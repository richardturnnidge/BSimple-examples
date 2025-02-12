_asc2int:
    push ix
    ld ix, 0
    add ix, sp

    inc hl 
    ld a, (hl)      ; this will be 0 or an ascii char
    cp 0  
    jr z, @under10   ; was terminated after 1 byte

@over10:
    ld a, 10
    ret

@under10:
    dec hl
    ld a, (hl)      ; this will be 0 or an ascii char 
    sub 48          ; sub 48 fropm ascii to dec

    ld hl, 0
    ld l, a         ; return value of A in UHL's L

    ld sp, ix
    pop ix
    ret


