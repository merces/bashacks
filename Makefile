SRC=$(shell find '.' -type f -name '*.sh')
OUTFILE = ./bashacks.sh
STLANGUAGE=$(shell echo $(LANG) | cut -d \. -f1) 

all:
	echo -e '#!/bin/bash\n' > $(OUTFILE)
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
		echo -e '\n' >> $(OUTFILE); \
	done
	if [ $(STLANGUAGE) == "pt_BR" ] ; then \
		install man/pt_BR/bashacks.1 /usr/share/man/man1; \
	else \
		install man/en/bashacks.1 /usr/share/man/man1; \
	fi
	
clean:
	rm -f bashacks.sh
	rm -f /usr/share/man/man1/bashacks.1
