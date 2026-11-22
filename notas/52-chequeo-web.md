# 52 — Chequeo web de tres afirmaciones del proyecto

- **Fecha del chequeo:** 22 de noviembre de 2026
- **Método:** 3 consultas `webfetch` (máximo permitido); sin búsqueda web, sin invención.
  Se citan únicamente fragmentos literales obtenidos en esas consultas.
- **Nota importante:** Wikipedia es fuente *secundaria*; la fuente primaria de la
  afirmación 2 es el preprint de Charton et al., que **no** se consultó por límite
  de presupuesto. La afirmación 3 se verifica contra la fuente citada por nuestras
  notas (`05-theta-bridges.md`, línea 60: «Katz; citado en 2309.08528»).

## Tabla de veredictos

| Afirmación | Veredicto | Fuente (URL) | Cita literal / valor exacto |
|---|---|---|---|
| **1.** Bajo GEH, Polymath 8b obtiene H₁ ≤ 6, y es lo mejor posible desde consideraciones puramente de tamiz. | **CONFIRMADA** (matiz: atribución exacta abajo) | https://arxiv.org/abs/1407.4897 (Polymath8, «Variants of the Selberg sieve…», v4, Research in the Mathematical Sciences 1:12, 2014) | «As a consequence, we can obtain the bound $H_1 \leq 246$ unconditionally, and $H_1 \leq 6$ under the assumption of the generalized Elliott–Halberstam conjecture. Indeed, under the latter conjecture we show the stronger statement that for any admissible triple $(h_1,h_2,h_3)$, there are infinitely many $n$ for which at least two of $n+h_1,n+h_2,n+h_3$ are prime. We modify the "parity problem" argument of Selberg to show that **this result is the best possible that one can obtain from purely sieve-theoretic considerations**.» |
| **2.** La cota incondicional actual para huecos acotados entre primos es 212 (a septiembre de 2026), después del 240 de Stadlmann; obra de Charton–Hong–Lau–Ono–Rémy–Siu–Swaminathan–Thorner–Xie. | **CONFIRMADA** (según Wikipedia EN; fuente primaria no consultada) | https://en.wikipedia.org/wiki/Yitang_Zhang (rev. oldid 1381104425, última edición 20 oct 2026) | «Research programs such as the Polymath Project built upon Zhang's result, eventually lowering the bounded gap to 212 as of September 2026[update].[20]» — Referencia [20]: «CHARTON, FRANCOIS; HONG, LETONG; LAU, KENNY; ONO, KEN; REMY, GUILLAUME; SIU, HO CHUNG; SWAMINATHAN, ASHVIN A.; THORNER, JESSE; XIE, YUNZHOU; A NEW BOUND FOR SMALL GAPS BETWEEN PRIMES. https://primegaps.axiommath.ai/bgp212.pdf — bgp 212 Abstract. Stadlmann recently proved that infinitely many pairs of distinct primes are apart by at most 240…» La lista de autores coincide literalmente con la afirmación. |
| **3.** La cota de Weil \|S(m,n;p)\| ≤ 2√p es óptima: S(1,n;p) = 2√p cos θ_p(n) con ángulos distribuidos según Sato–Tate (Katz). | **NO VERIFICABLE** | https://arxiv.org/abs/2309.08528 (Andersen–Anderson–Woodall, «The Weil bound for generalized Kloosterman sums of half-integral weight») | El resumen solo dice: «We prove the Weil bound for the Kloosterman sums $S_{\alpha,\beta}(m,n,c)$ of half-integral weight for the Weil Representation attached to $L$. We obtain this bound by proving an identity that relates a divisor sum of Kloosterman sums to a sparse exponential sum. This identity generalizes Kohnen's identity for plus space Kloosterman sums with the theta multiplier system.» **El resumen no menciona en absoluto** «optimal», «optimality», «Sato–Tate», «Katz» ni la parametrización $S(1,n;p) = 2\sqrt{p}\cos\theta_p(n)$. |

## Veredicto en español (afirmación por afirmación)

### 1. H₁ ≤ 6 bajo GEH y optimalidad de tamiz — ✅ SE PUEDE AFIRMAR TAL CUAL

