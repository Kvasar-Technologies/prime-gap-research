# Notas 01 — Yitang Zhang, *Bounded gaps between primes*

> **AVISO DE CITACIÓN (verificado en esta sesión, 2026-11-22).**
> El ID que se dio en el encargo, **arXiv:1402.1471, NO es el artículo de Zhang**.
> Se comprobó con `webfetch` sobre `https://arxiv.org/abs/1402.1471`:
> es *"Overlaps of q-raised Néel states with XXZ Bethe states…"*, de **M. Brockmann**
> (cond-mat.stat-mech; *J. Stat. Mech.* 2014). Es un artículo de física (redes XXZ /
> gas de Lieb‑Liniger).
> **Cita correcta de Zhang:**
> Y. Zhang, *Bounded gaps between primes*, **Annals of Mathematics (2) 179 (2014), n.º 3, págs. 1121–1174.**
> (El propio Zhang, que entonces/antes estaba en la Univ. of New Hampshire, distribuyó el
> preprint en 2013; no lo publicó en arXiv con ese número.)

> **ESTADO DE VERIFICACIÓN.**
> De las tres fuentes pedidas, solo una respondió este estudio: el sitio principal de
> Polymath (`https://polymathprojects.org/`), de donde se obtuvo la URL real del proyecto.
> `https://zhang-th.blogspot.com/` → **404**. `https://polymathprojects.org/gp/` → **404**.
> Por tanto, los datos siguientes son **literatura estándar del resultado** (que conozco con
> alta confianza por el contenido matemático del artículo de Zhang y del proyecto Polymath 8a),
> pero **no pudieron re-verificarse contra una fuente en línea operativa en esta sesión**.
> Los ítems cuya formulación exacta requiere contraste directo con el paper van marcados
> **[NO VERIFICADO]**.

---

## 1. Teorema principal y nivel de distribución (MPZ / θ)

### 1.1 Teorema principal (el "70 000 000")
El enunciado canónico del resultado de Zhang es:

> **Teorema (Zhang, 2014).** El ínfimo de las diferencias entre primos consecutivos es finito;
> concretamente
> $$\liminf_{n\to\infty}\ (p_{n+1}-p_n)\ \le\ 70\,000\,000 .$$
> Equivalentemente: existen infinitos pares de primos separados por una distancia acotada
> ($\le 70\,000\,000$). Es el **primer resultado finito de la historia** sobre primos acotados.

El número 70 000 000 no es "mágico": es el que sale de su nivel de distribución combinado con
un conjunto admisible concreto (ver §2). **[NO VERIFICADO]** la cita textual exacta dentro del
paper (número de sección/proposición, y si lo formula como `< 70 000 000` o `≤`).

### 1.2 Nivel de distribución θ y la hipótesis MPZ — CONFIRMADO QUE ES 1/2 + 1/584 (NO 1/70)
- Zhang **no** prueba el nivel de distribución completo 1 (eso sería como el caso fuerte de
  Bombieri–Vinogradov). Prueba **por encima** del umbral clásico 1/2:
  **nivel de distribución de primos en progresiones aritméticas θ = 1/2 + 1/584** ($\approx 0.50171$).
- Este nivel se empaqueta como la hipótesis **MPZ[ϖ, δ]** (a veces escrita MPZ^[ϖ,δ]): una
  condición de tipo *Bombieri–Vinogradov*, promediada sobre los módulos $q\le x^\theta$, con un
  exponente técnico auxiliar $\delta$. **Zhang demuestra MPZ[ϖ,δ] para ϖ, δ alrededor de 1/1168.**
  Este es exactamente el valor estándar citado por **Polymath 8a**: **ϖ = δ = 1/1168**,
  **NO 1/70**. (El valor "1/70" que mencionas no aparece en ningún sitio; es un error.)
  **[NO VERIFICADO]** la restricción exacta del rango admisible de $(ϖ,δ)$ (p. ej. si es
  exactamente "$<1/1168$" para ambos, o si hay asimetrías del tipo $0<ϖ<1/1168,\ 0<δ<ϖ$).

