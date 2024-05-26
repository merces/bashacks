SRC = `find src/ -type f -name '*.sh'|LC_ALL=C sort`
OUTFILE = bashacks.sh
BASHRCFILE = ~/.profile
BASHACKS = `pwd`/$(OUTFILE)

all:
	>$(OUTFILE)
	for file in $(SRC); do \
		(echo '#!/bin/bash' && cat $$file) >> $(OUTFILE); \
		echo >> $(OUTFILE); \
	done
	tr -d \\r < $(OUTFILE) > $(OUTFILE).tmp
	mv $(OUTFILE).tmp $(OUTFILE)

install:
	[ -e $(OUTFILE) ] && \
		echo -e "\n[ -e $(BASHACKS) ] && . $(BASHACKS)" >> $(BASHRCFILE) \
	|| \
		echo -e "$(OUTFILE) not found. Try: make\n"

clean:
	rm -f bashacks.sh

uninstall:
	sed -i .bak "/bashacks\.sh/d" $(BASHRCFILE)
