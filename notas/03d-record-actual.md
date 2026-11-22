# 03d — Correcciones bibliográficas y récord actual

## Correcciones verificadas en esta sesión

| Afirmación anterior | Estado | Corrección |
|---|---|---|
| Zhang = arXiv:1402.1471 | ❌ **FALSO** | arXiv:1402.1471 es *"Overlaps of q-raised Néel states…"* de **M. Brockmann** (cond-mat.stat-mech) — **verificado por fetch directo de arxiv.org/abs/1402.1471** |
| Zhang = Annals of Math. 179 (2014), 1121–1174, doi:10.4007/annals.2014.179.3.7 | ✅ **correcto** | cita canónica (Wikipedia EN, «Yitang Zhang», lista de publicaciones; MR3171761, Zbl 1290.11128) |
| Zhang = arXiv:1311.4600 era Maynard | ✅ | idem |
| Maynard = arXiv:1409.3661 | ❌ **FALSO** | paper de cosmología; Maynard = **arXiv:1311.4600** |
| H₁ ≤ 246 es el récord incondicional | ⚠️ **DESFASADO** | ver abajo |

## Récord incondicional actual (septiembre 2026)

De Wikipedia EN, artículo «Yitang Zhang» (sección Research, actualizado sept-2026):

> "Research programs such as the Polymath Project built upon Zhang's result,
> eventually lowering the bounded gap to **212 as of September 2026**",
> citando: Charton–Hong–Lau–Ono–Rémy–Siu–Swaminathan–Thorner–Xie,
> **"A new bound for small gaps between primes"** (= 212), tras
> **Stadlmann"** (240).

Estado de verificación: **[VERIFICADO PARCIALMENTE]** — la cita está en una
fuente secundaria fiable (Wikipedia, con referencia bibliográfica completa),
pero **no se ha accedido al paper primario**. Acción pendiente: recuperar el
arXiv de Charton et al. (probablemente 2025-2026) y comprobar:
1. si el 212 sale de parámetros optimizados computacionalmente sobre el marco
   Polymath 8b (tipo "calibración"), o de una nueva estimación;
2. si usa métodos de optimización numérica/ML (relevante para nuestro propio
   enfoque de experimentación).

Implicación para este proyecto: nuestros resultados "246" como récord deben leerse
como "246 era el récord a fecha de las fuentes verificadas (2016); el récord ha
seguido bajando por optimización computacional del mismo marco, no por nueva
teoría". **Esto refuerza la conclusión de `notas/20-arquitectura.md`**: el margen
está en la *calibración numérica*, no en teoría nueva — y nuestra Fase 4
(experimentación + formalización) encaja en esa dirección.

## Fuente primaria del 212 (descargada durante la investigación, NO incluida en el repo público)

*Charton, Hong, Lau, Ono, Rémy, Siu, Swaminathan, Thorner, Xie, **A new bound for small
gaps between primes***, <https://primegaps.axiommath.ai/bgp212.pdf> (734 KB; depositado en
el entorno de trabajo privado en `referencias/bgp212.pdf`, pero **no** redistribuido en el
repositorio público por derechos de autor). La extracción de texto del PDF confirma la
presencia del enunciado `H_1 ≲ 212` y su bibliografía incluye **Stadlmann:2026:BGP**
(el trabajo primario que da 240).
**Estado:** [VERIFICADO PARCIALMENTE] — PDF primario consultado con extracción de texto
fragmentaria; se recomienda leer directamente el Teorema 1.1.
