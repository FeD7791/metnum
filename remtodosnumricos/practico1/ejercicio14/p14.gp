#
# ejecutar:
# gnuplot p14.gp


###########################
set terminal wxt size 800,600 enhanced font 'Helvetica,12' persist

set title "Problema 14. Guia 1."


set key bottom right
#set key left 

set xzeroaxis
set yzeroaxis
# Notar que el eje horizontal no aparece debido a que el rango automático
# en 'y' no muestra regiones con 'y' < 0.

set logscale x
set logscale y

set xlabel "n"
set ylabel "errores"

plot "salida_prob14b.dat" u 1:3 t "b)" w p  ps 0.75, \
     "salida_prob14c.dat" u 1:3 t "c)" w l  lw 1.6

set terminal pdf enhanced font 'Helvetica,4'
set output "problema14.pdf"
# set terminal pngcairo enhanced size 900,675
# set output "problema14.png"

replot

###########################

exit
