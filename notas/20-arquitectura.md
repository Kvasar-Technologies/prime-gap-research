# Fase 3 — Arquitectura: dónde podrían entrar theta-lifts y multiplicidades

Síntesis de `04-riemann-1859.md`, `05-theta-bridges.md`, `06-honest-assessment.md`,
`10-cuellos-de-botella.md`, `03*-polymath8*.md`.

## 1. El diagrama de dependencias (todo lo de abajo está verificado en las notas)

```
                    ┌─────────────────────────────────────────────┐
   theta ←──┐  Weyl rep. SL₂(F_p) → COTA DE WEIL 2√p (óptima)      │
            │        ↓                                            │
            │   Fórmula de traza de KUZNERSOV (Bessel + K-Sums)   │
            │        ↓                                            │
  H ≤ f(θ, k, M_k/I_k) ←── NIVEL DE DISTRIBUCIÓN θ  ←── Tipo I/II  │
            │                  ↑                                   │
            │                  └──── truco del divisor (r_Δ, d|n(n+2))
            │                            ↓                         │
            │                  Siegel–Weil / theta lifts (promedios)
            └── Riemann 1859: ecuación funcional vía serie theta,
                fórmula explícita (multiplicidad de ceros)
```

Consecuencia inmediata y honesta: **las técnicas theta ya están dentro del método**
como *andamio* de las estimaciones Tipo I/II/III. El motor sigue siendo
Bombieri–Vinogradov, y el techo actual (H₁ ≤ 246 incondicional; H₁ ≤ 6 bajo GEH)
sale de θ ≈ 1/2 + 1/40 (8b) y del cuello variacional `M_k/I_k ≍ log k/k`.

## 2. Los cuatro sitios donde un "mejoramiento" puede ocurrir

### (S1) Promedios de sumas de Kloosterman — el único con margen real
La estimación Tipo II de un Progreso tipo Zhang/8b involucra sumas
`Σ_{c≤X} S(m, n; c)/c` controladas por Kuznetsov: `X^{1/6+ε}` **[PROBADO]**,
frente al trivial `X^{1/2}` de Weil. La conjetura de Linnik `X^ε` está abierta.
Una mejora aquí sube θ; ninguna ruta publicada lo hace hoy sobre ℚ.

### (S2) La cota de Weil puntual — **cerrado**
`S(m,n;p) = 2√p cos θ_p(n)` con ángulos Sato–Tate (Katz): la constante 2 es
alcanzada infinitas veces. Verificado numéricamente aquí (`experimentos/kloosterman-weil.js`:
4.344 sumas, razón máxima `|K|/(2√p) = 0.9653`). **Cualquier plan que empiece por
"mejorar Weil" está muerto antes de empezar.**

### (S3) El truco del divisor como identidad de theta — **el sitio con contenido nuevo**
Zhang/8a/8b necesitan estimar `Σ_{d ≤ D} r_Δ(...)` con `d | n(n+2)`, es decir
una **convolución deslizada de la función divisor**. Su formulación natural:

```
  Σ_{n≤M} τ(n) = #{(a,b) ∈ ℕ² : ab ≤ M}          (identidad de la hipérbola, VERIFICADA EN LEAN)
```
Es exactamente el coeficiente de la **serie theta** de la forma cuadrática
descompuesta `xy`, y su promedio viene dado por la **fórmula de Siegel–Weil**
(promedio de coeficientes theta = coeficiente de Eisenstein) + una forma
cuspiforme `f ∘ θ` (el "theta lift" literal). Por tanto:

> **Lema P3 (articulación del proyecto):** la estimación Tipo III de Zhang es,
> en lenguaje theta, el control del *término de error* de la identidad de
> Siegel–Weil para la forma `xy` en un intervalo corto y con condición de
> congruencia.

La cota de error estándar es Rankin–Selberg para la cuspiforme diferencia, es
decir, para `L(s, π, sym²)`. Evidentemente aquí hay margen (functorialidad
simétrica, Kim–Shahidi), pero **no existe teorema publicado que mejore el nivel
de distribución por esta vía**. Se marca **[CONJETURAL]**.

### (S4) Multiplicidad de ceros de ζ — **cerrado para gaps acotados**
La fórmula explícita (Riemann 1859) hace que la multiplicidad de un cero ρ
contribuya como `m·x^ρ/ρ` a `ψ(x) − x`. Verificado numéricamente aquí
(`experimentos/ceros-explicita.js`: 11 ceros reproducidos a ~1e-13; residuos
−14.6, −0.6, −229.7 para x = 10⁴, 10⁵, 10⁶, dentro de la escala `√x/√T`).
Pero:

- el error que esto mide es de tamaño `√x`, y no acota huecos entre primos
  (para eso haría falta región libre de ceros, que daría huecos ≤ x^δ, no acotados);
- **el ruido de la cola omitida tiene el mismo orden que un solo término**
  (RMS ≈ `√x·T^{-1/2}` frente a `√x/√γ`), de modo que la multiplicidad no es
  decidible por muestreo a T alcanzable (haría falta T ~ x^{1−ε}).

Conclusión: la vía "multiplicidad de ceros" es históricamente hermosa
(es literalmente Riemann) y no toca el problema de huecos acotados.

## 3. El cuello que ninguna de estas técnicas toca

Bajo EH generalizada (θ = 1−ε), Polymath 8b obtiene **H₁ ≤ 6** y afirman que eso
es lo mejor posible desde consideraciones puramente de tamiz
[arXiv:1407.4897, verificado]. Es decir: **aun con θ = 1, el método de tamiz no
produce H = 2.** Para primos gemelos hay que salir del tamiz: ni mejorar θ ni
ninguna técnica theta/Kloosterman/Kuznetsov cambia el término gravitacional
`M_k/I_k ≍ 4 log k /(2k)`.

## 4. Veredicto del proyecto (Fase 3)

| Ruta | ¿Tocó algún cuello? | Veredicto |
|---|---|---|
| Mejorar la cota de Weil (theta) | No | **Cerrada** (óptima, Katz) |
| Promedios de Kloosterman (Kuznetsov) | θ, marginalmente | Abierta pero sin ruta publicada |
| Siegel–Weil/theta lifts para el divisor | Tipo III | **La única con contenido nuevo** (conjetural) |
| Multiplicidad de ceros (Riemann) | Ninguno | No conecta con huecos acotados |
| Variacional `M_k/I_k` | H mínimo | Inalcanzable desde el análisis |