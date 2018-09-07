#!/usr/bin/gnuplot
#
# Generate an animated Trajectory
#
# AUTHOR: Anji babu Kapakayala

reset

# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
set terminal pngcairo size 700,500 enhanced font 'Verdana,10'

# color definitions
set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 ps 2 # --- blue

unset key
set border lw 2
#set xlabel "Time (ps)"
#set ylabel "Phi"
set title " MD 500 K"
unset tics
set view 342,0
system('mkdir -p png')
n=0
do for [ii=1:417] {
  n=n+1

    set output sprintf('png/pic%03.0f.png',n)
set multiplot layout 2,1
#plotiing trajectory
set xrange [0:900000]
set yrange [-1.7:1.7]
    plot 'energy_file_500' every ::1::ii u 1:2 w l ls 1 notitle, \
          'energy_file_500' every ::ii::ii u 1:2 w p ls 1 notitle
#plotting energy
#   plot 'data2.dat'  u 1:3 w l ls 1 notitle
set yrange [-0.0015:0.001]
set xrange [-1.7:1.7]
    plot (0.001*(x**2-1)**2)-0.0012 w l lw 3 lc rgb 'red' notitle , \
          'energy_file_500' every ::ii::ii u 2:5 w p ls 1 notitle
 unset multiplot
}
#----------------------------------------------------------------g
#     Written By ANJI BABU KAPAKAYALA                            #
#----------------------------------------------------------------#
