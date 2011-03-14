TARGETS=\
	/home/polster/.bash_profile \
	/home/polster/.netrc \

install: preinstall $(TARGETS)

preinstall:
	@if id | grep -iqv root; then \
	  echo "Run this as an root"; \
	  exit 1; \
	fi
	@case `hostname -s` in \
		maemo-vm*)	;; \
		*)		echo "Run this on maemo-vm"; exit 1;; \
	esac

/home/polster/.netrc: netrc-polster
	cp -f $< $@
	chown polster:polster $@
	chmod u+r,og-rwx $@

/home/polster/.bash_profile: polster.bash_profile
	cp -f polster.bash_profile $@
	chmod u+rwx $@
	chown polster:polster $@
