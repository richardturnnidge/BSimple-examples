
; richard's custom commands

_gpio_getport:
  push ix
  ld ix, 0
  add ix, sp

  ld a, (ix + 6) ; which port

  cp 'b'
  jr z, portB

  cp 'c'
  jr z, portC

  cp 'd'
  jr z, portD

  ld a, 255
  jr exitHere

portB:
  in0 a, ($9A) 
  jr exitHere

portC:
  in0 a, ($9E) 
  jr exitHere

portD:
  in0 a, ($A2) 
  jr exitHere

exitHere:
  ld hl, 0
  ld l, a

  ld sp, ix
  pop ix
  ret