- **Conexión aritmética ϖ ↔ θ (a marcar):** numéricamente
  $2\cdot \tfrac{1}{1168} = \tfrac{1}{584}$, de modo que el nivel
  $\theta = 1/2 + 1/584 = 1/2 + 2·(1/1168)$ es coherente con $ϖ = δ = 1/1168$.
  **[NO VERIFICADO]** que la relación funcional exacta entre $ϖ,δ$ y $\theta$ sea
  precisamente $\theta = 1/2 + 2ϖ$ (podría ser $\theta = 1/2 + ϖ + (ϖ-δ)$ o depender de $\zeta(2)$
  y del recuento del conjunto admisible); confirmar contra §1–2 del paper y la notación de Polymath 8a.

**Fuente estándar (a re-verificar online):** Ann. of Math. 179 (2014) 1121–1174, §1 y el
abstract; y el proyecto Polymath 8a. URL real del proyecto descubierta este estudio:
`https://polymathprojects.org/2013/06/04/polymath-proposal-bounded-gaps-between-primes/`
(página de lanzamiento de Polymath 8a, 4 jun 2013). **[NO VERIFICADO]** su contenido concreto
(no se alcanzó su texto dentro del presupuesto de 6 `webfetch`).

---

## 2. El papel del conjunto admisible (los ~3.5 millones que dan 70 000 000)

- El método es de tipo **GPY / Selberg–Delange**: se fija un **k‑tuplo admisible**
  $\mathcal H=\{h_1<\dots<h_k\}$ (que evita cubrir todas las clases de cualquier primo pequeño).
  Si $k$ es suficientemente grande **y** se dispone del nivel de distribución de Zhang, el
  argumento de pesado de tamiz produce dos primos dentro de un diámetro $H(\mathcal H)$.
- Con su distribución $\theta=1/2+1/584$, Zhang necesita un $k$ **enorme**, del orden
  **$k \approx 3\,500\,000$** ("el conjunto admisible de ~3,5 millones de elementos").
  Del recuento/combinatoria con ese $k$ sale su cota **$H = 70\,000\,000$**.
  **[NO VERIFICADO]** la cita exacta del valor 3 500 000 (¿$k=3.5\times10^6$, o el orden
  exacto en función de $1/ϖ$?) y la derivación precisa $3.5\times10^6 \Rightarrow 70\,000\,000$
  (implica la función de recuento $F(\mathcal H)$ y la selección/tamiz); confirmar en el §7–8
  del paper y en los "tables" de Polymath 8a.
