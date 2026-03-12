# plot.gp

set terminal postscript
set output "plot.ps"


set title "Example plot"
set xlabel "x"
set ylabel "f(x)"



set xrange [-20:20]

# plot "data.txt" using 1:3 with lines

plot "data.txt" index 0:3 w l
unset output