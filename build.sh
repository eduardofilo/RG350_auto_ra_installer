#!/bin/bash

set -e

BUILD_STOCK=true        # Build Stock version of installer
BUILD_ODBETA=true       # Build ODBeta version of installer
CONF_CSV=official       # Name of CSV with parameterization, without extension
#CONF_CSV=poligraf
#CONF_CSV=adam

VERSION=`cat v`
DIRECTORY=$(pwd)
RA_DIST_FILE=${VERSION}_RetroArch.7z
OPK_NAME_ST=RA_Stock_Installer_v${VERSION}_${CONF_CSV}.opk
OPK_NAME_ODB=RA_ODBeta_Installer_v${VERSION}_${CONF_CSV}.opk


# Stock
if [ ${BUILD_STOCK} = true ] ; then
    echo "# Building Stock RA installer"
    if [ ! -f ${DIRECTORY}/build_st/${RA_DIST_FILE} ] ; then
        echo "    Downloading RA distribution"
        RA_DIST_URL_ST=https://buildbot.libretro.com/nightly/dingux/mips32/${RA_DIST_FILE}
        wget -q -P ${DIRECTORY}/build_st ${RA_DIST_URL_ST}
        status=$?
        [ ! ${status} -eq 0 ] && echo "@@ ERROR: Problem downloading RA distribution" && exit ${status}
    fi

    echo "    Unpacking RA distribution"
    if [ -d ${DIRECTORY}/build_st/retroarch ] ; then
        rm -rf ${DIRECTORY}/build_st/retroarch
    fi
    7z -bb0 -bso0 -bse0 -bsp0 x -o${DIRECTORY}/build_st ${DIRECTORY}/build_st/${RA_DIST_FILE}
    status=$?
    [ ! ${status} -eq 0 ] && echo "@@ ERROR: Problem unpacking RA distribution" && exit ${status}

    echo "    Building RA core pack"
    mv ${DIRECTORY}/build_st/retroarch/bin/retroarch_rg350 files_st/
    mv ${DIRECTORY}/build_st/retroarch/retroarch_rg350.opk files_st/
    mkdir -p ${DIRECTORY}/build_st/retroarch/.retroarch/cores
    cp ${DIRECTORY}/opendingux_ra_cores_unofficial/"stock or rogue"/*.so ${DIRECTORY}/build_st/retroarch/.retroarch/cores/
    tar -czf ${DIRECTORY}/files_st/retroarch.tgz -C ${DIRECTORY}/build_st/retroarch/.retroarch assets core_info cores database filters system
    rm -rf ${DIRECTORY}/build_st/retroarch

    echo "    Building OPK wrappers"
    if [ -d ${DIRECTORY}/files_st/apps_ra ] ; then
        rm -rf ${DIRECTORY}/files_st/apps_ra
    fi
    mkdir -p ${DIRECTORY}/files_st/apps_ra/squashfs-root
    if [ -d ${DIRECTORY}/files_st/links ] ; then
        rm -rf ${DIRECTORY}/files_st/links
    fi
    mkdir -p ${DIRECTORY}/files_st/links
    sed 1d ${DIRECTORY}/${CONF_CSV}.csv | while read row; do
        # https://stackoverflow.com/questions/10586153/how-to-split-a-string-into-an-array-in-bash
        IFS='|' read -r -a array <<< "${row}"
        num_el=${#array[@]}
        [ ${num_el} -lt 5 ] && echo "@@ ERROR: Problem with CSV format" && exit 1
        if [ ! -f ${DIRECTORY}/icons/"${array[2]}.png" ] ; then
            cp ${DIRECTORY}/icons/unknown.png ${DIRECTORY}/files_st/apps_ra/squashfs-root/"${array[2]}.png"
        else
            cp ${DIRECTORY}/icons/"${array[2]}.png" ${DIRECTORY}/files_st/apps_ra/squashfs-root/
        fi
        [ "${array[5]}" = "" ] && core_desc="" || core_desc=" with ${array[5]} core"
        [ "${array[3]}" = "true" ] && browse=" %f" || browse=""
        cat > ${DIRECTORY}/files_st/apps_ra/squashfs-root/default.gcw0.desktop <<EOF
[Desktop Entry]
Name=${array[0]}
Comment=${array[0]} on RA${core_desc}
Exec=/media/data/local/bin/retroarch_rg350 -v -L /media/data/local/home/.retroarch/cores/${array[4]} --config /media/data/local/home/.retroarch/retroarch.cfg${browse}
Terminal=false
Type=Application
StartupNotify=true
Icon=${array[2]}
Categories=retroarch;
X-OD-NeedsDownscaling=true
EOF
        mksquashfs ${DIRECTORY}/files_st/apps_ra/squashfs-root ${DIRECTORY}/files_st/apps_ra/retroarch_rg350_${array[1]}.opk -all-root -no-xattrs -noappend -no-exports > /dev/null
        rm ${DIRECTORY}/files_st/apps_ra/squashfs-root/*
        [ "${array[3]}" = "true" ] && browse="f" || browse=""
        cat > ${DIRECTORY}/files_st/links/retroarch_rg350_${array[1]}_exec.sh${browse} <<EOF
title=${array[0]}
description=${array[0]} on RA${core_desc}
icon=/media/data/apps/retroarch_rg350_${array[1]}.opk#${array[2]}.png
clock=1080
EOF
        [ ! "${array[6]}" = "" ] && echo "selectorfilter=${array[6]}" >> ${DIRECTORY}/files_st/links/retroarch_rg350_${array[1]}_exec.sh${browse}
        [ ! "${array[7]}" = "" ] && echo "selectordir=${array[7]}" >> ${DIRECTORY}/files_st/links/retroarch_rg350_${array[1]}_exec.sh${browse}
    done
    rm -rf ${DIRECTORY}/files_st/apps_ra/squashfs-root
    cd ${DIRECTORY}/files_st/apps_ra
    tar -czf ${DIRECTORY}/files_st/apps_ra.tgz *
    cd ${DIRECTORY}
    rm -rf ${DIRECTORY}/files_st/apps_ra
    cd ${DIRECTORY}/files_st/links
    tar -czf ${DIRECTORY}/files_st/links.tgz *
    cd ${DIRECTORY}
    rm -rf ${DIRECTORY}/files_st/links

    echo "    Building installer"
    mkdir -p ${DIRECTORY}/releases
    cat > ${DIRECTORY}/default.gcw0.desktop <<EOF
[Desktop Entry]
Type=Application
Name=RA Inst. v${VERSION}
Comment=RetroArch installer v${VERSION} for Stock with ${CONF_CSV}
Exec=update_st.sh
Icon=icon
Categories=applications;
Terminal=true
EOF
    FLIST="${DIRECTORY}/files_st"
    FLIST="${FLIST} ${DIRECTORY}/icon.png"
    FLIST="${FLIST} ${DIRECTORY}/update_st.sh"
    FLIST="${FLIST} ${DIRECTORY}/v"
    FLIST="${FLIST} ${DIRECTORY}/default.gcw0.desktop"

    if [ -f ${DIRECTORY}/releases/${OPK_NAME_ST} ] ; then
        rm ${DIRECTORY}/releases/${OPK_NAME_ST}
    fi

    mksquashfs ${FLIST} ${DIRECTORY}/releases/${OPK_NAME_ST} -all-root -no-xattrs -noappend -no-exports > /dev/null
    rm -f ${DIRECTORY}/default.gcw0.desktop
fi


# ODBeta
if [ ${BUILD_ODBETA} = true ] ; then
    echo "# Building ODBeta RA installer"
    if [ ! -f ${DIRECTORY}/build_odb/${RA_DIST_FILE} ] ; then
        echo "    Downloading RA distribution"
        RA_DIST_URL_ST=https://buildbot.libretro.com/nightly/dingux/mips32-odbeta/${RA_DIST_FILE}
        wget -q -P ${DIRECTORY}/build_odb ${RA_DIST_URL_ST}
        status=$?
        [ ! ${status} -eq 0 ] && echo "@@ ERROR: Problem downloading RA distribution" && exit ${status}
    fi

    echo "    Unpacking RA distribution"
    if [ -d ${DIRECTORY}/build_odb/retroarch ] ; then
        rm -rf ${DIRECTORY}/build_odb/retroarch
    fi
    7z -bb0 -bso0 -bse0 -bsp0 x -o${DIRECTORY}/build_odb ${DIRECTORY}/build_odb/${RA_DIST_FILE}
    status=$?
    [ ! ${status} -eq 0 ] && echo "@@ ERROR: Problem unpacking RA distribution" && exit ${status}

    echo "    Building RA core pack"
    mv ${DIRECTORY}/build_odb/retroarch/bin/retroarch_rg350_odbeta files_odb/
    mv ${DIRECTORY}/build_odb/retroarch/retroarch_rg350_odbeta.opk files_odb/
    mkdir -p ${DIRECTORY}/build_odb/retroarch/.retroarch/cores
    cp ${DIRECTORY}/opendingux_ra_cores_unofficial/"stock or rogue"/*.so ${DIRECTORY}/build_odb/retroarch/.retroarch/cores/
    cp ${DIRECTORY}/opendingux_ra_cores_unofficial/beta/*.so ${DIRECTORY}/build_odb/retroarch/.retroarch/cores/
    tar -czf ${DIRECTORY}/files_odb/retroarch.tgz -C ${DIRECTORY}/build_odb/retroarch/.retroarch assets core_info cores database filters system
    rm -rf ${DIRECTORY}/build_odb/retroarch

    echo "    Building OPK wrappers"
    if [ -d ${DIRECTORY}/files_odb/apps_ra ] ; then
        rm -rf ${DIRECTORY}/files_odb/apps_ra
    fi
    mkdir -p ${DIRECTORY}/files_odb/apps_ra/squashfs-root
    if [ -d ${DIRECTORY}/files_odb/links ] ; then
        rm -rf ${DIRECTORY}/files_odb/links
    fi
    mkdir -p ${DIRECTORY}/files_odb/links
    sed 1d ${DIRECTORY}/${CONF_CSV}.csv | while read row; do
        # https://stackoverflow.com/questions/10586153/how-to-split-a-string-into-an-array-in-bash
        IFS='|' read -r -a array <<< "${row}"
        num_el=${#array[@]}
        [ ${num_el} -lt 5 ] && echo "@@ ERROR: Problem with CSV format" && exit 1
        if [ ! -f ${DIRECTORY}/icons/"${array[2]}.png" ] ; then
            cp ${DIRECTORY}/icons/unknown.png ${DIRECTORY}/files_odb/apps_ra/squashfs-root/"${array[2]}.png"
        else
            cp ${DIRECTORY}/icons/"${array[2]}.png" ${DIRECTORY}/files_odb/apps_ra/squashfs-root/
        fi
        [ "${array[5]}" = "" ] && core_desc="" || core_desc=" with ${array[5]} core"
        [ "${array[3]}" = "true" ] && browse=" %f" || browse=""
        cat > ${DIRECTORY}/files_odb/apps_ra/squashfs-root/default.gcw0.desktop <<EOF
[Desktop Entry]
Name=${array[0]}
Comment=${array[0]} on RA${core_desc}
Exec=/media/data/local/bin/retroarch_rg350_odbeta -v -L /media/data/local/home/.retroarch/cores/${array[4]} --config /media/data/local/home/.retroarch/retroarch.cfg${browse}
Terminal=false
Type=Application
StartupNotify=true
Icon=${array[2]}
Categories=retroarch;
X-OD-NeedsDownscaling=true
EOF
        mksquashfs ${DIRECTORY}/files_odb/apps_ra/squashfs-root ${DIRECTORY}/files_odb/apps_ra/retroarch_rg350_${array[1]}.opk -all-root -no-xattrs -noappend -no-exports > /dev/null
        rm ${DIRECTORY}/files_odb/apps_ra/squashfs-root/*
        cat > ${DIRECTORY}/files_odb/links/retroarch_rg350_${array[1]} <<EOF
clock=996
EOF
        [ ! "${array[7]}" = "" ] && echo "selectordir=${array[7]}" >> ${DIRECTORY}/files_odb/links/retroarch_rg350_${array[1]}
    done
    rm -rf ${DIRECTORY}/files_odb/apps_ra/squashfs-root
    cd ${DIRECTORY}/files_odb/apps_ra
    tar -czf ${DIRECTORY}/files_odb/apps_ra.tgz *
    cd ${DIRECTORY}
    rm -rf ${DIRECTORY}/files_odb/apps_ra
    cd ${DIRECTORY}/files_odb/links
    tar -czf ${DIRECTORY}/files_odb/links.tgz *
    cd ${DIRECTORY}
    rm -rf ${DIRECTORY}/files_odb/links

    echo "    Building installer"
    mkdir -p ${DIRECTORY}/releases
    cat > ${DIRECTORY}/default.gcw0.desktop <<EOF
[Desktop Entry]
Type=Application
Name=RA Inst. v${VERSION}
Comment=RetroArch installer v${VERSION} for OD Beta with ${CONF_CSV}
Exec=update_odb.sh
Icon=icon
Categories=applications;
Terminal=true
EOF
    FLIST="${DIRECTORY}/files_odb"
    FLIST="${FLIST} ${DIRECTORY}/icon.png"
    FLIST="${FLIST} ${DIRECTORY}/update_odb.sh"
    FLIST="${FLIST} ${DIRECTORY}/v"
    FLIST="${FLIST} ${DIRECTORY}/default.gcw0.desktop"

    if [ -f ${DIRECTORY}/releases/${OPK_NAME_ODB} ] ; then
        rm ${DIRECTORY}/releases/${OPK_NAME_ODB}
    fi

    mksquashfs ${FLIST} ${DIRECTORY}/releases/${OPK_NAME_ODB} -all-root -no-xattrs -noappend -no-exports > /dev/null
    rm -f ${DIRECTORY}/default.gcw0.desktop
fi

exit 0
