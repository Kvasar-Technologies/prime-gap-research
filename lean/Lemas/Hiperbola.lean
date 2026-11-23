import Mathlib
open BigOperators

namespace Lemas.Hiperbola

/-!
# Identidad de la hipérbola (Dirichlet)

`Σ_{n≤x} τ(n) = #{(a,b) ∈ ℕ² : a·b ≤ x}` para todo `x : ℕ`.

Se construye la biyección explícita entre divisores y pares:
`(d, n) ↦ (d, n/d)` con `d ∣ n`, y su inversa `(a, b) ↦ (a, a·b)`.

Es el caso degenerado de la identidad de promedios de Siegel–Weil para la serie
theta de la forma descompuesta `xy`. El *término de error* del promedio (Voronoï,
`O(√x)`; mejor conocido `O(x^{1/3})`, conjetura `x^{1/4+ε}`) **no** está formalizado
aquí: requiere análisis.
-/

/-- Divisores positivos de `n`. -/
def divisores (n : ℕ) : Finset ℕ := (Finset.range (n + 1)).filter (fun d => d ∣ n)

/-- `tauCount x = Σ_{n≤x} τ(n)`. -/
def tauCount (x : ℕ) : ℕ := ((Finset.range (x + 1)).filter (fun n => 0 < n)).sum
  (fun n => (divisores n).card)

/-- `divPairs x = {(d,n) : 1 ≤ d, 1 ≤ n ≤ x, d ∣ n}`. -/
def divPairs (x : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.Icc 1 x) ×ˢ (Finset.Icc 1 x)).filter (fun p => p.1 ∣ p.2)

/-- `multPairs x = {(a,b) : 1 ≤ a, 1 ≤ b ≤ x, a·b ≤ x}`. -/
def multPairs (x : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.Icc 1 x) ×ˢ (Finset.Icc 1 x)).filter (fun p => p.1 * p.2 ≤ x)

