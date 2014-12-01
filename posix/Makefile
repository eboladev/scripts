# Makefile for common Posix scripts

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
	/etc/davfs2/davfs2.conf \
	/etc/davfs2/secrets \
	/usr/local/bin/gmail-mailto \
	/usr/local/bin/besthost \
	/usr/local/bin/startsynergy \
	/usr/local/bin/exportmusic \
	/usr/local/bin/buildterm \
	~polster/.gitignore-global \
	/usr/local/bin/bin2c \
	~polster/.vimrc \
	~polster/.vim/colors/wombat.vim \
	~polster/.vim/colors/blueshift.vim \
	/usr/local/bin/mktag \
	/usr/local/bin/rmtag \
	/usr/local/bin/askpass \
	~polster/backup \
	~polster/.netrc \
	~polster/.screenrc \
	~polster/.vim/ftdetect/markdown.vim \
	~polster/.vim/syntax/markdown.vim \
	/usr/local/bin/exportitunes \
	/etc/machine-info \
	/usr/local/bin/clip \

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
	/usr/local/bin/runrvplayer \
	/usr/share/mime-info/extra.mime \
	/etc/cron.hourly/mountall \
	
DIRS = nolove mac berry greenwave

install: preinstall $(OTHERS)
	-for d in $(DIRS); do (cd $$d; make install); done

~polster/.netrc: netrc-polster /etc/secmaemo /etc/secgithub /etc/secmillionmoves /etc/secquantisproject
	rm -f $@
	sed s/secmaemo/`cat /etc/secmaemo`/g $< | \
	sed s/secgithub/`cat /etc/secgithub`/g | \
	sed s/secmillionmoves/`cat /etc/secmillionmoves`/g | \

/usr/local/bin/clip: clip
	cp -f $< $@
	chmod a+rx $@

/etc/machine-info: update-machine-info
	hostname -s > /etc/machine-info

~polster/.netrc: netrc-polster /etc/secmaemo /etc/secmillionmoves /etc/secquantisproject /etc/secgithub
	rm -f $@
	sed s/secmaemo/`cat /etc/secmaemo`/g $< | \
	sed s/secmillionmoves/`cat /etc/secmillionmoves`/g | \
	sed s/secgithub/`cat /etc/secgithub`/g | \
	sed s/secquantisproject/`cat /etc/secquantisproject`/g > $@
	chown polster $@
	chmod og-rwx $@

~polster/backup: backup-dir
	-mkdir ~polster/backup
	-chown -R polster ~polster/backup

~polster/.vim/ftdetect/markdown.vim: ftdetect.markdown.vim
	-mkdir -p ~polster/.vim/ftdetect
	-cp -f $< $@
	-chown -R polster ~polster/.vim

~polster/.vim/syntax/markdown.vim: syntax.markdown.vim
	-mkdir -p ~polster/.vim/syntax
	-cp -f $< $@
	-chown -R polster ~polster/.vim

~polster/.vim/colors/blueshift.vim: blueshift.vim
	-mkdir -p ~polster/.vim/colors
	-cp -f $< $@
	-chown -R polster ~polster/.vim

~polster/.vim/colors/wombat.vim: wombat.vim
	-mkdir -p ~polster/.vim/colors
	-cp -f $< $@
	-chown -R polster ~polster/.vim

~polster/.vimrc: dot-vimrc
	-mkdir -p ~polster/.vim/doc ~polster/backup
	-touch ~polster/.vim/doc/empty
	-cp -f $< $@
	-chown polster $@

~polster/.screenrc: dot-screenrc
	-cp -f $< $@
	-chown polster $@

/usr/local/bin/askpass: askpass
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/bin2c: bin2c
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/mktag: mktag
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/rmtag: rmtag
	cp -f $< $@
	chmod a+rx $@

~polster/.gitignore-global: dot-gitignore-global
	-cp -f $< $@
	-chown polster $@
	-su polster -c "git config --global core.excludesfile "$@

/usr/local/bin/buildterm: buildterm
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/exportitunes: exportitunes
	cp exportitunes /usr/local/bin
	chmod a+rx /usr/local/bin/exportitunes

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

/etc/davfs2/secrets: secrets /etc/sechom
	mkdir -p /etc/davfs2
	rm -f $@
	sed -e s/sechom/`cat /etc/sechom`/g $< > $@
	chmod og-rwx $@

/etc/davfs2/davfs2.conf: davfs2.conf
	mkdir -p /etc/davfs2
	cp -f davfs2.conf $@

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
	@case "`uname -s`" in \
	  Linux|Darwin|Cygwin|CYGWIN*) ;; \
	  *) echo "Can't install on non-Posix system"; exit 1;; \
	esac
	mkdir -p /usr/local/bin
	chmod a+rx /usr/local/bin
