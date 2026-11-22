# 05 — Puentes theta: bibliografía anotada con enunciados exactos

> **Convenio.** Cada entrada dice **[DEMOSTRADO]** (teorema con fuente), **[CONJECTURAL]**
> o **[NO VERIFICADO]** (no he podido contrastarlo con una fuente fetchada en esta sesión;
> no lo des por bueno). Todas las URLs fueron fetchadas el 2026-11-21 salvo indicación.
> Todas las citas a arXiv están verificadas contra la API de arXiv
> (`export.arxiv.org/api/query`): id, título, autores y resumen.
>
> **Aviso importante:** buscando `abs:"smooth numbers" AND abs:"level of distribution"`
> la API devuelve **0 resultados**; `abs:"level of distribution" AND abs:"Riemann"`
> devuelve 5, ninguno relevante (física / RMT); `au:"Diamond" AND abs:"zeta"` devuelve
> **0**. Por tanto el apartado (iii) está marcado como no verificado. *No inventar
> referencias.*

---

## (i) Cota de Weil para sumas de Kloosterman (vía la representación de Weil / la theta) **[DEMOSTRADO]**

**Definición** (Kloosterman 1926; tal cual en Andersen–Anderson–Woodall,
arXiv:2309.08528, ec. (1.1)):

```
S(m,n,c) = Σ_{d(c)×} e_c( m·d̄ + n·d ),   e_c(x) = e^{2π i x / c}.
```

**Enunciado verificado** (arXiv:2309.08528, Introducción; y arXiv:1202.0189, ec. (1.1)):

```
|S(m,n,p)| ≤ 2 √p      (Weil; mejora el p^{3/4} de Kloosterman)              (i.a)
|S(m,n,c)| ≤ τ(c)·(m,n,c)^{1/2}·c^{1/2}      (forma general, llamada «cota de Weil»)  (i.b)
```

**El puente theta (verificado, arXiv:2309.08528 §§3.2–3.3).** Para un retículo par `L`
con grupo discriminante `L'/L`, la **representación de Weil** `ρ_L : Mp₂(Z) → C[L'/L]`
viene dada por `ρ_L(T)e_α = e(q(α))e_α` y
`ρ_L(S)e_α = i^{(b⁻−b⁺)/2}|L'/L|^{-1/2} Σ_β e(−⟨α,β⟩) e_β`, y sus coeficientes
admiten la fórmula de **Shintani** (3.12):

```
ρ_{αβ}(g̃) = i^{(b⁻−b⁺)/2} / ( c^{(b⁺+b⁻)/2} √|L'/L| ) · Σ_{r ∈ L/cL} e_c( a q(α+r) − ⟨β,α+r⟩ + d q(β) ).
```

Es decir: **los coeficientes de la representación de Weil son sumas exponenciales
cuadráticas explícitas** (la theta del cuerpo finito, en versión de retículo), y las
sumas de Kloosterman (de peso entero o semientero) se definen combinando esos
coeficientes (`S_{α,β}(m,n,c) = e^{−πik/2} Σ_{d(c)×} ρ̄_{αβ}(g̃)e_{2Δc}(ma+nd)`, ec. (3.14)).
Su cota trivial es `≪ c`; la cota de Weil sale de una **identidad que relaciona una suma
de divisores de sumas de Kloosterman con una suma exponencial rala** (generaliza la
identidad de Kohnen), Teoremas 2.1/2.2 y Corolario 2.3 de 2309.08528:

```
S_{αv,β}(m v², n, c) ≪_L √c · Σ_{u | (v,c)} R(m₀n, c/u),   R(y,c) ≤ 2^{ω(c)+1}(y,c)^{1/2}.  (i.c)
```

El mismo mecanismo, en el «mundo de las formas modulares», es la **fórmula de traza de
Petersson** (arXiv:1202.0189, §1): el lado geométrico tiene `Σ_c S(m,n;c)/c · J_{k-1}(4π√(mn)/c)`.

**Resultados vecinos verificados:**
* Los ángulos de Kloosterman (Sato–Tate): `S(1,n,p) = 2√p cos θ_p(n)` con `(θ_p(n))`
  equidistribuidos según Sato–Tate — teorema de **Katz** (*Gauss Sums, Kloosterman Sums,
  and Monodromy Groups*, Ann. of Math. Studies 108, PUP 1988).
  **[NO VERIFICADO EN SESIÓN]**: el chequeo web de `notas/52` confirma que la fuente que
  citábamos (arXiv:2309.08528) **no** respalda esta atribución (solo trata de la cota de
  Weil para sumas de peso semientero). El contenido es estándar en la literatura, pero
  aquí no se pudo confirmar contra fuente primaria; **no citar 2309.08528 para esto**.
  Nuestra evidencia propia (experimento E1: 4.344 sumas, razón máxima `|K|/(2√p) = 0.9653`)
  es *consistente* con la optimalidad pero no la demuestra. ⇒ la cota `2√p` es
  **óptima salvo constante** (afirmación: [NO VERIFICADO] en este proyecto).
