onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Multi_Cycle_TB/clk
add wave -noupdate /MIPS_Multi_Cycle_TB/reset
add wave -noupdate /MIPS_Multi_Cycle_TB/RegDst
add wave -noupdate /MIPS_Multi_Cycle_TB/ALUSrcA
add wave -noupdate /MIPS_Multi_Cycle_TB/PCSrc
add wave -noupdate /MIPS_Multi_Cycle_TB/PCWrite
add wave -noupdate /MIPS_Multi_Cycle_TB/MemWrite
add wave -noupdate /MIPS_Multi_Cycle_TB/IorD
add wave -noupdate /MIPS_Multi_Cycle_TB/IRWrite
add wave -noupdate /MIPS_Multi_Cycle_TB/MomtoReg
add wave -noupdate /MIPS_Multi_Cycle_TB/RegWrite
add wave -noupdate /MIPS_Multi_Cycle_TB/ALUControl
add wave -noupdate /MIPS_Multi_Cycle_TB/ALUSrcB
add wave -noupdate -radix hexadecimal /MIPS_Multi_Cycle_TB/Simulacion
add wave -noupdate -radix hexadecimal /MIPS_Multi_Cycle_TB/pcounter
add wave -noupdate -radix hexadecimal /MIPS_Multi_Cycle_TB/instr
add wave -noupdate -radix hexadecimal /MIPS_Multi_Cycle_TB/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {334 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {19 ps}
