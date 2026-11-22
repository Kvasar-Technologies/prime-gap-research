# 01b — Constantes numéricas verificadas (Y. Zhang, "Bounded gaps between primes")

*(versión detallada; sustituye al resumen corto que se conserva sólo en el entorno local)*

Regla de este fichero: **sólo** constantes que he podido verificar. Cada línea lleva la fuente.
Cualquier cantidad no verificada está marcada `[NO VERIFICADO]` y **no** aparece en las tablas.
Convención de notación: uso la notación de Zhang (`k_0`, `l_0`, `δ`, `ν`, `Λ`) y, donde la
fuente secundaria la usa, la notación Polymath (`ϖ`, `σ`, `MPZ[ϖ,δ]`).

## 0. Advertencia obligada sobre el identificador de arXiv

| Afirmación | Estado | Comprobación |
|---|---|---|
| "arXiv:1402.0013 es el artículo de Zhang" | **FALSO** | `ar5iv.org/abs/1402.0013` = *Classifying Latent Infection States in Complex Networks*, Y. Lim, B. Ribeiro, D. Towsley (https://arxiv.org/abs/1402.0013) |
| "arXiv:1402.1471 es el artículo de Zhang" | **FALSO** | `ar5iv.labs.arxiv.org/html/1402.1471` = *Overlaps of qq-raised Néel states with XXZ Bethe states…*, M. Brockmann (https://arxiv.org/abs/1402.1471) |
| ID de arXiv del artículo de Zhang | `[NO VERIFICADO]` | En el índice de arXiv alcanzable aquí, la búsqueda por título `"Bounded gaps between primes"` devuelve **15 artículos y ninguno es de Zhang** (https://arxiv.org/search/?searchtype=title&query=%22Bounded+gaps+between+primes%22); la búsqueda por autor "Zhang, Yitang" devuelve sólo 3 artículos (0705.4306, 1512.01470, 2211.02515) (https://arxiv.org/search/?searchtype=author&query=Zhang%2C+Yitang). **No invento un ID.** |

Fuente usada para todo lo demás: **PDF oficial de Annals of Mathematics** (acceso libre),
descargado de https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n3-p07-p.pdf
(página del artículo: https://annals.math.princeton.edu/2014/179-3/p07).
He extraído el texto yo mismo del PDF (protección RC4, R3/V2, contraseña de usuario vacía);
los **dígitos** de esa extracción son fiables; algunos símbolos (λ, ε, δ, ϖ, ≪, ≈) requieren
lectura por contexto y se señalan donde procede.

---

## 1. Constantes del enunciado principal (artículo de Zhang)

| Constante | Valor exacto | Dónde aparece | Fuente |
|---|---|---|---|
| Acotado final | `liminf_{n→∞}(p_{n+1} − p_n) < 7 × 10^7 = 70 000 000` | Resumen y ec. (1.5) | PDF Annals, p. 1121–1122 (abstract; (1.5)) |
| Talla mínima de la tupla admisible | `k_0 ≥ 3.5 × 10^6 = 3 500 000` | Teorema 1 | PDF Annals, p. 1122 (Thm 1) |
| Desigualdad que produce el 70 000 000 | `π(7·10^7) − π(3.5·10^6) > 3.5·10^6` | Tras (1.5) | PDF Annals, p. 1122 |
| Verificación numérica propia de esa desigualdad | `π(7·10^7) = 4 118 054`; `π(3.5·10^6) = 250 150`; diferencia `= 3 867 914 > 3 500 000` ✔ | — | Cálculo propio (criba de Eratóstenes hasta 7·10^7) |
| Exponente del nivel de criba | `D = x^{1/4+δ}`, ec. (2.5) | §2 | PDF Annals, p. 1125 |
| Valor de δ | `δ = 1/1168` | §2, "Let D be as in (2.5) with δ = 1/1168" | PDF Annals, p. 1125 |
| Entero asociado a δ | `1/(4δ) + 1 = 292 + 1 = 293`; de ahí `Σ_{D_1≤p<D} 1/p = log 293 + O(L^{-A})` | ec. (4.14) | PDF Annals, p. 1138 (coherente con δ = 1/1168) |
| Orden del peso de Selberg | `l_0 = 180` | §2 | PDF Annals, p. 1126 |
| Nivel inferior (Bombieri–Vinogradov) | `D_2 = x^{1/2−ε}` y `d < D_2^2 = x^{1−2ε}` | §6 | PDF Annals, p. 1143 |
| Nivel de primos pequeños | `D_1 = x^δ`, `P = Π_{p<D_1} p` | ec. (2.9) | PDF Annals, p. 1126 |
| Nivel de "primalidad" | `D_0 = exp(L/k_0)`, `P' = Π_{p≤D_0} p` | ec. (2.10) | PDF Annals, p. 1126 |
| Parámetros de tipo I/II | `x_1 = x^{3/8+8δ}`, `x_2 = x_1^{1/2−4δ}` | ec. (2.13) | PDF Annals, p. 1126 |
| Cotas de los órdenes de convolución | `j_1 ≤ 19`, `j_2 ≤ 19`, `|j_1+j_2| ≤ 20`; en Tipo III `j_1 ≤ 17` | (A1)–(A3), Tipo III | PDF Annals, p. 1126–1127 |
| Cota final del error Γ | `Γ_1 < exp(1200)` | ec. (4.21) | PDF Annals, p. 1141 |
| Cota intermedia explícita | `log Γ_1 < 3 500 000·(log 293)/292 + 584·log(185 100) + 360·log(26 500) < 1200` | ec. (4.21) | PDF Annals, p. 1140–1141 (contiene `3 500 000`) |
| Relación Γ₂/Γ₁ | `Γ_2 ≺ Γ_1 = k_0(k_0+2l_0+1)(1+4δ)/((2l_0+1)(2l_0+2)) < 10^8` | §5 | PDF Annals, p. 1142 |
| Número de factores primos de `q | P̃, q < D` | a lo más `293` (pues sus primos son ≥ D_1 y `q < D`) | §4 | PDF Annals, p. 1138 (la extracción automática lee "292"; el valor 293 es el que hace consistente `Σ 1/p = log 293` con δ = 1/1168) |
| Rango Tipo III (objetivo) | `x^{1/2−ε} < d < x^{1/2+2δ}`, `d | P`, `(d,P') < D_1` | ec. (13.1) | PDF Annals, p. 1162 |
| Rango Tipo III (crudo, sin factorización) | `MN_1 ≪ x^{3/8−5δ/2−ε}` | §2 | PDF Annals, p. 1127 |
| Parámetro K de Tipo III | `K = ⌈x^{1/2−48δ}/(N_1N_2)⌉`, `K ≪ x^{1/8−56δ}` | ec. (13.15) | PDF Annals, p. 1164 |
| Peso de completación | `ρ̃(m) ≺ min{1/r, 1/|m|, q/m^2}` | ec. (14.10) | PDF Annals, p. 1170 |
| Cotas de las dos piezas de Cauchy | `P_1 ≪ d_1^{1+ε/2} N_1^2`; `P_2 ≪ d_1 x^{3/16+52δ+ε}/K^2` | ec. (14.2), (14.3) | PDF Annals, p. 1167 |
| Nivel Tipo III alcanzado | `(1/K)Σ_{k≍K} N(d_1;k) ≪ x^{1−δ/2+ε} M_1^{-1}` | ec. (13.16) | PDF Annals, p. 1164 |
| Condición de cierre final | `31/32 + 36δ ≤ 1 − δ/2` ⟺ `δ ≤ 1/1168` | fin de §14 | PDF Annals, p. 1171 (los dígitos; la forma exacta se confirma con la fuente [Tao13b] abajo) |

## 2. Constantes de la reformulación moderna (motohashi–pintz–Zhang / Polymath)

| Constante | Valor | Fuente |
|---|---|---|
| Zhang obtiene `MPZ[ϖ,δ]` para | `0 ≤ ϖ, δ < 1/1168` | Polymath8b "Variants of the Selberg sieve", Claim 2.4: https://arxiv.org/abs/1407.4897 (texto vía https://ar5iv.org/abs/1407.4897) |
| Nivel de distribución de los primos en el resultado de Zhang | `θ = 1/2 + 1/584` | Polymath8a, Thm 1.1 y comentario: https://arxiv.org/abs/1402.0811 ("In [52], Zhang establishes a weaker form of Theorem 1.1, with θ = 1/2 + 1/584") |
| Nivel de distribución alcanzado por Polymath8a | `θ = 1/2 + 7/300` | ibid. (abstract) |
| Mejora Polymath8a de MPZ | `600ϖ + 180δ < 7` (ϖ → 7/600 ≈ 0.01167) | ibid. (Thm 2.5) |
| Parámetros implícitos de Zhang en la notación `Type_I/II/III[ϖ,δ,σ]` | `ϖ = δ = 1/1168`, `σ = 1/8 − 8ϖ` | ibid. (§ "In Zhang's work [52]…") |
| Numerología optimizada de Zhang (Polymath8a) | `Type I: 44ϖ+12δ+8σ < 1`; `Type II: 116ϖ+20δ < 1`; `Type III: σ > 3/26 + (32/13)ϖ + (2/13)δ` | ibid. |
| Saturación numérica de esas condiciones con `ϖ=δ=1/1168`, `σ=1/8−8ϖ` | `44ϖ+12δ+8σ ≈ 0.9931 < 1`; `3/26+(32/13)ϖ+(2/13)δ ≈ 0.1176 < σ ≈ 0.1182` | cálculo propio a partir de las fórmulas de arXiv:1402.0811 |
| Condición que cierra el Tipo III en la lectura de Tao | `31/32 + 36ϖ ≤ 1 − ϖ/2` ⟺ `ϖ ≤ 1/1168` | Tao, reading seminar, alt-text de MathJax: https://terrytao.wordpress.com/2013/06/04/online-reading-seminar-for-zhangs-bounded-gaps-between-primes/ |
| Forma de `MPZ[ϖ,δ]` | `I ⊂ [1,x^δ]`, `Q ≪ x^{1/2+2ϖ}`, `P_I = Π_{p∈I}p`, `q` libre de cuadrados con primos en `I`, clase `a(P_I)` primitiva, y `Σ_{q≤Q}|Δ(Λ1_{[x,2x]};a(q))| ≪ x log^{-A}x` | ibid. (Claim 2.4 de arXiv:1407.4897) |
| `DHL[k_0,2]` alcanzado por Zhang | `k_0 = 3 500 000` | Tao (reading seminar): `{DHL[k_0,2]}`, `{k_0 = 3,500,000}` (misma URL) |
| Valor heurístico de `k_0` al nivel `1/2+1/584` | `k_0 ≈ (θ−1/2)^{-2} ≈ 584^2 = 341 056` (Tao da `341 640`) | Tao: `{k_0 = 341,640}`, `{k_0 \sim (\theta-1/2)^{-2}}` (misma URL; 584² cálculo propio) |
| Condición GPY clásica (forma) | `2θ > (1 + 1/√k_0)^2` | Tao, 3 jun 2013: https://terrytao.wordpress.com/2013/06/03/the-prime-tuples-conjecture-sieve-theory-and-the-work-of-goldston-pintz-yildirim-motohashi-pintz-and-zhang/ (alt-text MathJax) |
| Condición que convertiría `EH[1/2+2ϖ]` en `H_1 ≤ 16` | `ϖ > 0.229855` | Polymath8b (arXiv:1407.4897, Thm 1.1 y comentario) |
| `EH[ϑ]` incondicional (Bombieri–Vinogradov) | `0 < ϑ < 1/2` | ibid. (Thm 2.3) |

## 3. Constantes históricas de la cadena de mejoras (para contexto)

| Cantidad | Valor | Fuente |
|---|---|---|
| Zhang | `H_1 ≤ 70 000 000` | arXiv:1407.4897 (Thm 1.2); arXiv:1409.8361 (retrospectiva Polymath); arXiv:1410.8400 (Granville) |
| k en el teorema de Zhang (tupla admisible) | `k = 3 500 000` | Granville, arXiv:1410.8400 §1.3 ("Zhang proved this result for a fairly large value of k, that is k=3500000") |
| Maynard | `k = 105`; luego `k = 50` | ibid. |
| Polymath8a (optimizando a Zhang) | `H_1 ≤ 4 680` | arXiv:1407.4897 |
| Maynard | `H_1 ≤ 600`; `H_m ≤ C m^3 e^{4m}` | ibid. (Thm 1.3) |
| Polymath8b | `H_1 ≤ 246`; `H_2 ≤ 398 130`; `H_3 ≤ 24 797 814`; `H_4 ≤ 1 431 556 072`; `H_5 ≤ 80 550 202 480`; bajo GEH `H_1 ≤ 6`, `H_2 ≤ 270` | ibid. (Thm 1.4) |
| Cotas de Granville para su prueba de Zhang | `B_m = e^{8m+5}`; Maynard `B_m = c m^3 e^{4m}` | arXiv:1410.8400 |

## 4. Constantes citadas pero **no** verificadas

| Afirmación recibida en el encargo | Estado |
|---|---|
| "nivel de distribución `θ = 1/2 + 1/70`" | `[NO VERIFICADO]`. No aparece en el PDF de Annals (el artículo sólo contiene `1168` como denominador de δ; no hay ningún `70` como constante). Los valores verificados son `1/2 + 1/584` (nivel de primos, según arXiv:1402.0811) y `ϖ = δ = 1/1168` (nivel de criba `D = x^{1/4+ϖ}`, que da nivel de primos `1/2 + 2ϖ = 1/2 + 1/584`). |
| "conjunto admisible de 3.5 millones de elementos con `m = 3.5·10^6` vía criba de Selberg" | `[NO VERIFICADO]`. Zhang no usa tal construcción: su Teorema 1 es para **cualquier** `H` admisible con `k_0 ≥ 3.5·10^6`, y el 70 000 000 se obtiene tomando `H` = `k_0` primos distintos todos `> k_0`, con la desigualdad `π(7·10^7) − π(3.5·10^6) > 3.5·10^6` (verificado literal y numéricamente). No hay ningún parámetro `m` en el artículo. La **criba de Selberg** sí aparece, pero como construcción del peso `ν(n)`, no del conjunto admisible. |
| "rangos `D^{1/2}`, `D^{1/2+1/100}`, `D` (y `q`, `r`)" | `[NO VERIFICADO]` en esa forma. Los rangos que sí verifiqué están en la tabla 1 (§ Lemma 4, (7.1)–(7.5), (13.1)). El paso de reducción contiene un rango de `q` que la extracción automática no me permite resolver de forma fiable (`"D_2/r < q < D_2/r"`, ilegible). |
| "completion de la suma con `r_Δ`" | `[NO VERIFICADO]`. No aparece `r_Δ` en el artículo. La completación de §14 usa el peso `ρ̃(m) ≺ min{1/r, 1/|m|, q/m^2}` (ec. (14.10)) y el desarrollo de Fourier de `F(y)` con `ρ̂(m)`; eso es lo que documento. |
| "`d | n(n+2)`" como estructura de divisores | `[NO VERIFICADO]` en el artículo de Zhang: la expresión `n(n+2)` **no aparece** (búsqueda literal en el texto extraído: 0 ocurrencias). Zhang trabaja con el polinomio general `P(n) = Π_{j=1}^{k_0}(n+h_j)` y con `P(c+h_i)`; la estructura trilineal es `ν = α * β_1 * β_2 * β_3` (Tipo III). `n(n+2)` es la especialización `h = (0,2)` típica de las presentaciones GPY/Maynard. |

---

### Nota de método
Todo el texto del artículo de Zhang citado en `01-zhang.md` procede de mi extracción del PDF de
Annals. Donde la extracción de un símbolo matemático es dudosa, lo marco con `[EXTR.]`
(extracción automática, lectura por contexto) o con `[NO VERIFICADO]`.