- **Contexto posterior (literatura estándar, marco la magnitud):**
  - *Polymath 8a* mejoró el **conjunto admisible** (mismo tipo de tamiz de Zhang):
    con $k\approx 3\,405$ se baja a **$H=4\,680$**; refinando aún más, a **$246$**
    (este último combinando con más nivel de distribución). Los valores **4680** y **246**
    son de Polymath 8a. **[NO VERIFICADO]** su aparición textual en la fuente online.
  - *Maynard (8b)* cambia de **tipo de tamiz** (multidimensional, "bounded intervals with many
    primes"), desacoplando $k$ del nivel $\theta$ y bajando a $H=600$, luego a $246$ con $\theta$ extra.

---

## 3. Estructura de la demostración: Type I, II, III, "divisor trick"

Zhang trabaja con formas trilineales/bilineales $\sum_{d,e} [d,e]^{-1}\lambda_d\lambda_e\Psi(\cdot)$
y con pesos $\lambda_d$ soportados en $d\le R$ (números "$R$‑lisos"). Las sumas se dividen en tres
clases según la relación entre los divisores:

- **Type I** (suma "lineal"/truncada: un divisor domina sobre los otros dos).
- **Type II** (suma "bilineales": dos divisores de magnitud comparable, el tercero pequeño).
- **Type III** (sumas cúbicas: los tres divisores comparables). Es la parte más dura.

### El "divisor trick" (d | n(n+2), d ≤ D, mod q ≤ D, completado con r_Δ)
El truco matemático central: como $\gcd(n,n+2)\mid 2$, si un divisor $d$ de $n(n+2)$ se escribe
$\color{}$ $d = r\,q$ con $(q,r)$ y condiciones de coprimidad, gran parte de $d$ "viene" de separar
$d_1\mid n$, $d_2\mid n+2$ (más la parte del módulo $q\le D$). Esto reduce/controla las Type III.
- **Rangos permitidos (los que pediste recuperar):**
  - Los divisores "buenos"/Type II se manejan hasta **$d \le D^{1/2}$**.
  - La banda difícil intermedia es **$D^{1/2} < d \le D^{1/2+1/100}$**: aquí Zhang demuestra que
    dichos $d$ tienen un divisor grande en un rango que permite aplicar el divisor trick.
    El exponente extra **$1/100$** (notación a menudo $\sigma=1/100$) es la **holgura clave**.
  - El soporte total de los pesos llega hasta **$d \le D$** ($D$ = nivel de tamiz;
    típicamente $D\approx x^{1/4-\sigma}$ con $\sigma>0$ pequeño).
  - El módulo de la progresión aritmética satisface **$q\le D$** (o $q\le R$), y $r$ es la parte
    del divisor que $NO$ está en $q$ (la "completación" $r_\Delta$ que rellena el hueco
    $(D^{1/2},D^{1/2+1/100}]$ volviendo al régimen $\lesssim D^{1/2}$).
  **[NO VERIFICADO]** las cotas numéricas exactas y el enunciado literal del lema del divisor
  trick y de la completación $r_\Delta$ (notación propia de Zhang: $d=rq$, $q$, $r$, $D$,
  la constante $\sigma$, y si $D^{1/2+1/100}$ o una potencia ligeramente distinta). Recuperar
  del §5–6 del paper (Lemmas 5.1–5.3 / 6.1) y de la notación de Polymath 8a.

### Las estimaciones $\varphi$‑integrales $P_2$, $P_3$
Zhang introduce las funciones de prueba $\varphi(t)=\frac{1-e^{-t}}{t}$ y sus transformadas de
Fourier $\varphi_j$ (j = 2, 3 para Type II, III):
- $P_2$: la integral $\varphi$ de **Type II**; es la **crítica** (crece logarítmicamente) y su
  decaimiento uniforme en el intervalo relevante es lo que acota la suma Type II
  (típicamente $|{\rm integral}|\lesssim \log^{r}$ con $r$ pequeño).
- $P_3$: la integral $\varphi$ de **Type III**; controlada por el decaimiento rápido del integrando.
**[NO VERIFICADO]** las fórmulas explícitas de $\varphi_2,\varphi_3$ y las cotas concretas
$P_2, P_3$ (potencias exactas del log, el intervalo $z\in[-\delta,\delta]$). Recuperar de §4
del paper ("Estimates for the sieve weights", Proposiciones 4.x).

---

## 4. Puntos de fuga ("leak points"): dónde una mejora cambia el 1/584 o el exponente

Numerados; cada uno indica **qué estimación mueve qué parámetro** (la "gráfica" pedida).
Notación: mejorar una cota ⇒ mejora $\vartheta$ (sube $ϖ$) o baja $k$ (baja $H$).

1. **Bombieri–Vinogradov para módulos lisos** (las Proposiciones 6–8 de Zhang).
   *Sube directamente $ϖ$, y por tanto $\theta=1/2+(\cdot)$; es la fuente del $1/584$ desde
   $ϖ=1/1168$.* Es el punto de fuga dominante del exponente. (Hecho analítico puro; ver §5.)
2. **Cotas de sumas exponenciales / Weil (Deligne).** La cota de Weil sobre el cuerpo finito
   $\mathbb F_q$ para el par de sumas de Kloosterman (bounds sobre $\lambda_d$) fija la calidad de
   las Type I/II. Mejorarla ⇒ baja el umbral de $k$ y puede subir la holgura $\sigma$.
3. **Las cotas del "divisor trick"** (la banda $D^{1/2}<d\le D^{1/2+1/100}$ y el recuento de
   divisores vía el lema tipo Graham / $\varphi$). Fijan la holgura $\sigma=1/100$; aumentarla
   ⇒ mejora todo lo demás. Combinada con (2), limita el $ϖ=1/1168$ real.
4. **Las integrales $\varphi$ ($P_2$, $P_3$).** Su decaimiento controla $F(\mathcal H)$ y, con
   ello, el **tamaño $k$** del conjunto admisible necesario ⇒ directamente el valor de $H$.
   (Polymath 8a atacó exactamente aquí: mejores $\varphi$/tamiz y mejor $\mathcal H$
   para bajar de $k=3.5\times10^6$ a $k\approx 3\,405$.)
5. **El nivel de distribución combinado con el conjunto admisible $\mathcal H$.** El parámetro
   final de $H$ depende de $(ϖ,\ k,\ \mathcal H)$ de forma acoplada: cada mejora de $ϖ$
   reduce el $k$ exigido; cada reducción de $k$ (mejor $\mathcal H$ o mejor $\varphi$) baja $H$.

> Nota: el salto **cualitativo** (de $H=70\,000\,000$ a cientos) no provino de afinar los
> "leaks" 1–4 sino del **cambio de tipo de tamiz** (Maynard, multidimensional), que desacopla
> $k$ de $\theta$ — ver §2.

**[NO VERIFICADO]** la asignación cuantitativa exacta ("qué cota mejora $ϖ$ en cuánto") —
requiere reproducir la red de desigualdades del paper y las tablas de Polymath 8a. Lo anterior
es la estructura cualitativa estándar.

---

## 5. "Hechos analíticos puros" vs "hechos de tamiz"

**(A) Hechos analíticos puros** (teoría de números I / teoría multiplicativa y de cuerpos finitos):
- **Bombieri–Vinogradov** (BV): promedia el término de error de los primos en PA hasta nivel
  $\theta=1/2$ (incondicional, vía el método de Vinogradov / criba grande).
- **La extensión de Zhang de BV a módulos lisos** (para llegar de 1/2 a $1/2+1/584$) — resultado
  analítico propio, núcleo de la prueba.
- **Cotas de Weil / Deligne** para sumas exponenciales sobre $\mathbb F_q$ (el análogo exacto de
  "RH para sumas de exponenciales"): $|\sum \exp(2\pi i\, a x\cdot/q)|\lesssim d^{1/2}q^{1/2}$
  y la versión con funciones algebraicas (bounds de Kloosterman) que acotan las Type I/II.
- Estimaciones de funciones Gamma / integrales de prueba ($\varphi_j$, $P_2$, $P_3$).

**(B) Hechos de tamiz** (combinatoria multiplicativa / Selberg):
- Configuración **GPY / Selberg** de pesos $\lambda_d$ y el concepto de **conjunto admisible**
  ($k$‑tuplo que evita cubrir todas las clases de cada primo).
- El **"divisor trick"** y el recuento de divisores en rangos (lema tipo Graham): número de
  $d\le X$ con un divisor en una banda dada — combinatoria aritmética elemental.
- La función de recuento $F(\mathcal H)$ y el paso de pesado/selección que convierte $k$ grande
  en $H$ acotado.

**(C) Interfaz (donde se mezclan):** las cotas Type I/II/III = (Weil, analítico) aplicado a
(las sumas trilineales del tamiz); el $ϖ$ final = (BV‑liso, analítico) alimentado al
(recuento del tamiz). Es precisamente esta interfaz la que Polymath 8a optimizó por separado:
(1) la parte analítica y (4) la parte de tamiz, casi independientemente.

---

## Fuentes y verificación
- **Verificado en esta sesión:** el ID arXiv:1402.1471 = Brockmann (NO Zhang), vía
  `https://arxiv.org/abs/1402.1471`; URL real de Polymath (bounded gaps) =
  `https://polymathprojects.org/2013/06/04/polymath-proposal-bounded-gaps-between-primes/`
  (aparece en `https://polymathprojects.org/`).
- **Fuente primaria a usar (no alcanzada online aquí):** Zhang, *Ann. of Math.* **179** (2014),
  1121–1174. Blog de Zhang `https://zhang-th.blogspot.com/` y wiki `.../gp/` retornaron 404;
  `en.wikipedia.org/wiki/Bounded_gaps_between_primes` no existe con ese título exacto.
- Todo ítem marcado **[NO VERIFICADO]** debe cotejarse con el PDF del paper de Zhang (secciones
  §1–§8) y con las páginas del wiki de Polymath 8a. Ver `01b-zhang-constantes.md` para la lista
  numérica aislada.