# vim: set noet ts=2 sw=2:

all:
	@echo "Nothing to do. Plase, install as 'sudo make install'."; \
	exit

install:
	@if [ "`whoami`" != 'root' ]; then \
		echo "ERROR: Need root privilege to install. Run as 'sudo make install'."; \
		exit; \
	fi; \
	find src/ -type f -exec cp "{}" /usr/local/bin/ \; \
	cp etc/* /usr/local/etc/; \
	chmod 0755 /usr/local/bin/bh_* /usr/local/etc/bashack.conf; \
	chown root: /usr/local/bin/bh_* /usr/local/etc/bashack.conf; \
	echo 'Installed!'
	
uninstall:
	@if [ "`whoami`" != 'root' ]; then \
		echo "ERROR: Need root privilege to install. Run as 'sudo make uninstall'."; \
		exit; \
	fi; \
	rm -f /usr/local/bin/bh_* /usr/local/etc/bashack.conf; \
	echo 'Uninstalled!'

