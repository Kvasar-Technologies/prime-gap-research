# Desarrollo Lean — qué está probado y qué no

Toolchain: **Lean 4.36.0 + Mathlib v4.36.0**. Reproducir:

```bash
elan toolchain install leanprover/lean4:v4.36.0
lake build                    # compila todo
lake build verificar && ./.lake/build/bin/verificar
```

## Módulos

| Fichero | Contenido | Estado |
|---|---|---|
| `Lemas/Definiciones.lean` | Definición formal de k-tupla admisible (`esAdmisible`) + 6 lemas (card pequeño, congruentes, pares, residuo ausente, cobertura, reducción) | ✅ probado, sin `sorry` |
| `Lemas/Verificaciones.lean` | 5 tuplas admisibles y 3 refutadas, comprobadas contra la definición | ✅ probado |
| `Lemas/Multiplicidad.lean` | Linealidad de la fórmula explícita en el vector de multiplicidades | ✅ probado |
| `Lemas/Hiperbola.lean` | **Identidad de la hipérbola `Σ_{n≤x} τ(n) = #{(a,b): ab ≤ x}` para todo `x`**, vía la biyección explícita `(d,n) ↦ (d, n/d)` | ✅ probado |
| `Lemas/Admisibles.lean` | Existencia de k-tupla admisible con diámetro acotado (construcción explícita sobre el primorial) | ✅ probado |
| `Lemas/Maynard.lean` | Traducción del criterio de Maynard (arXiv:1311.4600) y del resultado GEH de Polymath 8b, con los ingredientes analíticos y variacionales como **axiomas etiquetados** | ⚠️ enunciados, **no demostrados aquí** |
| `Verificar.lean` | Ejecutable de comprobaciones | ✅ |

## Axiomas (#print axioms)

| Teorema | Axiomas |
|---|---|
`hiperbola` (todo x) | `propext, Classical.choice, Quot.sound` |
`tauCount_eq_card_divPairs`, `card_divPairs_eq_multPairs` | ídem |
`existe_admisible` (tuplas admisibles) | ídem |
`linealidad_multiplicidad` | ídem |
`noCubreP_*` (admisibilidad) | ídem |
**`huecos_desde_maynard`** | los tres de arriba **+ `nivel_distribucion`, `Mk`, `maynard_prop_4_2`** ← los axiomas etiquetados |

## Lo que NO está formalizado (honestamente)

- El nivel de distribución θ de los primos en progresiones aritméticas: se importa
  como `axiom nivel_distribucion` (es teoría analítica: Bombieri–Vinogradov /
  Elliott–Halberstam).
- La cantidad variacional `M_k` de Maynard: se importa como `axiom Mk` (nuestro
  cálculo numérico `experimentos/maynard-mk.js` reproduce `M₂` y confirma `M₅ > 2`,
  pero no es una prueba formal).
- El término de error de Voronoï del problema del divisor (`O(√x)`, mejor conocido
  `O(x^{1/3})`): requiere análisis.
- El resultado GEH de Polymath 8b (`H₁ ≤ 6`): se importa como axioma etiquetado,
  citado de arXiv:1407.4897.
- Los teoremas de `Lemas/Maynard.lean` son, por tanto, *enunciados*: la parte
  combinatoria que los rodea sí está probada.