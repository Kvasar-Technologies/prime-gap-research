# Verificación con fuente primaria local (gracias al agente que bajó las fuentes)

En `referencias/` están las fuentes primarias descargas:

- `riemann-1859-aleman.tex` — Riemann 1859 (original alemán, texto LaTeX)
- `riemann-1859-wilkins.tex` / `.pdf` — traducción inglesa (Wilkins)
- `riemann1859-clay-scan.pdf` — scan Clay

## Lo que SÍ he verificado directamente sobre el original (§2)

Pasaje literal (alemán, §2, inicio):

> "Es sei $F(x)$, wenn $x$ nicht gerade einer Primzahl gleich ist, gleich dieser
> Anzahl, wenn aber $x$ eine Primzahl ist, um $\frac{1}{2}$ grösser, so dass für ein
> $x$, bei welchem $F(x)$ sich sprungweise ändert, $F(x) = \frac{F(x+0)+F(x-0)}{2}$."

Es decir: Riemann define F(x) con la convención de **medio salto** en las
primitivas (x potencia de primo), de forma que en los puntos de discontinuidad
`F(x) = ½(F(x+0)+F(x−0))`. Esta es la convención que hace que la fórmula explícita
sea una igualdad de funciones "centradas", y es el punto donde el **orden
(multiplicidad)** de los ceros se manifestaría como un salto no simetrizado.

## Lo que sigue [NO VERIFICADO]

La extensión de esa convención a ceros de ζ de orden par (la formulación "si una
raíz de orden par ... F(x) es discontinua") es una *lectura* habitual de los
comentaristas: no he localizado el enunciado literal en la fuente descargada, así
que se mantiene marcado [NO VERIFICADO] en `notas/04-riemann-1859.md`. No afirmar
más de lo que el original dice.
