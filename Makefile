build: ulisp-arm/ulisp-arm.ino.uf2

ulisp-arm/ulisp-arm.ino.uf2: ulisp-arm/ulisp-arm.ino
	arduino-cli compile --no-color \
	  --output-dir ./ulisp-arm \
	  --board-options flash=2097152_1048576 \
	  --fqbn pico:rp2040:rpipico \
	  ulisp-arm

download: ulisp-arm/ulisp-arm.ino.uf2
	  arduino-cli upload \
	    --input-dir ./ulisp-arm/ \
	    --port /dev/ttyACM0 \
	    --fqbn pico:rp2040:rpipico
.PHONY: download

ulisp-arm/TAGS: ulisp-arm/ulisp-arm.ino
	etags --output=$@ $^
	find ~/Arduino/hardware/pico/rp2040/libraries/ -regex ".*\.\(cpp\|h\)" \
	  -exec etags --class-qualify --output=$@ --append '{}' \;

clean:
	-rm ulisp-arm/TAGS
	-rm ulisp-arm/ulisp-arm.ino.bin
	-rm ulisp-arm/ulisp-arm.ino.elf
	-rm ulisp-arm/ulisp-arm.ino.map
	-rm ulisp-arm/ulisp-arm.ino.uf2
.PHONY: clean
