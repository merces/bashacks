SRC = `find src/ -type f -name 'bh_*.sh' | LC_ALL=C sort`
OUTFILE = bashacks.sh
BASHRCFILE = ~/.profile
BASHACKS = `pwd`/$(OUTFILE)

all:
	cat src/internal/bootstrap.sh > $(OUTFILE)
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
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
