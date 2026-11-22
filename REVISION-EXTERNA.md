# Paquete de revisión externa (Fase 5)

**Qué se somete a revisión.** Este informe contiene afirmaciones de tres tipos,
delimitados explícitamente:

| Tipo | Ejemplos | Verificación |
|---|---|---|
| (A) Hechos de la literatura citados | θ = 1/2 + 7/300 (8a), H₁ ≤ 246 (8b), M₂ = 1/(1−W(1/e)), cota de Weil óptima | fuentes primarias en `notas/03*`, `notas/02`, `notas/05` |
| (B) Verificaciones propias | ceros de ζ (11, a ~1e-13), cota de Weil sobre 4.344 sumas, M₂..M₅ reproducidos, H(k) para k ≤ 10 | `experimentos/` + `lemas/40` |
| (C) Síntesis y lemas propuestos | "las técnicas theta ya son andamio, no motor"; P1b (umbral de detección); P2a (divisor = Siegel–Weil) | `notas/20`, `lemas/30` |

**Pregunta para el revisor.** ¿Son correctas (a) la tabla de resultados intermedios y
cotas en `notas/10-cuellos-de-botella.md`, (b) el veredicto de `notas/20-arquitectura.md`
de que ninguna ruta theta/multiplicidad puede mover H salvo el error de Siegel–Weil,
y (c) el umbral P1b?

**Reproducir las verificaciones.**

```bash
# numpy/none needed: Node 24
cd experimentos && node kloosterman-weil.js 37      # cota de Weil
cd experimentos && node ceros-explicita.js          # ceros de ζ + fórmula explícita
cd experimentos && node util.js                     # anchos admisibles
cd experimentos && node maynard-mk.js 2 2,3,4,5,6   # M_k (reproduce M₂ exacto)

# Lean (en el volumen libre; el disco raíz está al 95%)
export PATH=$HOME/.elan/bin:$PATH
cd /mnt/HC_Volume_106949518/git-repo/twinprime-lean
lake build      # 13 teoremas, sin sorry; #print axioms = propext, Classical.choice, Quot.sound
```

## Canales adecuados

1. **Revisión por pares informal (la más rápida):** pregunta en *MathOverflow*
   citando `notas/10` + `notas/20` y preguntando específicamente si el punto (S3)
   (Siegel–Weil/error del divisor) tiene literatura de referencia que no citamos.
2. **Parte Lean:** canal `#maths` del Lean Zulip; el código es autocontenido
   (solo Mathlib, sin `sorry`, `#print axioms` limpio).
3. **Para publicación formal:** lo único publicable tal cual es la parte de
   verificación/programa (formalización de admisibilidad y de la identidad de la
   hipérbola), no como teorema nuevo. No conviene enviar un preprint afirmando
   resultados sobre primos gemelos: **no hay ninguno demostrado aquí**.

## Declaración honesta

Este informe **no demuestra** la conjetura de los primos gemelos ni mejora ninguna
cota conocida de `liminf (p_{n+1} − p_n)`. Muestra que las técnicas theta y de
multiplicidad analizadas (Weil, Kuznetsov, Siegel–Weil, multiplicidad de ceros)
ya están incorporadas al método o no pueden tocar sus cuellos de botella, e
identifica un único punto (el control del error en la identidad de Siegel–Weil
para la forma `xy`) donde un ataque nuevo sería concebible.