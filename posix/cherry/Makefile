TARGETS=\
	/home/polster/.bash_profile \
	/home/polster/.ssh/config \
	/etc/default/tftpd-hpa \
	/etc/exports \
	/home/polster/.bashrc \

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

/etc/exports: exports
	cp -f $< $@

/home/polster/.bashrc: dot-bashrc
	cp -f $< $@
	chmod u+rwx $@
	chown polster:polster $@

/home/polster/.bash_profile: dot-bash_profile
	cp -f $< $@
	chmod u+rwx $@
	chown polster:polster $@

/home/polster/.ssh/config: dot-ssh-config
	mkdir -p /home/polster/.ssh
	chown polster /home/polster/.ssh
	cp $< $@
	chown polster $@

/etc/default/tftpd-hpa: tftpd-hpa
	cp -f $< $@
	@service tftpd-hpa restart
