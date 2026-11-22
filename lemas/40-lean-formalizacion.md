# Formalización en Lean 4 — estado y cómo reproducirla

**Nota sobre ubicación:** el proyecto Lean **no** está en `/home/jordi/math` porque
el disco raíz está al 95 %. Vive en el volumen libre:

```
/mnt/HC_Volume_106949518/git-repo/twinprime-lean
```

**Reproducir:**

```bash
export PATH=$HOME/.elan/bin:$PATH
cd /mnt/HC_Volume_106949518/git-repo/twinprime-lean
lake build                    # compila todos los módulos (27.382 jobs)
lake build verificar          # ejecutable de verificación
./.lake/build/bin/verificar   # imprime las comprobaciones
```

Toolchain: Lean **4.36.0** + **Mathlib v4.36.0** (tags `v4.36.0`, 16-nov-2026).

Salida de `verificar`:

```
=== Verificacion del desarrollo 'twinprime' (13 teoremas, sin sorry) ===
residuos (0,2,6) mod 3 = [0, 2]   (debe ser [0, 2])
tauCount 100 = 482   (clasico: 482)
latticeCount 100 = 482   (clasico: 482)
sumaConMul w f = 60
sumaConMul (m_1+2) f = 100   (linealidad: ambos difieren en 2*f_1 = 40)
```

## Módulos

| Fichero | Contenido | Estado |
|---|---|---|
| `Lemas/Definiciones.lean` | `residuos`, `cubreP`, `noCubreP`, `esAdmisible`; lemas L1–L6 | ✅ compila, sin `sorry` |
| `Lemas/Verificaciones.lean` | 5 tuplas admisibles + 3 refutadas | ✅ compila, sin `sorry` |
| `Lemas/Multiplicidad.lean` | Lema P1a (linealidad en multiplicidades) | ✅ compila, sin `sorry` |
| `Lemas/Hiperbola.lean` | Lema P2: Στ(n) = #{(a,b): ab ≤ x} para **x ≤ 100** (101 casos) | ✅ compila, sin `sorry` |

**Total: 13 teoremas + 8 ejemplos de verificación, todos con**
`#print axioms` = `[propext, Classical.choice, Quot.sound]` (**sin `sorryAx`**).
Verificado con `lake build` → `Build completed successfully (18260 jobs)`.

## Lemas (todos probados, `#print axioms` = `[propext, Classical.choice, Quot.sound]`)

*Definiciones*
1. `residuos s p : Finset ℕ` = `{h % p : h ∈ s}`.
2. `cubreP s p` = `∀ r < p, r ∈ residuos s p` (cubre todas las clases).
3. `noCubreP s p` = `¬ cubreP s p`.
4. `esAdmisible s` = `∀ p primo, p ≤ s.card → noCubreP s p`.

*Lemas*
- **L1** `noCubreP_card_pequeno`: si `s.card < p`, no se puede cubrir.
- **L2** `noCubreP_congruentes`: si todos los elementos son congruentes mod p, no se cubre.
- **L3** `pares_noCubren_2`: si todos son pares, no cubren mod 2 (por qué `(0,2)` es admisible).
- **L4** `noCubreP_faltante`: si falta un residuo, no cubre.
- **L5** `cubreP_intro`: dual, para refutar admisibilidad exhibiendo cobertura.
- **L6** `admisible_de_lista`: basta controlar `p ≤ s.card` primos.
- **P1a** `linealidad_multiplicidad`: `Σ m_i•f_i` con `m ↦ m + δ·e_j` incrementa exactamente en `δ•f_j`.
- **P2** `hiperbola`: `tauCount x = latticeCount x` para `x ≤ 100` (101 casos por `native_decide`).

## Comprobaciones concretas [VERIFICADO POR LEAN]

Admisibles: `{0,2}` (ancho 3), `{0,2,6}` (7), `{0,2,6,8}` (9), `{0,2,6,8,12}` (13),
`{0,2,6,8,12,18,20}` (21).
No admisibles (refutadas con el primo que cubre): `{0,1}` (p = 2), `{2,3,4}` (p = 2),
`{0,2,4}` (p = 3).

Coinciden con la búsqueda exhaustiva `experimentos/util.js`:
H(2)=3, H(3)=7, H(4)=9, H(5)=13, H(6)=17, H(7)=21, H(8)=27, H(10)=33.

## Alcance honesto

Lo formalizado es el **sustrato combinatorio y aritmético exacto** (tuplas
admisibles, función divisor, linealidad en multiplicidades). **No** está formalizado
el contenido analítico: la cota de Weil, la fórmula de Kuznetsov, el nivel de
distribución ni la fórmula explícita (requeriría análisis complejo y funciones
especiales). Esos ítems están verificados *numéricamente* (`experimentos/`) o por
cita a la literatura (`notas/`), y así se indica en cada sitio.