SRC = $(shell find src/ -type f -name '*.sh')
OUTFILE = bashacks.sh
BASHRCFILE = /etc/profile.d/bashacks_init.sh

OS = $(shell uname -s)
ifeq ($(OS), Darwin)
	BASHRCFILE = /etc/bashrc
endif

all:
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
		echo >> $(OUTFILE); \
	done

install:

ifeq ("$(wildcard $(OUTFILE))","")
	$(error $(OUTFILE) not found. Try: make)
endif	

	echo 'source $(shell pwd)/$(OUTFILE)' >> $(BASHRCFILE)
	
clean:
	rm -f bashacks.sh

uninstall:
	sed -i .bak '/bashacks/d' $(BASHRCFILE)
