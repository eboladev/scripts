TARGETS=\
	/home/polster/.bash_profile \
	/home/polster/.ssh/config \
	/etc/default/tftpd-hpa \
	/etc/exports \
	/home/polster/.minirc.dfl \
	/home/polster/.bashrc \

install: preinstall $(TARGETS)

preinstall:
	@if id | grep -iqv root; then \
	  echo "Run this as an root"; \
	  exit 1; \
	fi
	@case `hostname -s` in \
		akosthink*)	;; \
		*)		echo "Run this on akosthink"; exit 1;; \
	esac

/home/polster/.bashrc: dot-bashrc
	cp -f $< $@
	chown polster:polster $@

/home/polster/.minirc.dfl: dot-minirc.dfl
	cp -f $< $@
	chown polster:polster $@

/etc/exports: exports
	cp -f $< $@
	mkdir -p /nfsroot
	chown polster:polster /nfsroot

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
