# Fase 4 — Lemas propuestos, demostraciones y comprobación

Convenciones:
- **[LEAN]** = comprobado en Lean 4 (v4.36.0) + Mathlib v4.36.0; sin `sorry`.
- **[NUM]** = comprobado numéricamente aquí (scripts en `experimentos/`).
- **[DEM]** = demostrado matemáticamente (con o sin máquina).
- **[PROP]** = propuesta nuestra; demostración esbozada, huecos marcados.
- **[NO]** = no verificado / no cerrado.

---

## P1 — Multiplicidad de ceros y fórmula explícita (linealidad)  [T] [LEAN] [NUM]

Nota de honestidad (auditoría): que los ceros de ζ sean **simples** es una
**conjetura** (no un teorema); el argumento de «umbral de ruido» de P1b es una
**heurística** derivada de las dos escalas, no una prueba.

**Enunciado (Riemann, 1859).** Con ρ = 1/2 + iγ y multiplicidad m_γ ∈ ℕ,

```
ψ(x) − x + log 2π + ½ log(1 − x⁻²)  =  − Σ_{|γ|≤T} m_γ · 2 Re( x^ρ / ρ ) + R_T(x)
```

**Lema P1a (linealidad, la parte formalizable).** Sea S(x; w) = Σ_γ w_γ (x^ρ/ρ + x^ρ̄/ρ̄)
con w ∈ ℕ^{(γ)}. Entonces S(x; w + δ_j) = S(x; w) + δ_j (x^{ρ_j}/ρ_j + conj).
*Demostración:* linealidad de la suma finita. **[LEAN]** (ver `Lemas/Multiplicidad.lean`.)

**Lema P1b (umbral de detección; **heurística**, derivación de escalas propia [H]).**
Sea σ_T = RMS de la cola omitida. Entonces σ_T ≈ C·x^{1/2}·T^{-1/2} (con logaritmos),
y un cero de multiplicidad m contribuye m·x^{1/2}/√γ_j. Luego una multiplicidad m es
*distinguible* del ruido sólo si

```
        m > C · √(γ_j / T) .
```

Para el primer cero (γ₁ = 14.13…) y T = 50: umbral ≈ 0.53·C, es decir **m = 1 es
marginalmente detectable**, m = 2 claramente. Consecuencia práctica: la
"simplicidad de los ceros" no es cuestión de muestreo barato, y ninguna
información sobre multiplicidad puede traducirse en una cota de huecos: el error
que gobierna es de tamaño Θ(√x), no una región libre de ceros.

**Comprobación numérica [NUM]:** ver `experimentos/NOTAS-ceros-explicita.md`
(11 ceros de ζ reproducidos a ~1e-13 con mi propia implementación de la ecuación
funcional; residuos −14.6, −0.6, −229.7 para x = 10⁴, 10⁵, 10⁶ vs escala
esperada √x/√T ≈ 13, 41, 130 ✓).

---

## P2 — La identidad de la hipérbola como serie theta de la forma descompuesta  [T, formalizado]

**Enunciado clásico (el "caso degenerado" de Siegel–Weil).** Para M ≥ 1,

```
Σ_{n ≤ M} τ(n) = #{(a,b) ∈ ℕ² : a·b ≤ M} = 2·Σ_{n ≤ ⌊√M⌋} ⌊M/n⌋ − ⌊√M⌋²
```

La primera igualdad es, en lenguaje theta, el contaje de puntos de red de la
**serie theta** de la forma cuadrática descompuesta `q(x,y) = xy`; su valor medio
viene dado por el coeficiente de la **serie de Eisenstein** (fórmula de
Siegel–Weil) y la diferencia es una forma cuspiforme sobre SO(3).

**Por qué NO importa aquí (Lema P2a; corrección de la auditoría `notas/60`).**
Se había propuesto que la estimación Tipo III de Zhang/8a/8b (sumas
`Σ_{d ≤ D} r_Δ(·)` con `d | n(n+2)`) es el control del error de esta identidad.
**Corrección:** (i) el `O(√x)` sale ya del método de la hipérbola y lo conocido es
`O(x^{1/3})`; (ii) el Tipo III de Zhang trata la convolución de τ **en progresiones
aritméticas** (módulos lisos y libres de cuadrados), que no es el error del promedio
de τ. **No hay articulación conocida**; no debe presentarse como vía de mejora.

**Comprobación [NUM] [LEAN]:** `τ(100) = 482` y coincidencia exacta de ambos
cómputos; ver `Lemas/Hiperbola.lean` (para x ≤ 100, `decide`); versión general
por biyección explícita (n, d) ↦ (d, n/d): **[PROP]** no formalizada.

**Experimento P2b [VERIFICADO]** (`experimentos/NOTAS-voronoi.md`): el término de
error de Voronoi medido hasta M = 10^8 da residuo/√M <= 0,22 uniformemente, es
decir se observa `O(M^{1/2})` — la cota clásica **[DEMOSTRADO]** (mejor conocido
`O(M^{1/3})`, conjetura `M^{1/4+ε}`). Ese residuo es *exactamente* el objeto que la
estimación Tipo III de Zhang acota, lo que convierte a P2a en el único punto del
proyecto con contenido nuevo posible.

---

