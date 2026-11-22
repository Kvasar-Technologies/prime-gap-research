# Prime-Gap Research — ¿Sirven las theta lifts para acotar distancias entre primos?

> Investigación documentada sobre las técnicas de *theta lifts* (correspondencia de
> theta, cota de Weil, traza de Kuznetsov, Siegel–Weil) y la *multiplicidad* de ceros
> de ζ, y si pueden mejorar los métodos de Zhang/Maynard/Polymath para acotar
> `liminf (p_{n+1} − p_n)`.
>
> **Resultado: no.** Las técnicas theta ya forman parte del método (son su andamio),
> la cota de Weil es óptima, e incluso bajo la mejor hipótesis analítica posible
> (conjetura de Elliott–Halberstam generalizada) el tamiz da **H ≤ 6**, no 2.
> Este repositorio documenta el porqué, con todas las constantes verificadas.

## Español

### La pregunta

Los métodos modernos para huecos acotados entre primos (GPY 2005 → Zhang 2013 →
Maynard 2015 → Polymath 8) descansan en dos entradas: un **nivel de distribución θ**
(input analítico) y un problema variacional `M_k` (input combinatorio).
¿Pueden las técnicas de construcción mediante theta lifts y las consideraciones de
*multiplicidad* mejorar esos métodos?

### La respuesta, en cuatro hechos verificados

1. **Las técnicas theta ya están dentro del método.** La cadena
   `theta (representación de Weil) → cota de Kloosterman (2√p) → traza de
   Kuznetsov → estimaciones Tipo I/II → θ → H` es el andamio real de los papers
   citados. No queda nada que "añadir" por esa vía: ya se consume.
2. **La cota de Weil es óptima** (Sato–Tate/Katz): `S(m,n;p) = 2√p cos θ_p(n)` con
   ángulos equidistribuidos. Cualquier plan que empiece por "mejorar Weil" está
   muerto antes de empezar. Lo verificamos sobre **4.344 sumas** (0 violaciones).
3. **El cuello de botella es variacional.** Bajo GEH (θ = 1−ε) el tamiz da
   `H₁ ≤ 6`, y Polymath 8b demuestra que eso es *lo mejor posible desde
   consideraciones puramente de tamiz*. Es decir: ni θ = 1 ni ninguna técnica
   analítica producen `H = 2`.
4. **La "multiplicidad" de Riemann no conecta.** La fórmula explícita hace que la
   multiplicidad de un cero contribuya `m·x^ρ/ρ` a `ψ(x)−x`, que mide errores de
   orden √x; el ruido de la cola omitida tiene el mismo orden que un solo término
   (umbral `m ≳ C√(γ/T)`).

### El único resquicio con contenido nuevo

La estimación Tipo III de Zhang es una **convolución deslizada de la función
divisor**. En lenguaje theta, es el control del *error* en la identidad de
**Siegel–Weil** de la forma descompuesta `xy`:

```
Σ_{n≤M} τ(n) = #{(a,b) ∈ ℕ² : ab ≤ M}      (serie theta de xy)   [verificado en Lean]
Σ_{n≤M} τ(n) = M log M + (2γ−1)M + O(M^{1/2})   (Voronoï)            [verificado numéricamente]
```

Ese residuo —medido acotado en escala √M hasta 10⁸— es lo que habría que mejorar,
y la vía seria es `L(s, π, sym²)`, no la theta lift como identidad de promedios.

### Qué hay aquí

| Directorio | Contenido |
|---|---|
| `notas/` | Las 5 fases: estudio de Zhang/Maynard/Polymath (01–03), Riemann 1859 y puentes theta (04–06), mapa de cuellos de botella (10), arquitectura (20), chequeo web (52) |
| `lemas/` | Lemas propuestos con estado, y detalle de la formalización |
| `experimentos/` | 5 verificaciones numéricas independientes (Node) |
| `lean/` | Formalización **Lean 4 + Mathlib**: 13 teoremas, **sin `sorry`** |
| `referencias/` | Fuentes primarias (Riemann 1859 en alemán + traducción, preprint del récord 212) y el registro de verificación consolidado |

### Verificaciones numéricas (2 minutos)

```bash
cd experimentos && npm install
node kloosterman-weil.js 37      # cota de Weil sobre 4.344 sumas de Kloosterman (p ≤ 37)
node ceros-explicita.js          # ceros de ζ + fórmula explícita de Riemann
node util.js                     # anchos mínimos admisibles H(k)
node maynard-mk.js 2,3 2,3,4,5,6 # M_k de Maynard (reproduce M₂ exacto; confirma M₅ > 2)
node voronoi.js                  # término de error del problema del divisor
```

### Formalización (Lean 4 + Mathlib)

```bash
cd lean
elan toolchain install leanprover/lean4:v4.36.0   # una vez
lake build                    # compila
lake build verificar && ./.lake/build/bin/verificar
```

Teoremas probados (todos sin `sorry`; `#print axioms` = `propext, Classical.choice,
Quot.sound`): admisibilidad de tuplas (6 lemas + 8 comprobaciones concretas),
identidad de la hipérbola `Στ(n) = #{(a,b): ab ≤ x}` (x ≤ 100), y la
**linealidad de la fórmula explícita en las multiplicidades**.

---

## English summary

**Research question.** Can theta-lift constructions (Weil representation /
Kloosterman bound, Kuznetsov trace formula, Siegel–Weil) and zero-multiplicity
considerations improve the methods (GPY–Zhang–Maynard–Polymath) that bound
`liminf (p_{n+1} − p_n)`?

**Answer: no, and here is exactly why.** (1) Theta techniques are already the
scaffolding of the method (Weil bound → Kuznetsov → Type I/II estimates → level of
distribution θ → H), so nothing can be "added"; (2) the Weil bound `2√p` is optimal
(Sato–Tate/Katz) — verified numerically on 4,344 Kloosterman sums; (3) the real
bottleneck is variational — even under the Generalised Elliott–Halberstam conjecture
the sieve gives `H₁ ≤ 6`, which Polymath 8b proved is the best possible from purely
sieve-theoretic considerations, so `H = 2` needs genuinely new bilinear information;
(4) Riemann's zero-multiplicity governs errors of size `√x`, not prime gaps, and is
undecidable at attainable heights.

**Only remaining opening:** the shifted-divisor-convolution estimate behind Zhang's
Type III, i.e. the error term in the Siegel–Weil/theta identity for the split form
`xy` — the serious route is the symmetric-square L-function, not average identities.

**Deliverables:** documented five-phase study with verified constants, 5 independent
numeric verifications (including an exact rational-arithmetic reproduction of
Maynard's `M₂ = 1/(1−W(1/e))` and the confirmation `M₅ > 2`), and a Lean 4 +
Mathlib formalization of 13 theorems with no `sorry`.

---

*This repository documents a research programme whose answer turned out to be
negative. That is a legitimate scientific outcome, and everything here is either
verified against a cited primary source or explicitly marked `[NO VERIFICADO]`.*