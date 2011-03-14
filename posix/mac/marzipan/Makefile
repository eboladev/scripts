TARGETS= \
	/var/at/tabs/polster \
	/Users/polster/.bash_profile \
	/var/at/tabs/root \

install: preinstall $(TARGETS)

preinstall:
	@if [ `id -u` != 0 ]; then echo "Run make as superuser"; exit 1; fi
	@case `scutil --get ComputerName` in \
		marzipan*)	;; \
		*)		echo "Run this on marzipan"; exit 1;; \
	esac

/var/at/tabs/root: crontab.root
	crontab crontab.root

/Users/polster/.bash_profile: polster.bash_profile
	cp -f polster.bash_profile $@
	chown polster $@

/var/at/tabs/polster: crontab.polster
	su polster -c "crontab crontab.polster"
