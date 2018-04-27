# vim: set noet ts=2 sw=2:
SHELL=/bin/bash

.PHONY: all install uninstall

define check_if_root
	if [ "$$(id -u)" -ne 0 ]; then \
		echo "ERROR: Need root privileges. Run with sudo."; \
		exit; \
	fi
endef

define check_bash_version
	if [ "$${BASH_VERSINFO[0]}" -lt 4 ]; then \
		echo "ERROR: Need bash version 4 or superior."; \
		exit; \
	fi
endef

all:
	@echo "Nothing to do. Please, install with 'sudo make install' or uninstall with 'sudo make uninstall'."; \
	exit

install:
	@$(call check_if_root); \
  $(call check_bash_version); \
	find src/ -type f -exec cp "{}" /usr/local/bin/ \; \
	cp etc/* /usr/local/etc/; \
	chmod 0755 /usr/local/bin/bh_* /usr/local/etc/bashack.conf; \
	chown root: /usr/local/bin/bh_* /usr/local/etc/bashack.conf; \
	echo 'Installed!'
	
# FIXME: Left bashacks.conf and asm "cache" behind... Please, fix!
uninstall:
	@$(call check_if_root); \
	rm -f /usr/local/bin/bh_* /usr/local/etc/bashack.conf; \
	echo 'Uninstalled!'

