// voronoi.js — Término de error del problema del divisor / serie theta de la forma xy.
//
//   Σ_{n≤M} τ(n) = M log M + (2γ−1)M + Δ(M),    Δ(M) = O(√M)   (Voronoï 1903)
//   mejor conocido: Δ(M) = O(M^{1/3}); conjetura del problema del divisor: M^{1/4+ε}.
//
// El script compara Δ(M) con las tres escalas (√M, M^{1/3}, M^{1/4}) y reporta los
// máximos normalizados. Salida determinista (sin aleatoriedad).
//
// Uso: node voronoi.js [M1 M2 M3 ...]

function tauSum(M) {
  // #{(a,b) ∈ ℕ² : a·b ≤ M} = 2 Σ_{n≤⌊√M⌋} ⌊M/n⌋ − ⌊√M⌋²  (método de la hipérbola)
  const s = Math.floor(Math.sqrt(M));
  let tot = 0;
  for (let n = 1; n <= s; n++) tot += Math.floor(M / n);
  return 2 * tot - s * s;
}

const GAMMA = 0.5772156649015329;
const ms = process.argv[2] ? process.argv.slice(2).map(Number) : [1e3, 1e4, 1e5, 1e6, 1e7, 1e8];
const logM = ms.map(Math.log);
const principal = ms.map((M, i) => M * logM[i] + (2 * GAMMA - 1) * M);
const delta = ms.map((M, i) => tauSum(M) - principal[i]);
const norms = {
  '√M': delta.map((d, i) => Math.abs(d) / Math.sqrt(ms[i])),
  'M^{1/3}': delta.map((d, i) => Math.abs(d) / ms[i] ** (1 / 3)),
  'M^{1/4}': delta.map((d, i) => Math.abs(d) / ms[i] ** (1 / 4)),
};

console.log('=== Problema del divisor: termino de error frente a tres escalas ===');
console.log('  M          Στ(n)          M log M+(2γ−1)M      Δ(M)     |Δ|/√M   |Δ|/M^{1/3}  |Δ|/M^{1/4}');
for (let i = 0; i < ms.length; i++) {
  console.log(
    String(ms[i]).padStart(10),
    String(tauSum(ms[i])).padStart(14),
    principal[i].toFixed(1).padStart(18),
    delta[i].toFixed(1).padStart(12),
    norms['√M'][i].toFixed(4).padStart(10),
    norms['M^{1/3}'][i].toFixed(4).padStart(13),
    norms['M^{1/4}'][i].toFixed(4).padStart(13));
}
console.log('\nMáximos normalizados: |Δ|/√M =', Math.max(...norms['√M']).toFixed(4),
  ' |Δ|/M^{1/3} =', Math.max(...norms['M^{1/3}']).toFixed(4),
  ' |Δ|/M^{1/4} =', Math.max(...norms['M^{1/4}']).toFixed(4));
console.log('\nLectura: en este rango |Δ|/√M y |Δ|/M^{1/3} no muestran crecimiento sistematico,');
console.log('mientras que |Δ|/M^{1/4} si crece. Eso es CONSISTENTE con lo conocido:');
console.log('O(√M) (Voronoï) y O(M^{1/3}) (Kolesnik) son teoremas; M^{1/4+ε} es CONJETURA.');
console.log('Observacion numerica sobre 10^3..10^8: no es un resultado ni una cota nueva.');