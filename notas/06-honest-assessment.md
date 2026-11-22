# 06 — Evaluación honesta: qué sirve, qué podría servir, qué no puede servir

> Basado **solo** en lo verificado en esta sesión (ver `05-theta-bridges.md` y
> `04-riemann-1859.md`). Nada de esto es conclusión nueva: es la separación entre
> (a) técnica ya incorporada al método, (b) técnica con margen plausible, (c) técnica
> que no puede tocar el cuello de botella. Todo lo no verificado está marcado.

## 0. El blanco exacto

```
liminf_{n→∞} (p_{n+1} − p_n) ≤ H  con H finito
```

y la maquinaria (GPY 2005 → Zhang 2013 → Maynard 2015 → Polymath 8) produce H a partir de
dos entradas: un **nivel de distribución θ** (input analítico) y un **problema variacional**
`M_k/I_k` (input combinatorio). Hechos verificados:

* «una mejora de Bombieri–Vinogradov daría lugar infinitas veces a diferencias acotadas
  entre primos consecutivos» (arXiv:math/0505300, resumen). **[DEMOSTRADO]**
* Con EH (generalizada) Polymath 8b obtiene `H₁ ≤ 6`, y afirman que eso es lo mejor
  posible **desde consideraciones puramente de tamiz** (arXiv:1407.4897, resumen). **[DEMOSTRADO, condicional]**

Conclusión operativa: **todo lo analítico-puro que no toque θ o `M_k/I_k` no cambia H.**

---

## (a) Técnicas YA usadas en Zhang / Maynard / Polymath, y su lugar exacto

| Técnica | ¿Dónde entra exactamente? | Estado |
|---|---|---|
| **Bombieri–Vinogradov** (θ = 1/2+ε) | En las estimaciones Tipo I/II/III sobre `ψ(y;q,a)`/`ψ(y;q_a, [d])` que acotan `S₁/S₂`; es el input que fija el k máximo y por tanto H | **[DEMOSTRADO]** (1965) |
| **Cota de Weil para sumas de Kloosterman (2√p; τ(c)(m,n,c)^{1/2}c^{1/2})** | Entra **solo** allí donde el numerador de una suma tipo II/III factoriza como una forma cuadrática (p. ej. `d \| n(n+2)`) o donde aparece una suma de Kloosterman (delta-método DFI, identidad de Kohnen, theta semientera). Es un ladrillo *local*, no el motor | **[DEMOSTRADO]** (Weil 1948) |
| **Fórmula de Petersson / Bessel + KTF** | En las sumas de convolución desladas de coeficientes de formas cuspales, que es la vía por la que se obtienen cotas de subconvexidad y niveles de distribución en familias → Blomer–Harcos → Thorner. En Zhang/Maynard para primos sobre Q **no** aparece | **[DEMOSTRADO]** (Petersson 1932; Kuznetsov; Blomer–Harcos arXiv:0904.2429) |
| **Siegel–Weil / theta lifts** | En el principio «promedio de coeficientes de una serie theta = coeficiente de una serie de Eisenstein» que está detrás de los promedios de sumas de divisor desladas y de las densidades locales del truco del divisor | **[DEMOSTRADO]** como identidad, pero **[NO VERIFICADO]** su papel exacto dentro de la prueba de Polymath 8b; no afirmar más |
| **Números lisos (truco del divisor, `d ≤ D`, `R = D^δ`)** | Es la mejora 8b sobre 8a: relajar `d` de "libre de cuadrados pequeños" a "lisos" cambia la calibración y de ahí `H₁ ≤ 246` (desde 4680) | **[DEMOSTRADO]** (arXiv:1407.4897) |

**Lectura honesta de (a):** el método de gaps acotados **ya consume** casi toda la
«teoría theta» que sabemos usar sin crear matemática nueva. Weil/Kuznetsov/Siegel–Weil
son el *andamio* de las estimaciones Tipo II/III, pero el **motor** sigue siendo
Bombieri–Vinogradov, y el techo que se ha alcanzado (H ≈ 600, o 246 con el truco del
divisor) sale de θ ≈ 0.5.

