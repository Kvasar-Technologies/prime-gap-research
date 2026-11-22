// voronoi.js — Término de error de la identidad de divisor / serie theta de xy.
// Σ_{n≤M} τ(n) = #{(a,b): ab ≤ M};  Voronoï: = M log M + (2γ−1)M + O(M^{1/2})
// Este RESIDUO es exactamente el objeto que la estimación Tipo III de Zhang acota.
// Uso: node voronoi.js [M1 M2 M3]
function tauSum(M) {
  // Σ_{n≤M} τ(n) = 2 Σ_{n≤√M} ⌊M/n⌋ − ⌊√M⌋² (método de la hipérbola)
  const s = Math.floor(Math.sqrt(M));
  let tot = 0;
  for (let n = 1; n <= s; n++) tot += Math.floor(M / n);
  return 2 * tot - s * s;
}
const GAMMA = 0.5772156649015329;
const ms = process.argv[2] ? process.argv.slice(2).map(Number) : [1e3, 1e4, 1e5, 1e6, 1e7, 1e8];
console.log('  M          Στ(n)          M log M + (2γ−1)M      residuo      residuo/√M   (2γ−1)=0.154431');
for (const M of ms) {
  const S = tauSum(M);
  const main = M * Math.log(M) + (2 * GAMMA - 1) * M;
  const r = S - main;
  console.log(String(M).padStart(10), String(S).padStart(14), main.toFixed(1).padStart(18), r.toFixed(1).padStart(12), (r / Math.sqrt(M)).toFixed(3).padStart(12));
}
console.log('\nVoronoï (1903): residuo = O(M^{1/2}) [DEMOSTRADO, con constante efectiva];');
console.log('mejor conocido actual O(M^{1/3})…; conjetura del problema del divisor: M^{1/4+ε}.');
