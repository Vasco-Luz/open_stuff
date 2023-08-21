# open_stuff


You need xschem installed and the open PDKS and ngspice, this only works in linux. you can use chatgpt to help if you are new to linux.

xschem: https://github.com/StefanSchippers/xschem install in this repository

Open PDKS:  https://github.com/efabless/volare.git Define PDK_ROOT in bashrc for the instalaion location of the PDK

ngspice: https://ngspice.sourceforge.io/ download and install the latest version,

then copy the xschemrc file in the description to the: /usr/local/share/xschem use mine xschmerc file only for gf180mcuC tecnology, for sky130 the xschemrc file in pdk works well work well, so if you want to use that tecnology just copy the xschemrc file to the location were xschem is installed. not the one inside the PDK.
install xterm xterms "links" ngspice to xschem

open the file with "xschem [filename]" and simulate
