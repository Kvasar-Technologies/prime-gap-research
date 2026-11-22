import Lake
open Lake DSL

package «twinprime» where

require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "v4.36.0"

@[default_target]
lean_lib «Lemas» where
  globs := #[.andSubmodules `Lemas]

lean_exe «verificar» where
  root := `Verificar
