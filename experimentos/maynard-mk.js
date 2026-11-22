// maynard-mk.js — Reproduce los valores de M_k de Maynard (arXiv:1311.4600) por
// el método de Rayleigh-Ritz sobre el simplejo R_k = {Σ t_i ≤ 1}.
//
//   I_k(F)     = ∫_{R_k} F²
//   J_k^(m)(F) = ∫_{R_{k-1}} (∫_0^{1-Σ_{i≠m}u_i} F(u,t_m) dt_m)² du
//   M_k        = sup_F Σ_m J_k^{(m)}(F) / I_k(F)
//
// Todas las integrales son RACIONALES para base monomial:
//   ∫_{R_n} (1-Σt)^p ∏ t_i^{a_i} dt = p! ∏ a_i! / (Σ a_i + p + n)!
// => podemos calcular las matrices A y B EXACTAMENTE (BigInt) y luego resolver
//    el problema de autovalores generalizado B v = λ A v (λ_max ⇏ M_k, por abajo).
//
// Verificación: para k = 2 debe salir M_2 = 1/(1-W(1/e)) = 1.385936...
// Uso: node maynard-mk.js

const math = require('mathjs');

// ---------- racionales exactos ----------
function gcd(a, b) { while (b) { const t = a % b; a = b; b = t; } return a < 0n ? -a : a; }
function rat(n, d = 1n) {
  if (d === 0n) throw new Error('div0');
  if (d < 0n) { n = -n; d = -d; }
  const g = gcd(n, d) || 1n;
  return { n: n / g, d: d / g };
}
const R = rat;
const radd = (a, b) => rat(a.n * b.d + b.n * a.d, a.d * b.d);
const rmul = (a, b) => rat(a.n * b.n, a.d * b.d);
const rnum = (x) => Number(x.n) / Number(x.d);
function fact(n) { let r = 1n; for (let i = 2n; i <= n; i++) r *= i; return r; }

// ---------- base monomial sobre R_k ----------
// monomios t_1^{a_1}...t_k^{a_k} con Σa_i ≤ D
function monoms(k, D) {
  const out = [];
  const rec = (i, cur, sum) => {
    if (i === k) { out.push([...cur]); return; }
    for (let e = 0; e + sum <= D; e++) { cur.push(BigInt(e)); rec(i + 1, cur, sum + e); cur.pop(); }
  };
  rec(0, [], 0);
  return out;
}
const sumArr = (a) => a.reduce((x, y) => x + y, 0n);

// A_{ij} = ∫_{R_k} t^{a_i+b_i} = ∏(a_i+b_i)! / (Σ(a+b)+k)!
function Aentry(ai, aj, k) {
  let num = 1n;
  for (let q = 0; q < k; q++) num *= fact(ai[q] + aj[q]);
  const den = fact(sumArr(ai) + sumArr(aj) + BigInt(k));
  return rat(num, den);
}
// B_{ij} = Σ_m J_{ij}^{(m)}, con
//   J_{ij}^{(m)} = (a_m+b_m+2)! ∏_{i≠m}(a_i+b_i)! / [(a_m+1)(b_j+1)(Σ(a+b)+k+1)!]
function Bentry(ai, aj, k) {
  let tot = rat(0n);
  for (let m = 0; m < k; m++) {
    const pm = ai[m] + aj[m] + 2n;
    let num = fact(pm);
    for (let q = 0; q < k; q++) if (q !== m) num *= fact(ai[q] + aj[q]);
    const den = fact(sumArr(ai) + sumArr(aj) + BigInt(k) + 1n) * (ai[m] + 1n) * (aj[m] + 1n);
    tot = radd(tot, rat(num, den));
  }
  return tot;
}

function generalizedMaxEig(A, B, n) {
  // λ_max de (B, A): resolver A^{-1}B v = λ v
  const Af = math.inv(A.map((row) => row.map(rnum)));
  const C = math.multiply(Af, B.map((row) => row.map(rnum)));
  const eigs = math.eigs(C).values.map((z) => (typeof z === 'number' ? z : Math.abs(z)));
  return Math.max(...eigs.map((x) => (Number.isFinite(x) ? x : -Infinity)));
}

function run(k, D) {
  const basis = monoms(k, D);
  const n = basis.length;
  const A = [], B = [];
  for (let i = 0; i < n; i++) {
    A.push([]), B.push([]);
    for (let j = 0; j < n; j++) { A[i].push(Aentry(basis[i], basis[j], k)); B[i].push(Bentry(basis[i], basis[j], k)); }
  }
  const lam = generalizedMaxEig(A, B, n);
  // cociente canónico automático (Rayleigh) para el vector propio hallado:
  return { D, n, lam };
}

// W(1/e) para comparar
function lambertW(x) { let w = x < 1 ? 0.5 : Math.log(x); for (let i = 0; i < 200; i++) { const e = Math.exp(w); w = w - (w * e - x) / (e * (w + 1)); } return w; }
const W = lambertW(1 / Math.E);
const M2exact = 1 / (1 - W);

if (require.main === module) {
  const ks = process.argv[2] ? process.argv[2].split(',').map(Number) : [2, 3];
  const Ds = process.argv[3] ? process.argv[3].split(',').map(Number) : [2, 3, 4, 5, 6];
  console.log('=== M_k de Maynard por Rayleigh-Ritz (cotas INFERIORES) ===');
  console.log(`Valor exacto k=2:  M_2 = 1/(1-W(1/e)) = ${M2exact.toFixed(9)}\n`);
  for (const k of ks) {
    const row = [];
    for (const D of Ds) {
      const { n, lam } = run(k, D);
      row.push(`D=${D}(n=${n}): ${lam.toFixed(6)}`);
    }
    console.log(`k=${k}:  ` + row.join('   '));
  }
  console.log('\nCotas publicadas (notas/02-maynard.md): M₂ = 1.38593…; M₅ > 2; M₅₄ > 4.00238;');
  console.log('M_k ≤ (k/(k-1))·log k (Maynard) y M_k ≥ log k − C.');
  for (const k of ks) console.log(`   cota superior k=${k}: ${(k / (k - 1) * Math.log(k)).toFixed(6)}`);
}
module.exports = { run, rat, monoms };