.org $8000
start:
LDX #$FF
TXS
LDX #0

GameLoop:
;Game loop start

LDY $4000

Down_input:
CPY #02 ;ComPare Y register
BNE Up_input ;Branch on Not Equal
TXA ;Transfer X to A
CLC ;CLear Carry
ADC #16 ;add with carry
STX $00
TAX ;Transfer A to X
JSR Print_pixel

Up_input: 
CPY #01 
BNE Left_input
TXA
SBC #16 
STX $00
TAX
JSR Print_pixel

Left_input: 
CPY #04 
BNE Right_input
TXA
SBC #1 
STX $00
TAX
JSR Print_pixel

Right_input: 
CPY #08 
BNE else
TXA
CLC
ADC #1 
STX $00
TAX
JSR Print_pixel

else:
NOP

JMP GameLoop
;Game loop End

Print_pixel:
LDA #1
STA $0200, X
LDA #0
JSR Clear_pixel
RTS

Clear_pixel:
LDY $00
STA $0200,Y
LDY #00
RTS

.goto $FFFA
.dw start ; non maskable
.dw start ; reset
.dw start ; interrupt