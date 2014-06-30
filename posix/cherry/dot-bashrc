# set -x 

# Greenwave development environment
export GW_ROOT=/home/polster/src/gw
if [ -f $GW_ROOT/lego/lego.env ]; then
    cd $GW_ROOT/lego
    source lego.env
    [ -x $GW_ROOT/lego/git-setup.sh ] && \
        $GW_ROOT/lego/git-setup.sh >/dev/null 2>&1
fi
cd
