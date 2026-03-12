# ejecutar:
# gnuplot p1b.gp

###########################
set terminal wxt size 800,600 enhanced font 'Helvetica,12' persist


f(x)= sin(x) 


set title "Calculo de sin(x) por serie de Taylor."

#set styl data lines


#set key bottom right
#set key left 

#set logscale x
set logscale y

set xzeroaxis
set yzeroaxis

set xlabel "n"
set ylabel "error "

#set xrange [0:3]

plot "p15.dat" u 1:4 w lp lw 1.5 ps 1.2 t "simple",\
"p15_doble.dat" u 1:4 w lp  lw 1.5 ps 1.2 t "doble" 

#set terminal pdf enhanced font 'Helvetica,12'
#set output "prob15.pdf"
set terminal pngcairo enhanced font 'Helvetica,16' size 900,675
set output "prob15.png"

replot

exit
