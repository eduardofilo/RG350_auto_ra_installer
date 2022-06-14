#!/bin/sh

VERSION=`cat v`
UNINSTALL_PREV=false
INSTALL_CONF=false

# Screen determination
if grep -q "640x480" /sys/devices/platform/13050000.lcd-controller/graphics/fb0/modes; then
  MODEL="RG350M"
else
  MODEL="RG350P"
fi

export DIALOGOPTS="--colors --backtitle \"RetroArch installer v${VERSION}\""

TEXTO="
Choose if you want to uninstall core wrappers from previous installation and if you want to install preset configurations of cores (if you have an old installation and made changes, they will be overwritten).

Use \Zb\Z3X\Zn control to check options and \Zb\Z3OK\Zn to proceed with installation."

# Ask options
result=$(dialog --stdout --title "RA Installer options" --checklist "$TEXTO" 0 0 0 1 "Uninstall previous wrappers" off 2 "Install config" off)
if [ $? -eq 1 ] ; then
    exit 1
fi
if echo $result|grep -q "1"; then
    UNINSTALL_PREV=true
fi
if echo $result|grep -q "2"; then
    INSTALL_CONF=true
fi
clear

if [ ${UNINSTALL_PREV} = true ] ; then
    echo "Uninstalling previous OPK wrappers..."
    rm /media/data/apps/retroarch_rg350_*
    rm /media/data/local/home/.gmenu2x/sections/retroarch/retroarch_rg350_*
    sync
    echo "  DONE"
    sleep 5
fi

echo "Installing cores, please wait (about 1 minute)..."
sleep 5

# Copying retroarch icon to all GMenu2X skins
if [[ "$MODEL" == "RG350P" ]] ; then
    for filename in /usr/share/gmenu2x/skins/320x240/*; do
        skin=`basename $filename`
        mkdir -p "/media/data/local/home/.gmenu2x/skins/320x240/${skin}/sections"
    done
    for filename in /media/data/local/home/.gmenu2x/skins/320x240/*; do
        skin=`basename $filename`
        mkdir -p "/media/data/local/home/.gmenu2x/skins/320x240/${skin}/sections"
        if [[ "$skin" == "Pixel" ]] ; then
            cp -f files_odb/retroarch_pixel.png "/media/data/local/home/.gmenu2x/skins/320x240/${skin}/sections/retroarch.png"
        else
            cp -f files_odb/retroarch.png "/media/data/local/home/.gmenu2x/skins/320x240/${skin}/sections"
        fi
    done
fi
if [[ "$MODEL" == "RG350M" ]] ; then
    for filename in /usr/share/gmenu2x/skins/640x480/*; do
        skin=`basename $filename`
        mkdir -p "/media/data/local/home/.gmenu2x/skins/640x480/${skin}/sections"
    done
    for filename in /media/data/local/home/.gmenu2x/skins/640x480/*; do
        skin=`basename $filename`
        mkdir -p "/media/data/local/home/.gmenu2x/skins/640x480/${skin}/sections"
        if [[ "$skin" == "Pixel" ]] ; then
            cp -f files_odb/retroarch_pixel.png "/media/data/local/home/.gmenu2x/skins/640x480/${skin}/sections/retroarch.png"
        else
            cp -f files_odb/retroarch.png "/media/data/local/home/.gmenu2x/skins/640x480/${skin}/sections"
        fi
    done
fi
# Installing OPK and executable
cp -f files_odb/retroarch_rg350_odbeta.opk /media/data/apps
mkdir -p /media/data/local/bin
cp -f files_odb/retroarch_rg350_odbeta /media/data/local/bin
# Installing OPK wrappers for cores
tar -xzf files_odb/apps_ra.tgz -C /media/data/apps
# Installing home files
mkdir -p /media/data/local/home/.retroarch
tar -xzf files_odb/retroarch.tgz -C /media/data/local/home/.retroarch
# Installing GMenu2X links
mkdir -p /media/data/local/home/.gmenu2x/sections/retroarch
tar -xzf files_odb/links.tgz -C /media/data/local/home/.gmenu2x/sections/retroarch
sync
echo "  DONE"

if [ ${INSTALL_CONF} = true ] ; then
    echo "Installing configs, please wait..."
    sleep 5

    # Installing configs
    if [[ "$MODEL" == "RG350P" ]] ; then
        tar -xzf files_odb/configs_P.tgz -C /media/data/local/home/.retroarch
    fi
    if [[ "$MODEL" == "RG350M" ]] ; then
        tar -xzf files_odb/configs_M.tgz -C /media/data/local/home/.retroarch
    fi
    sync
    echo "  DONE"
fi

sleep 3

dialog --msgbox "Installation completed!\n\nRemember that following cores need BIOS files to run (LYNX, PC ENGINE CD, SEGA CD, VIDEOPAC, CHANNELF, ATARI ST, AMIGA, BK) or data files (DOOM, QUAKE, OUTRUN, CAVESTORY, FLASHBACK).\n\nNow we are going to reboot. After pressing \Zb\Z3OK\Zn, let the console reboot itself, don't force it manually." 16 0
reboot
