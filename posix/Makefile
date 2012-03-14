# Makefile for common Linux scripts

OTHERS=\
	/usr/local/bin/runkvt \
	/usr/local/bin/remsh \
	/usr/local/bin/tolatin2 \
	/usr/local/bin/used \
	/usr/local/bin/playm3u \
	/usr/local/bin/viewword \
	/usr/local/bin/viewman \
	/usr/local/bin/xroot \
	/etc/bash_completion.d/sys \
	/etc/hosts \
	/usr/local/bin/dumppin \
	/usr/local/bin/mountmyall \
	/usr/local/bin/mediatomb-transcode-audio \
	/usr/local/bin/mediatomb-transcode-video \
	/etc/init.d/umountcifs \
	/etc/issue.net \
	/etc/resolv.conf.nokia \
	/usr/local/bin/nokiaup \
	/usr/local/bin/nokiadown \
	/etc/vpnc/vpnc-aruba.conf \
	/etc/davfs2/davfs2.conf \
	/etc/davfs2/secrets \
	/usr/local/bin/gmail-mailto \
	/usr/local/bin/besthost \
	/usr/local/bin/startsynergy \
	/usr/local/bin/exportmusic \
	/usr/local/bin/buildterm \
	~polster/.gitignore-global \
	/usr/local/bin/findnokiaperson \
	/usr/local/bin/bin2c \
	~polster/.vimrc \
	~polster/.vim/colors/wombat.vim \
	/usr/local/bin/mktag \
	/usr/local/bin/rmtag \

ONHOLD=\
	crco \
	crci \
	saveconfig \
	b \
	runminicom \
	soundinstall \
	playeffect \
	runxpool \
	playsnd \
	xlogoff \
	viewmime \
	watchmail \
	/usr/local/bin/runrvplayer \
	/usr/share/mime-info/extra.mime \
	/etc/cron.hourly/mountall \
	
DIRS = bovi nolove maemo-vm mac

install: preinstall $(OTHERS)
	-for d in $(DIRS); do (cd $$d; make install); done

~polster/.vim/colors/wombat.vim: wombat.vim
	mkdir -p ~polster/.vim/colors
	cp -f $< $@
	chown -R polster ~polster/.vim

~polster/.vimrc: dot-vimrc
	mkdir -p ~polster/.vim/doc
	touch ~polster/.vim/doc/empty
	cp -f $< $@
	chown polster $@

/usr/local/bin/bin2c: bin2c
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/mktag: mktag
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/rmtag: rmtag
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/findnokiaperson: findnokiaperson
	cp -f $< $@
	chmod a+rx $@

~polster/.gitignore-global: dot-gitignore-global
	cp -f $< $@
	chown polster $@
	su polster -c "git config --global core.excludesfile "$@

/usr/local/bin/buildterm: buildterm
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/exportmusic: exportmusic
	cp exportmusic /usr/local/bin
	chmod a+rx /usr/local/bin/exportmusic

/usr/local/bin/startsynergy: startsynergy
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/besthost: besthost
	cp -f besthost $@
	chmod a+rx $@

/usr/local/bin/gmail-mailto: gmail-mailto
	cp -f gmail-mailto $@
	chmod a+rx $@

/etc/davfs2/secrets: secrets /etc/secnok /etc/sechom
	mkdir -p /etc/davfs2
	rm -f $@
	sed -e s/secnok/`cat /etc/secnok`/g -e s/sechom/`cat /etc/sechom`/g $< \
	  > $@
	chmod og-rwx $@

/etc/davfs2/davfs2.conf: davfs2.conf
	mkdir -p /etc/davfs2
	cp -f davfs2.conf $@

/etc/vpnc/vpnc-aruba.conf: vpnc-aruba.conf /etc/secvpncarubagrp /etc/secvpncarubapwd
	mkdir -p /etc/vpnc
	sed -e s/secvpncarubagrp/`cat /etc/secvpncarubagrp`/g \
	  -e s/secvpncarubapwd/`cat /etc/secvpncarubapwd`/g $< > $@
	cp -f $< $@
	chmod u+r,og-rw $@

/etc/vpnc/vpnc-nokia-espoo.conf: vpnc-nokia-espoo.conf
	mkdir -p /etc/vpnc
	cp -f $< $@
	chmod u+r,og-rw $@

