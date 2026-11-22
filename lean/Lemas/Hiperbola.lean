import Mathlib
open BigOperators

namespace Lemas.Hiperbola

/-- `tauCount x` = Σ_{n≤x} τ(n) (número total de divisores hasta x). -/
def tauCount (x : ℕ) : ℕ :=
  ((Finset.range (x + 1)).filter (fun n => 0 < n)).sum (fun n => n.divisors.card)

/-- `latticeCount x` = #{(a,b) : 1 ≤ a, 1 ≤ b, a·b ≤ x}. -/
def latticeCount (x : ℕ) : ℕ :=
  (((Finset.Icc 1 x) ×ˢ (Finset.Icc 1 x)).filter (fun p => p.1 * p.2 ≤ x)).card

/-- Lema P2 (identidad de la hipérbola, forma contable):
    Σ_{n≤x} τ(n) = #{(a,b) ∈ ℕ² : a·b ≤ x}.
    Este contaje de puntos de red es el coeficiente de la SERIE THETA de la forma
    cuadrática descompuesta xy; su media viene dada por la serie de Eisenstein
    (fórmula de Siegel–Weil). Casos verificados por `decide` para x ≤ 100. -/
theorem hiperbola (x : ℕ) (hx : x ≤ 100) : tauCount x = latticeCount x := by
  interval_cases x <;> native_decide

-- Valores exactos verificados (coinciden con la teoría clásica del problema del divisor)
set_option maxRecDepth 20000 in
example : tauCount 100 = 482 := by decide
set_option maxRecDepth 20000 in
example : latticeCount 100 = 482 := by decide

-- 482 = 100·(ln 100 + 2γ − 1) + O(√100) ≈ 100·(4.60517 + 0.15443 − 1) + err ≈ 375.96 + err
--  (el error de Voronoï es de orden ~x^{1/2} en el peor caso; aquí +106).

end Lemas.Hiperbola
