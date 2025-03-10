; -------------------
; snake game VDP commands
; -------------------

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

; -------------------

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


; -------------------
; keyboard routines
; -------------------

_kbd_init:
    push ix
    ld a, __mos_getkbmap
    rst.lil $08
    ld (__kbmap_addr), ix
    pop ix
    ret

; -------------------

_kbd_check_code:
  push ix
  ld ix,0
  add ix,sp

  ld hl,-3
  add hl,sp
  ld sp,hl

  ld hl,(__kbmap_addr)
  ld de,(ix+6)
  add hl,de
  ld (ix+-3),hl
  lea hl,ix+-3
  ld hl,(hl)
  ld hl,(hl)
  ld de,(ix+9)
  call __and
  ld de,0
  or a
  sbc hl,de
  ld hl,-1
  jr nz,_input001
  ld hl,0
_input001:
  jp _kbd_check_code_end
_kbd_check_code_end:
  ld sp,ix
  pop ix
  ret

; -------------------

_kbd_is_esc:
  push ix
  ld ix,0
  add ix,sp
  push de
  ld hl,1
  push hl
  ld hl,14
  push hl
  call _kbd_check_code
  ex de,hl
  ld hl,6
  add hl,sp
  ld sp,hl
  ex de,hl
  pop de
  jp _kbd_is_esc_end
_kbd_is_esc_end:
  ld sp,ix
  pop ix
  ret

; -------------------

_kbd_is_A:
  push ix
  ld ix,0
  add ix,sp
  push de
  ld hl,2
  push hl
  ld hl,8
  push hl
  call _kbd_check_code
  ex de,hl
  ld hl,6
  add hl,sp
  ld sp,hl
  ex de,hl
  pop de
  jp _kbd_is_A_end
_kbd_is_A_end:
  ld sp,ix
  pop ix
  ret

; -------------------

_kbd_is_Q:
  push ix
  ld ix,0
  add ix,sp
  push de
  ld hl,1
  push hl
  ld hl,2
  push hl
  call _kbd_check_code
  ex de,hl
  ld hl,6
  add hl,sp
  ld sp,hl
  ex de,hl
  pop de
  jp _kbd_is_Q_end
_kbd_is_Q_end:
  ld sp,ix
  pop ix
  ret

; -------------------

_kbd_is_O:
  push ix
  ld ix,0
  add ix,sp
  push de
  ld hl,64
  push hl
  ld hl,6
  push hl
  call _kbd_check_code
  ex de,hl
  ld hl,6
  add hl,sp
  ld sp,hl
  ex de,hl
  pop de
  jp _kbd_is_O_end
_kbd_is_O_end:
  ld sp,ix
  pop ix
  ret

; -------------------

_kbd_is_P:
  push ix
  ld ix,0
  add ix,sp
  push de
  ld hl,128
  push hl
  ld hl,6
  push hl
  call _kbd_check_code
  ex de,hl
  ld hl,6
  add hl,sp
  ld sp,hl
  ex de,hl
  pop de
  jp _kbd_is_P_end
_kbd_is_P_end:
  ld sp,ix
  pop ix
  ret

; -------------------

_kbd_is_S:
  push ix
  ld ix,0
  add ix,sp
  push de
  ld hl,2
  push hl
  ld hl,10
  push hl
  call _kbd_check_code
  ex de,hl
  ld hl,6
  add hl,sp
  ld sp,hl
  ex de,hl
  pop de
  jp _kbd_is_S_end
_kbd_is_S_end:
  ld sp,ix
  pop ix
  ret

; -------------------

__kbmap_addr:
    dl 0

