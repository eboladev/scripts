TARGETS= \
	/var/at/tabs/polster \
	/Users/polster/.bash_profile \
	/var/at/tabs/root \
	/usr/local/bin/vpn-connect.sh \
	/Applications/Internet/vpn-connect.app \

install: preinstall $(TARGETS)

preinstall:
	@if [ `id -u` != 0 ]; then echo "Run make as superuser"; exit 1; fi
	@case `scutil --get ComputerName` in \
		maczok*)	;; \
		*)		echo "Run this on maczok"; exit 1;; \
	esac

/Applications/Internet/vpn-connect.app: vpn-connect.applescript vpn-connect.icns
	-rm -rf /Applications/Internet/vpn-connect.app
	mkdir -p /Applications/Internet
	osacompile -o /Applications/Internet/vpn-connect.app \
	  vpn-connect.applescript
	cp -f vpn-connect.icns /Applications/Internet/vpn-connect.app/Contents/Resources/applet.icns
	touch /Applications/Internet/vpn-connect.app/Contents/Info.plist

/usr/local/bin/vpn-connect.sh: vpn-connect.sh
	cp -f $< $@
	chmod a+rx $@

/var/at/tabs/root: crontab.root
	crontab crontab.root

/Users/polster/.bash_profile: polster.bash_profile
	cp -f polster.bash_profile $@
	chown polster $@

/var/at/tabs/polster: crontab.polster
	su polster -c "crontab crontab.polster"