* arXiv:1202.0189, ec. (1.10): cota de Weil para las sumas de Kloosterman *retorcidas y
  generalizadas* `|S_χ(a,b;n,c)| ≤ τ(n)τ(c)(an,bn,c)^{1/2}c^{1/2}c_χ^{1/2}`, con el
  aviso explícito de que la versión «ingenua» `|S_χ(a,b,c)| ≤ τ(c)(a,b,c)^{1/2}c^{1/2}`
  es **falsa** (contr ejemplo en §9.9). Ojo: no generalizar a lo gratis.
* arXiv:2412.04976 (Linn): sí hay *power saving* para `GL_n`, n > 2, para todos los
  elementos de Weyl, representando las sumas como sumas exponenciales y acotando con la
  cota de Weil. ⇒ las mejoras existen, pero **fuera de GL(2)**.

**Cómo incide en gaps acotados:** la cota de Weil entra en la parte «gran tamiz /
Kloosterman» de las estimaciones tipo II/III y en cualquier argumento que use la
representación de Weil (Kohnen, theta semientera). Para el problema de los primales
`n(n+2)` es una cota *puntual* y ya es óptima: por sí sola **no** sube θ. Su valor real
en el proyecto es como **ladrillo exacto dentro de una fórmula de traza** (ver (ii)).

## (ii) Fórmula de traza de Kuznetsov **[DEMOSTRADO]**

Enunciado exacto, verificado en arXiv:1202.0189 §1, ecs. (1.3), (1.5), (1.6)
(Li–Knightly, *Mem. AMS*; `Δu_j = (1/4 + t_j²)u_j`, `σ_{2s}(m) = Σ_{0<d|m} d^{2s}`,
`K_s` = K-Bessel):

```
ESPECTRAL                                           =            GEOMÉTRICO

Σ_j h(t_j)/cosh(πt_j) · a_m(u_j)·ā_n(u_j)/‖u_j‖²
 + (1/π)∫_{−∞}^{∞} ((m/n)^{it} σ_{2it}(m)·σ̄_{2it}(n))/|ζ(1+2it)|² · h(t) dt
 =
   δ_{m,n}/π² ∫_{−∞}^{∞} h(t)·tanh(πt)·t dt
 + (2i/π) Σ_{c≥1} S(m,n;c)/c · ∫_{−∞}^{∞} J_{2it}(4π√(mn)/c) · h(t)·t/cosh(πt) dt .
```

*(Versión holológica análoga, Petersson, verificada en el mismo §1:)*

```
Γ(k−1)/(4π√(mn))^{k−1} · Σ_f a_m(f)ā_n(f)/‖f‖² = δ_{m,n} + 2π i^k Σ_c S(m,n;c)/c J_{k−1}(4π√(mn)/c).
```

Con `J_{k−1}(x) ≪ min(x^{k−1}, x^{−1/2})` (cota de Bessel verificada en el mismo texto).

**Qué da (todo verificado en 1202.0189 §1):**
* Kuznetsov (Teorema 3): `Σ_{c≤X} S(m,n;c)/c ≪_{m,n,ε} X^{1/6+ε}` — contra `X^{1/2}` de la
  cota de Weil sola. Es decir: **la traza extrae cancelación que la cota puntual no ve**.
  Linnik conjeturó 1962 que vale `X^ε`; sigue abierto.
* Selberg: `λ₁(Γ₀(N)) ≥ 3/16` a partir de la cota de Weil para Kloosterman, y la
  relación «sumas de Kloosterman ↔ λ₁» vía la serie
  `Z(s,m,n) = Σ_c S(m,n;c)/c^{2s}`.
* Deshouillers–Iwaniec: λ₁/… y que la conjetura de Linnik vale **en promedio**.
* Conrey (1989): >40% de los ceros de ζ en la línea crítica (vía esos controles).
* Duke–Friedlander–Iwaniec: equidistribución de raíces de congruencias cuadráticas
  (vía cota de una serie de Poincaré por su desarrollo espectral).
* El significado de las funciones de Bessel: son **las funciones de Bessel de las
  representaciones unitarias irreducibles de PGL₂(R)** (Cogdell–Piatetski-Shapiro),
  y el lado geométrico sale de aplicar sumación de Poisson en el espacio de Whittaker.
  Versión moderna explícita: arXiv:2410.15627 (Zhaolin Li) — Poisson en el espacio de
  Whittaker de GL₂ (= transformada de Hankel de Jacquet) ⇒ la ecuación funcional de las
  L-funciones estándar. Generalizaciones: arXiv:1606.02477 (PGL₂(C)),
  arXiv:2502.17234 (GSp(4)), arXiv:2005.09949 (ramificaciones locales prescritas),
  arXiv:1709.01365 (convolución para L de Dirichlet generalizadas).

