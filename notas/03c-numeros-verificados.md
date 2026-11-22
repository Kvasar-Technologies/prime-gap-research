# 03c — Números verificados (Polymath 8a y 8b)

Todos los valores de esta tabla fueron extraídos literalmente de las fuentes indicadas.
Leyenda: ✅ verificado · ⚠ no verificado (no aparece en ninguna fuente consultada).
Fuentes abreviadas:
- **A** = https://ar5iv.org/abs/1402.0811 (Polymath 8a, arXiv:1402.0811; ANT 8 (2014) 2067–2199)
- **B** = https://ar5iv.org/abs/1407.4897 (Polymath 8b, arXiv:1407.4897; Res. Math. Sci. 1:12 (2014))
- **API1402.0829** = https://export.arxiv.org/api/query?search_query=id:1402.0829&max_results=1
- **API4897** = https://export.arxiv.org/api/query?search_query=id:1407.4897&max_results=1
- **WIKI-H** = https://web.archive.org/web/20221112074939/https://asone.ai/polymath/index.php?title=Bounded_gaps_between_primes
- **WIKI-TL** = https://web.archive.org/web/20221019100720/https://asone.ai/polymath/index.php?title=Timeline_of_prime_gap_bounds
- **WIKI-DIST** = https://web.archive.org/web/20220306064911/https://asone.ai/polymath/index.php?title=Distribution_of_primes_in_smooth_moduli
- **WIKI-DHL** = https://web.archive.org/web/20220817142004/https://asone.ai/polymath/index.php?title=Dickson-Hardy-Littlewood_theorems
- **RETRO** = https://ar5iv.org/abs/1409.8361 (retrospectiva del proyecto)
- **TAO-T3** = https://terrytao.wordpress.com/2013/06/14/estimation-of-the-type-iii-sums/

## A. Identificación de los papers

| Valor | Significado | Fuente |
|---|---|---|
| arXiv:1402.0811 | Paper Polymath 8a "New equidistribution estimates of Zhang type"; ANT 8 (2014) 2067–2199; DOI 10.2140/ant.2014.8.2067 | A |
| arXiv:1407.4897 (v4) | Paper Polymath 8b "Variants of the Selberg sieve…"; Res. Math. Sci. 1:12 (2014); 79 págs. | B, API4897 |
| arXiv:1402.0829 | **NO es 8a**: es Babenko, "Sharp Estimates for Norms of Functions from Conjugate Classes" (math.FA) | API1402.0829 |

## B. Nivel de distribución y MPZ

| Valor | Enunciado | Fuente |
|---|---|---|
| **θ = 1/2 + 7/300** | nivel de distribución logrado por 8a (Teorema 1.1: suma sobre q ≤ x^{θ−ε}, q x^δ-smooth squarefree) | A |
| θ = 1/2 + 1/584 | versión de Zhang del Teorema 1.1 de 8a | A |
| ϖ,δ < 1/1168 | rango MPZ[ϖ,δ] de Zhang | B §2 |
| ϖ = δ = 1/1168, σ = 1/8 − 8ϖ | parámetros implícitos de Zhang en las estimaciones Type I/II/III | A §2.2 |
| **600ϖ + 180δ < 7** | Teorema 2.4(i)/Teorema 2.5: MPZ^(4)[ϖ,δ] (o MPZ[ϖ,δ]) se cumple ⟹ ϖ < 7/600 ≈ 0,01167 | A, B |
| **168ϖ + 48δ < 1** | Teorema 2.4(ii): MPZ^(2)[ϖ,δ] sin usar Deligne (⟹ ϖ < 1/168) | A |
| **1080ϖ + 330δ < 13** | mejora conjeturada (no probada; requiere raíz cuadrada en suma 4-dimensional) | B §9 |
| 1/2 + 1/70 | ⚠ "punto de partida de Zhang": no verificado; no aparece en ninguna fuente | — |

## C. Condiciones de las estimaciones Type I/II/III (fuente común: A y WIKI-DIST; enteros confirmados por el Maple de la wiki)

Type I: 11ϖ+3δ+2σ<1/4 (nivel 1); 17ϖ+4δ+σ<1/4 (nivel 2, más condiciones);
**54ϖ+15δ+5σ<1** (nivel 3); 236ϖ/3+64δ/3+4σ<1 (nivel 4); **160ϖ/3+16δ+34σ/9<1 y 64ϖ+18δ+2σ<1**
(nivel 5, con Deligne); 56ϖ+16δ+4σ<1 (nivel 6).
Type II: 58ϖ+10δ<1/2 (nivel 1); 48ϖ+7δ<1/2; 38ϖ+7δ<1/2; **34ϖ+7δ<1/2** (= nivel 1c; 8a lo
presenta como 68ϖ+14δ<1).
Type III: σ > 3/26+32ϖ/13+2δ/13 (nivel 1 = Zhang); σ > 1/10+16ϖ/5+δ/5 (nivel 2);
σ > 1/12+7ϖ/3+δ/4 (nivel 3, FKMN); **σ > 1/18+28ϖ/9+2δ/9** (nivel 4 = TypeIII^(1) de 8a).
Combinaciones MPZ de la wiki: 828ϖ+172δ<1 → 348ϖ+68δ<1 → 178ϖ+52δ<1 → 148ϖ+33δ<1 →
116ϖ+25,5δ<1 → 112(4/7)ϖ+27(6/7)δ<1 → 108ϖ+30δ<1 → (280/3)ϖ+(80/3)δ<1 →
**(600/7)ϖ+(180/7)δ<1** (= 600ϖ+180δ<7).

