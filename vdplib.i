
; richard's custom commands

_vdp_textcolour:
  push ix
  ld ix, 0
  add ix, sp

  ld a, 17
  rst.lil $10

  ld a, (ix + 6)
  rst.lil $10

  ld sp, ix
  pop ix
  ret

_vdp_gfxcolour:
  push ix
  ld ix, 0
  add ix, sp

  ld a, 18
  rst.lil $10
  ld a, 0
  rst.lil $10

  ld a, (ix + 6)
  rst.lil $10

  ld sp, ix
  pop ix
  ret

_vdp_sendbyte:
  push ix
  ld ix, 0
  add ix, sp

  ld a, (ix + 6)
  rst.lil $10

  ld sp, ix
  pop ix
  ret


_vdp_plot:
  push ix
  ld ix, 0
  add ix, sp

  ld a, 25
  rst.lil $10
  ld a, 68
  rst.lil $10

  ld a, (ix + 6)
  rst.lil $10
  ld a, (ix + 7)
  rst.lil $10

  ld a, (ix + 9)
  rst.lil $10
  ld a, (ix + 10)
  rst.lil $10

  ld sp, ix
  pop ix
  ret


_vdp_lineto:
  push ix
  ld ix, 0
  add ix, sp

  ld a, 25
  rst.lil $10
  ld a, 5
  rst.lil $10

  ld a, (ix + 6)
  rst.lil $10

  ld a, (ix + 7)
  rst.lil $10

  ld a, (ix + 9)
  rst.lil $10
  ld a, (ix + 10)
  rst.lil $10

  ld sp, ix
  pop ix
  ret

_vdp_scaling:
  push ix
  ld ix, 0
  add ix, sp

  ld a, 23
  rst.lil $10
  ld a, 0
  rst.lil $10
  ld a, $C0
  rst.lil $10

  ld a, (ix + 6)
  rst.lil $10


  ld sp, ix
  pop ix
  ret

_vdp_cursor_mask:
  push ix
  ld ix, 0
  add ix, sp

  ld a, 23
  rst.lil $10
  ld a, 16
  rst.lil $10


  ld a, (ix + 6)
  rst.lil $10

  ld a, 254
  rst.lil $10

  ld sp, ix
  pop ix
  ret


; VDU 23, 0, &C0, n

;VDU 25, code, x; y;
; plot is 68
; drrawl line is 4/5