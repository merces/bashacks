SRC = `find src/ -type f -name 'bh_*.sh' | LC_ALL=C sort`
OUTFILE = bashacks.sh
BASHACKS = `pwd`/$(OUTFILE)

all:
	cat src/internal/bootstrap.sh > $(OUTFILE)
	for file in $(SRC); do \
		cat $$file >> $(OUTFILE); \
		echo >> $(OUTFILE); \
	done
	tr -d \\r < $(OUTFILE) > $(OUTFILE).tmp
	mv $(OUTFILE).tmp $(OUTFILE)

clean:
	rm -f bashacks.sh