## D. Teorema 1.4 de 8b (cotas sobre Hₘ)

Incondicional: **H₁ ≤ 246**; H₂ ≤ 398.130; H₃ ≤ 24.797.814; H₄ ≤ 1.431.556.072;
H₅ ≤ 80.550.202.480; Hₘ ≤ C·m·exp((4−28/157)m).
Bajo EH: H₂ ≤ 270; H₃ ≤ 52.116; H₄ ≤ 474.266; H₅ ≤ 4.137.854; Hₘ ≤ C·m·e^{2m}.
Bajo GEH: **H₁ ≤ 6**; H₂ ≤ 252.
Fuente: B, Teorema 1.4.

## E. DHL[k,j] en 8b (Teorema 3.2)

DHL[50,2]; DHL[35.410,3]; DHL[1.649.821,4]; DHL[75.845.707,5]; DHL[3.473.955.908,6];
k ≥ C·exp((4−28/157)m) para DHL[k,m+1]. Bajo EH: DHL[54,3]; DHL[5.511,4]; DHL[41.588,5];
DHL[309.661,6]; k ≥ C·exp(2m). Bajo GEH: DHL[3,2]; DHL[51,3]. Fuente: B.

## F. H(k) (Teorema 3.3 de 8b)

H(3)=6; H(50)=246; H(51)=252; H(54)=270; H(5.511)≤52.116; H(35.410)≤398.130;
H(41.588)≤474.266; H(309.661)≤4.137.854; H(1.649.821)≤24.797.814;
H(75.845.707)≤1.431.556.072; H(3.473.955.908)≤80.550.202.480;
H(k) ≤ k·log k + k·log log k − k + o(k). Fuente: B.

## G. Constantes del problema variacional (8b)

- M₂ = 1/(1−W(1/e)) = 1,38593…; M₂ ≤ 2·log 2 = 1,38629… (B, Cor. 6.3–6.4)
- M₄ ≤ (4/3)·log 4 = 1,8454…; cota general M_k ≤ k/(k−1)·log k (B, Cor. 6.4)
- G_i(t) = (k−1)/(log k)·1/(1−t₁−…−t_k+kt_i) (B, prueba del Cor. 6.4)
- M₅₄ > 4,00238; M₅₅₁₁ > 6; M₄₁₅₈₈ > 8; M₃₀₉₆₆₁ > 10; M_k ≥ log k − C (B, Teo. 3.9)
- Tabla 3 (Krylov): 2→1,38593; 3→1,64644; 4→1,84540; 5→2,00714; 10→2,54547; 20→3,12756;
  30→3,48313; 40→3,73919; 50→3,93586; 53→3,98621; 54→4,00223; 60→4,09101; 100→4,46424
  (B, §7.1)
- M₅₀,₁/₂₅ > 4,0043 (d=27) y > 4,00124 (d=25); M₄,₀,₁₆₈ > 2,00558;
  M₅₁,₁/₅₀ > 4,00156 (d=22) (B, Teo. 3.13, §7.2–7.3)
- Tabla 2 (asintótica): k=5511 (θ=0,965; β=0,973; M=6,000048609);
  k=35.410 (0,99479; 0,85213; 7,829849259); k=41.588 (0,97878; 0,94319; 8,000001401);
  k=309.661 (0,98627; 0,92091; 10,00000032); k=1.649.821 (1,00422; 0,80148; 11,65752556);
  k=75.845.707 (1,00712; 0,77003; 15,48125090); k=3.473.955.908 (1,0079318; 0,7490925;
  19,30374872) (B, §6)
- 4 − 28/157 = 600/157 ≈ 3,82166 (derivación: m ≤ log k/(4−28/157) − C′; B §3)
- Criterios: EH[ϑ] + M_k > 2m/ϑ (Teo. 3.8); M_k^[δ/(1/4+ϖ)] > m/(1/4+ϖ) con 0<ϖ<1/4,
  0<δ<1/2 (Teo. 3.10); M_{k,ε} > 2m/ϑ con 1+ε<1/ϑ (EH) o ε<1/(k−1) (GEH) (Teo. 3.12)
- Comparación Maynard: M₅ > 2; M₁₀₅ > 4; M_k ≥ log k − 2 log log k − 2 (B §3, citando [38])
- Retrospectiva: M₄: 1,845 → 1,937 → 1,951 → … → 2,018 (ε-trick) → H₁ ≤ 8 (GEH);
  luego M₃ > 2 → H₁ ≤ 6 (GEH); incondicional 600 → 300 → 246 (RETRO, §2)

