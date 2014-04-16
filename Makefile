# Makefile for common UNIX scripts

ALL=\
	/etc/profile \
	/etc/bashrc

SKIP = \
	/usr/local/bin/re \
	/usr/local/bin/darken \
	/usr/local/bin/tcltrim \
	/usr/local/bin/tclsq \
	/usr/local/bin/tkrmt \
	/usr/local/bin/xtail \
	/usr/local/bin/tmore \
	/usr/local/bin/viewamipro \
	/usr/local/bin/t2p \
	/usr/local/bin/buttons \
	/usr/local/bin/sskeygen \
	/usr/local/bin/tcolor \
	/usr/local/bin/fixdisp \
	/usr/share/xemacs/site-lisp/tcl.el \
	/usr/share/xemacs/site-lisp/brief.el \
	/usr/share/xemacs/site-lisp/backup.el \
	/usr/local/bin/excvs \
	/usr/local/bin/cvsupdate \
	/usr/local/bin/mh2ns \
	/usr/local/bin/tkfontsel \
	/usr/local/bin/tkres \
	/usr/local/bin/faxit \
	/usr/local/bin/getimages \
	/usr/local/bin/todosname \
	/usr/local/bin/wakeupmail \
	/usr/local/bin/runvnc \
	/usr/local/bin/runvmware \
	/usr/local/bin/tolatin2 \
	/usr/local/bin/tofile \
	/usr/local/bin/runtgif \
	/usr/local/bin/rehu \
	/usr/local/bin/pydoc \
	/etc/mime.types \
	/etc/shells
	
DIRS = posix

install: preinstall $(ALL)
	-for d in $(DIRS); do (cd $$d; $(MAKE) install); done

preinstall:
	@if mkdir /etc/x; then \
	    rmdir /etc/x; \
	else \
	    echo "Run make as root"; \
	    exit 1; \
	fi

/etc/bashrc: bashrc
	cp -f bashrc /etc/bashrc
	chmod a+rx /etc/bashrc

/usr/local/bin/bogofix: bogofix
	cp -f bogofix /usr/local/bin/bogofix
	chmod a+rx /usr/local/bin/bogofix

/usr/local/bin/pydoc: pydoc
	cp -f pydoc /usr/local/bin
	chmod a+x /usr/local/bin/pydoc

/usr/local/bin/rehu: rehu
	cp -f rehu /usr/local/bin
	chmod a+x /usr/local/bin/rehu

/usr/local/bin/runtgif: runtgif
	cp -f runtgif /usr/local/bin/runtgif
	chmod a+x /usr/local/bin/runtgif

/usr/local/bin/tofile: tofile
	cp -f tofile /usr/local/bin/tofile
	chmod a+x /usr/local/bin/tofile

/usr/local/bin/tolatin2: tolatin2
	cp -f tolatin2 /usr/local/bin/tolatin2
	chmod a+x /usr/local/bin/tolatin2

/usr/local/bin/runvmware: runvmware
	cp -f runvmware /usr/local/bin/runvmware
	chmod a+x /usr/local/bin/runvmware

/etc/profile: profile
	cp -f profile /etc/profile
	chmod a+rx /etc/profile
	-rm -f /etc/bash.profile

/etc/shells: shells
	cp -f shells /etc/shells

/usr/local/bin/runvnc: runvnc
	cp -f runvnc /usr/local/bin/runvnc
	chmod a+x /usr/local/bin/runvnc

/usr/local/bin/wakeupmail: wakeupmail
	cp -f wakeupmail /usr/local/bin
	chmod a+x /usr/local/bin/wakeupmail

/usr/local/bin/todosname: todosname
	cp -f todosname /usr/local/bin/todosname
	chmod a+x /usr/local/bin/todosname

/usr/local/bin/getimages: getimages
	cp -f getimages /usr/local/bin/getimages
	chmod a+x /usr/local/bin/getimages

/usr/local/bin/faxit: faxit
	cp -f faxit /usr/local/bin/faxit
	chmod a+rx /usr/local/bin/faxit

/usr/local/bin/tkres: tkres
	cp -f tkres /usr/local/bin
	chmod a+x /usr/local/bin/tkres

