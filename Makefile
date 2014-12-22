SRC=$(shell find '.' -type f -name '*.sh')
OUTFILE = ./bashacks.sh
STLANGUAGE=$(shell echo $LANG | cut -d \. -f1) 

all:
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
		echo >> $(OUTFILE); \
	done

install:
	ifeq ($(STLANGUAGE), pt_BR)
		install man/pt_BR/bashacks.1 /usr/share/man/man1
	else
		install man/en/bashacks.1 /usr/share/man/man1
	endif
	
clean:
	rm -f bashacks.sh

uninstall:
	rm -f /usr/share/man/man1/bashacks.1