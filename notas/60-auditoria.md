# 60 — Auditoría de afirmaciones del proyecto

Objetivo de la reorientación: que cada afirmación sea correcta, esté bien acotada y
sea honesta sobre su novedad. Clasificación:

- **T** = teorema conocido (con cita primaria)
- **H** = heurística
- **N** = verificación numérica (no es prueba)
- **C** = conjetura
- **A** = afirmación nuestra (expositiva)

| # | Afirmación | Dónde aparece | Tipo | Fuente primaria | Acción |
|---|---|---|---|---|---|
| 1 | Zhang: liminf ≤ 70.000.000; θ = 1/2 + 1/584 (MPZ[ϖ,δ], ϖ,δ = 1/1168) | `01`, `10`, `RESUMEN` | **T** | Zhang, *Ann. of Math.* 179 (2014) 1121–1174 | mantener (citando la revista, **no** arXiv:1402.1471) |
| 2 | Maynard: criterio «EH[θ] y `M_k > 2m/θ` ⇒ `H_m ≤ H(k)`»; `M_k` multidimensional | `02`, `30` | **T** | Maynard, arXiv:1311.4600, Prop. 4.2 | mantener |
| 3 | `M₂ = 1/(1−W(1/e)) = 1.385936…`; `M₅ > 2`; `M₅₄ > 4.00238` | `02`, `03b` | **T** | Polymath 8b (Cor. 6.3); Maynard | mantener |
| 4 | Reproducción numérica de `M₂` = 1.385933 (convergente) y `M₅^(D=4)` = 2.0059 | `NOTAS-maynard-mk` | **N** | cálculo propio | mantener, etiquetado «cota inferior por Rayleigh–Ritz; no es prueba» |
| 5 | Polymath 8b: `H₁ ≤ 246` incondicional; bajo EH `H₂ ≤ 270`; **bajo GEH `H₁ ≤ 6`** | `03b`, `03c` | **T** | arXiv:1407.4897 (abstract verificado en `52`) | mantener |
| 6 | «6 es lo mejor posible desde consideraciones puramente de tamiz» | `03b`, `10`, `20` | **T** | arXiv:1407.4897 (abstract; cita literal en `52`) | mantener **con la cita literal** |
| 7 | Récord incondicional actual = **212** (sept 2026), tras 240 de Stadlmann | `03d`, `RESUMEN` | **T** (fuente: Wikipedia EN con ref. bibliográfica completa + preprint primario consultado con extracción fragmentaria) | Charton–Hong–Lau–Ono–Rémy–Siu–Swaminathan–Thorner–Xie, *A new bound…* | mantener, citando también el preprint |
| 8 | Cota de Weil `|S(m,n;p)| ≤ 2√p` | `05`, `06` | **T** | Weil 1948 | mantener |
| 9 | «La constante 2 es óptima (Sato–Tate/Katz)» | `05`, `06`, `20` | **T no verificada en sesión** | Katz, *Gauss Sums, Kloosterman Sums and Monodromy Groups* (1988) | **matizar**: marcar [NO VERIFICADO EN SESIÓN]; quitar la atribución a arXiv:2309.08528 |
| 10 | Comprobación numérica de la cota de Weil (4.344 sumas, 0 violaciones) | `kloosterman-weil.js` | **N** | cálculo propio | **degradar a «ilustración de un teorema»** (PASO 4c) |
| 11 | Kuznetsov: `Σ_{c≤X} S(m,n;c)/c ≪ X^{1/6+ε}` | `05` | **T** | Kuznetsov | mantener |
| 12 | Blomer–Harcos: cotas Burgess-like para L retorcidas de GL(2) | `05` | **T** | arXiv:0904.2429 | mantener |
| 13 | «Las técnicas theta son el andamio del método» | `20`, `06`, `README` | **A (sobredimensionada)** | — | **corregir**: Zhang/Maynard usan cotas de **Deligne** (ℓ-ádicas) y la **traza de Kuznetsov** en GL₂ (Deshouillers–Iwaniec); la *correspondencia theta* de Howe/Kudla–Millson no es el motor |
| 14 | «La vía multiplicidad de ceros no conecta con huecos» | `20`, `CONCLUSION` | **A + H** | argumento de escalas propio | mantener, pero marcar el argumento de ruido como **heurístico** y la simplicidad de ceros como **conjeturada** |
| 15 | Umbral de detección `m ≳ C√(γ/T)` | `30` | **H** | derivación de escalas propia | mantener como **heurística** |
| 16 | Identidad de la hipérbola `Στ = #pares` (todo x) | `Lemas/Hiperbola.lean` | **T (formalizado)** | Dirichlet | mantener; es la única contribución formal sólida |
| 17 | «resquicio con contenido nuevo: control del error en Siegel–Weil/forma `xy`» | `20`, `30`, `CONCLUSION` | **A (sobredimensionada)** | — | **eliminar el framing de "resquicio"**: aclarar que `O(√x)` sale ya del método de la hipérbola de Dirichlet, que lo conocido es `O(x^{1/3})` y que el Tipo III de Zhang trata la convolución de τ **en progresiones aritméticas**, no el error del promedio de τ |
| 18 | Término de error del divisor medido (residuo/√M ≤ 0.22 hasta 10⁸) | `voronoi.js`, `NOTAS-voronoi` | **N** | cálculo propio | mantener como **observación numérica**; no presentar como resultado |
| 19 | Anchura mínima admisible H(k) = 3,7,9,13,17,21,27,31,33,37,43,51 | `util.js`, `30`, `40` | **N** | cálculo exhaustivo propio | mantener (coincide con las tablas clásicas) |
| 20 | Formalización Lean: admisibilidad, hipérbola, multiplicidad, Maynard (axiomas) | `lean/` | **T/A** | este desarrollo | mantener; documentar en `lean/README.md` |

## Resumen de acciones

| Acción | Afirmaciones |
|---|---|
| mantener | 1, 2, 3, 5, 6, 7, 8, 11, 12, 16, 19, 20 |
| matizar | 4, 9, 10, 14, 15, 18 |
| eliminar/reescribir | 13, 17 |