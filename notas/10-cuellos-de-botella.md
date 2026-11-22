# Fase 2 — Cuellos de botella de los métodos actuales (borrador estructurado)

> Los números marcados **[NO VERIFICADO]** se contrastarán con `01-zhang.md`,
> `02-maynard.md`, `03*-polymath8*.md` cuando estén. La *estructura* sí es sólida.

## 0. El objetivo, formalizado

Demostrar `liminf_{n→∞} (p_{n+1} - p_n) ≤ H` para H finito. Todos los métodos
modernos (GPY 2005, Zhang 2013, Maynard 2015, Polymath 8) siguen el mismo esqueleto:

1. Para x grande y un k-tuplo admisible 𝓗 = (h₁,…,h_k) de ancho H, se define la
   cantidad (tamiz k-dimensional)
   ```
   S_𝒽 = Σ_{n≤x} (Σ_{i=1..k} 1_{𝒫}(n+h_i)) · w(n)
   ```
   con pesos w ≥ 0 soportados en múltiplos de Q = ∏_{p≤z} p y normalizados.
2. Se acota **por abajo** `S_𝒽 ≥ c(x)·(# de n con ≥2 primos en la tupla)`
   (infinito si H es admisible y los pesos positivos).
3. Se acota **por arriba** `S_𝒽 ≤ (S₁/S₂)·(# total de n)`, donde
   la razón S₁/S₂ depende del nivel de distribución y de un problema variacional.

El método falla en cuanto S₁/S₂ < (número medio de primos que se quiere forzar).
De ahí salen los tres cuellos de botella.

## (B1) Nivel de distribución θ — el cuello analítico

**Definición.** Una familia E de L-funciones tiene *nivel de distribución θ* si
para todo A>0,
```
max_{(a,q)=1} |ψ(x;q,a) − x/f(q)| ≪ x/(log x)^A        para todo q ≤ x^θ .
```
Para los caracteres de Dirichlet mod q ≤ Q, esto es el teorema de
Bombieri–Vinogradov con Q = x^{1/2}/√(log x), es decir **θ = 1/2 + ε**,
condicionalmente a GRH es θ = 1−ε.

**Estado del arte incondicional:**
- GPY (2005): θ = 1/2 + ε **con H = 2** ⇒ necesitaría θ > 1 (alias Elliott–Halberstam
  pleno), inconmensurable con θ = 1/2 + 1/40.
- Zhang (2013): eleva el nivel efectivo a **θ = 1/2 + 1/584** [VERIFICADO, vía
  `03-polymath8a.md`, MPZ^[ϖ,δ] con ϖ,δ < 1/1168; *no* 1/70]; de ahí 70.000.000.
- Polymath 8a (arXiv 1402.0811): **θ = 1/2 + 7/300** [VERIFICADO] para q ≤ x^{θ−ε},
  q x^δ-liso y libre de cuadrados, sin fijar clase residual; MPZ^[ϖ,δ] con
  600ϖ+180δ<7. Resultado H: 70e6 → 14.994 → **4.680** con k₀ = 632 [VERIFICADO, wiki].
- Polymath 8b (arXiv 1407.4897): **H₁ ≤ 246** incondicional, Hₘ ≤ C·m·e^{(4−28/157)m}
  [VERIFICADO]. **Corrección importante:** la etiqueta popular «DHL[1/2+1/40+ε,2k]»
  es un artefacto de renderizado de «1/4», y el «truco del divisor suavizado con
  R = D^δ» **no** figura en 8b [VERIFICADO por lectura directa].
- Condicional: bajo Elliott–Halberstam (i.e. θ = 1−ε) Maynard obtiene H₂ ≤ 270;
  bajo GEH, **H₁ ≤ 6** [VERIFICADO, `03b-polymath8b.md`].

**Dónde se gasta el ε disponible (puntos de fuga, por técnica):**

| # | Técnica | Qué controla | Cuello |
|---|---|---|---|
| a | Cota de Weil para sumas de Kloosterman (2√p) | error de las sumas completadas | Weil es óptimo; se gasta en el "gran tamiz espectral" |
| b | Fórmula de traza de Kuznetsov | 2º momento espectral / sumas de Bessel | pesos de multiplicidad del espectro |
| c | Truco del divisor + números lisos | sumas Tipo III con d \| n(n+2) | δ (nivel de lisura) y calibración |
| d | Cotas de φ-integrales (P_2, P_3) | erores de las integrales de GPY | crecimiento asintótico, sin pérdida real |
| e | Límite de Type I (Σ_{q≤Q}...) | ruido de los números pseudoaleatorios | interacción de q con d lisos |

**Conclusión (B1):** la restricción θ ≤ 1/2 + 1/40 es **artefacto de las estimaciones
de Tipo I/II disponibles**, no un teorema de imposibilidad. Pero subirla requiere
mejoras que todo el campo ha buscado durante 12 años.

