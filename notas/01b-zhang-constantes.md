# Notas 01b — Constantes numéricas de Zhang, con fuente y estado

Regla aplicada: **ninguna cifra inventada**. Cada línea indica si la constante fue **verificada
en esta sesión** (con una fuente web real) o si procede de **literatura estándar** pero su
**re-verificación online falló** (las tres URLs del encargo devolvieron 404 o apuntaban a otro
artículo; el título exacto de Wikipedia tampoco existía). Las marcadas **[NO VERIFICADO]** deben
cotejarse con el PDF primario antes de citarse en una publicación.

## A. Verificado en esta sesión (web real)
| Magnitud | Valor | Fuente (verificada hoy) |
|---|---|---|
| Identidad real del "arXiv:1402.1471" | NO es Zhang: es M. Brockmann, cond-mat.stat-mech (J. Stat. Mech. 2014, P05006) | https://arxiv.org/abs/1402.1471 |
| Cita correcta del paper de Zhang | *Ann. of Math.* (2) **179** (2014), n.º 3, págs. **1121–1174** | Referencia bibliográfica estándar (a contrastar con PDF) |
| URL real del proyecto Polymath 8a | página de lanzamiento 4 jun 2013 | https://polymathprojects.org/2013/06/04/polymath-proposal-bounded-gaps-between-primes/ (vista desde https://polymathprojects.org/) |

## B. Constantes matemáticas (literatura estándar; re-verificación online PENDIENTE)
| # | Constante | Valor | Significado | Fuente | Estado |
|---|---|---|---|---|---|
| 1 | Cota de saltos de Zhang | **70 000 000** | $\liminf_{n}(p_{n+1}-p_n)\le 70\,000\,000$ | Zhang, Ann. Math. 179 (2014) 1121–1174 (Teorema princ.) | **[NO VERIFICADO]** online |
| 2 | Nivel de distribución $\theta$ | **$1/2 + 1/584$** ($\approx 0.501712$) | Primos en PA por encima del umbral BV $=1/2$ | Zhang §1–2; confirmado como estándar en Polymath 8a | **[NO VERIFICADO]** online |
| 3 | Corrección sobre 1/2 | **$1/584$** ($\approx 0.001712$) | $\theta - 1/2$ | id. | **[NO VERIFICADO]** online |
| 4 | Exponente MPZ $ϖ=δ$ | **$1/1168$** ($\approx 8.562\times10^{-4}$) | Zhang prueba MPZ$[ϖ,δ]$ para $ϖ,δ\approx 1/1168$ (NO 1/70) | notación de Polymath 8a | **[NO VERIFICADO]** online |
| 5 | Consistencia aritmética | $2\cdot\frac{1}{1168}=\frac{1}{584}$ | $θ=1/2+2·(1/1168)$ | cálculo exacto (verificado aritméticamente) | **[NO VERIFICADO]** que sea la fórmula funcional real $ϖ\!\to\!θ$ |
| 6 | Tamaño del conjunto admisible | **$\approx 3\,500\,000$** | $k$ del $k$‑tuplo admisible que da 70 000 000 | Zhang §7–8; tablas Polymath 8a | **[NO VERIFICADO]** online |
| 7 | Rango Type II | **$D^{1/2}$** | divisores "buenos" del tamiz | Zhang §5–6 | **[NO VERIFICADO]** online |
| 8 | Holgura del divisor trick | **$D^{1/2+1/100}$** ($σ=\tfrac{1}{100}$) | banda difícil controlada por el divisor trick | Zhang §5–6 | **[NO VERIFICADO]** online |
| 9 | Soporte total de pesos | **$D$** | $d\le D$; y módulo $q\le D$ | Zhang §5 | **[NO VERIFICADO]** online |
| 10 | Cota de Weil (Deligne) | $|S|\lesssim d^{1/2}q^{1/2}$ | suma exponencial sobre $\mathbb F_q$ | Weil/Deligne (hecho analítico) | estándar, fórmula canónica |
| 11 | BV clásico | nivel $θ=1/2$ | Bombieri–Vinogradov | BV (hecho analítico) | estándar, canónico |
| 12 | Mejora Polymath 8a (mismo tamiz) | **$H=4\,680$** con $k\approx 3\,405$ | mejor conjunto admisible | Polymath 8a | **[NO VERIFICADO]** online |
| 13 | Mejora Polymath 8a (más refinada) | **$H=246$** | admisible + más nivel | Polymath 8a | **[NO VERIFICADO]** online |
| 14 | Cambio de tamiz (Maynard, 8b) | **$H=600$** (luego 246) | tamiz multidimensional | Maynard; Polymath 8b | **[NO VERIFICADO]** online |

**Nota:** el valor "1/70" mencionado en el encargo **no corresponde** a ninguna notación estándar;
el nivel correcto es $1/2+1/584$ desde $ϖ=δ=1/1168$ (filas 2, 3, 4).