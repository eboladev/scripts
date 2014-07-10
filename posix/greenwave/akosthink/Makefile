TARGETS=\
	/usr/share/X11/xorg.conf.d/nvidia-brightness.conf \

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

/usr/share/X11/xorg.conf.d/nvidia-brightness.conf: nvidia-brightness.conf
	mkdir -p /usr/share/X11/xorg.conf.d
	cp -f $< $@
