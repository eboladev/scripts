TARGETS=\
	/home/polster/.bash_profile \

install: preinstall $(TARGETS)

preinstall:
	@if id | grep -iqv root; then \
	  echo "Run this as an root"; \
	  exit 1; \
	fi
	@case `hostname -s` in \
		cherry*)	;; \
		*)		echo "Run this on cherry"; exit 1;; \
	esac

/home/polster/.bash_profile: polster.bash_profile
	cp -f polster.bash_profile $@
	chmod u+rwx $@
	chown polster:polster $@

/home/polster/.ssh/config: dot-ssh-config
	mkdir -p /home/polster/.ssh
	chown polster /home/polster/.ssh
	cp $< $@
	chown polster $@