/etc/mime.types: mime.types
	cp -f mime.types /etc/mime.types

/usr/local/bin/tkfontsel: tkfontsel
	cp -f tkfontsel /usr/local/bin; chmod a+x /usr/local/bin/tkfontsel

/usr/local/bin/mh2ns: mh2ns
	cp -f mh2ns /usr/local/bin; chmod a+x /usr/local/bin/mh2ns

/usr/local/bin/cvsupdate: cvsupdate
	cp -f cvsupdate /usr/local/bin/cvsupdate
	chmod a+x /usr/local/bin/cvsupdate

/usr/local/bin/excvs: excvs
	cp -f excvs /usr/local/bin
	chmod a+rx /usr/local/bin/excvs

$(HOME)/.signature: signature.polster
	su polster -c "cp -f signature.polster $(HOME)/.signature"

/usr/local/bin/fixdisp: fixdisp
	cp -f fixdisp /usr/local/bin; chmod a+x /usr/local/bin/fixdisp

/usr/share/xemacs/site-lisp/tcl.el: tcl.el
	mkdir -p /usr/share/xemacs/site-lisp
	-cp -f tcl.el /usr/share/xemacs/site-lisp/tcl.el
	-cd /usr/share/xemacs/site-lisp; \
	  xemacs -batch -eval "(byte-compile-file \"tcl.el\")" 2>/dev/null

/usr/share/xemacs/site-lisp/brief.el: brief.el
	mkdir -p /usr/share/xemacs/site-lisp
	-cp -f brief.el /usr/share/xemacs/site-lisp/brief.el
	-cd /usr/share/xemacs/site-lisp; \
	  xemacs -batch -eval "(byte-compile-file \"brief.el\")" 2>/dev/null

/usr/share/xemacs/site-lisp/backup.el: backup.el
	mkdir -p /usr/share/xemacs/site-lisp
	-cp -f backup.el /usr/share/xemacs/site-lisp/backup.el
	-cd /usr/share/xemacs/site-lisp; \
	  xemacs -batch -eval "(byte-compile-file \"backup.el\")" 2>/dev/null

$(HOME)/.emacs: emacs.polster
	-su polster -c "cp -f emacs.polster $(HOME)/.emacs"

/usr/local/bin/re: re
	cp -f re /usr/local/bin/re
	chmod a+x /usr/local/bin/re

/usr/local/bin/darken: darken
	cp -f darken /usr/local/bin/darken
	chmod a+x /usr/local/bin/darken

/usr/local/bin/tcltrim: tcltrim
	cp -f tcltrim /usr/local/bin/tcltrim
	chmod a+x /usr/local/bin/tcltrim

/usr/local/bin/tclsq: tclsq
	cp -f tclsq /usr/local/bin/tclsq
	chmod a+x /usr/local/bin/tclsq

/usr/local/bin/tkrmt: tkrmt
	cp -f tkrmt /usr/local/bin/tkrmt
	chmod a+x /usr/local/bin/tkrmt

/usr/local/bin/xtail: xtail
	cp -f xtail /usr/local/bin/xtail
	chmod a+x /usr/local/bin/xtail

/usr/local/bin/tmore: tmore
	cp -f tmore /usr/local/bin/tmore
	chmod a+x /usr/local/bin/tmore

/usr/local/bin/viewamipro: viewamipro
	cp -f viewamipro /usr/local/bin/viewamipro
	chmod a+x /usr/local/bin/viewamipro

/usr/local/bin/t2p: t2p
	cp -f t2p /usr/local/bin/t2p
	chmod a+x /usr/local/bin/t2p

/usr/local/bin/buttons: buttons
	cp -f buttons /usr/local/bin/buttons
	chmod a+x /usr/local/bin/buttons

/usr/local/bin/sskeygen: sskeygen
	cp -f sskeygen /usr/local/bin/sskeygen
	chmod a+x /usr/local/bin/sskeygen

/usr/local/bin/tcolor: tcolor
	cp -f tcolor /usr/local/bin/tcolor
	chmod a+x /usr/local/bin/tcolor

#
# End		Makefile
#
