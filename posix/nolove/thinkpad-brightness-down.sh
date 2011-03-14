#!/bin/bash
manufacturer=`dmidecode --string system-manufacturer`
case "$manufacturer" in
    LENOVO*)
	echo 5 > /proc/acpi/ibm/cmos
	exit
    ;;
    *)
	. /usr/share/acpi-support/key-constants
	acpi_fakekey $KEY_BRIGHTNESSDOWN
    ;;
esac
