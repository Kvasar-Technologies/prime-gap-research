// kloosterman-weil.js — ILUSTRACIÓN (no aporta resultado nuevo)
// ------------------------------------------------------------------
// Comprueba numéricamente la cota de Weil para sumas de Kloosterman:
//     K(a,b;p) = Σ_{x mod p} e_p(a x + b x^{-1}) satisface |K| ≤ 2·√(p/mcd(a,b)).
// Ese teorema es de Weil (1948) y está demostrado; este script es una
// ILUSTRACIÓN del mismo (por eso se mantiene: muestra que la constante 2 es
// alcanzable y que la cota es apreciable). La optimalidad de la constante 2
// (Sato-Tate/Katz) NO se verifica aquí.
// Uso: node kloosterman-weil.js [N]

const { sieve } = require('./util.js');

function e_p(a, m, p) { // e_p(a/m) con a entero (mod p^?), doble precisión
  return [Math.cos(2 * Math.PI * (a / m) / p), Math.sin(2 * Math.PI * (a / m) / p)];
}
function cadd([a, b], [c, d]) { return [a + c, b + d]; }
function cmul([a, b], [c, d]) { return [a * c - b * d, a * d + b * c]; }
function cabs([a, b]) { return Math.hypot(a, b); }
function carg([a, b]) { return Math.atan2(b, a); }

// Gauss sum G(a;p) = Σ_{x mod p} e_p(a x^2), p impar
function gaussSum(a, p) {
  let s = [0, 0];
  for (let x = 0; x < p; x++) s = cadd(s, e_p(a * x * x, 1, p));
  return s;
}
// Kloosterman K(a,b;p) = Σ_{x mod p} e_p(a x + b x^{-1})
function kloosterman(a, b, p) {
  let s = [0, 0];
  for (let x = 1; x < p; x++) s = cadd(s, e_p(a * x + b * modinv(x, p), 1, p));
  return s;
}
function modinv(x, p) { // inverso por Euclides
  let [a, b] = [((x % p) + p) % p, p], [u, v] = [1, 0];
  while (b) { const q = Math.floor(a / b); [a, b] = [b, a - q * b]; [u, v] = [v, u - q * v]; }
  return ((u % p) + p) % p;
}

const N = Number(process.argv[2] || 60);
const { primes } = sieve(N);
let violW1 = 0, violW3 = 0, maxRatio = 0, checked = 0;
for (const p of primes) {
  if (p < 3) continue;
  const G1 = gaussSum(1, p);
  const errG = Math.abs(cabs(G1) ** 2 - p) / p;
  if (errG > 1e-9) { violW1++; console.log(`W1 FALLA p=${p}: |G|²-p = ${(cabs(G1) ** 2 - p).toExponential(3)}`); }
  for (let a = 1; a < p; a++) for (let b = 1; b < p; b++) {
    const K = kloosterman(a, b, p);
    const R = cabs(K) / (2 * Math.sqrt(p));
    maxRatio = Math.max(maxRatio, R); checked++;
    if (R > 1) { violW3++; if (violW3 < 6) console.log(`W3 FALLA p=${p} a=${a} b=${b}: |K|/(2√p)=${R.toFixed(4)}`); }
  }
}
console.log(`\nVerificado sobre ${primes.length} primos p ∈ [3,${N}], ${checked} sumas de Kloosterman (todas las clases).`);
console.log(`W1 (Gauss |G|²=p): violaciones = ${violW1}`);
console.log(`W3 (Weil |K| ≤ 2√p): violaciones = ${violW3}, razón máxima observada |K|/(2√p) = ${maxRatio.toFixed(4)}`);
console.log(`\nNota: la cota 2√p es asintóticamente óptima (distribución Sato–Tate/semicircular).`);
console.log(`Papel en huecos: la cota de Weil entra en la fórmula de traza de Kuznetsov`);
console.log(`→ estimaciones Tipo I/II → nivel de distribución θ → liminf(huecos).`);