/-- `Σ_{n≤x} τ(n) = #(divPairs x)`: ambas cuentan los mismos pares. -/
theorem tauCount_eq_card_divPairs (x : ℕ) : tauCount x = (divPairs x).card := by
  have hidx : ((Finset.range (x + 1)).filter (fun n => 0 < n) : Finset ℕ) = Finset.Icc 1 x := by
    ext n
    simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_Icc]
    omega
  have hdivset : ∀ n ∈ Finset.Icc 1 x, divisores n = (Finset.Icc 1 x).filter (fun d => d ∣ n) := by
    intro n hn
    have hnI : 1 ≤ n ∧ n ≤ x := Finset.mem_Icc.mp hn
    ext d
    constructor
    · intro hd
      have hlt : d < n + 1 := Finset.mem_range.mp (Finset.mem_filter.mp hd).1
      have hdvd : d ∣ n := (Finset.mem_filter.mp hd).2
      have hpos : 0 < d := Nat.pos_of_dvd_of_pos hdvd hnI.1
      exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨hpos, by omega⟩, hdvd⟩
    · intro hd
      have hdvd : d ∣ n := (Finset.mem_filter.mp hd).2
      have hdle : d ≤ n := Nat.le_of_dvd hnI.1 hdvd
      exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by omega), hdvd⟩
  rw [tauCount, hidx, divPairs,
    Finset.card_filter (p := fun p => p.1 ∣ p.2) (s := Finset.Icc 1 x ×ˢ Finset.Icc 1 x)]
  rw [Finset.sum_product' (f := fun a b => if a ∣ b then 1 else 0)]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro n hn
  rw [hdivset n hn]
  exact Finset.card_filter (p := fun d => d ∣ n) (s := Finset.Icc 1 x)

/-- La biyección `(d, n) ↦ (d, n/d)` envía `divPairs x` exactamente sobre `multPairs x`. -/
theorem multPairs_eq_image (x : ℕ) :
    multPairs x = (divPairs x).image (fun p => (p.1, p.2 / p.1)) := by
  ext q
  obtain ⟨a, b⟩ := q
  constructor
  · intro hq
    have hmem := Finset.mem_filter.mp hq
    have hprod := Finset.mem_product.mp hmem.1
    have haI : 1 ≤ a ∧ a ≤ x := Finset.mem_Icc.mp hprod.1
    have hbI : 1 ≤ b ∧ b ≤ x := Finset.mem_Icc.mp hprod.2
    have habx : a * b ≤ x := hmem.2
    have hab1 : 1 ≤ a * b := by
      have h2 : 1 * 1 ≤ a * b := Nat.mul_le_mul haI.1 hbI.1
      omega
    rw [Finset.mem_image]
    refine ⟨(a, a * b), ?_, ?_⟩
    · exact Finset.mem_filter.mpr ⟨Finset.mem_product.mpr ⟨Finset.mem_Icc.mpr ⟨haI.1, haI.2⟩,
        Finset.mem_Icc.mpr ⟨hab1, habx⟩⟩, dvd_mul_right a b⟩
    · show (a, (a * b) / a) = (a, b)
      rw [Nat.mul_div_cancel_left b haI.1]
  · intro hq
    rw [Finset.mem_image] at hq
    obtain ⟨p, hp, Hed⟩ := hq
    have ha : p.1 = a := congrArg Prod.fst Hed
    have hb : p.2 / p.1 = b := congrArg Prod.snd Hed
    have hmem := Finset.mem_filter.mp hp
    have hprod := Finset.mem_product.mp hmem.1
    have hdI : 1 ≤ p.1 ∧ p.1 ≤ x := Finset.mem_Icc.mp hprod.1
    have hnI : 1 ≤ p.2 ∧ p.2 ≤ x := Finset.mem_Icc.mp hprod.2
    have hdiv : p.1 ∣ p.2 := hmem.2
    have hquo : p.1 * (p.2 / p.1) = p.2 := Nat.mul_div_cancel_left' hdiv
    have hdle : p.1 ≤ p.2 := Nat.le_of_dvd hnI.1 hdiv
    have hpos : 0 < p.1 := Nat.pos_of_dvd_of_pos hdiv hnI.1
    have hdiv1 : 1 ≤ p.2 / p.1 := (Nat.one_le_div_iff hpos).mpr hdle
    have hdiv2 : p.2 / p.1 ≤ x := (Nat.div_le_self p.2 p.1).trans hnI.2
    rw [← ha, ← hb]
    exact Finset.mem_filter.mpr ⟨Finset.mem_product.mpr ⟨Finset.mem_Icc.mpr ⟨hdI.1, hdI.2⟩,
      Finset.mem_Icc.mpr ⟨hdiv1, hdiv2⟩⟩, by rw [hquo]; exact hnI.2⟩

theorem injOn_bijection (x : ℕ) :
    Set.InjOn (fun p : ℕ × ℕ => (p.1, p.2 / p.1)) (divPairs x) := by
  intro p hp q hq hpq
  obtain ⟨d, n⟩ := p
  obtain ⟨e, m⟩ := q
  have hmem := Finset.mem_filter.mp hp
  have hprod := Finset.mem_product.mp hmem.1
  have hnI : 1 ≤ n ∧ n ≤ x := Finset.mem_Icc.mp hprod.2
  have hdiv : d ∣ n := hmem.2
  have hquo1 : d * (n / d) = n := Nat.mul_div_cancel_left' hdiv
  have hmem' := Finset.mem_filter.mp hq
  have hprod' := Finset.mem_product.mp hmem'.1
  have hmI : 1 ≤ m ∧ m ≤ x := Finset.mem_Icc.mp hprod'.2
  have hdiv' : e ∣ m := hmem'.2
  have hquo2 : e * (m / e) = m := Nat.mul_div_cancel_left' hdiv'
  have hd_eq_e : d = e := congrArg Prod.fst hpq
  have hquo_eq : n / d = m / e := congrArg Prod.snd hpq
  have hn_eq_m : n = d * (n / d) := (hquo1).symm
  have hm_eq_e : m = e * (m / e) := (hquo2).symm
  exact Prod.ext hd_eq_e (by rw [hn_eq_m, hm_eq_e, hquo_eq, hd_eq_e])

/-- `#(divPairs x) = #(multPairs x)` por la biyección explícita. -/
theorem card_divPairs_eq_multPairs (x : ℕ) : (divPairs x).card = (multPairs x).card := by
  rw [multPairs_eq_image x]
  exact (Finset.card_image_of_injOn (f := fun p : ℕ × ℕ => (p.1, p.2 / p.1)) (injOn_bijection x)).symm


/-- **Identidad de la hipérbola** (Dirichlet) para todo `x : ℕ`:
`Σ_{n≤x} τ(n) = #{(a,b) ∈ ℕ² : a·b ≤ x}`. -/
theorem hiperbola (x : ℕ) : tauCount x = (multPairs x).card :=
  (tauCount_eq_card_divPairs x).trans (card_divPairs_eq_multPairs x)

-- Comprobaciones concretas (sanity check; hoy son consecuencias del teorema general)
set_option maxRecDepth 20000 in
example : tauCount 100 = 482 := by decide
set_option maxRecDepth 20000 in
example : (multPairs 100).card = 482 := by decide

end Lemas.Hiperbola
