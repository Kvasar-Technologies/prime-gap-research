# Experimento 1 — ceros de ζ, ecuación funcional y fórmula explícita (Riemann 1859)

**Script:** `experimentos/ceros-explicita.js` (Node, sin dependencias; BigInt no necesario).

## Qué hace

1. **ζ(s) por la ecuación funcional «theta» de Riemann.** Calcula η(s) = Σ (-1)^{n-1} n^{-s}
   con la transformación de Euler y recupera ζ(s) = η(s)/(1-2^{1-s}) (válido para σ>0).
   La ξ completada se evalúa como
   `ξ(s) = ½ s(s-1) π^{-s/2} Γ(s/2) ζ(s)` (Lanczos complejo).
2. **Ceros no triviales** por bisección del signo de Re ξ(½+it).
3. **Fórmula explícita truncada** de von Mangoldt–Riemann:
   `ψ(x) ≈ x - Σ_{|γ|≤T} x^ρ/ρ - log 2π - ½ log(1-x^{-2})`,
   con ψ exacto por criba de Λ(n).
4. **Multiplicidad:** demuestra la linealidad de la fórmula en el vector de
   multiplicidades y cuantifica el ruido de la cola omitida.

## Resultados [VERIFICADO]

```
ζ(2) = 1.6449340668482266   (π²/6 = 1.6449340668482264)   error 2e-16
ζ(4) = 1.0823232337111381   (π⁴/90 = 1.082323233711138)   error 3e-16
```
Primeros ceros (error absoluto frente a las tablas estándar):

| γ₁ | error | | γ₁₁ | error |
|---|---|---|---|---|
| 14.134725142 | +1.1e-14 | | 52.970321478 | -3.1e-13 |
| 21.022039639 | -2.0e-13 | | (γ₁₂ error 2.7e-7: degradación por truncamiento de Euler a N=128) | |

Fórmula explícita (T = γ₁₂ ≈ 59.35):

| x | ψ(x) exacto | predicción | residuo | escala esperada √x/√T |
|---|---|---|---|---|
| 10⁴ | 10013.4 | 10028.0 | −14.6 | 13.0 |
| 10⁵ | 100051.6 | 100052.1 | −0.6 | 41.0 |
| 10⁶ | 999586.6 | 999816.3 | −229.7 | 129.8 |

Linealidad en multiplicidades: par ±γ₁ con peso 1 → 36.0512; con peso 2 → 72.1023;
cociente exacto 2.000000. Es decir
`S(x; w + λ e_j) = S(x; w) + λ x^{ρ_j}/ρ_j` (identidad exacta; formalizable en Lean).

## Conclusión del experimento (y lo que NO muestra)

- Se verifica numéricamente la maquinaria de Riemann (ecuación funcional vía serie
  theta/η, ξ, fórmula explícita).
- **La multiplicidad de un cero es un dato lineal que la fórmula explícita hace
  legible, pero su lectura numérica a altura T es del orden del ruido de la cola:
  RMS(cola) ~ √x · T^{-1/2} (con logs), mientras que un solo término ~ √x/√γ.**
  A T ≈ 60 son comparables → **el muestreo no decide multiplicidades**. Esto es
  exactamente la razón por la que las peores consecuencias del «multiplicidad» en
  el problema de primos (saltos de F(x) en ceros de orden par) no son abordables
  por experimentación numérica: haría falta T ~ x^{1-ε}.