set terminal wxt size 800,600 enhanced font 'Helvetica,12' persist


f(x)=0.5*x+1.
g(x)=0.4*x+1.2

set xlabel 'x'
set ylabel 'y'
set title 'Funciones lineales'
set grid

plot 'datos.dat' u 1:2 w p ps 5, 'datos.dat' u 1:3 w p, f(x) w l lw 4 lc rgb "blue" t 'linea', g(x) w l

set terminal png
set output 'p4.png'
replot

set terminal pdf
set output 'p4.pdf'
replot


set terminal postscript
set output 'p4_byn.ps'
replot


set terminal postscript enhanced color
set output 'p4_color.ps'
replot


