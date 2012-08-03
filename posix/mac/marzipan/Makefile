TARGETS= \
	/var/at/tabs/polster \
	/var/at/tabs/root \
	/Users/polster/Documents/defaultzoom.css

install: preinstall $(TARGETS)

preinstall:
	@if [ `id -u` != 0 ]; then echo "Run make as superuser"; exit 1; fi
	@case `scutil --get ComputerName` in \
		marzipan*)	;; \
		*)		echo "Run this on marzipan"; exit 1;; \
	esac

/Users/polster/Documents/defaultzoom.css: defaultzoom.css
	cp -f $< $@
	chown polster $@

/var/at/tabs/root: crontab.root
	crontab crontab.root

/var/at/tabs/polster: crontab.polster
	su polster -c "crontab crontab.polster"
