# 04 — Riemann 1859: lo único que nos importa (θ-función, fórmula explícita, orden de los ceros)

> **Estado de las fuentes.** La fuente primaria (original alemán + traducción inglesa de
> D. R. Wilkins) está alojada en Trinity College Dublin y **existe**, pero este entorno no
> puede leer PDF ni `.tex` por webfetch (mensaje devuelto: `Unsupported fetched file
> content type: application/pdf` / `-x-tex`). Verificado el directorio:
> <https://www.maths.tcd.ie/pub/HistMath/People/Riemann/Zeta/>
> (original `Zeta.pdf`, traducción `EZeta.pdf`). Por eso las citas textuales se marcan
> **[NO VERIFICADO]** y se da la fuente secundaria *sí* fetchada.
>
> Fuente secundaria verificada (fetched, 2026-11-21):
> Wikipedia EN, *Riemann zeta function*, secciones «Riemann's functional equation»,
> «Riemann's xi function» y «Zeros, the critical line, and the Riemann hypothesis»:
> <https://en.wikipedia.org/wiki/Riemann_zeta_function>
> Existe además el artículo
> <https://en.wikipedia.org/wiki/On_the_Number_of_Primes_Less_Than_a_Given_Magnitude>
> (enlazado dos veces desde la página fetchada; **no** fetched).

---

## 1. Lo que Riemann hace con la función theta (el núcleo, verificado)

Riemann considera (Wikipedia, §3, transcripción literal del cálculo):

```
ψ(x) := Σ_{n=1..∞} e^{−π n² x}        (su "theta", salvo la constante)
```

y usa dos hechos:

**(A) Identidad integral (Mellin de theta):** para Re(s) > 0,

```
∫_0^∞ x^{s/2 − 1} e^{−π n² x} dx = Γ(s/2) / (n^s · π^{s/2}) .
```

Sumando en n y usando convergencia absoluta (Re(s) > 1 para la suma):

```
π^{−s/2} Γ(s/2) ζ(s) = Σ_{n≥1} ∫_0^∞ x^{s/2−1} e^{−πn²x} dx
                       = ∫_0^∞ x^{s/2−1} ψ(x) dx .                       (1)
```

**(B) Inversión de la theta por sumación de Poisson:**

```
Σ_{n=−∞..∞} e^{−n²πx} = (1/x) Σ_{n=−∞..∞} e^{−n²π/x}
⟹  2ψ(x) + 1 = (1/x)·(2ψ(1/x) + 1).                                       (2)
```

Riemann parte la integral (1) en `∫_0^1 + ∫_1^∞`, sustituye (2) en el primer trozo y
re-sustituye `x ↦ 1/x`. Resultado (forma *exactamente* simétrica, verificado):

```
π^{−s/2} Γ(s/2) ζ(s) = 1/(s(s−1))
      + ∫_1^∞ ( x^{s/2 − 1} + x^{(1−s)/2 − 1} ) ψ(x) dx .                 (3)
```

El integrando (y el polo `1/(s(s−1))`) es **invariante bajo s ↔ 1−s**. De ahí:

> **Teorema (Riemann 1859).** Para todo s ∈ ℂ\{1},
> `π^{−s/2} Γ(s/2) ζ(s) = π^{−(1−s)/2} Γ((1−s)/2) ζ(1−s)` .

Esta es *exactamente* la relación pedida. Reescribiéndola:

```
Γ(s/2)ζ(s)/π^{s/2} = Γ((1−s)/2)ζ(1−s)/π^{(1−s)/2} .
```

**Punto clave para nuestro proyecto (y verificado en la misma fuente):** el factor
`π^{−s/2}Γ(s/2)` es, en la formulación adélica de la tesis de Tate,
«el factor z local en el lugar Arquimediano» de la L-función. Es decir: **la theta de
Riemann ES el factor de lugar infinito**; y toda la teoría moderna (Siegel–Weil,
correspondencia de theta, fórmula de traza) es, en un sentido preciso, el estudio de qué
ocurre al poner los factores de todos los demás lugares (primos finitos). Ese es el
puente más honesto entre 1859 y 2026.

Riemann además define la función xi (verificado):

