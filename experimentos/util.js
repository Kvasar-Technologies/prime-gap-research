// util.js — aritmética exacta (BigInt) + utilidades de criba para el proyecto
// "theta lifts y huecos entre primos". Ejecutar: node util.js (autotest)

function sieve(N) {
  const isC = new Uint8Array(N + 1);
  const primes = [];
  for (let i = 2; i <= N; i++) {
    if (!isC[i]) {
      primes.push(i);
      for (let j = 2 * i; j <= N; j += i) isC[j] = 1;
    }
  }
  return { primes, isComposite: isC };
}
const isPrimeQuick = (n) => { if (n < 2) return false; for (let i = 2; i * i <= n; i++) if (n % i === 0) return false; return true; };

// Tupla admisible (Hardy-Littlewood): para todo primo p, los residuos {h_i mod p}
// NO cubren toda la clase Z/p. (Sólo primos p <= k pueden cubrir k clases.)
function isAdmissible(hs, k) {
  const bad = [];
  for (let p = 2; p <= k; p++) {
    if (!isPrimeQuick(p)) continue;
    const seen = new Set();
    for (const h of hs) seen.add(((h % p) + p) % p);
    if (seen.size === p) return false;
  }
  return true;
}

// DFS con poda: primera tupla admisible de anchura mínima (best-first-ish).
function minAdmissibleWidth(k, maxH) {
  let best = null, bestW = maxH + 1;
  const cur = [];
  function dfs() {
    if (cur.length === k) {
      const w = cur[k - 1] - cur[0];
      if (w + 1 < bestW) { bestW = w + 1; best = [...cur]; }
      return;
    }
    const start = cur.length ? cur[cur.length - 1] + 1 : 0;
    // poda: con cur.length elementos elegidos, los (k-cur.length) restantes deben caber
    const room = (k - cur.length) - 1;
    for (let h = start; h + room <= maxH; h++) {
      if (best !== null && h - cur[0] + room + 1 >= bestW) return; // no cabe menos
      cur.push(h);
      if (isAdmissible(cur, k)) dfs(cur);
      cur.pop();
    }
  }
  dfs();
  return best ? { tuple: best, width: bestW } : null;
}

// Comprueba (h_i) admisible con primos ≤ P (no necesariamente ≤ k): usado para cubrimientos.
function isAdmissibleUpTo(hs, P) { return isAdmissible(hs, Math.max(P, 2)) || (P > 2 && isAdmissible(hs, P)); }

// ---- Autotest ----
if (require.main === module) {
  const { primes } = sieve(50);
  console.log('primos <= 50:', primes.join(','));
  console.log('admisible (0,2):', isAdmissible([0, 2], 2));          // true (2 cubre ambas)
  console.log('admisible (0,1):', isAdmissible([0, 1], 2));          // false (1 ímpar => 3? k=2: p=2 cubre 0; pos 1 no)
  for (const k of [2, 3, 4, 5, 6, 10, 14]) {
    const t0 = Date.now();
    const r = minAdmissibleWidth(k, k <= 6 ? 14 : 40);
    console.log(`k=${k}:`, r ? `anchura ${r.width} tupla ${r.tuple.join(',')}` : 'no encontrada', `[${Date.now() - t0}ms]`);
  }
}

module.exports = { sieve, isAdmissible, minAdmissibleWidth };
// --- Comprobaciones de sanidad del predicado de admisibilidad ---
if (process.argv[1].endsWith('util.js')) {
  console.log('--- Admisibilidad (definición Hardy-Littlewood correcta) ---');
  const tests = [
    [[0, 2], 2, true, '(0,2) primos gemelos'],
    [[0, 1], 2, false, '(0,1): mod 2 cubre {0,1}'],
    [[2, 3, 4], 3, false, '(2,3,4): mod 2 cubre'],
    [[0, 2, 6], 3, true, 'H(3)=7'],
    [[0, 2, 6, 8], 4, true, 'H(4)=9'],
    [[0, 2, 6, 8, 12], 5, true, 'H(5)<=13'],
    [[0, 2, 6, 8, 11], 5, true, 'H(5)<=12'],
    [[0, 2, 4, 6, 8], 5, false, 'mod 3 cubre'],
  ];
  for (const [h, k, esp, desc] of tests) {
    const got = isAdmissible(h, k);
    console.log(`${got === esp ? 'OK ' : 'FALLA'} ${desc.padEnd(22)} → ${got}`);
  }
  console.log('--- Anchos mínimos (búsqueda exhaustiva con poda) ---');
  for (const k of [2, 3, 4, 5, 6, 7, 8, 10, 14]) {
    const t0 = Date.now();
    const r = minAdmissibleWidth(k, k <= 8 ? 30 : 60);
    console.log(`H(${k}) = ${r ? r.width : '?'}  (tupla ${r ? r.tuple.join(',') : ''}) [${Date.now() - t0}ms]`);
  }
}