---

## (b) Técnicas que podrían (plausiblemente) subir θ

1. **Nivel de distribución automorfo por Kuznetsov (Blomer–Harcos).** Verificado: dan
   cotas Burgess-like para L retorcidas de GL(2) mediante «descomposición espectral de
   sumas de convolución desladas + fórmula de Kuznetsov generalizada»
   (arXiv:0904.2429). Ya explotado por Thorner (arXiv:1401.6677) para gaps en conjuntos
   de Chebotarev. **Margen real, pero ya agotado en su formulación actual**; para
   primos en PA sobre Q no está claro que ayude, porque el rango de conductores que
   haría falta es el de BV, pero sin la simetría multiplicativa que lo hace funcionar.
2. **Tipo II con nivel > 2/3.** Verificado (arXiv:1410.7073, Tao): mejoras de Burgess si
   se tienen estimaciones Tipo II con nivel > 2/3 (o 3/4 libre de cubos);
   «moralmente» también vía τ₃, τ₄. Es una hoja de ruta concreta y acotada.
3. **Control de ceros excepcionales en familias (Harcos–Thorner, arXiv:2303.16889,
   arXiv:2508.10844).** Verificado: región libre de ceros para todos los torcimientos
   `L(s, π×π')`, i.e. la versión moderna del problema de Siegel. Si se ganara
   uniformidad *efectiva* aquí, subiría θ — pero el precio histórico de este programa
   es la **inefectividad**, y una θ inefectiva no produce ningún H numérico.
4. **Cotas de promedios de Kloosterman (Kuznetsov `X^{1/6+ε}`).** Verificado: ya detecta
   cancelación `X^{1/6}` frente al `X^{1/2}` de Weil. Pero la conjetura de Linnik
   (`X^ε`) sigue abierta, y **aunque se demostrara**, produciría cotas de promedios, no
   niveles de distribución de primos. El puente no es automático.

**Veredicto (b):** hay margen técnico real pero estrecho, y ninguno de estos caminos
tiene hoy una ruta publicada que produzca θ > 1/2 + 1/40 incondicionalmente sobre Q.

---

## (c) Técnicas matemáticamente incapaces de ayudar (y por qué)

1. **«Mejorar» la cota de Weil `|S(m,n,p)| ≤ 2√p`. Imposible: es óptima.**
   **[NO VERIFICADO EN SESIÓN]** (afirmación estándar —Katz, *Gauss Sums, Kloosterman
   Sums, and Monodromy Groups* (1988)— pero el chequeo web de `notas/52` muestra que la
   fuente que citábamos, arXiv:2309.08528, **no** la respalda: ese paper solo prueba la
   cota de Weil para sumas de Kloosterman de peso semientero; no menciona optimalidad,
   Sato–Tate ni Katz. **No citar 2309.08528 para esto.**): los ángulos de Kloosterman
   satisfacen `S(1,n,p) = 2√p cos θ_p(n)` y son equidistribuidos según Sato–Tate (Katz).
   La constante 2 es alcanzada infinitas veces. Verificación numérica parcial nuestra:
   `experimentos/kloosterman-weil.js` (0 violaciones en 4.344 sumas, razón máxima 0.9653). Cualquier plan que empiece por «mejorar Weil»
   está muerto antes de empezar. Lo único que se puede mejorar es el **promedio**
   (`X^{1/6+ε}` de Kuznetsov, conjeturalmente `X^ε`).
2. **La RH sobre cuerpos finitos / la cota de Weil sobre F_q. No hay puente conocido a
   θ sobre Q.** Es un teorema de cohomología/ℓ-ádica sobre objetos (variedades sobre
   F_q) que no controla la distribución de primos modulo q sobre ℤ. Es el análogo
   *formal* del paso de theta↔Poisson de Riemann (ver `04-riemann-1859.md` §1), y por eso
   es fascinante históricamente, pero **no** mueve H. Trasladar un resultado de
   Grothendieck al nivel de distribución de `ψ(y;q_a)` no es cuestión de técnica, es
   cuestión de que falta el teorema.
