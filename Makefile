SRC=$(shell find '.' -type f -name '*.sh')
OUTFILE = ./bashacks.sh

all:
	echo -e '#!/bin/bash\n' > $(OUTFILE)
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
		echo -e '\n' >> $(OUTFILE); \
	done

clean:
	rm -f bashacks.sh
