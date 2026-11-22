import Mathlib

namespace Lemas.Definiciones

/-!
# Tuplas admisibles (Hardy-Littlewood)

`esAdmisible s` formaliza: `s` es admisible si para todo primo `p ≤ s.card` el conjunto
de residuos `{h % p : h ∈ s}` no cubre todas las clases `0,...,p-1`; equivalentemente,
no existe primo `p` que divida algún `n + h_i` para **todo** n.

Ingrediente combinatorio del método GPY / Zhang / Maynard / Polymath 8.
-/

/-- Residuos de `s` módulo `p`. -/
def residuos (s : Finset ℕ) (p : ℕ) : Finset ℕ := s.image (fun h => h % p)

/-- `s` cubre todos los residuos módulo `p`. -/
def cubreP (s : Finset ℕ) (p : ℕ) : Prop := ∀ r : ℕ, r < p → r ∈ residuos s p

/-- `s` no cubre todos los residuos módulo `p`. -/
def noCubreP (s : Finset ℕ) (p : ℕ) : Prop := ¬ cubreP s p

/-- `s` es admisible: ningún primo `p ≤ s.card` cubre `s.card` clases. -/
def esAdmisible (s : Finset ℕ) : Prop :=
  ∀ p ∈ (Finset.range (s.card + 1)).filter Nat.Prime, noCubreP s p

theorem mem_filter_prime (p : ℕ) {s : Finset ℕ} (hp : Nat.Prime p) (h : p ≤ s.card) :
    p ∈ (Finset.range (s.card + 1)).filter Nat.Prime :=
  Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by omega), hp⟩

/-- L1 (card pequeño): si `p > s.card`, es imposible cubrir. -/
theorem noCubreP_card_pequeno (s : Finset ℕ) {p : ℕ} (h : s.card < p) : noCubreP s p := by
  intro hcub
  have hsub : Finset.range p ⊆ residuos s p := by
    intro r hr
    rw [Finset.mem_range] at hr
    exact hcub r hr
  have hpc : (Finset.range p).card = p := Finset.card_range p
  have hle1 : (Finset.range p).card ≤ (residuos s p).card := Finset.card_le_card hsub
  have hle2 : (residuos s p).card ≤ s.card :=
    Finset.card_image_le (f := fun h => h % p) (s := s)
  omega

/-- L2 (congruentes): si todos los elementos son congruentes mod p, no cubren. -/
theorem noCubreP_congruentes (s : Finset ℕ) {p : ℕ} (hp : 2 ≤ p) (c : ℕ) (hc : c < p)
    (hcong : ∀ x ∈ s, x % p = c) : noCubreP s p := by
  intro hcub
  have hlt : (c + 1) % p < p := Nat.mod_lt _ (by omega)
  obtain ⟨h, hin, hval⟩ := Finset.mem_image.mp (hcub ((c + 1) % p) hlt)
  have hcong' : h % p = c := hcong h hin
  rcases Nat.lt_or_ge (c + 1) p with H | H
  · have hc1 : (c + 1) % p = c + 1 := Nat.mod_eq_of_lt H
    rw [hc1] at hval; omega
  · have hp1 : c + 1 = p := by omega
    have hc3 : (c + 1) % p = 0 := by rw [hp1, Nat.mod_self]
    rw [hc3] at hval; omega

/-- L3 (pares): si todos los elementos son pares, no cubren mod 2. -/
theorem pares_noCubren_2 (s : Finset ℕ) (h : ∀ x ∈ s, 2 ∣ x) : noCubreP s 2 := by
  apply noCubreP_congruentes s (by norm_num) 0 (by norm_num)
  intro x hx
  exact Nat.mod_eq_zero_of_dvd (h x hx)

/-- L4 (residuo faltante): si un residuo falta, no cubre. -/
theorem noCubreP_faltante (s : Finset ℕ) (p : ℕ) (r : ℕ) (hr : r < p)
    (hall : ∀ h ∈ s, h % p ≠ r) : noCubreP s p := by
  intro hcub
  obtain ⟨h, hin, hval⟩ := Finset.mem_image.mp (hcub r hr)
  exact hall h hin hval

/-- L5 (cobertura explícita): si cada residuo < p está realizado, cubre. -/
theorem cubreP_intro (s : Finset ℕ) (p : ℕ)
    (hall : ∀ r : ℕ, r < p → ∃ x ∈ s, x % p = r) : cubreP s p := by
  intro r hr
  obtain ⟨x, hx, hval⟩ := hall r hr
  rw [←hval]
  exact Finset.mem_image_of_mem _ hx

/-- L6: para probar `esAdmisible`, basta controlar los primos `p ≤ s.card`. -/
theorem admisible_de_lista (s : Finset ℕ)
    (hp : ∀ p, Nat.Prime p → p ≤ s.card → noCubreP s p) : esAdmisible s := by
  intro p hmem
  rw [Finset.mem_filter] at hmem
  apply hp p hmem.2
  rw [Finset.mem_range] at hmem
  exact Nat.le_of_lt_succ hmem.1

end Lemas.Definiciones
