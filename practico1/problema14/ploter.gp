set terminal postscript color
set output "errores_1.ps"

set logscale x
set logscale y


plot "errores_2.dat" using 1:2 with lines, "errores_2.dat" using 1:3 with lines
