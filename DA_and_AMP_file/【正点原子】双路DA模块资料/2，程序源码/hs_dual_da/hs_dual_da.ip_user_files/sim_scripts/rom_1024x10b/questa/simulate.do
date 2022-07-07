onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rom_1024x10b_opt

do {wave.do}

view wave
view structure
view signals

do {rom_1024x10b.udo}

run -all

quit -force
