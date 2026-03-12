# ejecutar:
# gnuplot p16.gp


###########################
set terminal wxt size 800,600 enhanced font 'Helvetica,12' persist

set title "Tiro oblicuo"

#set styl data lines

#set samples 200

#set xrange [-.5:3.5]
#set yrange [-.5:3.0]

#set key bottom right
#set key left 

set xzeroaxis
set yzeroaxis
# Notar que el eje horizontal no aparece debido a que el rango automático
# en 'y' no muestra regiones con 'y' < 0.

set xlabel "t"
set ylabel "x"

plot "salida_tiro_oblicuo.dat" u 1:2 t "x vs t" w points pt 1 ps 2

set terminal pngcairo enhanced size 900,675
set output "p16_x_t.png"

replot

###########################


set xlabel "t"
set ylabel "y"

plot "salida_tiro_oblicuo.dat" u 1:3 t "y vs t" w points pt 1 ps 2

set terminal pngcairo enhanced size 900,675
set output "p16_y_t.png"

replot

###########################



set xlabel "t"
set ylabel "v_y"

plot "salida_tiro_oblicuo.dat" u 1:5 t "v_y vs t" w points pt 1 ps 2

set terminal pngcairo enhanced size 900,675
set output "p16_vy_t.png"

replot

###########################



set xlabel "x"
set ylabel "y"

plot "salida_tiro_oblicuo.dat" u 2:3 t "y vs x (trayectoria)" w points pt 1 ps 2

set terminal pngcairo enhanced size 900,675
set output "p16_y_x.png"

replot

###########################

exit
