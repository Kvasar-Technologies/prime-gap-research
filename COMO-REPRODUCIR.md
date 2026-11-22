# Cómo reproducir todo el proyecto

Requisitos: Linux, Node 24, ~7 GB de disco libres **en `/mnt/HC_Volume_106949518`**
(el disco raíz está al 95 %, por eso el proyecto Lean vive en el volumen libre).

## 0. Dependencias

```bash
# ración exacta + toolchain Lean (una sola vez)
cd /home/jordi/math/experimentos && npm install        # mathjs, nerdamer
export PATH=$HOME/.elan/bin:$PATH                      # Lean 4.36.0 + Mathlib ya instalados
```

## 1. Verificaciones numéricas (2 minutos)

```bash
cd /home/jordi/math/experimentos

node kloosterman-weil.js 37      # E1: cota de Weil sobre 4.344 sumas (p ≤ 37)
node ceros-explicita.js          # E2: ceros de ζ + fórmula explícita de Riemann
node util.js                     # E3: anchos mínimos admisibles H(k), k = 2..14
node maynard-mk.js 2,3 2,3,4,5,6 # E4: M_k de Maynard (reproduce M₂ exacto y confirma M₅ > 2)
node voronoi.js                  # E5: término de error del problema del divisor
```

Salidas de referencia (deben coincidir): `referencias/registro-verificacion.txt`.

## 2. Verificación formal (Lean, ~10 min la primera vez)

```bash
export PATH=$HOME/.elan/bin:$PATH
cd /mnt/HC_Volume_106949518/git-repo/twinprime-lean
lake build                      # compila Mathlib en caché + nuestros 4 módulos
lake build verificar            # ejecutable
./.lake/build/bin/verificar     # imprime las comprobaciones
lake env lean Lemas/Verificaciones.lean   # o módulo a módulo
```

Estado esperado: `Build completed successfully`, **cero `sorry`**, y
`#print axioms` = `[propext, Classical.choice, Quot.sound]`:

```bash
cat > /tmp/ax.lean <<'EOF'
import Mathlib
import Lemas.Multiplicidad
import Lemas.Hiperbola
import Lemas.Definiciones
#print axioms Lemas.Definiciones.noCubreP_card_pequeno
#print axioms Lemas.Multiplicidad.linealidad_multiplicidad
#print axioms Lemas.Hiperbola.hiperbola
EOF
lake env lean /tmp/ax.lean
```

## 3. Documentación

| Documento | Contenido |
|---|---|
| `RESUMEN.md` | informe final por fases |
| `CONCLUSION.md` | respuesta ejecutiva en una página |
| `notas/10` | mapa de cuellos de botella |
| `notas/20` | arquitectura de la conexión theta/Riemann |
| `lemas/30` | lemas propuestos y su estado |
| `lemas/40` | detalle de la formalización Lean |
| `REVISION-EXTERNA.md` | paquete para revisión humana |
| `notas/03d` | correcciones bibliográficas y récord actual |