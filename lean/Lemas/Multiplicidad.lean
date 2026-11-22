import Mathlib
open BigOperators

namespace Lemas.Multiplicidad

/-- `sumaConMul w f` = Σ_i m_i • f_i : la aportación del vector de multiplicidades. -/
def sumaConMul {ι : Type} [Fintype ι] [DecidableEq ι] {G : Type} [AddCommMonoid G]
    (w : ι → ℕ) (f : ι → G) : G :=
  ∑ i, (w i : ℕ) • f i

/-- Lema P1a (linealidad en las multiplicidades): aumentar la multiplicidad de un
    sumando en δ incrementa la suma exactamente en δ • f j. Es el contenido
    formalizable de la observación de Riemann sobre el papel del orden
    (multiplicidad) de los ceros en la fórmula explícita. -/
theorem linealidad_multiplicidad {ι : Type} [Fintype ι] [DecidableEq ι]
    {G : Type} [AddCommMonoid G] (w : ι → ℕ) (f : ι → G) (j : ι) (δ : ℕ) :
    sumaConMul (fun i => w i + (if i = j then δ else 0)) f
      = sumaConMul w f + (δ : ℕ) • f j := by
  have h1 : ∑ i, (w i + (if i = j then δ else 0) : ℕ) • f i
      = (∑ i, (w i : ℕ) • f i) + (∑ i, (if i = j then δ else 0 : ℕ) • f i) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    exact add_nsmul (f i) (w i) _
  have h2 : (∑ i, (if i = j then δ else 0 : ℕ) • f i) = (δ : ℕ) • f j := by
    have hc : ∑ i, (if i = j then δ else 0 : ℕ) • f i
        = ∑ i, ite (i = j) ((δ : ℕ) • f j) 0 := by
      apply Finset.sum_congr rfl
      intro i _
      by_cases h : i = j <;> simp only [h, ite_true, ite_false] <;> simp
    rw [hc, Fintype.sum_ite_eq' j (fun _ : ι => (δ : ℕ) • f j)]
  simp only [sumaConMul, h1, h2]

end Lemas.Multiplicidad
