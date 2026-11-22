import Mathlib
import Lemas.Definiciones
open Finset
open Lemas.Definiciones

/-!
# Comprobaciones concretas [VERIFICADO POR LEAN 4 (v4.36.0) + Mathlib v4.36.0]

Cada tupla se comprueba contra la definición formal `esAdmisible`.
Las negativas se refutan exhibiendo el primo que cubre **todos** los residuos.
Los anchos mínimos coinciden con la búsqueda exhaustiva de `experimentos/util.js`.
-/

-- ===================== POSITIVAS =====================
example : esAdmisible ({0, 2} : Finset ℕ) := admisible_de_lista _ (by
  intro p hp hle
  have hcard : ({0, 2} : Finset ℕ).card = 2 := by decide
  have hn : p ≤ 2 := by omega
  have h2 : 2 ≤ p := Nat.Prime.two_le hp
  interval_cases p
  · exact pares_noCubren_2 _ (by decide))

example : esAdmisible ({0, 2, 6} : Finset ℕ) := admisible_de_lista _ (by
  intro p hp hle
  have hcard : ({0, 2, 6} : Finset ℕ).card = 3 := by decide
  have hn : p ≤ 3 := by omega
  have h2 : 2 ≤ p := Nat.Prime.two_le hp
  interval_cases p
  · exact pares_noCubren_2 _ (by decide)
  · exact noCubreP_faltante _ 3 1 (by decide) (by decide))

example : esAdmisible ({0, 2, 6, 8} : Finset ℕ) := admisible_de_lista _ (by
  intro p hp hle
  have hcard : ({0, 2, 6, 8} : Finset ℕ).card = 4 := by decide
  have hn : p ≤ 4 := by omega
  have h2 : 2 ≤ p := Nat.Prime.two_le hp
  interval_cases p
  · exact pares_noCubren_2 _ (by decide)
  · exact noCubreP_faltante _ 3 1 (by decide) (by decide)
  · exact absurd hp (by decide))

example : esAdmisible ({0, 2, 6, 8, 12} : Finset ℕ) := admisible_de_lista _ (by
  intro p hp hle
  have hcard : ({0, 2, 6, 8, 12} : Finset ℕ).card = 5 := by decide
  have hn : p ≤ 5 := by omega
  have h2 : 2 ≤ p := Nat.Prime.two_le hp
  interval_cases p
  · exact pares_noCubren_2 _ (by decide)
  · exact noCubreP_faltante _ 3 1 (by decide) (by decide)
  · exact absurd hp (by decide)
  · exact noCubreP_faltante _ 5 4 (by decide) (by decide))

example : esAdmisible ({0, 2, 6, 8, 12, 18, 20} : Finset ℕ) := admisible_de_lista _ (by
  intro p hp hle
  have hcard : ({0, 2, 6, 8, 12, 18, 20} : Finset ℕ).card = 7 := by decide
  have hn : p ≤ 7 := by omega
  have h2 : 2 ≤ p := Nat.Prime.two_le hp
  interval_cases p
  · exact pares_noCubren_2 _ (by decide)
  · exact noCubreP_faltante _ 3 1 (by decide) (by decide)
  · exact absurd hp (by decide)
  · exact noCubreP_faltante _ 5 4 (by decide) (by decide)
  · exact absurd hp (by decide)
  · exact noCubreP_faltante _ 7 3 (by decide) (by decide))

-- ===================== NEGATIVAS =====================
example : ¬ esAdmisible ({0, 1} : Finset ℕ) := by
  intro h
  apply h 2 (Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by decide), by decide⟩)
  apply cubreP_intro _ _
  intro r hr
  interval_cases r
  · exact ⟨0, by decide, by decide⟩
  · exact ⟨1, by decide, by decide⟩

example : ¬ esAdmisible ({2, 3, 4} : Finset ℕ) := by
  intro h
  apply h 2 (Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by decide), by decide⟩)
  apply cubreP_intro _ _
  intro r hr
  interval_cases r
  · exact ⟨2, by decide, by decide⟩
  · exact ⟨3, by decide, by decide⟩

example : ¬ esAdmisible ({0, 2, 4} : Finset ℕ) := by
  intro h
  apply h 3 (Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by decide), by decide⟩)
  apply cubreP_intro _ _
  intro r hr
  interval_cases r
  · exact ⟨0, by decide, by decide⟩
  · exact ⟨4, by decide, by decide⟩
  · exact ⟨2, by decide, by decide⟩
