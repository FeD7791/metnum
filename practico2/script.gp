 set terminal pngcairo size 800,600
 set output "plot.png"
 set xlabel "X"
 set ylabel "Y"
 set title "Mi grafico"
 plot "plot_data.dat" using 1:2 with lines lw 2 title "datos"
