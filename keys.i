
; richard's custom commands

_keys_getlast:
  push ix
  ld ix, 0
  add ix, sp

  push ix

  ; my code

  ld a, $08
  rst.lil $08
  ld a, (ix + 5) ; key_ascii

  ld hl, 0
  ld l, a

  ; - end 

  pop ix

  ld sp, ix
  pop ix
  ret

