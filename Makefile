APP = rv2llvm
OUT = ./build

.PHONY: all build clean

build:
	go build -o ${OUT}/${APP}

clean:
	rm ${OUT}/${APP}