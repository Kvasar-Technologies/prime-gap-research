# Polymath 8a — "New equidistribution estimates of Zhang type"

**Fuente principal:** D. H. J. Polymath, *New equidistribution estimates of Zhang type*, arXiv:**1402.0811**
(v1 4-feb-2014, v3 3-sep-2014), publicado en *Algebra & Number Theory* **8** (2014), 2067–2199
(DOI 10.2140/ant.2014.8.2067). Texto completo consultado en https://ar5iv.org/abs/1402.0811 .

> **⚠ Corrección importante de identificador:** el arXiv ID `1402.0829` que se indicó en el encargo
> **no** es Polymath 8a. Según la API de arXiv
> (https://export.arxiv.org/api/query?search_query=id:1402.0829&max_results=1), 1402.0829 es
> *"Sharp Estimates for Norms of Functions from Conjugate Classes in Metrics C and L"* de
> V. Babenko (math.FA, 2014). El paper correcto de 8a es **1402.0811**.

---

## 1. Contexto y resultado titular

Zhang (mayo 2013) demostró la finitud de H₁ (= liminf(p_{n+1}−p_n)) con H₁ ≤ 70.000.000,
derivada de k = 3.500.000 (retrospectiva, https://ar5iv.org/abs/1409.8361). El proyecto Polymath8
(8a) se propuso entender y optimizar el argumento de Zhang; su resultado de distribución es el
**Teorema 1.1** de 8a, cuyo enunciado exacto es:

> **Teorema 1.1 (8a).** Sea **θ = 1/2 + 7/300**. Sea ε > 0 y A ≥ 1 fijos. Para cada primo p sea
> a_p una clase residual invertible módulo p, y para cada q ≥ 1 libre de cuadrados sea a_q la
> única clase invertible módulo q congruente con a_p para todo p | q. Existe δ > 0 (dependiendo
> solo de ε) tal que, para x ≥ 1,
>
> $$\sum_{\substack{q \le x^{\theta-\varepsilon}\\ q\ x^{\delta}\text{-smooth, squarefree}}}
> \Bigl\|\psi(x;q,a_q)-\frac{x}{\varphi(q)}\Bigr\| \ll \frac{x}{(\log x)^A},$$
>
> con constante implícita dependiendo solo de A, ε, δ (en particular independiente de las clases
> residuales a_p).

Es decir: **8a alcanza nivel de distribución θ = 1/2 + 7/300 ≈ 0,5233** para módulos lisos
(x^δ-smooth) libres de cuadrados, con congruencias que verifican condiciones tipo CRT y *sin fijar
la clase residual*. Según el propio paper, este es "el mejor resultado conocido sobre primos en
progresiones aritméticas con módulos grandes sin fijar la clase residual" (con clase fija los
mejores resultados siguen siendo los de Bombieri–Friedlander–Iwaniec).

### Punto de partida real de Zhang (corrige el "θ = 1/2 + 1/70")

- En la formulación de 8a, Zhang establece una versión más débil del Teorema 1.1 con
  **θ = 1/2 + 1/584** (§1 de 8a).
- En la formulación MPZ[ϖ,δ] (que es la usada en 8b), Zhang obtiene (esencialmente) MPZ[ϖ,δ]
  siempre que **0 ≤ ϖ, δ < 1/1168** (8b, §2); como el nivel de distribución es 1/2 + 2ϖ, esto
  equivale a 1/2 + 1/584. Los parámetros implícitos de Zhang se toman ϖ = δ = 1/1168,
  σ = 1/8 − 8ϖ (8a, §2.2).
- El valor "θ = 1/2 + 1/70" que aparece en el encargo: **[NO VERIFICADO]**; no figura en ninguna
  de las fuentes consultadas (8a, 8b, wiki, retrospectiva). [Nota: en el HTML de estos papers
  "1/2+1/40" o "1/70" son frecuentemente artefactos de renderizado de "1/4" seguido de "0<…";
  ver el archivo 03b.]

## 2. El marco MPZ, módulos lisos y "densely divisible"

- **Definición (wiki):** n es *y-smooth* si todos sus factores primos son ≤ y; n es
  *y-densamente divisible* si para todo 1 ≤ R ≤ n admite un factor en [y⁻¹R, R]; con doble
  divisibilidad densa análogamente. Se tiene 𝒮_[1,y] ⊂ 𝒟²_y ⊂ 𝒟_y
  (https://web.archive.org/web/20220306064911/https://asone.ai/polymath/index.php?title=Distribution_of_primes_in_smooth_moduli).
- **MPZ[ϖ,δ]:** ∑_{q ∈ 𝒮_I, q < x^{1/2+2ϖ}} ‖Δ(Λ1_[x,2x]; a_q)‖ ≪ x log^{-A}x, para todo
  I ⊂ [1, x^δ] y todo "congruence class system" (a_q) verificando CRT.
- 8a introduce la variante **MPZ^(i)[ϖ,δ]** con divisibilidad densa i-tuple (Def. 2.1: factorizar
  n = qr con y⁻¹R ≤ r ≤ R de forma recursiva), y prueba:
  - **Teorema 2.4(i):** MPZ^(4)[ϖ,δ] para todo ϖ, δ > 0 fijos con **600ϖ + 180δ < 7**
    (esto da ϖ arbitrariamente cercano a 7/600 ≈ 0,011667, luego θ = 1/2 + 2ϖ hasta 1/2 + 7/300).
  - **Teorema 2.4(ii):** MPZ^(2)[ϖ,δ] para **168ϖ + 48δ < 1** (ϖ < 1/168) **sin usar los
    teoremas de Deligne** (solo teoría de Weil en una variable).
  - El lema combinatorio (Lema 2.7): MPZ^(i)[ϖ,δ] se deduce de Type_I^(i) + Type_II^(i) +
    Type_III^(i) (y Type_III puede omitirse si σ > 1/6).

## 3. Las estimaciones Type I/II/III: qué mejora 8a sobre Zhang

Numerología (8a, Tabla/Teorema 2.8 y los "Levels" de la wiki, que coinciden; la fuente wiki
incluye código Maple explícito con estos enteros):

| Estimación | Numeración (condición suficiente) | Zhang |
|---|---|---|
| Type I-1 | 11ϖ + 3δ + 2σ < 1/4 | (método de Zhang) |
| Type I-2 | 17ϖ + 4δ + σ < 1/4 (más 20ϖ+6δ+3σ<1/2) | |
| Type I-3 | **54ϖ + 15δ + 5σ < 1** (usa divisibilidad densa) | |
| Type I-4 | 236ϖ/3 + 64δ/3 + 4σ < 1 (q-van der Corput iterado) | |
| Type I-5 | 160ϖ/3 + 16δ + 34σ/9 < 1 **y** 64ϖ + 18δ + 2σ < 1 (promediando en d₁, l; necesita Deligne) | |
| Type I-6 | 56ϖ + 16δ + 4σ < 1 (rebalanceo de la Cauchy–Schwarz final) | |
| Type II-1 | 58ϖ + 10δ < 1/2 | (método de Zhang) |
| Type II-1a/1b/1c | 48ϖ+7δ < 1/2; 38ϖ+7δ < 1/2; **34ϖ+7δ < 1/2** (optimizando el parámetro R) | |
| Type III-1 | σ > 3/26 + 32ϖ/13 + 2δ/13 (≺ (13/2)(1/2+σ) > 8(1/2+2ϖ)+δ) | ✓ Zhang |
| Type III-2 | σ > 1/10 + 16ϖ/5 + ϖ/5 + δ/5 (promediando en α) | |
| Type III-3 | σ > 1/12 + 7ϖ/3 + δ/4 (método FKMN, sin Weyl differencing) | |
| Type III-4 | **σ > 1/18 + 28ϖ/9 + 2δ/9** (promediando en α; = TypeIII^(1) de 8a, Teo. 2.8(v)) | |

(Fuentes: 8a §2.2–2.3 y §5–8; wiki "Distribution of primes in smooth moduli", secciones
Type I/II/III y su código Maple. En el texto ar5iv las barras de fracción a veces se pierden —
p. ej. "7300" = 7/300 — por eso aquí se citan los enteros tal como aparecen en el Maple de la wiki,
que no está sujeto a renderizado matemático. Nota: "34ϖ+7δ < 1/2" de la wiki coincide con el
"68ϖ+14δ < 1" que muestra el texto de 8a, Teorema 2.8(iv), tras multiplicar por 2.)

Combinaciones MPZ resultantes (wiki, tabla "Combinations"): …, 148ϖ+33δ < 1 → 116ϖ+25,5δ < 1 →
108ϖ+30δ < 1 → (600/7)ϖ + (180/7)δ < 1, esta última usando Type I-5 + Type II-1c + Type III-4,
equivalente a **600ϖ + 180δ < 7** = Teorema 2.4(i) de 8a.

### Las mejoras técnicas concretas (verificadas)

1. **Type I/II vía completion of sums + cotas de Kloosterman (Weil).** Como Zhang, 8a reduce las
   estimaciones Type I/II a acotar sumas exponenciales incompletas
   ∑_{N<n≤2N} e(c₁n̄ + c₂(n+l)̄/q) (§1 de 8a). Las cotas base provienen de *completion of sums*
   (Lema 4.9, §4.4) sobre cuerpos finitos: cotas de Weil para sumas de Kloosterman (|Kl₂| ≤ 2√p;
   §4.2) y sumas de Ramanujan.
2. **q-van der Corput A-process (Heath-Brown; Graham–Ringrose).** Mejora clave de 8a sobre Zhang
   en Type I/II: explotando que q es liso (o al menos densamente divisible) se mejora la cota de
   sumas aditivas incompletas mediante el proceso A de van der Corput en dirección q, combinado con
   la hipótesis de Riemann para curvas sobre cuerpos finitos (§5.3, Prop. 4.12/Cor. 4.16). La wiki
   atribuye a esto los saltos Level 2→3→4→6 de Type I. Para 8b esto no fue el cuello definitivo:
   "the Type II and Type III estimates had been optimised to such an extent that they were no
   longer the dominant barrier… the only remaining major source of improvement was the Type I
   estimates" (retrospectiva).
3. **Tratamiento de las variables divisoras r, s y q (rebalanceo de Cauchy–Schwarz).** Los
   "Level 6" de Type I y Type II (wiki) modifican la Cauchy–Schwarz final: en lugar de duplicar
   todo salvo (n,q₁,q₂), se factoriza **q₂ = r₂s₂** (Type I) o **q₁ = r₁s₁** (Type II) y se hace
   Cauchy–Schwarz en (n, q₁, r₂) duplicando solo (h, s₂), para que el caso diagonal hs′₂ = h′s₂
   aporte más y el no diagonal menos. Resultado: 56ϖ+16δ+4σ < 1. También en Type II se optimiza el
   **parámetro R** del completion of sums: R ∈ [x^{1/2−2ϖ−δ−ε}, x^{1/2−2ϖ−ε}] (Level 1b) y luego
   R ∈ [x^{−δ−ε}N, x^{−ε}N] (Level 1c).
4. **Type I más fuerte: promediado sobre el módulo + Deligne.** La estimación Type I más fuerte
   (§8 de 8a) usa promediado adicional sobre el módulo mediante estimaciones de sumas
   exponenciales multidimensionales (Corolario 6.24) que sí dependen de la forma profunda de
   Deligne de la hipótesis de Riemann sobre cuerpos finitos.
5. **Type III: de Birch–Bombieri a correlaciones de hiper-Kloosterman vía trace functions.**
   Zhang remata su Type III con la estimación tridimensional de Bombieri–Birch sobre
   T(k;m,m′;q) (Weil + sumas de Ramanujan). 8a (§6–7) reduce la tarea a **cotas de correlación de
   sumas de hiper-Kloosterman** (Corolarios 6.24 y 6.26), establecidas con el formalismo de
   *trace functions*ℓ-esquísticas (fajado de Artin–Schreier + fajado de hiper-Kloosterman de rango
   3, vía la segunda demostración de Deligne). Numerología: σ > 1/18 + 28ϖ/9 + 2δ/9 en lugar de
   σ > 3/26 + 32ϖ/13 + 2δ/13 (Zhang); además FKMN mostraron (Type III-3, σ > 1/12+7ϖ/3+δ/4)
   que se puede evitar Weyl differencing.
6. **"Segunda expansión" (second expansion) y "divisor trick" con números lisos R = D^δ sobre
   d | n(n+2):** estos términos concretos **[NO VERIFICADO]** — no aparecen en el texto de 8a ni en
   el de 8b ni en la wiki "Distribution of primes in smooth moduli". Lo que sí existe y cubre
   parcialmente la descripción: (i) el "divisor trick" de Zhang sí se discute en el seminario de
   Tao (https://terrytao.wordpress.com/2013/06/14/estimation-of-the-type-iii-sums/, §2:
   descomposición d = d₁d₂, inversión de Möbius, el lema ∑_{k≤K}(k,q) ≪ q^{o(1)}K para los
   factores (k,q)); (ii) las expansiones de Taylor en intervalos finos ℐ(Q) (§8.2); (iii) el
   parámetro R en Type II. Se recomienda verificar la atribución original de "second expansion"
   antes de usarla.

## 4. La cadena de valores de H durante 8a (wiki, "Timeline of prime gap bounds")

Fuente: https://web.archive.org/web/20221019100720/https://asone.ai/polymath/index.php?title=Timeline_of_prime_gap_bounds
(convenciones: # = no usa Deligne; ?? = límite teórico/provisional; [EH]/[GEH] = condicional).

| Fecha | ϖ o (ϖ,δ) | k₀ | H |
|---|---|---|---|
| 14-may-2013 | 1/1168 (Zhang) | 3.500.000 (Zhang) | **70.000.000** |
| 21-may | | | 63.374.611 (Lewko) |
| 28-may | | | 59.874.594 (Trudgian) |
| 30-may | | | 59.470.640 (Morrison) → 57.554.086 (Morrison) |
| 31-may | | 2.947.442 → 2.618.607 (Morrison) | 48.112.378 → 42.342.946 |
| 1-jun | | | 42.342.924 (Tao) |
| 2-jun | | 866.605 (Morrison) | 13.008.612 (mejora de Σ₂) |
| 3-jun | 1/1040? | 341.640 (Morrison) | 4.982.086 → 4.802.222 (reformulación DHL) |
| 4-jun | | | 4.801.744 → 4.788.240 (Sutherland) |
| 5-jun | | 34.429? (cutoff de Bessel) | 4.725.021 → 387.974 (tuplas greedy-greedy) |
| 17-jun | 348ϖ+68δ<1 | 6.329 (v08ltu) | 60.760 → 60.732 (Type III con α) |
| 20–23-jun | 148ϖ+33δ<1 | 1.470 → 1.466 | 12.042 → 12.006 (Engelsma) |
| 24–27-jun | 116ϖ+25,5δ < 1 → 108ϖ+30δ<1 | 1.268 → 962 → 902 | 10.206 → 7.470 → 6.966 |
| 30-jun–1-jul | (93+1/3)ϖ+(26+2/3)δ<1 | 873? | 6.712 |
| 5-jul | 7/600? (10-jul) | 720 | 5.414 (doble divisibilidad densa) |
| **27-jul** | | **633 → 632** (Tao/Harcos) | **4.686 → 4.680 (Engelsma): valor final de 8a** |
| **30-jul** | 168ϖ+48δ<1 | 1.788 (Tao) | **14.994** (Sutherland) — sin Deligne |
| 17-ago | | 1.783 | 14.950 — sin Deligne |
| 3-oct | 13/1080?? | 604?? | 4.428?? (provisional) |
| 11-oct | (83+1/13)ϖ+(25+5/13)δ<1? | 603? | 4.422? |

- Primer journal del proyecto: liminf(p_{n+1}−p_n) ≤ **4.680** (8a, §1), alcanzado con
  k = 632 y tupla de Engelsma de diámetro 4.680 (la wiki conserva la tupla
  `admissible_632_4680.txt` y el applet sieving k=632, diámetro 4.680).
- El valor **4.014** que se preguntaba: **[NO VERIFICADO]** — no aparece en la cronología de la
  wiki, ni en 8a/8b, ni en la retrospectiva. (Sí aparecen 14.994, 14.950, 4.428??, 4.422? y el
  final 4.680.)

## 5. Estado final y publicaciones

- El valor 4.680 (k₀ = 632) usaba las estimaciones de distribución con Deligne; la variante sin
  Deligne (168ϖ+48δ < 1) daba 14.994 (k₀ = 1.788).
- El paper 8a publicado (ANT, 2014) se centra solo en las estimaciones de equidistribución; la
  parte de cotas a H quedó obsoleta ante Maynard. Tenía originalmente 163 páginas; la versión
  revisada tiene 107 (retrospectiva, nota de Tao).
- Hₘ para m grande: "The results here are also needed to obtain the best known bounds on
  liminf(p_{n+k}−p_n) for large values of k; see [47]" (= 8b).