El resumen de arXiv:1407.4897 (Polymath 8b) afirma exactamente las dos cosas:
«$H_1 \leq 246$ unconditionally, and $H_1 \leq 6$ under the assumption of the
generalized Elliott–Halberstam conjecture», y la optimalidad «this result is the
best possible that one can obtain from purely sieve-theoretic considerations»
(vía la modificación del argumento de la «parity problem» de Selberg). El
antecedente de «this result» en el resumen es precisamente el resultado GEH
(H₁ ≤ 6 / dos de tres en una terna admisible), que es la lectura que da el
proyecto. Único matiz de redacción: el resumen escribe «generalized» (inglés);
el proyecto escribe «Generalised»; es la misma conjetura (GEH), no hay
discrepancia de contenido.

### 2. Cota incondicional 212 a septiembre de 2026 (tras el 240 de Stadlmann), de Charton et al. — ✅ SE PUEDE AFIRMAR TAL CUAL, CON UNA SALVEDAD DE CITACIÓN

Wikipedia EN («Yitang Zhang») dice literalmente: «eventually lowering the bounded
gap to 212 as of September 2026», y la referencia [20] que respalda esa frase
es el preprint «A NEW BOUND FOR SMALL GAPS BETWEEN PRIMES» de Charton, Hong,
Lau, Ono, Remy, Siu, Swaminathan, Thorner y Xie
(https://primegaps.axiommath.ai/bgp212.pdf), cuyo resumen empieza: «Stadlmann
recently proved that infinitely many pairs of distinct primes are apart by at
most 240…». Los tres elementos de la afirmación (212, fecha septiembre 2026,
Stadlmann 240, y la lista de nueve autores) coinciden uno a uno con la fuente.
**Salvedad:** la verificación es contra Wikipedia (fuente secundaria, artículo
marcado «as of September 2026» con plantilla `update`); por límite de
presupuesto no se abrió el PDF primario. Recomendación: en el proyecto, citar
además el preprint primario (URL arriba) junto a Wikipedia.

### 3. Optimalidad de 2√p y ángulos Sato–Tate (Katz) — ⚠️ NO SE PUEDE AFIRMAR CON ESTA CITA; MARCADO COMO NO VERIFICABLE

La fuente que nuestras notas citan para esta afirmación
(`notas/05-theta-bridges.md`, línea 60: «(Katz; citado en 2309.08528)») **no la
respalda**, al menos según su resumen: arXiv:2309.08528 trata de sumas de
Kloosterman **de peso semientero** para la representación de Weil de un retículo
par de rango impar, y demuestra la cota de Weil para *esas* sumas; ni el resumen
menciona optimalidad de 2√p, ni la descomposición
S(1,n;p) = 2√p cos θ_p(n), ni Sato–Tate, ni Katz. No se puede afirmar que la
optimalidad quede «citada/demostrada» con ese enlace.

Qué se puede y no se puede decir:
- **No verificable (no «falso»):** el contenido matemático de la afirmación sobre
  sumas de Kloosterman *clásicas* es estándar en la literatura (la cota 2√p de
  Weil y la equisdistribución Sato–Tate de los ángulos normalizados es teorema de
  Katz), pero **este chequeo no pudo confirmarlo** porque la fuente citada no lo
  contiene en su resumen y el cuerpo del artículo no se abrió (límite de 3
  consultas). Marcado **UNVERIFIABLE** conforme a la regla de no inventar.
- **Corrección recomendable al proyecto:** en `05-theta-bridges.md` línea 60, no
  atribuir la cita de Sato–Tate/Katz a 2309.08528; conviene citar el trabajo
  original de Katz sobre monodromía de haces de Kloosterman (fuente a verificar
  en una consulta posterior, no incluida aquí por presupuesto) y dejar
  2309.08528 citado solo para lo que sí prueba: la cota de Weil en peso
  semientero vía la identidad que generaliza la de Kohnen.

## Registro de consultas realizadas (3/3 usadas)

1. `https://arxiv.org/abs/1407.4897` — resumen arXiv (afirmación 1)
2. `https://en.wikipedia.org/wiki/Yitang_Zhang` — Wikipedia EN (afirmación 2)
3. `https://arxiv.org/abs/2309.08528` — resumen arXiv (afirmación 3)

No se consultó: el PDF `primegaps.axiommath.ai/bgp212.pdf`, el cuerpo
(ar5iv/HTML) de 2309.08528, ni la fuente original de Katz. Cualquiera de esas
tres consultas adicionales cerraría las salvedades indicadas arriba.