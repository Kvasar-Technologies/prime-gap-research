# Huecos acotados entre primos: ¿sirven las theta lifts? — nota expositiva + verificación

> **Estado:** nota expositiva con verificaciones reproducibles. **No contiene
> teoremas nuevos ni mejoras de ninguna cota.**

# Español

## 1. La pregunta

Los métodos modernos para acotar `liminf (p_{n+1} − p_n)` (GPY 2005 → Zhang 2014 →
Maynard 2015 → Polymath 8) descansan en dos entradas: un **nivel de distribución θ**
(ingrediente analítico) y un problema variacional `M_k` (ingrediente combinatorio).
¿Pueden las técnicas de construcción mediante *theta lifts* (correspondencia theta de
Howe, theta lifts de Kudla–Millson, identidad de Siegel–Weil) y las consideraciones
de *multiplicidad* (orden de los ceros de ζ) mejorar esos métodos?

## 2. Respuesta corta

**No**, y el registro documentado de por qué es la contribución de este repositorio:

1. Los ingredientes del método son **otros**: cotas de **Deligne** (ℓ-ádicas; la cota
   de Weil `2√p` para sumas de Kloosterman es su caso clásico) y la **traza de
   Kuznetsov** en GL₂ con pesos de Petersson (Deshouillers–Iwaniec). La
   correspondencia theta no es el motor de las estimaciones Tipo I/II/III.
2. El cuello de botella real es **variacional**: incluso bajo la conjetura de
   Elliott–Halberstam generalizada, el tamiz da `H₁ ≤ 6`, y Polymath 8b demuestra que
   eso es lo mejor posible desde consideraciones puramente de tamiz.
3. La cota de Weil es óptima (Katz/Sato–Tate) — afirmación estándar que aquí **no**
   hemos reverificado; ver `notas/05`.
4. La vía «multiplicidad de ceros» (Riemann) mide errores de orden `√x` y no conecta
   con huecos acotados; que los ceros sean simples es **conjetura**.

Récord incondicional actual: **212** (sept. 2026), tras 240 (Stadlmann) y 246 (Polymath 8b).

## 3. Conocido vs. contribución de este repositorio

| Es conocimiento estándar (citado) | Es contribución de este repositorio |
|---|---|
| Zhang (2014), Maynard (arXiv:1311.4600), Polymath 8a/8b (arXiv:1402.0811, 1407.4897) | **Nota expositiva** con correcciones de literatura verificadas: «arXiv:1402.1471 no es Zhang»; «Maynard es 1311.4600»; «θ = 1/2 + 1/584, no 1/70»; «`M_k` es multidimensional, no la versión 1D» |
| Teorema de Dirichlet, cota de Weil, Kuznetsov, Bombieri–Vinogradov, EH/GEH | **Scripts reproducibles** con tests (`npm test`, 16 comprobaciones) |
| Identidad de la hipérbola `Στ(n) = #{(a,b): ab ≤ x}` | **Formalización en Lean 4 + Mathlib**: admisibilidad, hipérbola para todo `x`, linealidad en multiplicidades, existencia de tuplas admisibles; el criterio de Maynard como axiomas etiquetados |
| `H₁ ≤ 246`; `H₁ ≤ 6` bajo GEH; récord 212 | Verificación numérica independiente de `M₂` (reproduce `1/(1−W(1/e))`) y de `M₅ > 2` |

## 4. Limitaciones (explícitas)

- No demostramos ningún teorema sobre primos gemelos ni mejoramos ninguna cota.
- Las comprobaciones numéricas son **ilustraciones**, no pruebas.
- La optimalidad de la cota de Weil (Katz) y la simplicidad de los ceros se marcan
  como no reverificadas / conjeturales.
- El formalismo Lean cubre la parte combinatoria; la analítica entra como axiomas
  etiquetados (ver `lean/README.md`).

## 5. Reproducir

```bash
cd experimentos && npm install && npm test
# Lean (en disco con espacio; requiere ~7 GB para Mathlib):
cd lean && lake build && lake build verificar && ./.lake/build/bin/verificar
```

## 6. Referencias primarias

Zhang, *Bounded gaps between primes*, Ann. of Math. 179 (2014) 1121–1174 ·
Maynard, arXiv:1311.4600 · Polymath 8a arXiv:1402.0811 · Polymath 8b
arXiv:1407.4897 · Deligne, Weil II (1974) · Katz, *Gauss sums, Kloosterman sums,
and monodromy groups* (1988) · Charton–Hong–Lau–Ono–Rémy–Siu–Swaminathan–Thorner–Xie,
*A new bound for small gaps between primes* (primegaps.axiommath.ai/bgp212.pdf).

---

# English (summary)

**Question.** Can theta-lift constructions and zero-multiplicity considerations
improve the methods that bound `liminf (p_{n+1} − p_n)`?

**Short answer: no.** The method's ingredients are Deligne's ℓ-adic exponential-sum
bounds and the Kuznetsov trace formula on GL₂ — not the theta correspondence; the
real bottleneck is variational (even under GEH the sieve gives `H₁ ≤ 6`, which
Polymath 8b proved optimal among sieve-theoretic considerations); the Weil bound is
standardly optimal (not re-verified here); and the zero-multiplicity route measures
`√x`-scale errors and does not reach prime gaps (zero simplicity is conjectural).

**What this repository is:** an expository note with verified literature corrections,
reproducible numerical scripts with a test suite, and a Lean 4 + Mathlib
formalization (admissible tuples, the hyperbola identity for all `x`, linearity in
multiplicities; Maynard's criterion stated with labelled axioms).
**What it is not:** new theorems, or an improvement of any bound.