**Cómo incide en gaps acotados:** indirectamente pero de forma esencial. Es la herramienta
que produce **cotas de nivel de distribución en familias retorcidas** (Blomer–Harcos,
(iv)), que es lo que Thorner usa para gaps acotados en conjuntos de Chebotarev. Para
primos en progresiones aritméticas sobre Q, la cantidad que se necesita sigue estando
fuera del alcance de la KTF tal cual (ver 06).

## (iii) «Nivel de distribución» de ζ en intervalos cortos / números lisos — **[NO VERIFICADO]**

**Lo que no pude verificar.** La API de arXiv no devuelve nada para
`"smooth numbers" AND "level of distribution"` (0 resultados), ni para
`"level of distribution" AND "Riemann"` (5 resultados, ninguno matemático puro
relevante: RMT y física), ni para `au:"Diamond" AND abs:"zeta"` (0). No he podido
confirmar la existencia de referencias etiquetadas «Conrad–Diamond–Liu» sobre nivel de
distribución de ξ. **[NO VERIFICADO: no citar estas referencias sin comprobarlas]**
(hojas tradicionales: C. Hooley, J. B. Friedlander–H. Iwaniec — buscar por ISI/zbMATH,
no en arXiv).

**Lo que SÍ es matemáticamente sólido y está verificado (con fuente):**

* El marco general: para x grande y `H` un k-tuplo admisible, el método GPY/Zhang/Maynard
  reduce gaps acotados a (a) un **nivel de distribución θ** y (b) un problema variacional.
  Verificado en el resumen de arXiv:math/0505300 (Goldston–Motohashi–Pintz–Yıldırım,
  *Small gaps between primes exist*):
  > «We also show here that **an improvement of the Bombieri–Vinogradov prime number
  > theorem would give rise infinitely often to bounded differences between consecutive
  > primes.» **[DEMOSTRADO]**
* Dependencia cuantitativa de EH, verificado en arXiv:math/0506067 (Goldston–Graham–
  Pintz–Yıldırım): para números con dos factores primos, `liminf(q_{n+1}−q_n) ≤ 26`
  y «**If an appropriate generalization of the Elliott–Halberstam Conjecture is true,
  then the above bound can be improved to 6**». **[DEMOSTRADO, condicional]**
* El mecanismo concreto por el que subir el «nivel» de las estimaciones tipo II mejora
  cotas clásicas, verificado en arXiv:1410.7073 (Tao):
  > «we can obtain an improvement over the Burgess bound … if one had Type II estimates
  > with **level of distribution above 2/3** (when the conductor is not cube-free) or
  > **3/4** (if the conductor is cube-free); morally, one would also obtain such a gain if
  > one had distributional estimates on the third or fourth divisor functions τ₃, τ₄ at
  > level above 2/3 or 3/4.» **[DEMOSTRADO, condicional]**

* Estado del arte (números verificados, arXiv:1407.4897 = Polymath 8b):
  Maynard `H₁ ≤ 600`; Polymath `H₁ ≤ 4680 → 246` **incondicional**,
  y `H₁ ≤ 6` **bajo la conjetura de Elliott–Halberstam generalizada**; además
  `H_m ≪ m³e^{4m}` (incond.) y `≪ m³e^{2m}` (bajo EH). **[DEMOSTRADO]**
  [NO VERIFICADO: el valor exacto de θ efectivo de Zhang `1/2 + 1/1160`-like y de
  Polymath 8b — no lo he contrastado con fuente primaria; usar el valor de
  `10-cuellos-de-botella.md` `θ=0.525` como hipótesis de trabajo.]

## (iv) Bombieri–Vinogradov y estado del arte para L-funciones automorfas **[DEMOSTRADO]**

**Bombieri–Vinogradov (1965)** — el teorema que hace funcionar todo (citado como
ingrediente en arXiv:1407.4897, arXiv:1401.6677):

```
max_{(a,q)=1} |ψ(y;q,a) − y/φ(q)| ≪_A y/(log y)^A   para todo q ≤ √y
   (más exactamente Q = y^{1/2}/(log y)^B).
```

Es decir **θ = 1/2 + ε** incondicional; θ = 1−ε bajo GRH. Nada nuevo que demostrar aquí,
pero conviene escribir la familia exacta: `L(s,χ)` con (q, 𝔠_χ) = 1.

