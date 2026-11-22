# Polymath 8b — "Variants of the Selberg sieve, and bounded intervals containing many primes"

**Fuente principal:** D. H. J. Polymath, *Variants of the Selberg sieve, and bounded intervals
containing many primes*, arXiv:**1407.4897** (v1 18-jul-2014, v4 22-dic-2014), publicado en
*Research in the Mathematical Sciences* **1**:12 (2014). Texto completo en
https://ar5iv.org/abs/1407.4897 .

---

## 1. El teorema titular exacto (Teorema 1.4 de 8b), con tabla completa

Definiciones: Hₘ := liminf_{n→∞}(p_{n+m}−p_n); DHL[k,j]: para toda k-tupla admisible
ℋ = (h₁,…,h_k) existen infinitas traslaciones n+ℋ con al menos j primos. H(k) = diámetro mínimo
de una k-tupla admisible. (Verificado, 8b §1, §3.)

**Incondicional (Teorema 1.4):**

| Nº | Resultado |
|---|---|
| (i) | **H₁ ≤ 246** |
| (ii) | H₂ ≤ 398.130 |
| (iii) | H₃ ≤ 24.797.814 |
| (iv) | H₄ ≤ 1.431.556.072 |
| (v) | H₅ ≤ 80.550.202.480 |
| (vi) | Hₘ ≤ C·m·exp((4 − 28/157)·m) para todo m ≥ 1 (C absoluta y efectiva) |

**Bajo EH[ϑ] para todo 0<ϑ<1 (Teorema 1.4):**

| Nº | Resultado |
|---|---|
| (vii) | H₂ ≤ 270 |
| (viii) | H₃ ≤ 52.116 |
| (ix) | H₄ ≤ 474.266 |
| (x) | H₅ ≤ 4.137.854 |
| (xi) | Hₘ ≤ C·m·e^{2m} |

**Bajo GEH[ϑ] para todo 0<ϑ<1 (Teorema 1.4):**

| Nº | Resultado |
|---|---|
| (xii) | **H₁ ≤ 6** |
| (xiii) | H₂ ≤ 252 |

Notas: (i) usa solo Bombieri–Vinogradov; (ii)–(vi) usan las estimaciones de equidistribución de
8a (Teorema 2.5 abajo); (vii)–(xiii) solo requieren EH/GEH para un ϑ explícito y calculable,
cercano a 1.

**Afirmaciones DHL subyacentes (Teorema 3.2):**
incondicional: DHL[50,2]; DHL[35.410,3]; DHL[1.649.821,4]; DHL[75.845.707,5]; DHL[3.473.955.908,6];
y DHL[k,m+1] si k ≥ C·exp((4−28/157)m). Bajo EH: DHL[54,3]; DHL[5.511,4]; DHL[41.588,5];
DHL[309.661,6]; DHL[k,m+1] si k ≥ C·exp(2m). Bajo GEH: DHL[3,2] y DHL[51,3].

**Cotas sobre H(k) (Teorema 3.3):** H(3) = 6; H(50) = 246; H(51) = 252; H(54) = 270;
H(5.511) ≤ 52.116; H(35.410) ≤ 398.130; H(41.588) ≤ 474.266; H(309.661) ≤ 4.137.854;
H(1.649.821) ≤ 24.797.814; H(75.845.707) ≤ 1.431.556.072; H(3.473.955.908) ≤ 80.550.202.480;
asintóticamente H(k) ≤ k·log k + k·log log k − k + o(k).

**Teorema 1.5 (disyunción, bajo GEH):** o bien H₁ = 2 (conjetura de los primos gemelos), o bien
"near-miss" de la conjetura de Goldbach par: para todo n múltiplo grande de 6, al menos uno de
n y n−2 (o n+2) es suma de dos primos; en particular todo par grande está a distancia ≤ 2 de una
suma de dos primos.

## 2. Correcciones a las premisas del encargo (verificadas en las fuentes)