## H. Histórico de H₁ (WIKI-TL, con las marcas de la propia wiki)

70.000.000 (Zhang, 14-may-2013, k₀=3.500.000) → 63.374.611 (Lewko) → 59.874.594 (Trudgian) →
59.470.640 (Morrison) → 48.112.378 → 42.342.946 → 42.342.924 (Tao) → 13.008.612 (Morrison) →
4.982.086 → 4.802.222 (3-jun) → 4.788.240 (Sutherland) → 387.974 (tuplas) →
12.006 (21–23 jun) → 248.898 → 60.760 (17-jun) → 51.520 (Pintz truncado) → 6.712 (1-jul) →
5.414 (5-jul, doble divisibilidad densa) → **4.680 (27-jul-2013, k₀=632; valor final 8a)** →
**14.994 (30-jul-2013, k₀=1.788, sin Deligne)** → 14.950 (17-ago) → 4.428?? (3-oct, provisional) →
4.422? (11-oct) → 700→600 (Maynard, oct–nov 2013, k₀=110/105) → … → **246 (Polymath8b,
abr-2014; "a 2-week computer calculation")** → 246 (valor final).

## I. Récords finales de la wiki (WIKI-H, tabla "Current records")

m=1: 2 (conjetural) / 6 (GEH), 12 (EH, Maynard) / **246** (sin EH) / 246 (sin EH ni Deligne);
m=2: 6 / 252 (GEH), 270 (EH) / 395.106 / 474.266; m=3: 8 / 52.116 / 24.462.654 / 32.285.928;
m=4: 12 / 474.266 / 1.404.556.152 / 2.031.558.336; m=5: 16 / 4.137.854 / 78.602.310.160 /
124.840.189.042; asintótico: O(exp(3,815 m)) (Baker–Irving, arXiv:1505.01815) sin EH,
O(m·exp((4−4/43)m)) sin EH ni Deligne.

## J. Otros valores citados

- GPY: EH[1/2+2ϖ] con 0<ϖ<1/4 ⟹ cota explícita finita sobre H₁; igual a 16 para ϖ > 0,229855 (B §1)
- Bombieri–Vinogradov: EH[ϑ] para todo 0<ϑ<1/2 (B §2)
- Criterio EH→DHL: 2θ > j²_{k₀−2}/(k₀(k₀−1)) (ceros de Bessel); límite DHL[6,2] (WIKI-DHL)
- Criterio MPZ→DHL: (1+4ϖ) > j²_{k₀−2}/(k₀(k₀−1))·(1+κ) con κ, κ′ de Pintz (WIKI-DHL)
- Bombieri–Birch (Type III de Zhang): |T(k;m,m′;q)| ≪ (m−m′,k,q)/(k,q)^{1/2}·q^{3/2+o(1)} (TAO-T3)
- Bessel cutoff en el proyecto: k₀ = 34.429 (⟹ H ≈ 390.000); luego 26.024 (⟹ H ≈ 280.000) (RETRO)
- Paper 8a: 163 páginas originalmente → 107 tras revisión (RETRO); 8b: 79 páginas (API4897)

## K. ⚠ NO VERIFICADOS (no inventar)

1. "Zhang partió de θ = 1/2 + 1/70" — no aparece en ninguna fuente; lo verificado es θ = 1/2 + 1/584 (o ϖ=δ<1/1168).
2. "DHL[1/2+1/40+ε, 2k]" como teorema de 8b — no existe; "1/40" es artefacto de renderizado de "1/4" seguido de "0<δ<1/2". Lo real: 0<ϖ<1/4 (umbral GPY), 0<δ<1/2 (Teo. 3.10), nivel logrado 1/2+7/300.
3. "≤ 600" como resultado titular de 8b — es de Maynard (Teorema 1.3 en 8b). 8b da 246 incondicional.
4. "H ≤ 12 para 12 y 0 mod 12 bajo DHL/EH" — no consta. Verificado: GPY 16 (EH), Maynard 12 (EH), 8b 6 (GEH).
5. "Extensión del divisor trick de Zhang a números lisos con nivel R = D^δ, sumas sobre d|n(n+2) en intervalo corto mod q" como técnica central de 8b — no se encuentra en 8b (ni en 8a); describe eso sí el parámetro R del completion of sums en Type II (wiki Type II-1b/1c) y la factorización d=d₁d₂ con Möbius del seminario de Tao; requiere verificación de atribución antes de usarse.
6. "Segunda expansión" (second expansion) en 8a — no aparece esa expresión; 8a usa completion of sums (Lema 4.9), q-van der Corput, Cauchy–Schwarz rebalanceada (q=r s) y expansiones de Taylor en intervalos finos ℐ(Q).
7. Valor H = 4.014 — no aparece en la wiki ni en los papers; sí 14.994, 14.950, 4.428??, 4.422?, 4.680 (≈4.686 para k₀=633).
</content>