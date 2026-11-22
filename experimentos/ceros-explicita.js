// ceros-explicita.js
// 1) Ceros no triviales de ζ por la ecuación funcional (η de Dirichlet con suma
//    de Euler) y la función ξ completada (relación theta de Riemann).
// 2) Fórmula explícita truncada + papel de la MULTIPLICIDAD de los ceros.
// Uso: node ceros-explicita.js

const L2 = Math.log(2), LNPI = Math.log(Math.PI), NM = 128;

// ---------- complejos mínimos ----------
const cadd = (a, b) => [a[0] + b[0], a[1] + b[1]];
const csub = (a, b) => [a[0] - b[0], a[1] - b[1]];
const cmul = (a, b) => [a[0] * b[0] - a[1] * b[1], a[0] * b[1] + a[1] * b[0]];
const cdiv = (a, b) => { const d = b[0] * b[0] + b[1] * b[1]; return [(a[0] * b[0] + a[1] * b[1]) / d, (a[1] * b[0] - a[0] * b[1]) / d]; };
const cabs2 = a => a[0] * a[0] + a[1] * a[1];
const cexp = a => { const m = Math.exp(a[0]); return [m * Math.cos(a[1]), m * Math.sin(a[1])]; };
const clog = a => [0.5 * Math.log(a[0] * a[0] + a[1] * a[1]), Math.atan2(a[1], a[0])];
const cpow = (a, b) => cexp(cmul(b, clog(a)));

// ---------- η(s) = Σ (-1)^{n-1} n^{-s}: transformación de Euler ----------
function etaEuler(σ, t, N) {
  const ar = new Float64Array(N + 1), ai = new Float64Array(N + 1);
  for (let n = 0; n <= N; n++) {
    const l = Math.log(n + 1), m = Math.exp(-σ * l), ang = -t * l;
    ar[n] = m * Math.cos(ang); // a_n = (n+1)^{-σ-it}
    ai[n] = m * Math.sin(ang);
  }
  let re = 0, im = 0;
  for (let k = 0; k <= N; k++) {
    const sk = 1 / 2 ** (k + 1); // A_k = (-1)^k Δ^k a_0 ⇒ Σ A_k/2^{k+1} = Σ (-1)^k Δ^k/2^{k+1}
    re += sk * ar[0]; im += sk * ai[0];
    for (let n = 0; n < N - k; n++) { ar[n] -= ar[n + 1]; ai[n] -= ai[n + 1]; }
  }
  return [re, im];
}
// ζ(s) = η(s)/(1-2^{1-s}) para σ>0
function zeta(σ, t, N) {
  const [er, ei] = etaEuler(σ, t, N);
  // 1-2^{1-s} = (1 - m cos(t ln2)) + i (m sin(t ln2))
  const m = 2 ** (1 - σ), a = 1 - m * Math.cos(t * L2), b = m * Math.sin(t * L2);
  const d = a * a + b * b;
  return [(er * a + ei * b) / d, (ei * a - er * b) / d];
}
// ---------- Γ compleja (Lanczos; aquí Re z ≥ 1/4, no hace falta reflexión) ----------
const CG = [0.99999999999980993, 676.5203681218851, -1259.1392167224028, 771.32342877765313,
  -176.61502916214059, 12.507343278686905, -0.13857109526572012, 9.9843695780195716e-6,
  1.5056327351493116e-7];
function lngammaC(z) { // log Γ(z), complejo
  const x = csub(z, [1, 0]), tmp = cadd(x, [7.5, 0]);
  let ser = [CG[0], 0];
  for (let j = 1; j < 9; j++) ser = cadd(ser, cdiv([CG[j], 0], cadd(x, [j, 0])));
  const t1 = [0.5 * Math.log(2 * Math.PI), 0];
  const t2 = cpow(tmp, cadd(x, [0.5, 0]));
  const t3 = cexp(cmul([-1, 0], tmp));
  return clog(cmul(cmul(cmul(t1, t2), t3), ser));
}
// ξ(s) = ½ s(s-1) π^{-s/2} Γ(s/2) ζ(s)
function xi(σ, t, N) {
  const zr = zeta(σ, t, N), s = [σ, t];
  const ss = csub(s, [1, 0]), half = [0.5 * (s[0] * ss[0] - s[1] * ss[1]), 0.5 * (s[0] * ss[1] + s[1] * ss[0])];
  const p = cexp(cmul([-0.5, 0], cmul([LNPI, 0], s)));
  const lg = lngammaC(cmul(s, [0.5, 0])), n = [Math.exp(lg[0]), lg[1]]; // Γ(s/2)
  const prod = cmul(cmul(cmul(half, p), n), zr);
  return prod;
}
// ---------- ceros: bisección sobre el signo de Re ξ(1/2+t i) ----------
function firstZeros(tMax, step) {
  const zeros = []; let t0 = 1, f0 = xi(0.5, t0, NM)[0];
  for (let t1 = t0 + step; t1 <= tMax; t1 += step) {
    const f1 = xi(0.5, t1, NM)[0];
    if (f0 === 0) zeros.push(t0);
    else if (f0 * f1 < 0) {
      let lo = t0, hi = t1, flo = f0;
      for (let i = 0; i < 80; i++) { const mid = 0.5 * (lo + hi), fm = xi(0.5, mid, NM)[0]; if (flo * fm <= 0) hi = mid; else { lo = mid; flo = fm; } }
      zeros.push(0.5 * (lo + hi));
    }
    t0 = t1; f0 = f1;
  }
  return zeros;
}