- **"≤ 600" como resultado de 8b: [NO VERIFICADO] / atribución corregida.** La cota
  liminf ≤ 600 es de **Maynard** (Teorema 1.3 en el texto de 8b; arXiv:1311.4600), junto con
  Hₘ ≤ C·m³e^{4m}; bajo EH Maynard tiene H₁ ≤ 12, H₂ ≤ 600, Hₘ ≤ C·m³e^{2m}. 8b mejora el 600
  incondicional a **246** (y no consigue mejorar H₁ ≤ 12 bajo EH: "we were unable to improve
  upon Maynard's bound H1≤12").
- **"DHL[1/2+1/40+ε, 2k]": [NO VERIFICADO] — no existe tal enunciado.** Rastreando el texto
  completo de 8a, 8b y la wiki, "1/40" solo aparece como **artefacto de renderizado**: los
  enunciados realmente dicen "0 < ϖ < 1/4" seguido de "0 < δ < …", que al fundirse el texto
  produce "1/40". Lo que sí existe verificado:
  - GPY: cualquier resultado EH[1/2+2ϖ] con 0 < ϖ < 1/4 implica cota explícita finita sobre H₁
    (igual a **16** para ϖ > 0,229855) — 8b §1, Teorema 1.1.
  - 8b, Teorema 3.10 (simplex truncado): hipótesis **0 < ϖ < 1/4 y 0 < δ < 1/2** con MPZ[ϖ,δ].
  - El nivel realmente alcanzado por el proyecto (vía 8a) es **1/2 + 7/300 + ε**
    (Teorema 2.5 abajo), no 1/2 + 1/40 = 0,525 (que superaría el 7/300 ≈ 0,0233 de 8a:
    1/40 = 0,025).
- **"H ≤ 12 para 12 y 0 mod 12 bajo DHL/EH": [NO VERIFICADO]** (no consta en ninguna fuente
  consultada). Verificado en su lugar: GPY H₁ ≤ 16 bajo EH; Maynard H₁ ≤ 12 bajo EH (8b no la
  mejora: bajo EH solo pudo bajar H₂ a 270); bajo GEH 8b da **H₁ ≤ 6**, que es óptimo para
  métodos puramente de tamiz (obstrucción de paridad de Selberg, §8 de 8b).
  La wiki de DHL→DHL registra además un "12 [EH]" atribuido a Maynard (respuesta en MathOverflow,
  hilo "Does Zhang's theorem generalize to 3 or more primes in an interval of fixed length?").

## 3. Núcleo técnico: qué es realmente nuevo en 8b

Según el propio paper (§1), hay **dos innovaciones técnicas principales**:

1. **Generalización del tamiz multidimensional de Selberg–Maynard:** se permite que el soporte de
   la función de corte F llegue a dominios mayores que los permitidos antes (especialmente bajo
   GEH). Como en Maynard, la tarea se reduce a un problema variacional multidimensional con F.
   Esto se traduce en los criterios encadenados del §3:
   - Teorema 3.8 (simplex estándar): EH[ϑ] y M_k > 2m/ϑ ⟹ DHL[k,m+1] (Maynard, Prop. 4.2).
   - Teorema 3.10 (**simplex truncado**): si 0<ϖ<1/4, 0<δ<1/2 y MPZ[ϖ,δ], entonces
     M_k^[δ/(1/4+ϖ)] > m/(1/4+ϖ) ⟹ DHL[k,m+1] — aquí es donde entra la lisura del módulo
     (parámetro de truncación α = δ/(1/4+ϖ)).
   - Teorema 3.12 (**simplex ε-agrandado**, el "ε-trick"): J_{i,1−ε} se integra sobre
     (1−ε)·ℛ_{k−1} y M_{k,ε} sobre (1+ε)·ℛ_k = {Σt_i ≤ 1+ε}; con EH[ϑ] y 1+ε < 1/ϑ, o con
     GEH[ϑ] y ε < 1/(k−1), entonces M_{k,ε} > 2m/ϑ ⟹ DHL[k,m+1].
   - Teorema 3.14 ("Going beyond the ε enlargement"): caso k=3 con corte polinomial a trozos
     (Teorema 3.15) — da DHL[3,2] bajo GEH.
2. **Métodos numéricos eficientes** para resolver el problema variacional: polinomios simétricos,
   **método del subespacio de Krylov** (ℒⁱ1, ⟨ℒⁱ1,1⟩ computados con Maple hasta i ≤ 50 y
   k ≤ 100), descomposición de politopos, y programas cuadráticos grandes para k medio
   (§7.2 recuerda que para M_{k,ε} el análogo de ℒⁱ1 es polinomial a trozos, por lo que se usan
   bases de polinomios de la forma (1+ε−P₍₁₎)^a P_α con α "signature" sin doses; se restringe a
   firmas con entradas pares; ε = 1/m con m de factores primos pequeños agiliza el cálculo).

### Constantes exactas de "calibración" del problema variacional (todas verificadas en 8b)

- Definiciones: I(F) = ∫_{[0,∞)^k} F²; J_i(F) = ∫_{[0,∞)^{k−1}} (∫_0^∞ F dt_i)²;
  **M_k := sup (Σ_i J_i(F))/I(F)** sobre el simplex ℛ_k = {Σ t_i ≤ 1}.
- Cotas superiores: **M_k ≤ k/(k−1)·log k** (Corolario 6.4, con G_i = (k−1)/(log k)·1/(1−Σt+kt_i));
  **M₂ = 1/(1−W(1/e)) = 1,38593…** (función Lambert W, Corolario 6.3);
  M₂ ≤ 2 log 2 = 1,38629…; **M₄ ≤ (4/3)·log 4 = 1,8454…** — "no se puede esperar probar
  DHL[4,2] (ni DHL[3,2]) solo con el Teorema 3.8 incluso bajo GEH".
- Maynard (comparación, citada en 8b): M₅ > 2; M₁₀₅ > 4; M_k ≥ log k − 2 log log k − 2.
- Cotas inferiores (Teorema 3.9): **M₅₄ > 4,00238**; **M₅₅₁₁ > 6**; **M₄₁₅₈₈ > 8**;
  **M₃₀₉₆₆₁ > 10**; M_k ≥ log k − C.
- Tabla 3 de 8b (subespacio de Krylov, cotas inferiores de M_k vs. k/(k−1)log k):
  k=2: 1,38593/1,38630; k=3: 1,64644/1,64792; k=4: 1,84540/1,84840; k=5: 2,00714/2,01180;
  k=10: 2,54547/2,55843; k=20: 3,12756/3,15341; k=30: 3,48313/3,51849; k=40: 3,73919/3,78347;
  k=50: 3,93586/3,99187; k=53: 3,98621/4,04665; k=54: 4,00223/4,06425; k=60: 4,09101/4,16375;
  k=100: 4,46424/4,65169.
- Cotas con ε (Teorema 3.13): **M₅₀,₁/₂₅ > 4,0043** (grado d=27; > 4,00124 con d=25);
  **M₄,₀,₁₆₈ > 2,00558**; **M₅₁,₁/₅₀ > 4,00156** (grado d=22).
- Tabla 2 de 8b (parámetros asintóticos θ, β con c = θ/log k, T = β/log k, τ = 1−kμ):
  k=5511: (0,965; 0,973; M=6,000048609); k=35.410: (0,99479; 0,85213; 7,829849259);
  k=41.588: (0,97878; 0,94319; 8,000001401); k=309.661: (0,98627; 0,92091; 10,00000032);
  k=1.649.821: (1,00422; 0,80148; 11,65752556); k=75.845.707: (1,00712; 0,77003; 15,48125090);
  k=3.473.955.908: (1,0079318; 0,7490925; 19,30374872).
- Teorema 3.11(i)–(vi): existen δ,ϖ>0 con **600ϖ+180δ<7** y
  M_{35.410}^[δ/(1/4+ϖ)] > 2/(1/4+ϖ), M_{1.649.821}^[…] > 3/(1/4+ϖ),
  M_{75.845.707}^[…] > 4/(1/4+ϖ), M_{3.473.955.908}^[…] > 5/(1/4+ϖ); y para todo k ≥ C,
  ϖ ≥ 7/600 − C/log k con M_k^[…] ≥ log k − C. De ahí:
  m ≤ (log k − C)(1/4 + 7/600 − C/log k) ⟹ **m ≤ log k/(4 − 28/157) − C′** — el origen exacto
  de la constante **4 − 28/157 = 600/157 ≈ 3,82166** (pues 1/(4−28/157) = 1/(1/4+7/600)=157/600).
- Narrativa de la "calibración" (retrospectiva, §2 Tao): la eficiencia M₄ pasó de 1,845 → 1,937
  → 1,951 → … sin alcanzar 2; el "epsilon trick" la llevó a **2,018** (y H₁ ≤ 8 bajo GEH),
  y finalmente M₃ > 2 (y H₁ ≤ 6 bajo GEH). El límite superior incondicional bajó de 600 a 300
  antes del 246 final ("a 2-week computer calculation", wiki 14-abr-2014).

### Cómo entra el nivel de distribución (y de dónde sale el "+1/40" mencionado)

- 8b usa **Teorema 2.5**: MPZ[ϖ,δ] se cumple para todo ϖ,δ ≥ 0 con **600ϖ + 180δ < 7**
  (resultado de 8a); en particular ϖ puede acercarse arbitramente a 7/600 ≈ 0,01167, i.e. nivel
  de distribución **1/2 + 7/300 + ε**. Zhang tenía 0 ≤ ϖ,δ < 1/1168.
- El §9 ("Additional remarks") de 8b afirma que la condición 600ϖ+180δ<7 podría mejorarse
  ligeramente a **1080ϖ + 330δ < 13**, pero requiere cancelación de raíz cuadrada en cierta
  suma exponencial tetradimensional sobre cuerpos finitos (no probada rigurosamente).
- Sobre el "divisor trick extendido a números lisos con nivel R = D^δ, sumas sobre d | n(n+2)
  en intervalo corto módulo q": **[NO VERIFICADO]** en 8b (tampoco en 8a). Lo que sí contiene 8b,
  y que probablemente se está describiendo: las sumas de divisores λ_F(n) = (∑_{d|n} F′(log_x d)
  …) del tamiz; la Proposición 4.2 ("almost primality": λ_F(n) acotado salvo en números sin
  factores primos < x^ε); los módulos [d_i,d′_i] con Möbius y cota del divisor; y una nota del §9
  sobre el caso (n, n−2) donde algunos módulos [d_j,d′_j] no son coprimos en p>w dividiendo x o
  x−2, lo que introduce la serie singular 𝔖. La "lisura" en 8b entra por MPZ[ϖ,δ] de 8a
  (módulos x^δ-smooth) y por el parámetro de truncación α = δ/(1/4+ϖ), no por un nivel R = D^δ
  de divisores.

## 4. Resultados finales registrados en la wiki (mejores valores del proyecto)

Fuente: https://web.archive.org/web/20221112074939/https://asone.ai/polymath/index.php?title=Bounded_gaps_between_primes
(tabla "Current records", ligeramente mejores que el paper; fuente de cada uno: comentarios del blog de Tao):

| m | Conjetural | Bajo EH | Sin EH | Sin EH ni Deligne |
|---|---|---|---|---|
| 1 | 2 | 6 (GEH); 12 [M] (EH) | **246** | 246 |
| 2 | 6 | 252 (GEH); 270 (EH) | 395.106 | 474.266 |
| 3 | 8 | 52.116 | 24.462.654 | 32.285.928 |
| 4 | 12 | 474.266 | 1.404.556.152 | 2.031.558.336 |
| 5 | 16 | 4.137.854 | 78.602.310.160 | 124.840.189.042 |
| asint. | (1+o(1))·m log m | O(m e^{2m}) | O(exp(3,815 m)) [BI] | O(m exp((4−4/43)m)) |

Conclusión del proyecto según la wiki: "Polymath8a … concluded with a bound of H = 4,680";
"Polymath8b … concluded with a bound of H = 246".