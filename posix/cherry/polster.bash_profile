# set -x 

# Greenwave development environment
export GW_ROOT=/home/polster/src/gw
if [ -f $GW_ROOT/lego/lego.env ]; then
    cd $GW_ROOT/lego
    source lego.env
fi
