# Notas 02 — James Maynard, "Small gaps between primes"

## 0. Nota preliminar IMPORTANTE: corrección del identificador arXiv

- El paper de Maynard citado en el encargo como **arXiv:1409.3661** es **incorrecto**. Verificado
  directamente en `https://arxiv.org/abs/1409.3661`: arXiv:1409.3661 es
  G.-C. Liu, K.-W. Ng, I.-C. Wang, *Naturally large tensor-to-scalar ratio in inflation*
  (hep-ph/astro-ph.CO; v1: 12 Sep 2014; Phys. Rev. D 90, 103531 (2014)).
- El paper correcto de Maynard es:

> **J. Maynard, "Small gaps between primes", arXiv:1311.4600** (v1 presentado el 19 Nov 2013;
> v3, Oct 2019, 25 páginas; math.NT). Texto completo consultado en
> `https://ar5iv.org/abs/1311.4600`. Referencia de revista (Ann. of Math. 181 (2015), 383–413):
> **[NO VERIFICADO]** (no consta en las fuentes consultadas).

Fuente secundaria verificada (valores de $H_m$, cotas de $M_k$, formulación variacional):

> **D. H. J. Polymath, "Variants of the Selberg sieve, and bounded intervals containing many
> primes", arXiv:1407.4897v4** (v1: 18 Jul 2014; v4: 22 Dic 2014; Research in the Mathematical
> Sciences 1:12 (2014)). Texto completo consultado en `https://ar5iv.org/abs/1407.4897`.

Fuentes que **no** pudieron verificarse dentro del límite de consultas:
- `https://polymathprojects.org/yb/` devuelve **404** → su contenido (tablas de $M_k$) es
  **[NO VERIFICADO]**.
- Post del blog de T. Tao del 19/11/2014: no pudo confirmarse su URL exacta → **[NO VERIFICADO]**.

---

## 1. Nivel de distribución $\theta$ y DHL$[\theta,k]$ (condición (1.1)/(1.3) del paper)

**Definición (Maynard, §1, ec. (1.3)).** Dado $\theta>0$, se dice que los primos tienen *nivel de
distribución $\theta$* ("level of distribution $\theta$") si, para todo $A>0$,

$$\sum_{q\le x^{\theta}}\ \max_{(a,q)=1}\Bigl\|\pi(x;q,a)-\frac{\pi(x)}{\varphi(q)}\Bigr\|\ \ll_A \frac{x}{(\log x)^{A}} .$$

Maynard advierte explícitamente (nota 1 de su §1) que distintos autores dan nombres/definiciones
ligeramente distintas de este concepto, y que para su paper (1.3) *es* la definición.
Hechos que rodean la definición:

- **Bombieri–Vinogradov**: nivel de distribución $\theta$ para todo $\theta<1/2$.
- **Elliott–Halberstam (conjetura)**: se conjetura (1.3) para todo $\theta<1$.
- **Friedlander–Granville**: (1.3) no puede valer sustituyendo $x^\theta$ por $x/(\log x)^B$ con $B$
  fijo; EH es "esencialmente el resultado más fuerte posible de este tipo".
