SRC=$(shell find '.' -type f -name '*.sh')
OUTFILE = ./bashacks.sh

all:
	echo '#!/bin/bash\n' > $(OUTFILE)
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
		echo '\n' >> $(OUTFILE); \
	done

clean:
	rm -f bashacks.sh
