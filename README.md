![Icon](images/icon_big.png)

This repository offers a bash script to build an installer from the files of the official [RetroArch](https://www.retroarch.com/) distribution for the different variants of the Anbernic RG350 and RG280 consoles. The generated OPK will install the RetroArch framework files in their precise locations, to which it will add a series of independent OPK launchers or wrappers for the different cores, so as to facilitate the integration of RetroArch in frontends such as GMenu2X or [SimpleMenu](https://github.com/fgl82/simplemenu).

## Installed RetroArch cores

In addition to the cores from the official distribution, the script also includes the cores compiled by the user [Poligraf](https://github.com/Poligraf). [Its repository](https://github.com/Poligraf/opendingux_ra_cores_unofficial) is integrated as a git submodule of this one.

Below is the full list of cores that are included in the final generated OPK installers:

|Source|Core|System|Need files|Supported extensions|Observations|
|:-----|:---|:-----|:---------|:-------------------|:-----------|
|Official|a5200_libretro.so|Atari 5200|true|bin, a52|Needs BIOS: `5200.rom` (md5: `281f20ea4320404ec820fb7ec0693b38`)|
|Official|bk_libretro.so|Elektronika - BK-0010/BK-0011|true|bin|Needs BIOS (model `BK-0010`): `bk/BASIC10.ROM` (md5: `3fa774326d75410a065659aea80252f0`), `bk/FOCAL10.ROM` (md5: `5737f972e8638831ab71e9139abae052`), `bk/MONIT10.ROM` (md5: `95f8c41c6abf7640e35a6a03cecebd01`). Unsupported video mode on stock/ROGUE.|
|Official|dosbox_pure_libretro.so|DOSBox|true|zip, dosz, exe, com, bat, iso, cue, ins, img, ima, vhd, m3u, m3u8| |
|Official (only ODbeta)|ecwolf_libretro.so|Wolfenstein 3D|true|wl6,n3d,sod,sdm,wl1,pk3,exe|Needs "BIOS": `ecwolf.pk3` (md5: `d68107770b3ba230d10aa27472a7617b`)|
|Official|fbalpha2012_cps1_libretro.so|CPS1|true|zip| |
|Official|fbalpha2012_cps2_libretro.so|CPS2|true|zip| |
|Official|fbalpha2012_neogeo_libretro.so|Neo Geo|true|zip| |
|Official|fceumm_libretro.so|Nintendo NES|true|fds, nes, unif, unf|Disk System needs BIOS: `disksys.rom` (md5: `ca30b50f880eb660a320674ed365ef7a`)|
|Official|freechaf_libretro.so|Fairchild ChannelF|true|bin, chf|Needs BIOS: `sl31253.bin` (md5: `ac9804d4c0e9d07e33472e3726ed15c3`), `sl31254.bin` (md5: `da98f4bb3242ab80d76629021bb27585`), `sl90025.bin` (md5: `95d339631d867c8f1d15a5f2ec26069d`)|
|Official|gambatte_libretro.so|GB/GBC|true|gb, gbc, dmg|BIOS optional: `gb_bios.bin` (md5: `32fbbd84168d3482956eb3c5051637f5`), `gbc_bios.bin` (md5: `dbfce9db9deaa2567f6a84fde55f9680`)|
|Official|gearboy_libretro.so|GB/GBC|true|gb, dmg, gbc, cgb, sgb| |
|Official|gearcoleco_libretro.so|ColecoVision|true|col,cv,bin,rom|Needs BIOS: `colecovision.rom` (md5: `2c66f5911e5b42b8ebe113403548eee7`)|
|Official|gearsystem_libretro.so|SG-1000, GG, MD|true|sms, gg, sg, bin, rom| |
|Official|genesis_plus_gx_libretro.so|SG-1000, MS, GG, MD, SEGA CD|true|mdx, md, smd, gen, bin, cue, iso, sms, bms, gg, sg, 68k, chd, m3u|SEGA CD needs BIOS: `bios_CD_E.bin`, `bios_CD_U.bin`, `bios_CD_J.bin`|
|Official|genesis_plus_gx_wide_libretro.so|SG-1000, MS, GG, MD, SEGA CD|true|mdx, md, smd, gen, bin, cue, iso, sms, bms, gg, sg, 68k, chd, m3u|SEGA CD needs BIOS: `bios_CD_E.bin`, `bios_CD_U.bin`, `bios_CD_J.bin`|
|Official|gpsp_libretro.so|GBA|true|gba, bin|BIOS optional: `gba_bios.bin` (md5: `a860e8c0b6d573d191e4ec7db1b1e4f6`)|
|Official|handy_libretro.so|LYNX|true|lnx, o|Needs BIOS: `lynxboot.img` (md5: `fcd403db69f54290b51035d82f835e7b`)|
|Official|jaxe_libretro.so|CHIP-8|true|ch8, sc8, xo8| |
|Official|mame2003_libretro.so|MAME2003|true|zip| |
|Official|mame2003_plus_libretro.so|MAME2003|true|zip| |
|Official|mednafen_pce_fast_libretro.so|PCE, PCE CD|true|pce, cue, ccd, chd, toc, m3u|PCE CD needs BIOS: `syscard3.pce` (md5: `38179df8f4ac870017db21ebcbf53114`)|
|Official|mednafen_wswan_libretro.so|WS|true|ws, wsc, pc2| |
|Official|mgba_libretro.so|GBA|true|gb, gbc, gba|BIOS optional: `gba_bios.bin` (md5: `a860e8c0b6d573d191e4ec7db1b1e4f6`)|
|Official|minivmac_libretro.so|MAC|true|dsk,img,zip,hvf,cmd|Needs BIOS: `MacII.ROM` (md5: `66223be1497460f1e60885eeb35e03cc`)|
|Official|minivmac_libretro.so|MAC|true|?|Needs BIOS: `vMac.ROM`|
|Official|mrboom_libretro.so|MrBoom|false| | |
|Official|o2em_libretro.so|Magnavox Odyssey2, Phillips Videopac+|true|bin|Needs BIOS: `o2rom.bin` (md5: `562d5ebf9e030a40d6fabfc2f33139fd`)|
|Official|picodrive_libretro.so|MS, MD, SEGA CD, SEGA 32X|true|bin, gen, smd, md, 32x, chd, cue, iso, sms, 68k, m3u|SEGA CD needs BIOS: `bios_CD_U.bin` (md5: `2efd74e3232ff260e371b99f84024f7f`), `bios_CD_E.bin` (md5: `e66fa1dc5820d254611fdcdba0662372`), `bios_CD_J.bin` (md5: `278a9397d192149e84e820ac621a8edd`)|
|Official|pokemini_libretro.so|POKEMINI|true|min|Needs BIOS: `bios.min` (md5: `1e4fb124a3a886865acb574f388c803d`)|
|Official|potator_libretro.so|Watara Supervision|true|bin, sv| |
|Official|prboom_libretro.so|DOOM|true|wad, iwad, pwad|Needs game files|
|Official|prosystem_libretro.so|Atari 7800|true|a78, bin|BIOS optional: `7800 BIOS (U).rom` (md5: `0763f1ffb006ddbe32e52d497ee848ae`)|
|Official|quicknes_libretro.so|NES|true|nes| |
|Official|race_libretro.so|NGP|true|ngp, ngc, ngpc, npc| |
|Official|scummvm_libretro.so|ScummVM|true|<see long list in core_info/scummvm_libretro.info>| |
|Official|snes9x2005_libretro.so|SNES|true|smc, fig, sfc, gd3, gd7, dx2, bsx, swc| |
|Official|snes9x2005_plus_libretro.so|SNES|true|smc, fig, sfc, gd3, gd7, dx2, bsx, swc| |
|Official|stella2014_libretro.so|Atari 2600|true|a26, bin| |
|Official|tic80_libretro.so|TIC-80|true|tic| |
|Official|tyrquake_libretro.so|QUAKE|true|pak|Needs game files|
|Official|vice_x64_libretro.so|C64|true|d64, d71, d80, d81, d82, g64, g41, x64, t64, tap, prg, p00, crt, bin, zip, gz, d6z, d7z, d8z, g6z, g4z, x6z, cmd, m3u, vfl, vsf, nib, nbz, d2m, d4m| |
|Official|vitaquake2_libretro.so|QUAKE2|true|pak|Needs game files|
|Official|vitaquake2-rogue_libretro.so|QUAKE2 Ground Zero|true|pak|Needs game files|
|Official|vitaquake2-xatrix_libretro.so|QUAKE2 The Reckoning|true|pak|Needs game files|
|Official|vitaquake2-zaero_libretro.so|QUAKE2 Zaero|true|pak|Needs game files|
|Poligraf|2048_libretro.so|[2048](https://en.wikipedia.org/wiki/2048_(video_game))|false| | |
|Poligraf|81_libretro.so|Sinclair ZX81|true|p, tzx, t81| |
|Poligraf|atari800_libretro.so|Atari 5200|true|xfd, atr, cdm, cas, bin, a52, zip, atx, car, com, xex|Needs BIOS to emulate Atari5200: `5200.rom` (md5: `281f20ea4320404ec820fb7ec0693b38`)|
|Poligraf|bluemsx_libretro.so|MSX, MSX2|true|rom,ri,mx1,mx2,col,dsk,cas,sg,sc,m3u|Needs BIOS in `.retroarch/system/Machines`|
|Poligraf|cannonball_libretro.so|SEGA Outrun|true|game, 88|Needs game files and a dummy file with `.game` extension|
|Poligraf|cap32_libretro.so|Amstrad CPC|true|dsk, sna, zip, tap, cdt, voc, cpr, m3u| |
|Poligraf|crocods_libretro.so|Amstrad CPC|true|dsk,sna,kcr| |
|Poligraf|dinothawr_libretro.so|Dinothawr|true|game|Needs [game files](https://buildbot.libretro.com/assets/cores/Dinothawr/Dinothawr.zip)|
|Poligraf|fmsx_libretro.so|MSX, MSX2|true|rom,mx1,mx2,dsk,cas|Needs BIOS: `MSX.ROM` (md5: `364a1a579fe5cb8dba54519bcfcdac0d`), `MSX2.ROM` (md5: `ec3a01c91f24fbddcbcab0ad301bc9ef`), `MSX2EXT.ROM` (md5: `2183c2aff17cf4297bdb496de78c2e8a`), `MSX2P.ROM` (md5: `847cc025ffae665487940ff2639540e5`), `MSX2PEXT.ROM` (md5: `7c8243c71d8f143b2531f01afa6a05dc`). Unsupported video mode en RG280/ODBeta.|
|Poligraf|frodo_libretro.so|Commodore 64|true|d64,t64,x64,p00,lnx,zip| |
|Poligraf|fuse_libretro.so|Sinclair ZX Spectrum|true|tzx, tap, z80, rzx, scl, trd, dsk| |
|Poligraf|gme_libretro.so|Game Music Emu|true|ay, gbs, gym, hes, kss, nsf, nsfe, sap, spc, vgm, vgz, zip| |
|Poligraf|gw_libretro.so|Nintendo Game&Watch|true|mgw|Unsupported video mode in some games on stock/ROGUE, but pressing some controls it runs sometimes|
|Poligraf|hatari_libretro.so|Atari ST|true|st, msa, zip, stx, dim, ipf, m3u|Needs BIOS: `tos.img` (md5: `c1c57ce48e8ee4135885cee9e63a68a2`).Difficult configuration because of unsupported video mode. Achieved some success with ODBeta, but not with stock/ROGUE.|
|Poligraf|lowresnx_libretro.so|LowRes NX|true|nx| |
|Poligraf|mednafen_vb_libretro.so|Nintendo Virtual Boy|true|vb, vboy, bin|Poor performance|
|Poligraf|mu_libretro.so|Palm|true|prc,pqa,img|Needs BIOS: `palmos41-en-m515.rom` (md5: `83cb1d1c76e568b916dc2e7c0bf669f6`). Needs a stick to manage the stylus, so doesn't run on RG280V.|
|Poligraf|nekop2_libretro.so|NEC PC-98|true|d98,zip,98d,fdi,fdd,2hd,tfd,d88,88d,hdm,xdf,dup,cmd,hdi,thd,nhd,hdd|I couldn't get it to work. May be it [needs some BIOS](https://docs.libretro.com/library/neko_project_ii_kai/#bios).|
|Poligraf|nxengine_libretro.so|Cave Story|true|exe|Needs game files|
|Poligraf|pcsx_rearmed_libretro.so|PlayStation|true|bin,cue,img,mdf,pbp,toc,cbn,m3u,ccd,chd|Poor performance|
|Poligraf|[pocketcdg_libretro.so](https://docs.libretro.com/library/pocketcdg/)|PocketCDG|true|cdg| |
|Poligraf|puae_libretro.so|Commodore Amiga|true|adf, adz, dms, fdi, ipf, hdf, hdz, lha, slave, info, cue, ccd, nrg, mds, iso, chd, uae, m3u, zip, 7z, rp9|Needs BIOS: `kick34005.A500` (md5: `82a21c1890cae844b3df741f2762d48d`)|
|Poligraf|quasi88_libretro.so|NEC PC-88|true|d88,u88,m3u|Needs BIOS: `quasi88/n88.rom`, `quasi88/n88_0.rom`|
|Poligraf|reminiscence_libretro.so|Flashback|true|map, aba, seq, lev|Needs game files. I couldn't get it to work.|
|Poligraf|stonesoup_libretro.so|Dungeon Crawl Stone Soup|true|crawlrc|Needs [game files](https://github.com/libretro/crawl-ref/tree/master/crawl-ref/source/dat) and an empty file `game.crawlrc` (instructions [here](https://docs.libretro.com/library/stone_soup/#how-to-start-the-dungeon-crawl-stone-soup-core)). `Unsupported video mode` on RG280/stock/ROGUE, reboots on beta.|
|Poligraf|theodore_libretro.so|Thomson - MO/TO|true|fd, sap, k7, m7, m5, rom|Difficult configuration because of unsupported video mode. Achieved some success with MO5 model on ODBeta, but not on stock/ROGUE.|
|Poligraf|uzem_libretro.so|Uzebox|true|uze|Poor performance|
|Poligraf|vecx_libretro.so|Vectrex|true|bin,vec| |
|Poligraf|x1_libretro.so|Sharp X1|true|dx1,zip,2d,2hd,tfd,d88,88d,hdm,xdf,dup,tap,cmd|Needs BIOS: `xmil/IPLROM.X1` (md5: `eeeea1cd29c6e0e8b094790ae969bfa7`), `xmil/IPLROM.X1T` (md5: `851e4a5936f17d13f8c39a980cf00d77`)|

## OPKs parameterization

The OPKs to launch the different cores are automatically generated from the configuration made in a CSV file. A couple of sample CSV files are included in the repository. One with the parameterization of the OPKs corresponding to the official cores (`official.csv`) and another for the cores compiled by Poligraf (`poligraf.csv`).

**WARNING:** The CSV file uses a pipe (|) as a column separator, not a comma (,). The first row of the file is ignored, so it can be used to identify the columns. The file must contain 8 columns in the following order and meaning:

1. Label that will be displayed by GMenu2X. For example `Nintendo GB`.
2. OPK filename without the OPK extension. The string `retroarch_rg350_` will prepend the filename. For example, if in this column we put `GB`, the resulting OPK filename will be` retroarch_rg350_GB.opk`.
3. Name of the PNG file (without extension) that will be used as the icon in the OPK. The corresponding icon must exist in the `icons` subdirectory of the repository. For example, if we put `gb` in this column, we must make sure that the `icons/gb.png` file exists, which will be copied into the OPK during the installer building process.
4. In this column we indicate with `true` or `false` if the generated OPK will show the file explorer to select the ROM or game file when launched from GMenu2X. It will correspond to the column `Need files` in the table from the previous paragraph. Normally this column is `true` except in cores that correspond to game ports like `Mr.Boom`.
5. Filename corresponding to the RA core to be used (with the extension `.so` included in this case). For example `gambatte_libretro.so`. We will take it from the `Core` column of the table from the previous paragraph.
6. Core descriptor. It is used to differentiate between different launchers based on the same system. For example to distinguish the `GenesisPlus` and `Picodrive` cores of the `SEGA MD` system.
7. Extensions supported by the core separated by commas (,). These extensions are the ones that will be filtered by GMenu2X when displaying the file explorer (only works on ROGUE). They should match or be a subset of those indicated in the `Supported extensions` column of the table in the previous paragraph. For example for normal Game Boy (not color) we will put `gb, gz, zip, 7z`.
8. Directory where the system ROMs are located. It will be the one shown by default when opening the OPK with GMenu2X. For example `/media/sdcard/roms/GB/`.

## Script usage

The script is designed to be used on Linux with bash. The procedure to use it is as follows:

1. Install some requirements:

    ```bash
    $ sudo apt install git wget p7zip-full tar sed squashfs-tools
    ```

2. Download repository with submodules (**IMPORTANT** don't forget the `--recurse-submodules` option):

    ```bash
    $ git clone --recurse-submodules https://github.com/eduardofilo/RG350_auto_ra_installer.git
    ```

3. Create the CSV file with the parameterization that we like. We can use as template one of the two files included as an example in the repository (`official.csv` and `poligraf.csv`). It is important to bear in mind that the column separator is a pipe (|) and not a comma (,) as usual in this kind of files.
4. Set the parameter `CONF_CSV` at the beginning of the script with the name of the previous CSV file (without extension).
5. Put the date of the RetroArch distribution from which you want to build the installer in the `v` file. Naturally if the date is in the future, the script will fail.
6. Execute the script:

    ```bash
    $ cd RG350_auto_ra_installer
    $ ./build.sh
    ```

As a result of the execution (and if there are no errors), two files will appear in the `releases` directory, one to be used in stock/ROGUE systems and the other for OD Beta (unless we have disabled the generation of any of them by means of the `BUILD_STOCK` and/or `BUILD_ODBETA` parameters at the beginning of the script).

## Built OPKs usage

When launched, it asks for two options that are disabled by default:

![Installing options](/images/installing_options.png)

* `Uninstall previous wrappers`: Remove OPK launchers (wrappers) installed previously.
* `Install config`: To install basic configurations for most cores (basically the ones collected by RetroGameCorps in [their guide](https://retrogamecorps.com/2020/12/24/guide-retroarch-on-rg350-and-rg280-devices/)). The recommendation is to install the configurations the first time and not to install them in subsequent installations to avoid losing the personal settings made on it.

Options are marked by selecting them with the Up/Down controls and pressing `X`. To install, select the `<OK>` button with the Left/Right controls and press `Start`. For some reason, the program starts with a black screen on OD Beta. Press any of the directional controls to make the screen light up.

The OPK with the installer can be obtained in the releases of [this repository](https://github.com/eduardofilo/RG350_auto_ra_installer/releases/latest).

## Hotkeys

If the `Install config` option defined above is used, among other things like video settings for most cores, the following controls will be adjusted globally:

|Function|Shortcut|
|:-------|:-------|
|Pause|`Select + A`|
|Reset|`Select + B`|
|RetroArch menu|`Select + X`|
|Fast forward|`Select + Y`|
|Save savestate|`Select + R1`|
|Load savestate|`Select + L1`|
|Swap disk|`Select + R2`|
|Open CD tray|`Select + L2`|
|Exit game|`Select + Start`|
|Change savestate slot|`Select + ←→`|
|Change volume|`Select + ↑↓`|

## Telegram channel for updates

Join this Telegram channel to get update notifications: [https://t.me/RG350_ra_installer](https://t.me/RG350_ra_installer)