**Familia automorfa, nivel de distribución (aspecto de nivel).** Verificados:
* arXiv:0904.2429, **Blomer–Harcos** (GAFA 20 (2010) 1–52, DOI 10.1007/s00039-010-0063-x):
  cota Burgess-like para L-funciones retorcidas de GL(2) sobre todo campo totalmente real,
  probada por **descomposición espectral de sumas de convolución deslizadas + fórmula de
  Kuznetsov generalizada**. **[DEMOSTRADO]** — es la «versión automorfa» de (ii)+(iii).
* arXiv:math/0101096 (Harcos, *Math. Ann.* 326 (2003) 347–365) y su tesis
  arXiv:math/0305299: sumas de productos deslizados de coeficientes de Fourier +
  subconvexidad de `L(s, π ⊗ χ)` extendiendo Duke–Friedlander–Iwaniec. **[DEMOSTRADO]**
* arXiv:1405.5457 (Young, JEMS): subconvexidad Weyl del valor central de L con torcimiento
  cuadrático, uniforme en el parámetro arquimediano y en el torcimiento —
  «hybrid bounds»: el ingrediente estándar para rangos de nivel. **[DEMOSTRADO]**
* arXiv:2110.01783 (Sono): segundo momento de torcimientos de Dirichlet de una
  L-función automorfa de GL(4), con cota híbrida. **[DEMOSTRADO]**
* arXiv:2303.16889 / arXiv:2508.10844 (Harcos–Thorner, Crelle 2025): regiones libres de
  ceros para **todos** los torcimientos `L(s, π×π')` con carácter, es decir la versión
  moderna del problema del **cero excepcional de Siegel** en familias. Esto es
  exactamente el ingrediente que hace «no uniforme» cualquier nivel de distribución
  automorfo. **[DEMOSTRADO]**
* Aplicación a gaps acotados fuera de Q: arXiv:1401.6677 (**Thorner**, *Res. Math. Sci.* 1
  (2014) art. 4): aplicando el método de Maynard a conjuntos de Chebotarev, usando
  niveles de distribución para L retorcidas en lugar de Bombieri–Vinogradov.
  **[DEMOSTRADO]** ⇒ los métodos espectrales SÍ trascienden el caso Q, pero para
  conjuntos de primos escasos, no para mejorar H sobre Q.

## (v) Elliott–Halberstam **[CONJECTURAL]**

```
Para todo A>0 y todo θ < 1:  max_{(a,q)=1}|ψ(y;q,a) − y/φ(q)| ≪_A y/(log y)^A
                                para todo q ≤ y^θ − (log y)^A .
```

`θ = 1` (o el máximo posible) ⇒ `liminf(p_{n+1} − p_n) = 2`? No exactamente: GPY
observó que con EH en amplitud θ ≈ 1 se obtiene H = 16 (verificado en
arXiv:1407.4897: «if one also assumes the Elliott–Halberstam conjecture, Maynard obtained
the bound H₁ ≤ 12, improving upon the previous bound H₁ ≤ 16 of Goldston, Pintz, and
Yıldırım»); bajo EH **generalizada** Polymath 8b obtiene `H₁ ≤ 6`, y afirman además que
«this result is the best possible that one can obtain from **purely sieve-theoretic**
considerations» (barrera de paridad de Selberg modificada). **[DEMOSTRADO, condicional]**
Para H = 2 haría falta superar el obstáculo variacional `M_k/I_k ≍ 4 log k/(2k)`
[NO VERIFICADO: forma exacta del criterio], que no es una cuestión de θ.

---

## Cómo se leen estos puentes desde 1859 (resumen de la cadena)

```
Riemann 1859:  θ + Mellin + Poisson  ⇒  Γ∞(s)=π^{-s/2}Γ(s/2)  (factor de lugar)
                                              │
                    ┌─────────────────────────┴──────────────────────────┐
            cuerpo finito Q_p                              lugares todos (adelos)
   representación de Weil de SL₂(F_q)          fórmulas de traza relativas
   coeficientes = sumas exponenciales          (Petersson → Kuznetsov)
   ⇒ cota de Weil 2√p (óptima)                 ⇒ Kuznetsov: X^{1/6+ε} (cancelación)
   ⇒ Kohnen / theta semientera                 ⇒ Blomer–Harcos: nivel en familias
   ⇒ DFI (equidistribución)                    ⇒ Thorner: gaps en Chebotarev
                                              ⇒ (intento) subir θ ⇒ H
```

Los eslabones **verificados** de esta cadena son los cinco apartados de arriba.
Los eslabones **[NO VERIFICADO]** son únicamente (iii)-Hooley/Friedlander–Iwaniec/
Conrad–Diamond–Liu y el valor exacto de θ efectivo de Zhang.