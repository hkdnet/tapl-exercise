default: all

all: bin/Ex3.2.4 bin/Ex7.1

bin/Ex3.2.4: Ex3.2.4.hs
	ghc -o bin/Ex3.2.4 Ex3.2.4.hs
bin/Ex7.1: Ex7.1.hs
	ghc -o $@ Ex7.1.hs

.PHONY: all default
