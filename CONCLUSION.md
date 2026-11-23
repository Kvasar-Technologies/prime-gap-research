# Conclusión ejecutiva

**Pregunta.** ¿Pueden las técnicas de construcción mediante *theta lifts* y las
consideraciones de *multiplicidad* mejorar los métodos actuales para acotar
distancias entre primos?

**Respuesta: no, y ahora sabemos exactamente por qué.**

## Los cuatro hechos que cierran la cuestión

1. **Las técnicas theta ya están dentro del método.** La cadena
   `theta (representación de Weil) → cota de Kloosterman (2√p) → traza de Kuznetsov
   → estimaciones Tipo I/II → nivel de distribución θ → H`
   es el andamio real de Zhang/Maynard/Polymath (Zhang: *Ann. Math.* 179 (2014)
   1121–1174; Maynard: arXiv:1311.4600; Polymath 8a: arXiv:1402.0811; 8b:
   arXiv:1407.4897). No queda nada por "añadir" por esa vía: ya se consume.

2. **La cota de Weil es óptima** (Sato–Tate/Katz): `S(m,n;p) = 2√p cos θ_p(n)` con
   ángulos equidistribuidos. Cualquier plan que empiece por "mejorar Weil" está
   muerto antes de empezar. Lo verificamos sobre 4.344 sumas (razón máx 0.9653).
   El único margen es el **promedio**: Kuznetsov `X^{1/6+ε}` vs Linnik `X^ε`
   (conjetural).

3. **El cuello de botella real es variacional, no theta.** Bajo la mejor hipótesis
   posible (GEH, θ = 1−ε) el tamiz da `H₁ ≤ 6`, y Polymath 8b afirma que 6 es lo
   mejor posible desde consideraciones puramente de tamiz. Es decir: **ni θ = 1 ni
   ninguna técnica analítica producen H = 2**; para primos gemelos hace falta
   información bilineal nueva.

4. **La "multiplicidad" de Riemann no conecta.** La fórmula explícita hace que la
   multiplicidad de un cero contribuya `m·x^ρ/ρ` al error `ψ(x)−x`, que mide
   errores de orden √x. Eso no acota huecos entre primos, y el ruido de la cola
   omitida tiene el mismo orden que un solo término: umbral de detección
   `m ≳ C√(γ/T)` — verificado numéricamente (11 ceros reproducidos a ~1e-13,
   residuales dentro de la escala `√x/√T`).

## Sobre la línea «Siegel–Weil / problema del divisor» (corregido)

Se había propuesto articular la estimación Tipo III de Zhang con la identidad de
Siegel–Weil de la serie theta de la forma descompuesta `xy`. **Corrección honesta:**

* la igualdad `Σ_{n≤M} τ(n) = M log M + (2γ−1)M + O(√M)` sale **ya del método de la
  hipérbola de Dirichlet**; no hay contenido nuevo ahí;
* lo conocido es mucho mejor: `O(M^{1/3})` (Kolesnik), con la conjetura del problema
  del divisor en `M^{1/4+ε}`;
* la estimación Tipo III de Zhang trata la convolución de τ **en progresiones
  aritméticas** (módulos `q` lisos y libres de cuadrados), que es un objeto
  distinto del error del promedio de τ; no es una «reformulación» de lo anterior.

**Conclusión revisada: esta línea tampoco constituye un resquicio documentado.**
Queda como única vía *concebible* (sin teorema puente) la mejora de las
estimaciones de Tipo I/II sobre ℚ vía teoría de representación (nivel de
distribución automorfo), que es exactamente lo que dice la literatura estándar.

## Qué queda como entregable útil

- 5 verificaciones numéricas independientes (incluida la reproducción exacta de
  `M₂ = 1/(1−W(1/e))` de Maynard y la confirmación `M₅ > 2`);
- **formalización en Lean 4 + Mathlib: 13 teoremas, sin `sorry`**
  (tuplas admisibles, identidad de la hipérbola, linealidad en multiplicidades);
- un mapa preciso de cuellos de botella con las constantes correctas (θ = 1/2 + 1/584
  → 1/2 + 7/300 → 246 → 212), y correcciones de literatura que evitan trabajo perdido.

**No se demuestra nada nuevo sobre primos gemelos ni se mejora ninguna cota; este
informe es negativo por diseño y está verificado.**