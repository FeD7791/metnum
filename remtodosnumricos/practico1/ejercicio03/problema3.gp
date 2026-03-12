# ejecutar:
# gnuplot problema3.gp


###########################
set terminal wxt size 800,600 enhanced font 'Helvetica,12' persist


f(x)=sin(2*pi*x)

set samples 500

set title 'f(x)=sin(2*pi*x)'
set xlabel 'x'
set ylabel 'y'

plot [0:5] f(x) w lp t 'f(x)'


