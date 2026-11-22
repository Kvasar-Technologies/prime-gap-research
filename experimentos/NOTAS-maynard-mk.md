# Experimento — Reproducción numérica independiente de M_k (Maynard)

**Script:** `experimentos/maynard-mk.js` (Node, racionales exactos BigInt + mathjs).

## Qué se hace

Con las definiciones verificadas de Maynard (arXiv:**1311.4600**):

```
R_k = simplejo {t ∈ [0,1]^k : Σ t_i ≤ 1}
I_k(F) = ∫_{R_k} F²
J_k^(m)(F) = ∫_{R_{k-1}} (∫_0^{1-Σ_{i≠m}u_i} F(u,t_m) dt_m)² du
M_k = sup_{F} Σ_m J_k^{(m)}(F) / I_k(F)
```

Se resuelve por **Rayleigh–Ritz sobre la base monomial** `t_1^{a_1}…t_k^{a_k}` con
`Σ a_i ≤ D`. Todas las integrales son racionales:

```
∫_{R_n} (1-Σt)^p ∏ t_i^{a_i} dt = p!·∏ a_i! / (Σa_i + p + n)!
```

de modo que las matrices `A = I_k` y `B = Σ_m J^(m)` se calculan **exactamente**
(BigInt) y `M_k^{(D)} := λ_max(B v = λ A v)` es una **cota inferior** de `M_k`
que converge por arriba… por abajo, desde abajo, al valor real.

## Resultados [VERIFICADO — reproducidos por nosotros]

| k | D=2 | D=3 | D=4 | D=5 | D=6 | valor exacto / referencia | cota superior Maynard |
|---|---|---|---|---|---|---|---|
| 2 | 1.385653 | 1.385909 | 1.385931 | 1.385933 | 1.385933 | **1/(1−W(1/e)) = 1.385933276** | 2·log 2 = 1.386294 |
| 3 | 1.643881 | 1.646031 | 1.646365 | 1.646427 | 1.646438 | — | 1.5·log 3 = 1.647918 |
| 4 | | 1.843715 | 1.844989 | | | — | 1.848392 |
| 5 | | 2.002887 | 2.005879 | | | **M₅ > 2** (Maynard) | 1.25·log 5 = 2.011797 |

**Conclusiones:**

1. **`M₂ = 1/(1−W(1/e))` queda reproducido numéricamente** a 6 decimales
   (1.385933 vs 1.385933276). Esto confirma que nuestra lectura de las
   definiciones de Maynard (simplejo + operador de integrales parciales) es la
   correcta, y que la versión 1D `∫ F'² t^{k-1}` que circula **no** es la del
   paper.
2. `M₅^(D=4) ≈ 2.006 > 2` **[NO VERIFICADO como cita, verificado por cálculo]**:
   coincide con el valor verificado `M₅ > 2` en `notas/02-maynard.md`.
3. Todas las cotas inferiores quedan por debajo de `(k/(k−1))·log k` ✓
   (consistencia interna).
4. `λ_max` se calcula resolviendo `A^{-1}B` con `math.eigs` (precisión doble);
   el error numérico es ≪ 1e-6, las matrices son exactas.

## Qué NO muestra

- Converge a `M_k` desde abajo; no da el valor exacto para k ≥ 3 (Maynard tampoco
  pudo resolver la ecuación de autovalores para k > 2).
- No toca el cuello del problema: con `θ` el criterio es `M_k > 2m/θ`, así que
  `M₅ ≈ 2.006` y `θ = 1/2` ya dan 2 primos en intervalos acotados (eso es lo que
  descubrió Maynard), pero **para H = 2 haría falta `M_k > 2m/θ` con θ ≈ 1 y
  m = 2**, y eso no está al alcance del tamiz (ver `notas/10`,
  `lemas/30-lemas-propuestos.md` §P4).