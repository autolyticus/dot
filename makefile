default:
	@echo "No targets specified."
%.cpp.out: %.cpp
	g++ -fopenmp -g -o $@ $<
%.go.out: %.go
	go build -o $@
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
%.hs.out: %.hs
	ghc -dynamic -outputdir /tmp/$@/ -o $@ $<
%.coffee.out: %.coffee
	cp $< $@
	chmod +x $@
%.nim.out: %.nim
	nim c -d:ssl -d:threads --nimcache:.nimcache --parallelbuild:0 --debugger:native -o:"$@" $<
%.clj.out: %.clj
	echo -e "#!/usr/bin/sh\nlein run" > $@
	chmod +x $@
%.exs.out: %.exs
	cp $< $@
	chmod +x $@
