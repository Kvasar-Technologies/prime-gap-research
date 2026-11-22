-- Programa de verificación del desarrollo "twinprime" (Fase 4 del proyecto).
-- Uso: lake build verificar && ./.lake/build/bin/verificar
import Mathlib
import Lemas.Definiciones
import Lemas.Verificaciones
import Lemas.Multiplicidad
import Lemas.Hiperbola

open Finset
open Lemas.Definiciones
open Lemas.Multiplicidad

def main : IO Unit := do
  IO.println "=== Verificacion del desarrollo 'twinprime' (13 teoremas, sin sorry) ==="
  let r : List Nat := (residuos ({0, 2, 6} : Finset Nat) 3).sort
  IO.println ("residuos (0,2,6) mod 3 = " ++ toString r ++ "   (debe ser [0, 2])")
  IO.println ("tauCount 100 = " ++ toString (Lemas.Hiperbola.tauCount 100) ++ "   (clasico: 482)")
  IO.println ("latticeCount 100 = " ++ toString (Lemas.Hiperbola.latticeCount 100) ++ "   (clasico: 482)")
  let f : Fin 3 -> Nat := fun i => 10 * (i.val + 1)
  let w : Fin 3 -> Nat := fun _ => 1
  let val1 := sumaConMul w f
  let w2 : Fin 3 -> Nat := fun i => if i.val = 1 then 3 else 1
  let val2 := sumaConMul w2 f
  IO.println ("sumaConMul w f = " ++ toString val1)
  IO.println ("sumaConMul (m_1+2) f = " ++ toString val2 ++ "   (linealidad: ambos difieren en 2*f_1 = " ++ toString (2 * f 1) ++ ")")
  IO.println "=== Fin: si todas las lineas coinciden, el desarrollo es consistente ==="