```
ξ(s) = (s(s−1)/2) · π^{−s/2} Γ(s/2) ζ(s) ,  ξ(s) = ξ(1−s),
```

entera, y cuyos ceros son exactamente los ceros no triviales. Reescribiendo (3) en
`ξ` y con `s = 1/2 + it`, (3) se convierte en

```
ξ(1/2+it) = 4 ∫_1^∞ d/dx [ x^{3/2} ψ'(x) ] · x^{−1/4} · cos( t log x / 2 ) dx ,
```

que expandida en serie de potencias de `t²` da `ξ(s) = Σ_n a_{2n} t^{2n}` — el paso
con el que Riemann «se convence» de que los exponentes reales `t` son los naturales
(esto es heurístico, no es una prueba).

## 2. La fórmula explícita para F(x) (su ecuación (2))

Riemann fija (notación moderna):

```
F(x) ~ Li(x) − Σ_ρ Li(x^ρ) − log 2 + ∫_x^∞ dt / ( t (t² − 1) log t ) ,   (4)
```

donde `Li(x) = ∫_2^x dt/log t` y `ρ` recorre los ceros no triviales de ζ (orden creciente
de la parte imaginaria). Riemann usa `F(x)` como la mejor aproximación al número de
primos ≤ x; el paso de (4) al recuento exacto `π(x)` es el que dejó abierto.

### 2.1 El «orden» de los ceros: lo que Riemann discute

Riemann es perfectamente consciente de que su fórmula depende de la **multiplicidad** de
los ceros, y de que la multiplicidad controla la **regularidad** de F:

* **(a)** `Li(x^ρ)` (o equivalentemente el término de la forma `x^ρ/ρ` al integrar contra
  el logaritmo de la función que se cuenta) es *multivaluada* en x; las contribuciones de
  `ρ` y `1−ρ̄` cancelan sus discontinuidades, de modo que **si ρ es simple
  (u orden impar)** la cancelación es completa y `F` sólo tiene los saltos que debe tener.
* **(b)** Si ρ tiene **orden par**, la cancelación falla y `F` hereda una
  **discontinuidad espuria** en un punto que no es una potencia de primo — algo que
  contradice que `F` sólo salte en las potencias de primo (salto +1).

Riemann usa este argumento de regularidad como *evidencia* (no como demostración) a favor
de que los ceros sean de orden impar, en particular simples.

> **[NO VERIFICADO]** No he podido fetchar el texto de Riemann; el párrafo anterior es una
> **paráfrasis mía** de lo que Riemann discute justo después de su ecuación (2). La
> formulación literal (alemán y traducción Wilkins) debe comprobarse en
> `https://www.maths.tcd.ie/pub/HistMath/People/Riemann/Zeta/EZeta.pdf`
> (original `Zeta.pdf`). Lo que SÍ está verificado (Wikipedia, misma sección §3 y §5) es
> la *estructura*: la ecuación funcional es demostrada; los ceros son una conjetura; y la
> densidad de ceros es asintótica (ritmo de Weyl/Selberg), ver §3.1.

### 2.2 Dónde aparece «multiplicidad» de verdad en el trabajo moderno

Es importante no inflar esto: en el método GPY/Zhang/Maynard **no** aparece el orden de
los ceros de ζ. Lo que sí aparece es el análogo técnico:

| Riemann 1859 | Análogo moderno |
|---|---|
| orden (multiplicidad) del cero ρ de ζ | multiplicidad de una representación / eigenvalor del Laplaciano en una fórmula de traza |
| discontinuidad espuria de F si el orden es par | multiplicidad de Siegel / cero excepcional / λ₁ pequeño: arruinan las cotas |
| ξ simétrica, factores de lugar | formas automorfas, pesos `1/cosh(π t_j)` de Kuznetsov |
| `x^ρ/ρ` | funciones de Bessel `J_{2it}(4π√(mn)/c)` en la fórmula de traza de Kuznetsov |