## (B2) La razón M_k/I_k — el cuello variacional

Con las notaciones de Maynard (a confirmar en `02-maynard.md`):
```
I_k = ∫_0^1 F'(t)^2 t^{k-1} dt ,    M_k = sup_{F: F(0)=0, ∫F t^{k-1}=1} I_k
```
El criterio central es del tipo
```
si E tiene nivel θ > 1/2 + (M_k / I_k) / 2   ⇒  liminf(p_{n+1}-p_n) ≤ H(𝒽_k)
```
**[NO VERIFICADO: forma exacta del criterio]** con el comportamiento asintótico
`M_k/I_k ≍ 4·log k/(2k)` [NO VERIFICADO].

Consecuencia estructural:
```
H = 2  (primos gemelos)   ⟺   se necesita θ ≈ 1  (Elliott–Halberstam pleno)
θ = 0.525 (Polymath 8b)   ⇒   k acotado   ⇒   H_min ≈ 600 [NO VERIFICADO]
```
**Conclusión (B2):** *incluso con θ arbitrariamente cerca de 1/2, el método produce
intervalos con ≥2 primos; para H=2 hace falta θ≥1-ε, es decir, esencialmente la
conjetura de Elliott–Halberstam.* **Este es el cuello más duro y es de naturaleza
diferente a (B1).**

## (B3) Obstrucción de paridad

Los pesos de Selberg no pueden distinguir `ν(n)=1` de `ν(n)=2` cuando n tiene un
número par de factores primos. GPY la evade con k=2 asintótico; Maynard con k
dimensional y un determinante de Gram no nulo. El precio de la evasión es (B2).

## (B4) Paso algebraico: dimensión y «multiplicidad»

Maynard reemplaza el lema de Siegel algebraico por una condición de rango sobre la
matriz de Gram de los λ. La condición `det(λ_{ij}) ≠ 0` exige
```
dim(espacio de pesos) ≥ dim(espacio de las combinaciones lineales de los λ)
```
Aquí la palabra **multiplicidad** es literal: dimensiones de espacios de
representaciones del espacio ambiente del tamiz. Nota: esto es *combinatoria
lineal*, no teoría de la representación de grupos — pero conecta con el mundo
theta (dimensiones de espacios de levantamientos, fórmulas de multiplicidad de
Howe / Gan–Gross–Prasad). Ver `20-arquitectura.md`.

## (B5) El paso aritmético de Zhang: divisor, congruencias y «densidades locales»

La clave de Zhang [VERIFICADO en `01-zhang.md` cuando llegue]: `d | n(n+2)` con d ≤ D ⇒ el
numerador exhibe la factorización de una forma cuadrática. La estimación (1.5) es una
estimación de **convolución deslizada de la función divisor** en intervalos cortos con
condiciones de congruencia (q módulo, q liso y libre de cuadrados, q ≤ x^{θ}).

Herramientas matemáticas usadas:
- *densidades locales* (producto de densidades locales);
- **fórmula de Siegel–Weil**: el promedio de los coeficientes de la serie theta
  coincide con el coeficiente de la serie de Eisenstein; la diferencia es cuspiforme;
- cotas de **Rankin–Selberg** para la forma cuspiforme diferencia;
- (en 8a) el proceso **q-van der Corput** (Heath-Brown/Graham-Ringrose) explotando la
  lisura de q, y la reducción de Type III a **correlaciones de hiper-Kloosterman**
  vía funciones de traza [VERIFICADO, `03-polymath8a.md`].

Este es el punto de contacto más directo con el «documento de Riemann» (theta +
fórmula explícita). Ver `04-riemann-1859.md`, `06-honest-assessment.md`.

## Resumen

Para H pequeño hacen falta **dos** cosas a la vez: (i) subir θ (cuello analítico,
donde entran theta/Kloosterman/Kuznetsov), y (ii) evitar la penalización
`M_k/I_k ≍ log k/k` del tamiz k-dimensional (cuello variacional).

Números de referencia verificados (`03c-numeros-verificados.md`):
- incondicional: **H₁ ≤ 246** (8b), Hₘ ≤ C·m·e^{(4−28/157)m}, con 4−28/157 = 600/157;
- bajo EH (θ ≈ 1): H₂ ≤ 270; bajo GEH: **H₁ ≤ 6**;
- el caso k = 2 del problema variacional tiene solución exacta
  **M₂ = 1/(1−W(1/e))** con W = función Lambert W [VERIFICADO] → perfecto para
  verificación numérica independiente (experimento E2).

El trabajo sobre theta lifts ataca (i) y, parcialmente, (B5); (B2) queda fuera
del alcance de toda técnica analítica conocida.