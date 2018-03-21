default:
	@echo "No targets specified."
%.cpp.out: %.cpp
	g++ -g -o $@ $<
%.c.out: %.c
	gcc -g -o $@ $< -lrt -lreadline
clean:
	rm -rf *.out
%.py.out: %.py
	cp $< $@
	chmod +x $@
%.pl.out: %.pl
	cp $< $@
	chmod +x $@
%.sh.out: %.sh
	cp $< $@
	chmod +x $@
%.s.out: %.o
	arm-none-eabi-ld -o $@ $<
%.o: %.s
	arm-none-eabi-as -g -o $<.o
%.m.out: %.m
	cp $< $@
	chmod +x $@
