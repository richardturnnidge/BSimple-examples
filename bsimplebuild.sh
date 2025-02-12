#!bin/bash
# UPDATED VERSION requires 'srec_cat' to be installed

echo -ne "Compile and Build script for AgonLight2 & Console8\nBSimple file:" $1 "\n"

ASMfile=$(basename $1 .bs).s
binfile=$(basename $1 .bs).bin
hexfile=$(basename $1 .bs).hex

echo -ne "--------------------------------------------------\n"

# make the ASM file
echo -ne "Starting BSimple Compiler...\n"

# get compiled
/usr/local/bin/bsimple "$1"

echo -ne "Created ASM file:" $ASMfile "\n"
echo -ne "--------------------------------------------------\n"

# make the bin file
echo -ne "Starting ez80asm...\n"

# just to get version printed
/usr/local/bin/ez80asm-2_0 "-v"

# now to get assembled
/usr/local/bin/ez80asm-2_0 "$ASMfile" "-l"

echo -ne "Created ez80asm v2.0 BIN file:" $binfile "\n"

echo -ne "--------------------------------------------------\n"
echo -ne "Making emulator local copy: $binfile\n"
cp "$binfile" "../../fab-agon-emulator-v0.9.85-macos/sdcard/" 

echo -ne "--------------------------------------------------\n"
echo -ne "Making HEX file:" $hexfile "\n"

# make the hex file
srec_cat "$binfile" "-binary"  "-offset" "0x40000" "-o" "$hexfile" "-intel" 

echo -ne "--------------------------------------------------\n"
echo -ne "Sending over serial to Agon...\n"
# send the hex file over serial port

# Console8
# python3 send.py "$hexfile" "/dev/tty.usbserial-02B1CCEA"

# Agon Light 2
python3 send.py "$hexfile" "/dev/tty.usbserial-1130"

# over USB serial
#python3 send.py "$hexfile" "/dev/tty.usbserial-0001"

echo -ne "--------------------------------------------------\n"

# NOTE: /dev/cu.usbserial-02B1CCEA, /dev/tty.usbserial-02B1CCEA
# /dev/tty.usbserial-0001
# Requires: ez80asm, python3, pyserial
# Run in same folder as source: bin2hex.py, send.py


