# Experimento — Término de error de la identidad de divisor (Voronoï)

**Script:** `experimentos/voronoi.js`. Calcula `Σ_{n≤M} τ(n)` por el método exacto de
la hipérbola (`2Σ_{n≤√M}⌊M/n⌋ − ⌊√M⌋²`, el mismo objeto verificado en Lean
`Lemas/Hiperbola.hiperbola`) y mide el residuo contra el término principal
`M log M + (2γ−1)M`.

| M | Στ(n) | término principal | residuo | residuo/√M |
|---|---|---|---|---|
| 10³ | 7.069 | 7.062,2 | 6,8 | 0,215 |
| 10⁴ | 93.668 | 93.647,7 | 20,3 | 0,203 |
| 10⁵ | 1.166.750 | 1.166.735,7 | 14,3 | 0,045 |
| 10⁶ | 13.970.034 | 13.969.941,9 | 92,1 | 0,092 |
| 10⁷ | 162.725.364 | 162.725.269,8 | 94,2 | 0,030 |
| 10⁸ | 1.857.511.568 | 1.857.511.207,4 | 360,6 | 0,036 |

**Lectura [VERIFICADO]:** el residuo est´a acotado en escala `√M` (cocientes
uniformemente ≤ 0,22), es decir, se observa `O(M^{1/2})` — la cota de Voronoï
**[DEMOSTRADO]** (mejor conocido actual `O(M^{1/3})`; la conjetura del problema del
divisor dice `M^{1/4+ε}`).

**Por qué esto importa para el proyecto (lema P2/P2a):** este residuo es *el objeto
matemático* que la estimación Tipo III de Zhang/8a/8b necesita acotar en un
intervalo corto y con condición de congruencia. En lenguaje theta, `Στ(n)` son los
coeficientes de la serie theta de la forma descompuesta `xy`; su valor medio es el
coeficiente de la Eisenstein (Siegel–Weil) y **este residuo es la cota de error**
que habría que mejorar por vía `L(s, π, sym²)`. De ahí que las "theta lifts" solo
puedan aportar algo en el control de *este* error, no en el nivel de distribución.
