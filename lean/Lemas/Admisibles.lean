import Mathlib
import Lemas.Definiciones
open Finset BigOperators
open Lemas.Definiciones

namespace Lemas.Admisibles

/-!
# Existencia de k-tuplas admisibles con diámetro acotado (construcción explícita)

Con `N_k = ∏_{p primo, p ≤ k} p` (primorial de k), la k-tupla
`𝓗_k = {j · N_k : 0 ≤ j < k}` es admisible: todo `h ∈ 𝓗_k` es divisible por cada
primo `p ≤ k`, así que el conjunto de residuos módulo `p` es `{0} ⊊ ℤ/p`.
Diámetro: `max − min ≤ (k−1)·N_k`.
-/

/-- Primorial de `k` (producto de los primos `≤ k`). -/
def primorial (k : ℕ) : ℕ := ∏ p ∈ (Finset.range (k + 1)).filter Nat.Prime, p

theorem dvd_primorial {p k : ℕ} (hp : Nat.Prime p) (h : p ≤ k) : p ∣ primorial k :=
  Finset.dvd_prod_of_mem (f := id) (Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (Nat.lt_succ_of_le h), hp⟩)

theorem primorial_pos (k : ℕ) : 0 < primorial k := by
  rcases Finset.eq_empty_or_nonempty ((Finset.range (k + 1)).filter Nat.Prime) with hempty | hne
  · rw [primorial, hempty]; simp
  · apply Finset.prod_pos
    intro p hp
    have h2 : 2 ≤ p := (Finset.mem_filter.mp hp).2.two_le
    omega

/-- La construcción explícita. -/
def tuplaConstruida (k : ℕ) : Finset ℕ :=
  (Finset.range k).image (fun j => j * primorial k)

/-- `tuplaConstruida k` tiene exactamente `k` elementos. -/
theorem card_tuplaConstruida (k : ℕ) : (tuplaConstruida k).card = k := by
  rw [tuplaConstruida, Finset.card_image_of_injOn (f := fun j => j * primorial k)]
  · simp
  · intro a ha b hb hab
    have : a * primorial k = b * primorial k := hab
    have : a = b := Nat.eq_of_mul_eq_mul_right (primorial_pos k) this
    exact this

/-- `tuplaConstruida k` es admisible. -/
theorem tuplaConstruida_admisible (k : ℕ) : esAdmisible (tuplaConstruida k) := by
  intro p hp
  have hcard : (tuplaConstruida k).card = k := card_tuplaConstruida k
  rw [hcard] at hp
  rw [Finset.mem_filter] at hp
  obtain ⟨hpk, hpp⟩ := hp
  have hN : p ∣ primorial k := dvd_primorial hpp (Nat.le_of_lt_succ (Finset.mem_range.mp hpk))
  have h2p : 2 ≤ p := hpp.two_le
  have h0p : 0 < p := by omega
  refine noCubreP_congruentes (tuplaConstruida k) h2p 0 h0p ?_
  intro x hx
  rw [tuplaConstruida, Finset.mem_image] at hx
  obtain ⟨j, hj, rfl⟩ := hx
  have h2 : p ∣ j * primorial k := dvd_mul_of_dvd_right hN j
  exact Nat.mod_eq_zero_of_dvd h2

/-- **Existencia**: para todo `k ≥ 1` hay una k-tupla admisible de diámetro acotado
    explícitamente por `(k−1)·primorial k`. -/
theorem existe_admisible (k : ℕ) (hk : 1 ≤ k) :
    ∃ 𝓗 : Finset ℕ, 𝓗.card = k ∧ esAdmisible 𝓗 ∧
      (∀ x ∈ 𝓗, x ≤ (k - 1) * primorial k) ∧ (0 ∈ 𝓗) := by
  refine ⟨tuplaConstruida k, card_tuplaConstruida k, tuplaConstruida_admisible k, ?_, ?_⟩
  · intro x hx
    rw [tuplaConstruida, Finset.mem_image] at hx
    obtain ⟨j, hj, rfl⟩ := hx
    have hjk : j < k := Finset.mem_range.mp hj
    exact Nat.mul_le_mul_right (primorial k) (by omega)
  · rw [tuplaConstruida, Finset.mem_image]
    exact ⟨0, Finset.mem_range.mpr hk, by simp⟩

end Lemas.Admisibles
