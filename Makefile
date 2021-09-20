SRC = $(shell find src/ -type f -name '*.sh')
OUTFILE = bashacks.sh
BASHRCFILE = ~/.bash_profile
BASHACKS = $(shell pwd)/$(OUTFILE)

all:
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
		echo >> $(OUTFILE); \
	done

install:

ifeq ("$(wildcard $(OUTFILE))","")
	$(error $(OUTFILE) not found. Try: make)
endif	

	echo -e "\n[[ -e $(BASHACKS) ]] && source $(BASHACKS)" >> $(BASHRCFILE)
	
clean:
	rm -f bashacks.sh

uninstall:
	sed -i .bak "/bashacks\.sh/d" $(BASHRCFILE)
