set terminal postscript color
set output "figura.ps"

f(x) = -0.5*x+1
g(x) = -0.4*x+1.2

set xrange [0:3]
set yrange [1:2.6]
set xlabel "Eje x"
set ylabel "Eje y"
set grid
set title "PRIMER GRAFICO"

plot "data.dat" using 1:2 with lines title "data" lc rgb "red", \
f(x) title "f(x)" lc rgb "blue", \
g(x) title "g(x)" lc rgb "yellow"

unset output
# Puedo usar evince para visualizar la figura.
