import Mathlib
import Lemas.Definiciones
import Lemas.Admisibles
open Finset BigOperators
open Lemas.Definiciones
open Lemas.Admisibles

namespace Lemas.Maynard

/-!
# El criterio de Maynard, trasladado como ENUNCIADO (no demostrado aquí)

Lo que hay en este fichero es la **traducción formal** de los enunciados externos.
Los ingredientes analíticos (nivel de distribución) y variacionales (`M_k`) entran
como **axiomas etiquetados**, claramente separados de lo que sí está probado en este
desarrollo (`Lemas/Definiciones.lean`, `Lemas/Admisibles.lean`).

Referencias:
* Maynard, *Small gaps between primes*, arXiv:1311.4600 (Ann. of Math. 2015):
  Prop. 4.2 — si los primos tienen nivel de distribución `θ > 0` y `M_k > 2m/θ`,
  entonces para toda k-tupla admisible `𝓗` hay infinitos `n` con al menos
  `r_k = ⌈θ·M_k/2⌉ ≥ m+1` primos entre los `n + h`.
* Polymath 8b, arXiv:1407.4897: bajo GEH, `H₁ ≤ 6`, y eso es «lo mejor posible
  desde consideraciones puramente de tamiz».
-/

/-- **AXIOMA ETIQUETADO** (no demostrado en este desarrollo): los primos tienen
nivel de distribución `θ`, es decir, para todo `A > 0` y todos los `q ≤ x^θ` con
`(a, q) = 1`, `|ψ(x;q,a) − x/φ(q)| ≪_A x/(log x)^A`.
Este es el camino por el que se importa la teoría analítica (Bombieri–Vinogradov,
Elliott–Halberstam, …) sin formalizarla. -/
axiom nivel_distribucion (θ : ℝ) (hθ : 0 < θ) : Prop

/-- **AXIOMA ETIQUETADO** (no demostrado): la cantidad variacional `M_k` de Maynard.
Definición matemática (Maynard, ec. (7.1)): sobre `𝓡_k = {t ∈ [0,1]^k : Σ t_i ≤ 1}`,
`I_k(F) = ∫_{𝓡_k} F²`, `J_k^{(m)}(F) = ∫_{𝓡_{k-1}} (∫_0^{1-Σ_{i≠m}u_i} F(u,t_m) dt_m)² du`,
y `M_k = sup_F Σ_m J_k^{(m)}(F) / I_k(F)`.
Valores conocidos (no formalizados aquí): `M₂ = 1/(1−W(1/e)) = 1.385936…`, `M₅ > 2`. -/
axiom Mk : ℕ → ℝ

/-- Maynard, Prop. 4.2 — **ENUNCIADO TRASLADADO, NO DEMOSTRADO AQUÍ** (axioma etiquetado).
Para toda k-tupla admisible `𝓗` y todo `N`, existe `n ≥ N` con al menos `m+1`
primos entre los `n + h`, `h ∈ 𝓗`. -/
axiom maynard_prop_4_2 (k m : ℕ) (θ : ℝ) (hθ : 0 < θ)
    (hniv : nivel_distribucion θ hθ) (hMk : Mk k > 2 * m / θ)
    (𝓗 : Finset ℕ) (h𝓗 : esAdmisible 𝓗) (hcard : 𝓗.card = k) :
    ∀ N : ℕ, ∃ n : ℕ, N ≤ n ∧ m + 1 ≤ ((𝓗.filter
      (fun h => Nat.Prime (n + h))).card)

/-- Polymath 8b bajo GEH: para toda terna admisible hay infinitos `n` con ≥ 2 de 3
primos. **ENUNCIADO TRASLADADO, NO DEMOSTRADO AQUÍ** (axioma etiquetado).
Junto con el argumento de la «parity problem» modificado de Selberg (Polymath 8b),
esto implica que `H₁ = 6` es el mejor resultado posible desde consideraciones
puramente de tamiz. -/
axiom polymath8b_GEH (𝓗 : Finset ℕ) (h𝓗 : esAdmisible 𝓗) (hcard : 𝓗.card = 3) :
    ∀ N : ℕ, ∃ n : ℕ, N ≤ n ∧ 2 ≤ ((𝓗.filter (fun h => Nat.Prime (n + h))).card)

/-- **Combinación** (demostrada) de lo probado con lo asumido: con las hipótesis de
Maynard, existe un ancho explícito `H = (k−1)·primorial k` para el que hay infinitos
`n` con al menos `m+1` primos entre los `n + h` de la tupla construida. -/
theorem huecos_desde_maynard (k m : ℕ) (θ : ℝ) (hθ : 0 < θ)
    (hniv : nivel_distribucion θ hθ) (hMk : Mk k > 2 * m / θ) :
    ∃ H : ℕ, H = (k - 1) * Lemas.Admisibles.primorial k ∧ ∀ N : ℕ, ∃ n : ℕ, N ≤ n ∧
      m + 1 ≤ ((tuplaConstruida k).filter (fun h => Nat.Prime (n + h))).card := by
  refine ⟨(k - 1) * Lemas.Admisibles.primorial k, rfl, ?_⟩
  intro N
  exact maynard_prop_4_2 k m θ hθ hniv hMk (tuplaConstruida k)
    (tuplaConstruida_admisible k) (card_tuplaConstruida k) N

end Lemas.Maynard
