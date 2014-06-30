#! /bin/bash

# Create a Qt Creator project file from a lego repository.

set +u
if [ -z "$LEGO_PRODUCT" ]; then
    echo "Run lego product_name first"
    exit 1
fi

PROJNAME=$LEGO_OUTPUT/qtcreator
cd $LEGO_ROOT
find proprietary opensource thirdparty products/$LEGO_PRODUCT \
    $LEGO_OUTPUT/include -type f -iname '*.cpp' -or -iname '*.h' -or \
    -iname 'Makefile' -or -iname '*.mk' -or -iname '*.sh'-or \
    -iname '*.cfg' -or -iname '.config' -or -iname '*.menu'> $PROJNAME.files
find proprietary opensource thirdparty $LEGO_OUTPUT/include -type d \
    > $PROJNAME.includes
echo "[General]" > $PROJNAME.creator
echo "// ADD PREDEFINED MACROS HERE!" > $PROJNAME.config

echo "Created Qt Creator project file $PROJNAME.creator"
