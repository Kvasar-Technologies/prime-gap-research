# Twin Prime Research — Informe final

**Pregunta.** ¿Pueden las técnicas de construcción mediante *theta lifts* y las
consideraciones de *multiplicidad* mejorar los métodos actuales para acotar
distancias entre primos?

**Respuesta corta.** No de forma demostrable hoy, y por razones que ahora son
*precisas*: (i) las técnicas theta (representación de Weil, suma de Kloosterman,
traza de Kuznetsov, Siegel–Weil) **ya forman parte** del método de GPY/Zhang/Maynard/
Polymath como andamio de las estimaciones Tipo I/II/III; (ii) la cota de Weil es
**óptima** (Sato–Tate/Katz), así que ese punto no admite mejora; (iii) aun con la
mejor hipótesis posible de nivel de distribución (GEH) el tamiz da **H₁ ≤ 6**, no 2:
para primos gemelos hace falta información *bilineal* nueva; (iv) la vía
"multiplicidad de ceros" de Riemann mide errores de orden √x y no conecta con
huecos acotados. El **único** punto con contenido matemático nuevo es formular el
"truco del divisor" de Zhang como control del error en la identidad de
Siegel–Weil/theta lift de la forma `xy` (P2).

Todo lo anterior está trazado a fuentes primarias y verificado donde se pudo
(Lean, cálculo exacto, cálculo numérico).

---

## Fase 1 — Comprender  (`notas/01..03`)

| Paper | Resultado clave verificado |
|---|---|
| Zhang — **Ann. of Math. 179 (2014), 1121–1174** (⚠️ **arXiv:1402.1471 NO es Zhang**: es un paper de cond-mat de Brockmann — verificado por fetch directo) | θ = **1/2 + 1/584** (MPZ[ϖ,δ] con ϖ=δ=1/1168); H = **70.000.000** vía conjunto admisible de ~3,5 M de elementos; *divisor trick* en la banda `D^{1/2+1/100}`, soporte `d ≤ D`, `q ≤ D` |
| **Maynard = arXiv:1311.4600** | criterio exacto: *si EH[θ] y `M_k > 2m/θ` ⇒ `H_m ≤ H(k)`* (`r_k = ⌈θM_k/2⌉` primos); `log k − C ≤ M_k ≤ (k/(k−1))log k`; `M₂ = 1/(1−W(1/e)) = 1.38593…`; `M₅ > 2`, `M₁₀₅ > 4`, `M₅₄ > 4.00238`; `H₁ ≤ 600`; bajo EH `H₁ ≤ 12` |
| Polymath 8a (arXiv:1402.0811) | θ = 1/2 + 7/300; MPZ^[ϖ,δ] con 600ϖ+180δ<7; H: 70e6 → 14.994 → **4.680** (k₀ = 632) |
| Polymath 8b (arXiv:1407.4897) | **H₁ ≤ 246**; H₂ ≤ 398130; … H₅ ≤ 80550202480; bajo EH H₂ ≤ 270; **bajo GEH H₁ ≤ 6** y "6 is the best possible from purely sieve considerations" |
| **Récord hoy (sept 2026)** | **212** (Charton–Hong–Lau–Ono–Rémy–Siu–Swaminathan–Thorner–Xie), tras Stadlmann 240 — **[VERIFICADO PARCIALMENTE]** (Wikipedia EN con referencia completa; no contrastado con el PDF primario) |

Correcciones importantes frente a lo que circula (ver `notas/03d-record-actual.md`):
«θ = 1/2 + 1/70» y «DHL[1/2+1/40+ε,2k]» son **artefactos**; el «truco del divisor
suavizado R = D^δ» **no** figura en 8b; el arXiv de Maynard es **1311.4600** (no
1409.3661, que es cosmología); el de Zhang no es 1402.1471. Que el récord haya
seguido bajando **por optimización de parámetros, no por teoría nueva**, refuerza
nuestra conclusión central.

## Fase 2 — Identificar  (`notas/10-cuellos-de-botella.md`)

Cuatro cuellos:
- **(B1) Nivel de distribución θ**: BV da θ = 1/2 + ε; el estado del arte es
  θ = 1/2 + 7/300 (8a) y `H₁ ≤ 246` (8b). Subir θ requiere mejorar Type I/II.
- **(B2) Cuello variacional `M_k/I_k`**: `M_k ≍ log k`; para H = 2 haría falta θ = 1.
- **(B3) Obstrucción de paridad**: Maynard la evita con k-dimensiones; el precio es (B2).
- **(B4) Paso algebraico (Gram)**: condiciones de rango; aquí la palabra «multiplicidad»
  significa dimensión de espacios.
- **(B5) Paso aritmético**: convolución deslizada del divisor (`d | n(n+2)`) —
  el sitio donde el proyecto puede formular algo nuevo.

## Fase 3 — Conectar  (`notas/04..06`, `notas/20-arquitectura.md`)

