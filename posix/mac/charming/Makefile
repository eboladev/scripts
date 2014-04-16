TARGETS= \
	/var/at/tabs/polster \
	/var/at/tabs/root \

install: preinstall $(TARGETS)

preinstall:
	@if [ `id -u` != 0 ]; then echo "Run make as superuser"; exit 1; fi
	@case `scutil --get ComputerName` in \
		charming*)	;; \
		*)		echo "Run this on charming"; exit 1;; \
	esac

/var/at/tabs/root: crontab.root
	crontab crontab.root

/var/at/tabs/polster: crontab.polster
	su polster -c "crontab crontab.polster"