3. **Siegel–Weil / theta-lifts, por sí solos, no suben θ.** Son **identidades de
   promedios** (promedio de coeficientes theta = coeficiente de Eisenstein, en la forma
   clásica). Igualdades no dan cotas de error; hacen falta estimaciones de error
   (Rankin–Selberg, cotas de Bessel, nivel de distribución), que son (a) y (b), no (c).
4. **Fórmulas de traza «en abstracto» (Selberg/Kuznetsov/PGL₂(C)) sin una familia
   paramétrica.** Sin familia no hay nivel de distribución; con familia ya están en (b).
5. **La RH / GRH: [CONJECTURAL].** Bajo GRH, θ = 1−ε; bajo EH generalizada, `H₁ ≤ 6`
   (verificado). Pero (i) es conjetural y (ii) no llega a H = 2. Ninguna de las
   técnicas (i)-(v) de `05-theta-bridges.md` es una demostración de EH ni de RH.
6. **El cuello variacional `M_k/I_k` no lo toca ninguna de estas técnicas.** Verificado
   (arXiv:1407.4897): bajo EH generalizada, `H₁ ≤ 6`, y eso es «lo mejor posible desde
   consideraciones puramente de tamiz». O sea: **aun con θ = 1−ε**, el método de tamiz
   no produce H = 2. Para H = 2 hay que salir del tamiz. [NO VERIFICADO: la forma
   asintótica exacta `M_k/I_k ≍ 4 log k/(2k)`; ver con cuidado antes de usarla.]

---

## Tabla final: PROBADO vs CONJECTURAL

| Afirmación | Estado |
|---|---|
| Ecuación funcional de vía theta (Riemann 1859) | **[PROBADO]** |
| Cota de Weil `2√p` y su forma general `τ(c)(m,n,c)^{1/2}c^{1/2}` | **[PROBADO]** (óptima, Katz/Sato–Tate) |
| Fórmula de traza de Kuznetsov (con `J_{2it}`, peso `1/cosh πt_j`) | **[PROBADO]** |
| Kuznetsov: `Σ_{c≤X} S(m,n;c)/c ≪ X^{1/6+ε}` | **[PROBADO]** |
| Conrey: > 40% de ceros de ζ en la línea crítica | **[PROBADO]** (1989) |
| Bombieri–Vinogradov (θ = 1/2+ε) | **[PROBADO]** |
| H₁ ≤ 600 (Maynard), ≤ 246 (Polymath 8b), H ≈ 4680 (Polymath 8a→8b) | **[PROBADO]** |
| H₁ ≤ 6 bajo EH generalizada | **[PROBADO condicional a conjetura]** |
| «Mejorar BV ⇒ diferencias acotadas» | **[PROBADO]** (como teorema condicional) |
| H₁ ≤ 2 (primos gemelos) | **[CONJECTURAL]** — no demostrado |
| Elliott–Halberstam (θ = 1) | **[CONJECTURAL]** |
| Linnik: `Σ_{c≤X} S(m,n;c)/c ≪ X^ε` | **[CONJECTURAL]** |
| Nivel de distribución «en números lisos» a la Hooley/Friedlander–Iwaniec/«Conrad–Diamond–Liu» | **[NO VERIFICADO]** — sin fuente fetchada; no citar sin comprobar |
| θ efectivo exacto de Zhang y de Polymath 8b | **[NO VERIFICADO]** |

## Conclusión en una frase

Las técnicas theta (Weil, Kuznetsov, Siegel–Weil) **ya están dentro** de la maquinaria de
gaps acotados como andamio de las estimaciones Tipo II/III; su margen de mejora está en
(a) el nivel de distribución automorfo por Kuznetsov (Blomer–Harcos, ya explotado fuera
de Q) y (b) los controles de ceros excepcionales en familias (Harcos–Thorner), pero
**ninguna** de ellas puede mejorar la cota de Weil puntual (óptima) ni el cuello
variacional; y subir θ más allá de ~0.5 no está hoy escrito en ninguna parte.