SRC = `find src/ -type f -name '*.sh'`
OUTFILE = bashacks.sh
BASHRCFILE = ~/.profile
BASHACKS = $(shell pwd)/$(OUTFILE)

all:
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
		echo >> $(OUTFILE); \
	done

install:
	[ -e $(OUTFILE) ] && \
		echo -e "\n[[ -e $(BASHACKS) ]] && source $(BASHACKS)" >> $(BASHRCFILE) \
	|| \
		echo -e "$(OUTFILE) not found. Try: make\n"

clean:
	rm -f bashacks.sh

uninstall:
	sed -i .bak "/bashacks\.sh/d" $(BASHRCFILE)