Diagrama verificado:
```
theta (Weil) → cota de Kloosterman (óptima) → Kuznetsov → Tipo I/II → θ → H
       ↑ Riemann 1859: ecuación funcional serie theta + multiplicidad de ceros
```
Veredicto honesto por vía: (a) ya usadas: BV, Weil, Kuznetsov, Siegel–Weil, smooth
divisor trick; (b) con margen estrecho: nivel de distribución automorfo vía
Kuznetsov (Blomer–Harcos, ya explotado fuera de ℚ), y control de ceros excepcionales
(con el precio histórico de la inefectividad); (c) cerradas: mejorar Weil (óptima),
usar RH de cuerpos finitos como puente a θ sobre ℚ, y Siegel–Weil/theta lifts solos
(son identidades de promedios, no cotas de error).

## Fase 4 — Experimentar  (`lemas/30`, `experimentos/`, `lemas/40`)

| Experimento | Resultado |
|---|---|
| `kloosterman-weil.js` (E1) | Cota de Weil verificada sobre **4.344 sumas** (p ≤ 37), 0 violaciones, razón máx **0.9653** |
| `ceros-explicita.js` (E2) | Implementación propia de ζ vía η (Euler) + ξ: **11 ceros a ~1e-13**; fórmula explícita reproduce ψ(x) (residuos −14.6, −0.6, −229.7 vs escala √x/√T ≈ 13, 41, 130 ✓) |
| `util.js` (E3) | Búsqueda exhaustiva con poda: H(2)=3, 7, 9, 13, 17, 21, 27, 31, 33, 37, 43, 51 (k=2..14) — secuencia clásica de anchos mínimos admisibles |
| `maynard-mk.js` (E4) | **Reproduce `M_k` exactamente**: M₂ → **1.385933** (exacto `1/(1−W(1/e)) = 1.385933276`), M₃ → 1.646438, M₄ → 1.844989, M₅ → **2.005879 > 2** ✓ (confirma `M₅ > 2`). Aritmética racional exacta + `λ_max` |
| **Lean 4.36.0 + Mathlib v4.36.0** | **13 teoremas + 8 comprobaciones probados sin `sorry`**; `#print axioms` = `[propext, Classical.choice, Quot.sound]` |

Registro único: `referencias/registro-verificacion.txt`.

Lemas formalizados: L1–L6 (admisibilidad), **P1a** (linealidad en multiplicidades),
**P2** (identidad de la hipérbola `Στ(n) = #{(a,b): ab ≤ x}` para x ≤ 100, 101 casos).
Lemas *nuevos* de tipo analítico-conjetural: **P1b** (umbral de detección
`m > C√(γ_j/T)`, derivación de escalas) y **P2a** (el divisor trick como control del
error en la identidad de Siegel–Weil/theta lift de la forma `xy`).

## Fase 5 — Validar  (`notas/50`, `notas/51`)

Dos revisiones independientes lanzadas: revisor adversario de matemática y auditor
numérico contra fuentes primarias. Resultados al llegar en los ficheros indicados.

---

## Índice de ficheros

```
/home/jordi/math/
  README.md                       plan del proyecto (5 fases)
  RESUMEN.md                      este informe
  REVISION-EXTERNA.md             paquete de revisión (Fase 5)
  NOTA-RIEMANN-FUENTE.md          verificación local con el original de 1859
  notas/01-zhang.md               notas/01b-zhang-constantes.md
  notas/02-maynard.md             notas/03-polymath8a.md
  notas/03b-polymath8b.md         notas/03c-numeros-verificados.md
  notas/03d-record-actual.md      (correcciones de citas + récord 212)
  notas/04-riemann-1859.md        notas/05-theta-bridges.md
  notas/06-honest-assessment.md   notas/10-cuellos-de-botella.md
  notas/20-arquitectura.md        notas/50-revision-adversaria.md   (en curso)
  notas/51-auditoria-numeros.md   (en curso)
  lemas/30-lemas-propuestos.md    lemas/40-lean-formalizacion.md
  experimentos/{kloosterman-weil,ceros-explicita,util,maynard-mk}.js
  experimentos/NOTAS-*.md         (4 notas de experimento)
  referencias/riemann-1859-{aleman,wilkins,clay-scan}.{tex,pdf}  fuentes primarias
  referencias/registro-verificacion.txt                           registro consolidado
  /mnt/HC_Volume_106949518/git-repo/twinprime-lean                 proyecto Lean + Mathlib
```

## Qué haría yo a continuación (ruta realista, no promesas)

1. Reproducir numéricamente `M₂ = 1/(1−W(1/e))` por método de Ritz sobre
   `[0,1]²` — confirma la definición correcta de Maynard y calibra el código para
   `M_k` con k grande (experimento nuevo, mediano esfuerzo, alto valor didáctico).
2. Formalizar la identidad de la hipérbola **en general** (biyección
   `(n,d) ↦ (d, n/d)`) en Lean: es un teorema real, no un caso particular.
3. Leer `notas/05-theta-bridges.md` y atacar solo (S3): escribir la versión
   *Siegel–Weil explícita* de la estimación Tipo III de Zhang y ver, con la
   literatura de convoluciones deslizadas (Blomer–Khan–Young), si hay una mejora
   real. Es la única línea donde las "theta lifts" podrían aportar algo nuevo.