// ---------- ψ exacto por criba ----------
function psiUpTo(x) {
  const LP = new Float64Array(x + 1);
  for (let i = 2; i <= x; i++) if (!LP[i]) for (let j = i; j <= x; j += i) if (!LP[j]) LP[j] = i;
  let s = 0;
  for (let n = 2; n <= x; n++) { const p = LP[n]; let m = n, ok = true; while (m % p === 0) { m /= p; } if (m === 1) s += Math.log(p); void ok; }
  return s;
}
// Σ_{|γ|≤T} x^ρ/ρ con ρ = 1/2 ± iγ (pesos según vector de multiplicidades)
function traceTerm(x, γ, mult) { // contribución del par ±γ multiplicado por mult
  const rx = Math.sqrt(x), a = γ * Math.log(x);
  const [cr, ci] = [rx * Math.cos(a), rx * Math.sin(a)];
  const r = [0.5, γ], d = 0.25 + γ * γ; // ρ = 1/2 + iγ
  const t = [cr * 0.5 + ci * γ, ci * 0.5 - cr * γ];
  void r;
  return [mult * t[0] / d, mult * t[1] / d];
}

if (require.main === module) {
  console.log('--- Comprobación de exactitud ---');
  console.log('ζ(2) =', zeta(2, 0, NM)[0], ' exacto π²/6 =', Math.PI ** 2 / 6);
  console.log('ζ(4) =', zeta(4, 0, NM)[0], ' exacto π⁴/90 =', Math.PI ** 4 / 90);
  const im = xi(0.5, 20, NM)[1];
  console.log('Im ξ(1/2+20i) =', im, '(debe ser ~0: ξ es real en σ=1/2)');

  console.log('\n--- Primeros ceros no triviales ---');
  const Z = firstZeros(60, 0.05);
  const known = [14.134725141734694, 21.022039638771755, 25.010857580145688, 30.424876125859513,
    32.935061587739189, 37.586178158825671, 40.918719012147495, 43.327073280914999,
    48.005150881167159, 49.773832477672302, 52.970321477714779, 56.446247425793589];
  Z.slice(0, 12).forEach((z, i) => console.log(`γ_${i + 1} = ${z.toFixed(9)}  (tabla: ${known[i] ?? '?'})  err = ${(z - known[i]).toExponential(2)}`));

  console.log('\n--- Fórmula explícita truncada:  ψ(x) ≈ x - Σ_{|γ|≤T} x^ρ/ρ - log 2π - ½log(1-x^{-2}) ---');
  const T = Z[Z.length - 1];
  for (const x of [10 ** 4, 10 ** 5, 10 ** 6]) {
    let S = [0, 0];
    for (const γ of Z) { const c = traceTerm(x, γ, 1); S = cadd(S, c); }
    const psi = psiUpTo(x);
    const pred = x - 2 * S[0] - Math.log(2 * Math.PI) - 0.5 * Math.log(1 - 1 / (x * x));
    console.log(`x=${x}: ψ exacto=${psi.toFixed(1)} predicción=${pred.toFixed(1)} residuo=${(psi - pred).toFixed(2)} (escala esperada ~√x/√T ≈ ${(Math.sqrt(x) / Math.sqrt(T)).toFixed(1)})`);
  }

  console.log('\n--- Multiplicidad: la fórmula es LINEAL en las multiplicidades ---');
  const x = 10 ** 6, γ = Z[0];
  const c1 = traceTerm(x, γ, 1), c2 = traceTerm(x, γ, 2);
  console.log(`par ±γ_1 con peso 1: ${c1[0].toFixed(4)} ; peso 2: ${c2[0].toFixed(4)} ; cociente = ${(c2[0] / c1[0]).toFixed(6)} (debe ser 2.000000)`);
  console.log('\nLectura numérica de m del primer cero omitido (x=10^8, T=' + T.toFixed(2) + '):');
  const Z2 = firstZeros(60, 0.05), x2 = 10 ** 8;
  void Z2; void x2;
  console.log('  (ver notas/21-multiplicidad.md: a T≈50 el ruido de la cola ~√x/√T es del mismo');
  console.log('   orden que un solo término → la multiplicidad no se decide por muestreo a esta T).');
}
module.exports = { zeta, xi, etaEuler, lngammaC, firstZeros, psiUpTo, traceTerm };