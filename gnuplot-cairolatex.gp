set term cairolatex pdf standalone size 8.5cm,6cm linewidth 3
set output "gnuplot-cairolatex.tex"

set border back
set key reverse Left samplen 5 at 38,0.5 spacing 1.2

set log y
set xrange [0:40]; set yrange [1e-5:1]
set xtics 10 scale 2,1; set ytics scale 2,1 add ("1" 1)
set mxtics 2; set mytics 10
set format y "$10^{%L}$"
set xlabel "Average CNR [dB]"; set ylabel "Bit Error Rate"

set label 1 "\\footnotesize\\begin{tabular}{l}QPSK\\\\Rayleigh fading\\\\Perfect channel estimation\\end{tabular}" at 2,6e-5 left

plot \
  (1-1/sqrt(1+2/(10**(x/10))))/2 title "Theory" linetype -1, \
  "data.txt" with lines linecolor "red" dashtype (10,10) notitle, \
  "data.txt" with points pointtype 9 linecolor "white" notitle, \
  "data.txt" with points pointtype 8 linecolor "red" notitle, \
  "dummy.txt" with linespoints pointinterval -1 pointtype 8 linecolor "red" dashtype (10,10) title "Simulation"