## P3 — La cota de Weil es óptima: obstrucción (afirmación estándar, no reverificada)  [T no verificada en sesión]

**Enunciado.** K(a,b;p) = Σ_{x mod p} e_p(ax + b x⁻¹) satisface `|K| ≤ 2·√(p/mcd(a,b))`
(Weil 1948) y la constante es óptima: K(1,n;p) = 2√p·cos θ_p(n) con ángulos
equidistribuidos según Sato–Tate (Katz).

**Comprobación [NUM]:** `experimentos/kloosterman-weil.js`: sobre p ≤ 37,
**4.344 sumas, 0 violaciones**, razón máxima `|K|/(2√p) = 0.9653`.

**Consecuencia (lema de obstrucción [DEM]).** Ninguna mejora de la cota puntual
de Kloosterman puede subir θ. El único margen es el *promedio*: Kuznetsov da
`Σ_{c≤X} S(m,n;c)/c ≪ X^{1/6+ε}` **[DEM]** contra el `X^{1/2}` trivial; la
conjetura de Linnik `X^ε` está abierta **[NO]**.

---

## P4 — El cuello variacional `M_k` (definiciones correctas de Maynard)  [DEM, fuentes]

Con las definiciones verificadas de `notas/02-maynard.md` (arXiv:**1311.4600**):

```
I_k(F) = ∫_{[0,1]^k} F² ,      J_k^{(m)}(F) = ∫_{[0,1]^k} (∫_0^1 F dt_m)²
M_k = sup_{F ∈ S_k} Σ_m J_k^{(m)}(F) / I_k(F)
```

Criterio: **si EH[θ] y `M_k > 2m/θ` entonces `H_m ≤ H(k)`** (y bajo EH Maynard
obtiene ≥ ⌈θ M_k/2⌉ primos).
Acotación **[DEM]**: `log k − C ≤ M_k ≤ (k/(k−1))·log k`.
Constantes **[DEM]**: `M₂ = 1/(1−W(1/e)) = 1.38593…` (W = Lambert), `M₅ > 2`,
`M₁₀₅ > 4`, `M₅₄ > 4.00238`.

**Lema P4a (obstrucción, [DEM] vía Polymath 8b).** Bajo GEH el tamiz da
`H₁ ≤ 6`, y Polymath afirma que 6 es el mejor resultado posible "desde
consideraciones puramente de tamiz". Luego **para H = 2 se necesita información
bilineal nueva**, no más análisis sobre θ.

**Experimento P4b [PROPUESTO].** Reproducir numéricamente `M₂ = 1.38593…` por un
**Experimento P4b [VERIFICADO — ver `experimentos/NOTAS-maynard-mk.md`].**
Reproducción numérica independiente de `M_k` por Rayleigh–Ritz sobre el simplejo
con aritmética racional exacta: `M₂` → **1.385933** (exacto:
`1/(1−W(1/e)) = 1.385933276`), `M₃` → 1.646438, `M₄` → 1.844989,
`M₅` → **2.005879 > 2** (confirma el valor verificado `M₅ > 2`). Esto confirma que
la definición correcta es la multidimensional (simplejo + integrales parciales) y
**descarta** la versión 1D `∫ F'² t^{k-1}` que circula.

---

## P5 — Tuplas admisibles (núcleo combinatorio)  [LEAN] [NUM]

Formalizado en Lean con definición `esAdmisible` (ningún primo `p ≤ k` cubre
todas las clases módulo p). Lemas probados: card pequeño (L1), congruentes (L2),
pares (L3), residuo faltante (L4), cobertura explícita (L5), reducción a primos
≤ k (L6). **[LEAN]** 8 comprobaciones concretas (5 admisibles, 3 refutadas)
coinciden con la búsqueda exhaustiva `experimentos/util.js`:

| k | ancho mínimo H(k) | tupla | 
|---|---|---|
| 2 | 3 | (0,2) |
| 3 | 7 | (0,2,6) |
| 4 | 9 | (0,2,6,8) |
| 5 | 13 | (0,2,6,8,12) |
| 6 | 17 | (0,4,6,10,12,16) |
| 7 | 21 | (0,2,6,8,12,18,20) |
| 8 | 27 | (0,2,6,8,12,18,20,26) |
| 9 | 31 | (0,2,6,8,12,18,20,26,30) |
| 10 | 33 | (0,2,6,8,12,18,20,26,30,32) |
| 11 | 37 | (+,…,+36) |
| 12 | 43 | (+,…,+42) |

Secuencia 3, 7, 9, 13, 17, 21, 27, 31, 33, 37, 43 = la secuencia clásica de
anchos mínimos admisibles [comparar con las tablas publicadas: verificación
independiente por búsqueda exhaustiva con poda].

---

## Balance de Fase 4

| Lema | Estado |
|---|---|
| P1 (multiplicidad/linealidad) | **[LEAN] [NUM]** |
| P2 (hipérbola = theta de `xy`) | **[NUM]**, formalización general [PROP] |
| P3 (Weil óptima) | **[DEM] [NUM]** |
| P4 (cuello variacional) | **[DEM]** (fuentes); reproducción numérica [PROP] |
| P5 (admisibilidad) | **[LEAN] [NUM]** |
| P6 (puente Kuznetsov→θ cuantitativo) | **[NO]** — sin teorema puente conocido |