- En la Proposición 4.1 Maynard usa la formulación con $R=N^{\theta/2-\delta}$ ("los primos tienen
  exponente de distribución $\theta>0$").

**Formulación de Polymath 8b.** Con $\Lambda{1}_{[x,2x]}$ y la discrepancia

$$\Delta(\alpha;a(q)):=\sum_{n\equiv a(q)}\alpha(n)-\frac1{\varphi(q)}\sum_{(n,q)=1}\alpha(n),$$

se define **EH$[\vartheta]$** (Claim 2.2): si $Q\asymp x^\vartheta$ y $A\ge1$ fijo,

$$\sum_{q\le Q}\sup_{a\in(\mathbb Z/q\mathbb Z)^\times}\|\Delta(\Lambda{1}_{[x,2x]};a(q))\|\ll x\log^{-A}x .$$

BV da EH$[\vartheta]$ para todo $\vartheta<1/2$. También se usan:
**MPZ$[\varpi,\delta]$** (Motohashi–Pintz–Zhang, moduli suaves en un intervalo de primos),
mejorado por Polymath 8a a $600\varpi+180\delta<7$ (Teorema 2.5), y su generalización
**GEH$[\vartheta]$** (Claim 2.6, para convoluciones $\alpha\star\beta$; implica EH,
Proposición 2.7).

**DHL$[k,j]$ (débil Dickson–Hardy–Littlewood, siguiendo a Pintz; Claim 3.1).**
Para $k\ge j\ge2$: para toda $k$-tupla admisible $\mathcal H=(h_1,\dots,h_k)$ existen infinitos
trasladados $n+\mathcal H$ que contienen **al menos $j$ primos**. La conjetura DH completa es
DHL$[k,k]$ para todo $k\ge2$. Con $H_m:=\liminf_{n\to\infty}(p_{n+m}-p_n)$ y
$H(k):=$ diámetro mínimo de una $k$-tupla admisible, **DHL$[k,m+1]$ implica $H_m\le H(k)$**,
y DHL$[k,k]$ implicaría $H_{k-1}=H(k)$.

---

## 2. Definiciones de $M_k$ e $I_k$ — verificado, difieren de la creencia inicial

**Advertencia:** la definición que se creía ($M_k=$ sup sobre $F$ con $F(0)=0$,
$\int_0^1 F(t)t^{k-1}dt=1$ de $\int_0^1 F'(t)^2t^{k-1}dt$; e $I_k=\int_0^1 F'(t)^2t^{k-1}dt$ para
la $F$ maximizante) **NO es la definición de Maynard ni la de Polymath 8b**: en esos papers
$I_k(F)$ es un *funcional* ($L^2$ en dimensión $k$), no un número, y no aparece el funcional
$\int F'(t)^2t^{k-1}dt$ salvo en el caso especial $F(t_1,\dots,t_k)=G(\sum t_i)$ (ver más abajo).
Esa reformulación unidimensional (que sí existe en la literatura posterior de Polymath, en el blog
de Tao) es **[NO VERIFICADO]** aquí: `polymathprojects.org/yb/` devuelve 404 y la URL del post del
blog de Tao del 19/11/2014 no pudo confirmarse.

**Definiciones exactas (Maynard, Prop. 4.1/4.2 y ec. (7.1)).** Sea

$$\mathcal R_k:=\{(t_1,\dots,t_k)\in[0,1]^k:\ t_1+\cdots+t_k\le 1\}\quad\text{(el simplejo)},$$

y $\mathcal S_k$ el conjunto de las funciones Riemann-integrables $F:[0,1]^k\to\mathbb R$ soportadas
en $\mathcal R_k$ con $I_k(F)\ne0$ y $J_k^{(m)}(F)\ne0$ para cada $m$. Entonces

$$I_k(F):=\int_0^1\!\cdots\!\int_0^1 F(t_1,\dots,t_k)^2\,dt_1\cdots dt_k,$$

$$J_k^{(m)}(F):=\int_0^1\!\cdots\!\int_0^1\Bigl(\int_0^1 F(t_1,\dots,t_k)\,dt_m\Bigr)^2\,dt_1\cdots dt_{m-1}\,dt_{m+1}\cdots dt_k,$$

$$\boxed{M_k=\sup_{F\in\mathcal S_k}\frac{\sum_{m=1}^{k}J_k^{(m)}(F)}{I_k(F)}}$$

(Maynard (7.1); en Maynard el supremo se toma sobre $F$ Riemann-integrables; en Polymath, ec. (33),
sobre $F$ de cuadrado integrable soportadas en $\mathcal R_k=\{(t_i)\in[0,\infty)^k:\sum t_i\le1\}$,
no idénticamente nulas — misma cantidad salvo normalización).

Comentarios verificados esenciales:

- **Interpretación espectral** (Maynard, Remark tras (7.1)): se espera que la $F$ óptima sea
  autofunción del operador $\mathcal L_kF(u_1,\dots,u_k)=\sum_m\int_0^{1-\sum_{i\ne m}u_i}
  F(u_1,\dots,t_m,\dots)\,dt_m$, con autovalor igual al valor del cociente; Maynard no pudo
  resolver la ecuación de autovalores para $k>2$. Polymath lo formaliza: (Corolario 6.2) si
  $\lambda F(t)=\sum_i\int_0^\infty F(\dots,t_i',\dots)\,dt_i'$ con $F>0$ en $\mathcal R_k$,
  entonces $\lambda=M_k$.
- **Caso especial GPY** (Maynard, Remark tras el Lema 6.3): si $F(t_1,\dots,t_k)=G(\sum t_i)$,
  entonces $I_k(F)=\int_0^1 G(t)^2t^{k-1}dt/(k-1)!$ y
  $J_k^{(m)}(F)=\int_0^1(\int_t^1 G(v)dv)^2t^{k-2}dt/(k-2)!$, recuperando el método GPY clásico.
  Aquí aparece el peso $t^{k-1}$ (con $G$), pero con integrales, no derivadas primeras.
- **Cálculo exacto $k=2$** (Polymath, Corolario 6.3):
  $M_2=\dfrac{1}{1-W(1/e)}=1.38593\ldots$ donde $W$ es la función Lambert.

---

## 3. Criterio exacto $\theta$–$k$–huecos acotados y comportamiento asintótico

### 3.1 El criterio exacto

- **Maynard, Proposición 4.2.** Si los primos tienen nivel de distribución $\theta>0$, entonces
  (para todo conjunto admisible $\mathcal H=\{h_1,\dots,h_k\}$, con las cotas de $S_1,S_2$ de la
  Proposición 4.1) existen infinitos $n$ tales que **al menos**

  $$r_k=\Bigl\lceil \frac{\theta M_k}{2}\Bigr\rceil$$

  de los $n+h_i$ son primos. En consecuencia
  $\liminf_n(p_{n+r_k-1}-p_n)\le\max_{1\le i,j\le k}(h_i-h_j)$.
  La forma de la cota (de la prueba) es
  $S_2-\rho S_1>0\iff (\theta/2-\delta)M_k-\rho>o(1)$, con $\rho=\theta M_k/2-\epsilon$.

- **Polymath 8b, Teorema 3.8 (forma normalizada).** Si EH$[\vartheta]$ vale y

  $$M_k>\frac{2m}{\vartheta},$$

  entonces **DHL$[k,m+1]$** vale (y por tanto $H_m\le H(k)$). Éste es el criterio exacto que
  conecta $\vartheta$, $k$ y $m$ (equivalentemente $\vartheta>2m/M_k$). Variantes verificadas:
  - **Teorema 3.10** (simplejo truncado + MPZ$[\varpi,\delta]$): si
    $M_k^{[\delta/(1/4+\varpi)]}>\dfrac{m}{1/4+\varpi}$ ⟹ DHL$[k,m+1]$.
  - **Teorema 3.12** (simplejo $\varepsilon$-agrandado $(1+\varepsilon)\mathcal R_k$): si (i) EH y
    $1+\varepsilon<1/\vartheta$, o (ii) GEH y $\varepsilon<1/(k-1)$, y
    $M_{k,\varepsilon}>\dfrac{2m}{\vartheta}$ ⟹ DHL$[k,m+1]$.
  - **Teorema 3.14** ("Going beyond the epsilon enlargement", GEH, con *condición de marginal
    desvanecente* $\int_0^\infty F\,dt_i=0$ cuando $\sum_{i'\ne i}t_{i'}>1+\varepsilon$):
    soporte en $\frac{k}{k-1}\mathcal R_k$; si
    $\sum_i J_{i,1-\varepsilon}(F)/I(F)>2m/\vartheta$ ⟹ DHL$[k,m+1]$.

  *Nota:* la fórmula tentativa "$\theta>1/2+(M_k/I_k)/2$" **[NO VERIFICADO]**; el enunciado real
  es el anterior.

### 3.2 Teoremas principales de Maynard (arXiv:1311.4600)

- **Teorema 1.1**: $\liminf_n(p_{n+m}-p_n)\ll m^{3}e^{4m}$ (y bajo EH: $O(m^{3}e^{2m})$).
  Prueba: con $\theta=1/2-\epsilon$ y (4.5) $\frac{\theta M_k}{2}\ge(\frac14-\frac\epsilon2)
  (\log k-2\log\log k-2)$; tomando $\epsilon=1/k$ se necesita $k\ge Cm^{2}e^{4m}$.
- **Teorema 1.2**: la proporción de $m$-tuplas admisables dentro de $\mathcal A$ que satisfacen la
  conjetura de primos $m$-tuplas es $\gg_m 1$ (argumento de conteo).
- **Teorema 1.3**: $\liminf_n(p_{n+1}-p_n)\le 600$ (con $k=105$, $M_{105}>4$, y una 105-tupla
  admisible de diámetro 600 — lista explícita en el paper, debida a cálculos de T. Engelsma).
- **Teorema 1.4** (bajo EH/$\theta\to1$): $\liminf_n(p_{n+1}-p_n)\le12$ (con $k=5$,
  $\mathcal H=\{0,2,6,8,12\}$) y $\liminf_n(p_{n+2}-p_n)\le600$.

### 3.3 Comportamiento asintótico de $M_k$ (con término de error)

Verificado en ambos papers:

- **Cota inferior (Maynard, Prop. 4.3(3))**: $M_k\ge \log k-2\log\log k-2$ para $k$ grande
  (Polymath observa que vale para todo $k\ge200$).
- **Cota inferior mejorada (Polymath, Teorema 3.9(xi))**: $M_k\ge \log k - C$ para todo $k\ge C$,
  con $C$ absoluta y efectiva (vía el Teorema 6.7 con la familia $g(t)=1/(c+(k-1)t)$).
- **Cota superior (Polymath, Corolario 6.4, vía Cauchy–Schwarz, Lema 6.1)**:
  $M_k\le \dfrac{k}{k-1}\log k$ para todo $k\ge2$.

En particular, combinando: $\log k-C\le M_k\le \log k+\dfrac{\log k}{k-1}$, es decir
$M_k=\log k+O(1)$; el paper enuncia las dos cotas por separado (no como una sola asintótica con
constante única). **[NO VERIFICADO]**: cualquier cota superior de la forma $M_k\le \log k+\log\log k+O(1)$
o superior/inferior con $o(\log k)$; no figura en las fuentes consultadas.
(Otras cotas inferiores verificadas: familia GPY $F(t_1,\dots,t_k)=f(\sum t_i)$ optimizada da
$M_k\ge \dfrac{4k(k-1)}{j_{k-2}^{2}}$ con $j_{k-2}$ el primer cero de $J_{k-2}$ — recupera
$M_2\ge1.383\ldots$ y $M_6>2$ (GPY: DHL[6,2]) pero nunca supera 4.)

---

## 4. La formulación del tamiz multidimensional

### 4.1 Los pesos, $S_1$ y $S_2$ (Maynard §2, §4)

El ingrediente nuevo es elegir pesos que dependan de divisores de cada $n+h_i$ por separado:

$$w_n=\Bigl(\sum_{d_i\mid n+h_i\ \forall i}\lambda_{d_1,\dots,d_k}\Bigr)^{2},$$

(comparar con el peso de Selberg estándar $w_n=(\sum_{d\mid\prod(n+h_i),\,d<R}\lambda_d)^2$,
$\lambda_d=\mu(d)(\log R/d)^k$, y con GPY $\lambda_d=\mu(d)F(\log R/d)$).
Con $W=\prod_{p\le D_0}p$, $D_0=\log\log\log N$, y la clase $v_0\bmod W$ elegida vía CRT
($v_0+h_i$ coprimo con $W$ para todo $i$, posible por admisibilidad), se definen

$$S_1=\sum_{\substack{N\le n<2N\\ n\equiv v_0\ (W)}}\Bigl(\sum_{d_i\mid n+h_i\ \forall i}\lambda_{d_1,\dots,d_k}\Bigr)^{2},$$

$$S_2=\sum_{\substack{N\le n<2N\\ n\equiv v_0\ (W)}}\Bigl(\sum_{i=1}^k\chi_{\mathbb P}(n+h_i)\Bigr)\Bigl(\sum_{d_i\mid n+h_i\ \forall i}\lambda_{d_1,\dots,d_k}\Bigr)^{2}.$$

(En Maynard $S_2=\sum_{m=1}^kS_2^{(m)}$; en la notación de Polymath, Lema 3.4, se piden las cotas
$\sum\nu(n)\le(\alpha+o(1))B^{-k}x/W$ y
$\sum\nu(n)\theta(n+h_i)\ge(\beta_i-o(1))B^{1-k}x/\varphi(W)$ con
$B=\frac{\varphi(W)}{W}\log x$, y el criterio $\frac{\beta_1+\cdots+\beta_k}{\alpha}>m$.)

**Elección precisa de $\lambda$ (Maynard, Prop. 4.1).** Con $R=N^{\theta/2-\delta}$ y
$F$ soportada en $\mathcal R_k$:

$$\lambda_{d_1,\dots,d_k}=\Bigl(\prod_i\mu(d_i)d_i\Bigr)
\sum_{\substack{r_1,\dots,r_k\\ d_i\mid r_i\ \forall i\\ (r_i,W)=1\ \forall i}}
\frac{\mu(\prod_i r_i)^2}{\prod_i\varphi(r_i)}
F\Bigl(\frac{\log r_1}{\log R},\dots,\frac{\log r_k}{\log R}\Bigr),$$

y $\lambda=0$ si $(\prod d_i,W)\ne1$. Los términos principales son (Prop. 4.1):

$$S_1=\frac{(1+o(1))\varphi(W)^kN(\log R)^k}{W^{k+1}}\,I_k(F),$$

$$S_2=\frac{(1+o(1))\varphi(W)^kN(\log R)^{k+1}}{W^{k+1}\log N}\sum_{m=1}^kJ_k^{(m)}(F), \quad
\text{con }I_k(F),J_k^{(m)}(F)\text{ como en el ítem 2.}$$

### 4.2 Manipulaciones de tamiz (verificadas)

Cambio de variables $y_{r_1,\dots,r_k}=(\prod_i\mu(r_i)\varphi(r_i))
\sum_{d_i:\,r_i\mid d_i}\lambda_{d_1,\dots,d_k}/\prod_id_i$ (Lema 5.1, invertible, vía
Möbius); identidad $\frac1{[d_i,e_i]}=\frac1{d_ie_i}\sum_{u_i\mid d_i,e_i}\varphi(u_i)$;
separación de las variables $\mu(s_{i,j})$ para eliminar la coprimalidad cruzada
$(d_i,e_j)=1$; función multiplicativa $g(p)=p-2$ usada en la parte $S_2^{(m)}$
(Lemas 5.2–5.3, 6.2–6.3); lema de conteo de divisores
$\sum_{d<z}\mu^2(d)g(d)G(\log d/\log z)=\mathfrak S\log z\int_0^1G(x)dx+O(\dots)$ (Lema 6.1, de
Goldston–S. Graham–Pintz–Yıldırım).

### 4.3 Condición de matriz de Gram / método del autovalor para $M_k$ (verificado)

Para $F=P$ polinómico simétrico en $\mathcal R_k$, Maynard §8 y Polymath §7 muestran que
$I_k(F)=\mathbf a^T A_1\mathbf a$ y $\sum_mJ_k^{(m)}(F)=\mathbf a^T A_2\mathbf a$ donde $\mathbf a$
es el vector de coeficientes y $A_1,A_2$ son matrices **simétricas definidas positivas racionales**
— las "matrices de Gram" de la base monomial. Lema 8.3 (Maynard) / §7.1 (Polymath): el cociente se
maximiza cuando $\mathbf a$ es autovector de $A_1^{-1}A_2$ con el **mayor autovalor**; si
$b_1,\dots,b_n$ son linealmente independientes en $L^2(\mathcal R_k)$, $A_1$ es definida positiva y
existe solución ssi el mayor autovalor de $A_2A_1^{-1}$ excede la cota deseada. Cálculos:

- $k=105$: $P$ combinación de los 42 monomios $(1-P_1)^bP_2^c$ con $b+2c\le11$
  ($P_j=\sum_i t_i^j$); mayor autovalor $\lambda\approx4.0020697\ldots>4$ ⟹ $M_{105}>4$ (Maynard (8.15)).
- $k=5$: $P=(1-P_1)P_2+\frac7{10}(1-P_1)^2+\frac1{14}P_2-\frac3{14}(1-P_1)$ da
  $M_5\ge\frac{1417255}{708216}>2$ (Maynard (8.17)).
- Polymath §7: $M_{54}>4.00238$ (grado $d=23$); $M_{50,1/25}>4.0043$ ($d=27$) / $>4.00124$ ($d=25$);
  $M_{51,1/50}>4.00156$; $M_{4,0.168}>2.00558$ (función explícita
  $F=(1-\alpha\sum t_i)\mathbf 1_{\sum t_i\le1+\varepsilon}$, $\varepsilon=0.168$, $\alpha=0.784$);
  $M_{4,5/21}\ge2.05411$; mejor cota inferior hallada para $M_{3,\varepsilon}$: $1.91726$
  ($\varepsilon=56/113$, polinomios cúbicos).
- Nota sobre reducción a funciones simétricas: por simetría de la suma, $M_k=\sup kJ_1(F)/I(F)$
  sobre $F$ simétricas (Lema 7.1 de Polymath).

### 4.4 Sobre el "lema de Siegel algebraico" y el papel de $k$ grande — pendiente de verificar

- Los objetos notados $P_D^\#$ y $R_k^\#$ y la "condición de matriz de Gram para exactamente $k$
  primos", así como el "lema de Siegel algebraico sobre un recubrimiento del cubo unidad",
  **no aparecen** en Maynard (arXiv:1311.4600) ni en Polymath (arXiv:1407.4897): **[NO VERIFICADO]**.
  Corresponden presumiblemente a la exposición de Tao (post del blog de Polymath8b de nov. 2014, URL
  no confirmada) y/o a la wiki `polymathprojects.org/yb/` (404 en la consulta).
- Lo que **sí** está verificado sobre eludir la obstrucción de paridad:
  - El método sólo produce **al menos** $r_k=\lceil\theta M_k/2\rceil$ primos (del orden
    $(1+o(1))\,\frac{\theta}{2}\log k$ para $k$ grande), no una detección exacta de posiciones
    concretas; esa "graduación" (número de primos hallados $\ll k$, creciendo con $k$) es lo que
    permite a Maynard/Tao resultados que el método GPY no daba (GPY con $F=f(\sum t_i)$ nunca
    supera $M_k\le4$).
  - Para $k$ pequeño el obstáculo se salva ampliando el dominio variacional (Teoremas 3.12, 3.14,
    3.15 de Polymath): soporte en $(1+\varepsilon)\mathcal R_k$ o $\frac{k}{k-1}\mathcal R_k$ con
    condición de marginal desvanecente, usando GEH; p. ej. el Teorema 3.15 construye una $F$ piecewise
    polinomial sobre $\frac32\mathcal R_3$ (partición del simplejo en 6 regiones $\times$ 8
    = 48 politopos, refinados a 60, con polinomios de grado ≤3) con $J(F)>2I(F)$, dando
    **DHL[3,2]**.
  - **Barrera de paridad (Selberg; Polymath §8, informal/heurístico)**: métodos puramente de tamiz
    no pueden probar ninguna cota de $H_1$ mejor que $H_1\le6$, ni siquiera asumiendo GEH; el peso
    de Liouville $\omega(n)=(1-\lambda(n)\lambda(n+2))(1-\lambda(n+2)\lambda(n+6))$ se anula en
    $A'=\{n:n,n+2\text{ primos}\}\cup\{n:n+2,n+6\text{ primos}\}$, mientras que el argumento de
    tamiz implicaría $\sum_n\nu(n)\mathbf 1_{A'}(n)\omega(n)>0$ — contradicción (suponiendo la
    "ley de aleatoriedad de Möbius"). Lo mismo prohíbe una prueba tamizable de $H_1=2$
    ($\omega(n)=1-\lambda(n)\lambda(n+2)$). Salida posible: axiomas de tamiz "bilineales" nuevos
    (p. ej. $\sum f(n)\Lambda(n+2)$), que no se sabe controlar.

---

## 5. Tablas numéricas

### 5.1 Valores de $M_k$ (los que se pueden verificar)

| Cantidad | Valor exacto/estado | Fuente |
|---|---|---|
| $M_2$ | $=\dfrac{1}{1-W(1/e)}=1.38593\ldots$ (exacto) | Polymath, Corolario 6.3 |
| $M_2$ (cota) | $\le 2\log 2=1.38629\ldots$ | Polymath, Corolario 6.4 |
| $M_2$ (Bessel) | $\ge 1.383\ldots$ ($4k(k-1)/j_{k-2}^2$ con $k=2$) | Polymath §6 |
| $M_4$ (cota) | $\le \frac43\log 4=1.8454\ldots$ | Polymath, Corolario 6.4 |
| $M_5$ | $\ge\frac{1417255}{708216}>2$ (y $>2$) | Maynard (8.17), Prop. 4.3(1) |
| $M_{105}$ | $>4$ (autovalor $\approx4.0020697\ldots$) | Maynard (8.15) |
| $M_{54}$ | $>4.00238$ | Polymath, Teor. 3.9(vii) |
| $M_{5511}$ | $>6$ | Polymath, Teor. 3.9(viii) |
| $M_{41588}$ | $>8$ | Polymath, Teor. 3.9(ix) |
| $M_{309661}$ | $>10$ | Polymath, Teor. 3.9(x) |
| $M_{50,1/25}$ | $>4.0043$ | Polymath, Teor. 3.13(i) |
| $M_{51,1/50}$ | $>4.00156$ | Polymath, Teor. 3.13(xiii) |
| $M_{4,0.168}$ | $>2.00558$ | Polymath, Teor. 3.13(xii′) |
| $M_{4,5/21}$ | $\ge2.05411$ | Polymath, Nota 7.4 |
| $M_{3,\varepsilon}$ (mejor hallado) | $1.91726$ ($\varepsilon=56/113$) | Polymath, Nota 7.4 |
| $M_{2,\varepsilon}$ | $=\dfrac{e(1+\varepsilon)-2\varepsilon}{e-1}$ para $1/3\le\varepsilon<1$; tiende a $2$ | Polymath §6 |
| Asintótica | $\log k-C\le M_k\le\frac{k}{k-1}\log k$ ($k\ge2$, $C$ absoluta efectiva); Maynard: $M_k\ge\log k-2\log\log k-2$ | Polymath Teor. 3.9(xi)+Corol. 6.4; Maynard Prop. 4.3(3) |

Tabla de parámetros para las cotas de $k$ medio (Polymath, Tabla 2 — se dan con $M_k^{[T]}>M$):
$k{=}5511$: $M{>}6.000048609$; $k{=}41588$: $M{>}8.000001401$; $k{=}309661$: $M{>}10.00000032$;
$k{=}1649821$: $M{>}11.65752556$; $k{=}75845707$: $M{>}15.48125090$;
$k{=}3473955908$: $M{>}19.30374872$ (y $k{=}35410$: $M{>}7.829849259$).

### 5.2 Anchuras admisibles mínimas $H(k)$ y valores resultantes de $H_m$

**Historia rápida (verificada):** GPY/EH: $H_1\le16$; Zhang (2013): $H_1\le70\,000\,000$;
Polymath 8a: $H_1\le4680$; Maynard (arXiv:1311.4600): $H_1\le600$, y $H_m$ finito para todo $m$
($H_m\ll m^3e^{4m}$; bajo EH $H_1\le12$, $H_2\le600$, $H_m\ll m^3e^{2m}$);
**Polymath 8b (arXiv:1407.4897), Teorema 1.4**:

- **Incondicional**: $H_1\le246$; $H_2\le398\,130$; $H_3\le24\,797\,814$;
  $H_4\le1\,431\,556\,072$; $H_5\le80\,550\,202\,480$; $H_m\le Cm\exp\!\big((4-\frac{28}{157})m\big)$.
- **Bajo EH$[\vartheta]$ ($\vartheta\to1$)**: $H_2\le270$; $H_3\le52\,116$; $H_4\le474\,266$;
  $H_5\le4\,137\,854$; $H_m\le Cme^{2m}$.
- **Bajo GEH$[\vartheta]$**: $H_1\le6$; $H_2\le252$.

**Valores de $H(k)$ usados (Polymath, Teorema 3.3):** $H(3)=6$, $H(50)=246$, $H(51)=252$,
$H(54)=270$, $H(5511)\le52\,116$, $H(35410)\le398\,130$, $H(41588)\le474\,266$,
$H(309661)\le4\,137\,854$, $H(1\,649\,821)\le24\,797\,814$,
$H(75\,845\,707)\le1\,431\,556\,072$, $H(3\,473\,955\,908)\le80\,550\,202\,480$, y
$H(k)\le k\log k+k\log\log k-k+o(k)$; por Brun–Titchmarsh
$H(k)\ge(\frac12+o(1))k\log k$.

**DHL usados (Polymath, Teorema 3.2):** incondicional DHL[50,2], DHL[35 410,3], DHL[1 649 821,4],
DHL[75 845 707,5], DHL[3 473 955 908,6]; bajo EH: DHL[54,3], DHL[5511,4], DHL[41 588,5],
DHL[309 661,6]; bajo GEH: DHL[3,2] y DHL[51,3]. Además DHL[54,2] (versión débil de DHL[50,2]
con BV + $M_{54}>4.00238$) y una versión débil DHL[4,2] bajo GEH.
*(Nota: con $H(3)=6$, DHL[3,2] da $H_1\le6$; Maynard no obtuvo $H_1\le6$ — eso es de Polymath 8b,
bajo GEH, no bajo EH.)*

---

## 6. ¿Qué hace falta para $H=2$? (relación con Elliott–Halberstam)

- $H_1=2$ es la conjetura de los primos gemelos; más generalmente la conjetura de tuplas de primos
  daría $H_m=H(m+1)$ (Polymath §1).
- **Del criterio exacto (§3.1)**: para obtener DHL$[k,2]$ (dos primos) con BV ($\vartheta\to1/2$)
  haría falta $M_k>2m/\vartheta\approx8$; como $M_k\le\frac{k}{k-1}\log k$, eso exige $k$ enorme;
  y aun asumiendo EH/GEH pleno ($\vartheta\to1$), haría falta $M_k>4$ **con $k=2$** para acotar
  $H_1\le H(2)=2$, pero $M_2=1.38593\ldots<4$: imposible con el Teorema 3.8. Polymath observa que
  ni DHL[3,2] ni DHL[4,2] pueden obtenerse sólo por el Teorema 3.8 (pues $M_4\le1.8454<4$), y que
  fueron necesarios los dominios ampliados (Teoremas 3.12, 3.14, 3.15) — con GEH — para lograr
  DHL[3,2] y así $H_1\le6$.
- **Más distribución no basta por sí sola**: la barrera de paridad (Selberg; Polymath §8) prohíbe
  cualquier prueba puramente tamizable de $H_1\le4$ (y en particular de $H_1=2$) incluso asumiendo
  GEH. Hacen falta axiomas/cotzas nuevas, p. ej. no triviales para sumas bilineales
  $\sum_{x\le n\le2x}f(n)\Lambda(n+2)$ (lo que daría $\sum\Lambda(n)\Lambda(n+2)$ y los primos
  gemelos).
- **Sentido en que Maynard necesita $\theta$ próximo a 1/2**: en su argumento asintótico (prueba del
  Teorema 1.1, ec. (4.5)) con $\theta=1/2-\epsilon$ se obtiene
  $\frac{\theta M_k}{2}\ge(\frac14-\frac\epsilon2)(\log k-2\log\log k-2)$; eligiendo
  $\epsilon=1/k$ y $k\ge Cm^2e^{4m}$ obtiene $m+1$ primos y $H_m\ll m^3e^{4m}$ (bajo EH:
  $k\ge Cm^2e^{2m}$, $H_m\ll m^3e^{2m}$). Es decir, con $\theta$ arbitrariamente por encima de
  $1/2$ ya se obtiene huecos acotados; la calidad mejora con $\theta\to1$.
  **[NO VERIFICADO]**: la formulación alternativa "$\theta=\frac12+(\text{algo})/k$" que se
  mencionaba en el encargo no aparece en el paper de Maynard (arXiv:1311.4600).

---

## Fuentes

1. J. Maynard, *Small gaps between primes*, **arXiv:1311.4600** — `https://ar5iv.org/abs/1311.4600`
   (ítems 1, 2, 3, 4.1–4.3, 5.1, 6).
2. D. H. J. Polymath, *Variants of the Selberg sieve, and bounded intervals containing many primes*,
   **arXiv:1407.4897v4** — `https://ar5iv.org/abs/1407.4897` (ítems 1, 3, 4.2–4.3, 5, 6).
3. Verificación del identificador arXiv erróneo: `https://arxiv.org/abs/1409.3661` (paper de
   cosmología Liu–Ng–Wang) y `http://export.arxiv.org/api/query?search_query=ti:"Small gaps between primes"`
   (identifica Maynard como arXiv:1311.4600).
4. D. H. J. Polymath, *The "bounded gaps between primes" Polymath project — a retrospective*,
   arXiv:1409.8361 (contexto histórico).
5. `https://polymathprojects.org/yb/` — **404**, no accesible: tablas de $M_k$ de la wiki
   **[NO VERIFICADO]**; post del blog de T. Tao (19/11/2014) **[NO VERIFICADO]** (URL no confirmada).