La conexión buena y honesta es: **la fórmula explícita de Riemann es el caso GL(1) de
las fórmulas de traza relativas**, y la pregunta «¿de qué orden son los ceros?» es el
mismo tipo de pregunta que «¿cuál es el λ₁ del Laplacian?» (Selberg:
λ₁ ≥ 3/16 usando **la cota de Weil para sumas de Kloosterman**, ver `05-theta-bridges.md`
(ii)). Eso sí está verificado (Li–Knightly, arXiv:1202.0189, §1).

## 3. Qué demostró Riemann y qué conjeturó

| Afirmación | Estado en el paper de 1859 | Nota |
|---|---|---|
| continuación meromorfa de ζ a ℂ, polo simple en s=1 con residuo 1 | **DEMOSTRADO** (vía theta) | Wikipedia §1, §3 |
| ecuación funcional simétrica (arriba) | **DEMOSTRADO** | verificado |
| los ceros no triviales están en 0 < Re(s) < 1 | **DEMOSTRADO** | Wikipedia §5 |
| simetría de ceros respecto a σ=1/2 y al eje real | **DEMOSTRADO** | Wikipedia §5 |
| **Riemann Hypothesis**: todos los ceros no triviales están en Re(s)=1/2 | **CONJETURADO** — no se demuestra en el paper | Wikipedia, introducción: «The 1859 article also contained the Riemann hypothesis, **a conjecture**» |
| los ceros triviales son −2, −4, … (del factor seno) | **DEMOSTRADO** | Wikipedia §3 |
| densidad de ceros: N(T) = (T/2π) log(T/2π e) + O(log T) | **DEMOSTRADO** (enunciado; la cota de error precisa tuvo que esperar) | el artículo cita refinamientos modernos (Trudgian) de esa fórmula: `|N(T) − (T/2π)log(T/2πe)| ≤ 0.112 log T + …` |
| «es muy probable que todas las raíces sean reales» / la prueba «debería» ser posible tras «algunos intentos fallidos» | **SÍNTESIS DE RIEMANN, no prueba** | ver abajo |

### 3.1 La frase famosa (cuidado: [NO VERIFICADO])

Riemann, tras enunciar que todos los ceros tienen parte real 1/2, dice (según la tradición
de Edwards/Wilkins) *expresiones equivalentes* a:

> «Es muy probable (*wohl wahrscheinlich*) que todas las raíces sean reales [= de parte
> real 1/2]; sería deseable una demostración rigurosa; sin embargo, **después de algunos
> intentos fallidos** (*nach einigen vergeblichen Versuchen*) he renunciado
> provisionalmente a buscarla…»

> **[NO VERIFICADO]** No he podido fetchar el texto. NO tomes estas palabras como cita
> literal. Lo único plenamente verificado aquí es el hecho que importa: **Riemann no
> demostró la Hipótesis de Riemann en ese artículo**; la presentó como conjetura con
> argumentos favorables de tipo variacional/simetría (la serie de cosenos de §1).
> Fuente verificada: Wikipedia EN (introducción + §5), y el página de Wilkins de TCD para
> el texto literal.

## 4. Resumen de lo que llevamos a los otros ficheros

1. La relación theta `π^{-s/2}Γ(s/2)ζ(s) = π^{-(1-s)/2}Γ((1-s)/2)ζ(1-s)` viene de
   **identidades integrales explícitas**: Poisson + Mellin. Nada más. Eso es exactamente
   lo que se generaliza a (a) cuerpos finitos (representación de Weil, cotas de
   Kloosterman) y (b) grupos reductivos (fórmulas de traza, correspondencia de theta).
   → `05-theta-bridges.md` (i), (ii).
2. La fórmula explícita (4) y el análisis del **orden** de los ceros es el antecedente
   conceptual de «los ceros múltiples / valores excepcionales rompen las cotas de
   distribución». Esa es exactamente la patología (cero de Siegel, λ₁ chico,
   representaciones de género) que limita hoy el nivel de distribución θ.
   → `06-honest-assessment.md`.
3. Riemann **demostró** ecuación funcional + continuación + simetría + densidad;
   **conjeturó** la RH. Todo lo que viene después en este proyecto trabaja
   *incondicionalmente* y por tanto **sin** usar la RH; lo cual es una diferencia de
   régimen enorme respecto al programa de Riemann.