/etc/vpnc/vpnc-nokia-dallas.conf: vpnc-nokia-dallas.conf
	mkdir -p /etc/vpnc
	cp -f $< $@
	chmod u+r,og-rw $@

/usr/local/bin/nokiadown: nokiadown
	cp -f nokiadown /usr/local/bin
	chmod a+rx /usr/local/bin/nokiadown

/usr/local/bin/nokiaup: nokiaup
	cp -f nokiaup /usr/local/bin
	chmod a+rx /usr/local/bin/nokiaup

/etc/resolv.conf.nokia: resolv.conf.nokia
	cp -f resolv.conf.nokia $@
	chmod a+r $@

/etc/issue.net: issue.net
	cp issue.net $@
	chmod a+r $@

/etc/init.d/umountcifs: umountcifs
	mkdir -p /etc/init.d
	cp -f umountcifs /etc/init.d
	chmod a+rx /etc/init.d/umountcifs
	if test -d /etc/rc0.d; then \
	  for i in 0 1 2 3 4 5 6; do \
	    ln -sf /etc/init.d/umountcifs /etc/rc$$i.d/K12umountcifs; \
	  done; \
	fi

/usr/local/bin/mediatomb-transcode-audio: mediatomb-transcode-audio
	cp mediatomb-transcode-audio /usr/local/bin
	chmod a+rx /usr/local/bin/mediatomb-transcode-audio

/usr/local/bin/mediatomb-transcode-video: mediatomb-transcode-video
	cp mediatomb-transcode-video /usr/local/bin
	chmod a+rx /usr/local/bin/mediatomb-transcode-video

/etc/cron.hourly/mountmyall: mountmyall
	mkdir -p /etc/cron.hourly
	cp -f $< $@
	chmod ug+rx,o-rwx $@

/usr/local/bin/mountmyall: mountmyall
	cp -f $< $@
	chmod u+rx,og-rwx $@

/usr/local/bin/dumppin: dumppin
	cp -f dumppin /usr/local/bin
	chmod a+rx /usr/local/bin/dumppin

/etc/hosts: hosts
	cp -f hosts /etc
	chmod a+r /etc/hosts

/etc/bash_completion.d/sys: sys.comp
	mkdir -p /etc/bash_completion.d
	cp -f sys.comp /etc/bash_completion.d/sys
	chmod a+rx /etc/bash_completion.d/sys

/usr/local/bin/xroot: xroot
	cp -f xroot /usr/local/bin
	chmod a+rx /usr/local/bin/xroot

/usr/share/mime-info/extra.mime: extra.mime
	mkdir -p /usr/share/mime-info
	cp -f extra.mime /usr/share/mime-info

/usr/local/bin/viewman: viewman
	cp -f viewman /usr/local/bin
	chmod a+rx /usr/local/bin/viewman

/usr/local/bin/viewword: viewword
	cp -f viewword /usr/local/bin
	chmod a+rx /usr/local/bin/viewword

/usr/local/bin/playm3u: playm3u
	cp -f playm3u /usr/local/bin
	chmod a+x /usr/local/bin/playm3u

/usr/local/bin/used: used
	cp -f used /usr/local/bin
	chmod a+x /usr/local/bin/used

/usr/local/bin/tolatin2: tolatin2
	cp -f tolatin2 /usr/local/bin
	chmod a+x /usr/local/bin/tolatin2

/usr/local/bin/runrvplayer: runrvplayer
	cp -f runrvplayer /usr/local/bin
	chmod a+x /usr/local/bin/runrvplayer

/usr/local/bin/remsh: remsh
	cp -f remsh /usr/local/bin; chmod a+x /usr/local/bin/remsh

/usr/local/bin/runkvt: runkvt
	cp -f runkvt /usr/local/bin; chmod a+x /usr/local/bin/runkvt

preinstall: 
	@chmod a+rx ../checknonroot
	@if sh -c ../checknonroot; then echo "Run make as root"; exit 1; fi
	@if [ `uname` != "Linux" -a `uname` != "Darwin" -a `uname -s` != "Cygwin" ]; then \
	  echo "Can't install this on non-Posix systems"; \
	  exit 1; \
	fi
	mkdir -p /usr/local/bin
	chmod a+rx /usr/local/bin
