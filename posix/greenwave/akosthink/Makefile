TARGETS=\
	/usr/share/X11/xorg.conf.d/nvidia-brightness.conf \
	/etc/udhcpd.conf \
	/etc/defaults/udhcpd \

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

/etc/defaults/udhcpd: udhcpd
	mkdir -p /etc/defaults
	cp -f $< $@
	-service udhcpd restart

/etc/udhcpd.conf: udhcpd.conf
	cp -f $< $@
	-service udhcpd restart

/usr/share/X11/xorg.conf.d/nvidia-brightness.conf: nvidia-brightness.conf
	mkdir -p /usr/share/X11/xorg.conf.d
	cp -f $< $@
