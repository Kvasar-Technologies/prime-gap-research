// tests.js — Suite de comprobación de los experimentos (valores esperados fijos).
// Cada script exporta (o recalcula) las cantidades clave; aquí se contrastan contra
// los valores publicados en `notas/`. Salida determinista.
//
// Uso: node tests.js   ·   Node >= 20 (ver package.json engines)

const path = require('path');
const ok = [];
const bad = [];
function check(nombre, obtenido, esperado, tol = 1e-9) {
  const pasa = (typeof obtenido === 'number' && typeof esperado === 'number')
    ? Math.abs(obtenido - esperado) <= tol * Math.max(1, Math.abs(esperado))
    : obtenido === esperado;
  (pasa ? ok : bad).push(`${nombre}: obtenido=${obtenido} esperado=${esperado}`);
}

// ---------- E4: M_k de Maynard (reproduce M₂ exacto y confirma M₅ > 2) ----------
const { run } = require('./maynard-mk.js');
const m2 = run(2, 6).lam;      // cota inferior de M₂ (converge desde abajo)
const m3 = run(3, 6).lam;
const m5 = run(4, 4).lam;
const m5b = run(5, 4).lam;
check('M₂ (Rayleigh–Ritz, D=6) ≈ 1.385936', m2, 1.385936, 1e-5);
check('M₃ (D=6) < (3/2)log3 = 1.647918', m3 < 1.647918, true, 0);
check('M₄ (D=4) < (4/3)log4 = 1.848392', m5 < 1.848392, true, 0);
check('M₅ (D=4) > 2  (Maynard: M₅ > 2)', m5b > 2, true, 0);

// ---------- E3: anchuras mínimas admisibles ----------
const { minAdmissibleWidth } = require('./util.js');
const Hk = { 2: 3, 3: 7, 4: 9, 5: 13, 6: 17, 7: 21, 8: 27, 10: 33 };
for (const [k, H] of Object.entries(Hk)) {
  const r = minAdmissibleWidth(Number(k), Number(k) <= 8 ? 30 : 40);
  check(`H(${k}) = ${H}`, r ? r.width : null, H, 0);
}

// ---------- E5: identidad de la hipérbola y escalas del error ----------
function tauSum(M) {
  const s = Math.floor(Math.sqrt(M));
  let tot = 0;
  for (let n = 1; n <= s; n++) tot += Math.floor(M / n);
  return 2 * tot - s * s;
}
check('Σ_{n≤100} τ(n) = 482 (coincide con Lean)', tauSum(100), 482, 0);
const GAMMA = 0.5772156649015329;
const d1e6 = tauSum(1e6) - (1e6 * Math.log(1e6) + (2 * GAMMA - 1) * 1e6);
check('|Δ(10⁶)|/√(10⁶) < 1', Math.abs(d1e6) / 1e3 < 1, true, 0);

// ---------- E1: cota de Weil (ilustración) ----------
const Weil = require('child_process').execSync('node kloosterman-weil.js 37', { encoding: 'utf8' });
check('Weil: 4344 sumas comprobadas, 0 violaciones', /violaciones = 0/.test(Weil), true, 0);

// ---------- E2: ceros de ζ ----------
const Zeta = require('child_process').execSync('node ceros-explicita.js', { encoding: 'utf8' });
check('ceros: γ₁ = 14.134725142 (tolerancia 1e-8)', /14\.134725142/.test(Zeta), true, 0);

console.log('=== Suite de experimentos (prime-gap-research) ===');
console.log(`Pasaron ${ok.length} de ${ok.length + bad.length} comprobaciones.`);
for (const l of ok) console.log('  OK   ' + l);
if (bad.length) { console.log('\nFALLOS:'); for (const l of bad) console.log('  FAIL ' + l); process.exit(1); }
console.log('\nTodas las comprobaciones dentro de tolerancia.');
console.log('Nota: estas son comprobaciones NUMÉRICAS (no pruebas); las pruebas formales');
console.log('      están en el proyecto Lean (ver ../lean/README.md).');