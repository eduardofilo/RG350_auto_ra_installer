![Icono](images/icon_big.png)

Este repositorio ofrece un script bash para construir un instalador a partir de los ficheros de la distribución oficial de [RetroArch](https://www.retroarch.com/) para las distintas variantes de las consolas Anbernic RG350 y RG280. El OPK generado instalará los ficheros del framework RetroArch en sus ubicaciones precisas, a los que añadirá una serie de lanzadores OPK independientes para los distintos cores, de manera que se facilite la integración en distintos frontends como GMenu2X o [SimpleMenu](https://github.com/fgl82/simplemenu).

## Cores RetroArch instalados

Además de los cores de la distribución oficial, el script dispone también de los cores compilados por el usuario [Poligraf](https://github.com/Poligraf). [Su repositorio](https://github.com/Poligraf/opendingux_ra_cores_unofficial) se integra como submódulo git de éste.

A continuación se muestra la lista completa de cores que se incluyen en el instalador OPK final generado:

|Fuente|Core|Sistemas|Necesita ficheros|Extensiones soportadas|Observaciones|
|:-----|:---|:-------|:----------------|:---------------------|:------------|
|Oficial|dosbox_pure_libretro.so|DOSBox|true|zip, dosz, exe, com, bat, iso, cue, ins, img, ima, vhd, m3u, m3u8| |
|Oficial|fbalpha2012_cps1_libretro.so|CPS1|true|zip| |
|Oficial|fbalpha2012_cps2_libretro.so|CPS2|true|zip| |
|Oficial|fbalpha2012_neogeo_libretro.so|Neo Geo|true|zip| |
|Oficial|fceumm_libretro.so|Nintendo NES|true|fds, nes, unif, unf|Disk System necesita BIOS: `disksys.rom` (md5: `ca30b50f880eb660a320674ed365ef7a`)|
|Oficial|gambatte_libretro.so|GB/GBC|true|gb, gbc, dmg|BIOS opcional: `gb_bios.bin` (md5: `32fbbd84168d3482956eb3c5051637f5`), `gbc_bios.bin` (md5: `dbfce9db9deaa2567f6a84fde55f9680`)|
|Oficial|gearboy_libretro.so|GB/GBC|true|gb, dmg, gbc, cgb, sgb| |
|Oficial|gearsystem_libretro.so|SG-1000, GG, MD|true|sms, gg, sg, bin, rom| |
|Oficial|genesis_plus_gx_libretro.so|SG-1000, MS, GG, MD, SEGA CD|true|mdx, md, smd, gen, bin, cue, iso, sms, bms, gg, sg, 68k, chd, m3u|SEGA CD necesita BIOS: `bios_CD_E.bin`, `bios_CD_U.bin`, `bios_CD_J.bin`|
|Oficial|genesis_plus_gx_wide_libretro.so|SG-1000, MS, GG, MD, SEGA CD|true|mdx, md, smd, gen, bin, cue, iso, sms, bms, gg, sg, 68k, chd, m3u|SEGA CD necesita BIOS: `bios_CD_E.bin`, `bios_CD_U.bin`, `bios_CD_J.bin`|
|Oficial|gpsp_libretro.so|GBA|true|gba, bin|BIOS opcional: `gba_bios.bin` (md5: `a860e8c0b6d573d191e4ec7db1b1e4f6`)|
|Oficial|handy_libretro.so|LYNX|true|lnx, o|Necesita BIOS: `lynxboot.img` (md5: `fcd403db69f54290b51035d82f835e7b`)|
|Oficial|mame2003_libretro.so|MAME2003|true|zip| |
|Oficial|mame2003_plus_libretro.so|MAME2003|true|zip| |
|Oficial|mednafen_pce_fast_libretro.so|PCE, PCE CD|true|pce, cue, ccd, chd, toc, m3u|PCE CD necesita BIOS: `syscard3.pce` (md5: `38179df8f4ac870017db21ebcbf53114`)|
|Oficial|mednafen_wswan_libretro.so|WS|true|ws, wsc, pc2| |
|Oficial|mgba_libretro.so|GBA|true|gb, gbc, gba|BIOS opcional: `gba_bios.bin` (md5: `a860e8c0b6d573d191e4ec7db1b1e4f6`)|
|Oficial|mrboom_libretro.so|MrBoom|false| | |
|Oficial|o2em_libretro.so|Magnavox Odyssey2, Phillips Videopac+|true|bin|Necesita BIOS: `o2rom.bin` (md5: `562d5ebf9e030a40d6fabfc2f33139fd`)|
|Oficial|picodrive_libretro.so|MS, MD, SEGA CD, SEGA 32X|true|bin, gen, smd, md, 32x, chd, cue, iso, sms, 68k, m3u|SEGA CD necesita BIOS: `bios_CD_U.bin` (md5: `2efd74e3232ff260e371b99f84024f7f`), `bios_CD_E.bin` (md5: `e66fa1dc5820d254611fdcdba0662372`), `bios_CD_J.bin` (md5: `278a9397d192149e84e820ac621a8edd`)|
|Oficial|pokemini_libretro.so|POKEMINI|true|min|Necesita BIOS: `bios.min` (md5: `1e4fb124a3a886865acb574f388c803d`)|
|Oficial|potator_libretro.so|Watara Supervision|true|bin, sv| |
|Oficial|prboom_libretro.so|DOOM|true|wad, iwad, pwad|Necesita ficheros de juego|
|Oficial|prosystem_libretro.so|Atari 7800|true|a78, bin|BIOS opcional: `7800 BIOS (U).rom` (md5: `0763f1ffb006ddbe32e52d497ee848ae`)|
|Oficial|quicknes_libretro.so|NES|true|nes| |
|Oficial|race_libretro.so|NGP|true|ngp, ngc, ngpc, npc| |
|Oficial|scummvm_libretro.so|ScummVM|true|<consultar larga lista en core_info/scummvm_libretro.info>| |
|Oficial|snes9x2005_libretro.so|SNES|true|smc, fig, sfc, gd3, gd7, dx2, bsx, swc| |
|Oficial|snes9x2005_plus_libretro.so|SNES|true|smc, fig, sfc, gd3, gd7, dx2, bsx, swc| |
|Oficial|stella2014_libretro.so|Atari 2600|true|a26, bin| |
|Oficial|tic80_libretro.so|TIC-80|true|tic| |
|Oficial|tyrquake_libretro.so|QUAKE|true|pak|Necesita ficheros de juego|
|Oficial|vice_x64_libretro.so|C64|true|d64, d71, d80, d81, d82, g64, g41, x64, t64, tap, prg, p00, crt, bin, zip, gz, d6z, d7z, d8z, g6z, g4z, x6z, cmd, m3u, vfl, vsf, nib, nbz, d2m, d4m| |
|Poligraf|2048_libretro.so|[2048](https://en.wikipedia.org/wiki/2048_(video_game))|false| | |
|Poligraf|81_libretro.so|Sinclair ZX81|true|p, tzx, t81| |
|Poligraf|atari800_libretro.so|Atari 5200|true|xfd,atr,cdm,cas,bin,a52,zip,atx,car,com,xex|Necesita BIOS para emular Atari5200: `5200.rom` (md5: `281f20ea4320404ec820fb7ec0693b38`)|
|Poligraf|bk_libretro.so|Elektronika - BK-0010/BK-0011|true|bin|Needs BIOS (model `BK-0010`): `bk/BASIC10.ROM` (md5: `3fa774326d75410a065659aea80252f0`), `bk/FOCAL10.ROM` (md5: `5737f972e8638831ab71e9139abae052`), `bk/MONIT10.ROM` (md5: `95f8c41c6abf7640e35a6a03cecebd01`). Unsupported video mode en stock/ROGUE.|
|Poligraf|bluemsx_libretro.so|MSX, MSX2|true|rom,ri,mx1,mx2,col,dsk,cas,sg,sc,m3u|Necesita BIOS en directorio `.retroarch/system/Machines`|
|Poligraf|cannonball_libretro.so|SEGA Outrun|true|game, 88|Necesita ficheros de juego y un fichero dummy con la extensión `.game`|
|Poligraf|cap32_libretro.so|Amstrad CPC|true|dsk, sna, zip, tap, cdt, voc, cpr, m3u| |
|Poligraf|crocods_libretro.so|Amstrad CPC|true|dsk,sna,kcr| |
|Poligraf|dinothawr_libretro.so|Dinothawr|true|game|Necesita [ficheros de juego](https://buildbot.libretro.com/assets/cores/Dinothawr/Dinothawr.zip)|
|Poligraf|fmsx_libretro.so|MSX, MSX2|true|rom,mx1,mx2,dsk,cas|Necesita BIOS: `MSX.ROM` (md5: `364a1a579fe5cb8dba54519bcfcdac0d`), `MSX2.ROM` (md5: `ec3a01c91f24fbddcbcab0ad301bc9ef`), `MSX2EXT.ROM` (md5: `2183c2aff17cf4297bdb496de78c2e8a`), `MSX2P.ROM` (md5: `847cc025ffae665487940ff2639540e5`), `MSX2PEXT.ROM` (md5: `7c8243c71d8f143b2531f01afa6a05dc`). Unsupported video mode en RG280/ODBeta.|
|Poligraf|freechaf_libretro.so|Fairchild ChannelF|true|bin, chf|Necesita BIOS: `sl31253.bin` (md5: `ac9804d4c0e9d07e33472e3726ed15c3`), `sl31254.bin` (md5: `da98f4bb3242ab80d76629021bb27585`), `sl90025.bin` (md5: `95d339631d867c8f1d15a5f2ec26069d`)|
|Poligraf|frodo_libretro.so|Commodore 64|true|d64,t64,x64,p00,lnx,zip| |
|Poligraf|fuse_libretro.so|Sinclair ZX Spectrum|true|tzx, tap, z80, rzx, scl, trd, dsk| |
|Poligraf|gme_libretro.so|Game Music Emu|true|ay, gbs, gym, hes, kss, nsf, nsfe, sap, spc, vgm, vgz, zip| |
|Poligraf|gw_libretro.so|Nintendo Game&Watch|true|mgw|Unsupported video mode en algunos juegos sobre stock/ROGUE, pero pulsando algunas teclas a veces funcionan|
|Poligraf|hatari_libretro.so|Atari ST|true|st, msa, zip, stx, dim, ipf, m3u|Necesita BIOS: `tos.img` (md5: `c1c57ce48e8ee4135885cee9e63a68a2`). Configuración complicada a causa del unsupported video mode. Conseguido cierto éxito con ODBeta, pero no con stock/ROGUE.|
|Poligraf|lowresnx_libretro.so|LowRes NX|true|nx| |
|Poligraf|mednafen_vb_libretro.so|Nintendo Virtual Boy|true|vb, vboy, bin|Rendimiento pobre|
|Poligraf|mu_libretro.so|Palm|true|prc,pqa,img|Necesita BIOS: `palmos41-en-m515.rom` (md5: `83cb1d1c76e568b916dc2e7c0bf669f6`). Necesita un stick para manejar el stylus, por lo que no funciona sobre RG280V.|
|Poligraf|nekop2_libretro.so|NEC PC-98|true|d98,zip,98d,fdi,fdd,2hd,tfd,d88,88d,hdm,xdf,dup,cmd,hdi,thd,nhd,hdd|No he conseguido hacerlo funcionar. Puede que [necesite algunas BIOS](https://docs.libretro.com/library/neko_project_ii_kai/#bios).|
|Poligraf|nxengine_libretro.so|Cave Story|true|exe|Necesita ficheros de juego|
|Poligraf|pcsx_rearmed_libretro.so|PlayStation|true|bin,cue,img,mdf,pbp,toc,cbn,m3u,ccd,chd|Rendimiento pobre|
|Poligraf|[pocketcdg_libretro.so](https://docs.libretro.com/library/pocketcdg/)|PocketCDG|true|cdg| |
|Poligraf|puae_libretro.so|Commodore Amiga|true|adf, adz, dms, fdi, ipf, hdf, hdz, lha, slave, info, cue, ccd, nrg, mds, iso, chd, uae, m3u, zip, 7z|Necesita BIOS: `kick34005.A500` (md5: `82a21c1890cae844b3df741f2762d48d`)|
|Poligraf|quasi88_libretro.so|NEC PC-88|true|d88,u88,m3u|Necesita BIOS: `quasi88/n88.rom`, `quasi88/n88_0.rom`|
|Poligraf|reminiscence_libretro.so|Flashback|true|map, aba, seq, lev|Necesita ficheros de juego. No he conseguido hacerlo funcionar.|
|Poligraf|stonesoup_libretro.so|Dungeon Crawl Stone Soup|true|crawlrc|Necesita [ficheros de juego](https://github.com/libretro/crawl-ref/tree/master/crawl-ref/source/dat) and an empty file `game.crawlrc` (instructions [here](https://docs.libretro.com/library/stone_soup/#how-to-start-the-dungeon-crawl-stone-soup-core)). Unsupported video mode sobre RG280/stock/ROGUE, reinicios sobre ODBeta.|
|Poligraf|theodore_libretro.so|Thomson - MO/TO|true|fd, sap, k7, m7, m5, rom|Configuración complicada debido a unsupported video mode. Conseguido cierto éxito con el modelo MO5 sobre ODBeta, pero no sobre stock/ROGUE.|
|Poligraf|uzem_libretro.so|Uzebox|true|uze|Rendimiento pobre|
|Poligraf|vecx_libretro.so|Vectrex|true|bin,vec| |
|Poligraf|x1_libretro.so|Sharp X1|true|dx1,zip,2d,2hd,tfd,d88,88d,hdm,xdf,dup,tap,cmd|Necesita BIOS: `xmil/IPLROM.X1` (md5: `eeeea1cd29c6e0e8b094790ae969bfa7`), `xmil/IPLROM.X1T` (md5: `851e4a5936f17d13f8c39a980cf00d77`)|

## Parametrización de OPKs

Los OPKs para lanzar los distintos cores se generan automáticamente a partir de la configuración que se hace en un fichero CSV. En el repositorio se incluyen un par de ficheros CSV de ejemplo. Uno con la parametrización de los OPKs correspondientes a los cores oficiales (`official.csv`) y otro para los cores compilados por Poligraf (`poligraf.csv`).

**IMPORTANTE:** El fichero CSV utiliza una pipa (|) como separador de columnas, no una coma (,). La primera fila del fichero no se tiene en cuenta, por lo que se puede utilizar para identificar las columnas. El fichero debe contener 8 columnas en el siguiente orden y con el significado que se indica:

1. Rótulo que mostrará GMenu2X del OPK. Por ejemplo `Nintendo GB`.
2. Nombre del fichero OPK sin la extensión OPK. Al nombre se le añadirá al principio la partícula `retroarch_rg350_`. Por ejemplo si en esta columna ponemos `GB`, el nombre del fichero OPK resultante será `retroarch_rg350_GB.opk`.
3. Nombre del fichero PNG (sin extensión) que se usará como icono en el OPK. El icono correspondiente deberá existir en el subdirectorio `icons` del repositorio. Por ejemplo si en esta columna ponemos `gb`, debemos asegurarnos de que existe el fichero `icons/gb.png`, que será copiado al interior del OPK durante el proceso de construcción del instalador.
4. En esta columna indicamos con `true` o `false` si el OPK generado mostrará el explorador de ficheros para seleccionar la ROM o fichero de juego al ser lanzado desde GMenu2X. Corresponderá con la columna `Necesita ficheros` de la tabla del apartado anterior. Normalmente esta columna vale `true` excepto en cores que corresponden a ports de juegos como Mr.Boom.
5. Nombre del fichero correspondiente al core a utilizar con la extensión `.so` incluida. Por ejemplo `gambatte_libretro.so`. Lo tomaremos de la columna `Core` de la tabla del apartado anterior.
6. Extensiones soportadas por el core separadas por comas (,). Estas extensiones son las que serán filtradas por GMenu2X al mostrar el explorador de archivos (sólo funciona en ROGUE). Deberían coincidir o ser un subconjunto de las indicadas en la columna `Extensiones soportadas` de la tabla del apartado anterior. Por ejemplo para Game Boy normal (no color) pondremos `gb,gz,zip,7z`.
7. Directorio donde se encuentran las ROMs del sistema. Será el que muestre por defecto GMenu2X al abrir el OPK, aunque lo podremos cambiar en cualquier momento. Por ejemplo `/media/sdcard/roms/GB/`.

## Utilización del script

El script se ha diseñado para ser utilizado en Linux sobre bash. El procedimiento para utilizarlo es el siguiente:

1. Instalar algunos requerimientos:

    ```bash
    $ sudo apt install git wget p7zip-full tar sed squashfs-tools
    ```

2. Descargar el repositorio y los submódulos:

    ```bash
    $ git clone --recurse-submodules https://github.com/eduardofilo/RG350_ra_installer.git
    ```

3. Crear el fichero CSV con la parametrización que nos interese. Nos podemos basar en los dos ficheros incluidos como ejemplo en el repositorio (`official.csv` y `poligraf.csv`). Es importante tener en cuenta que el separador de columnas es una pila (|) y no una coma (,) como habitualmente en este tipo de ficheros.

4. Ajustar el parámetro `CONF_CSV` al principio del script con el nombre del fichero CSV sin extensión con la parametrización que vamos a utilizar.

5. Ejecutar el script:

    ```bash
    $ cd RG350_ra_installer
    $ ./build.sh
    ```

Como resultado de la ejecución (y si no se producen errores durante la misma), aparecerán un par de ficheros en el directorio `releases`, uno para ser utilizado en sistemas stock/ROGUE y otro para OD Beta (a no ser que hayamos desactivado la generación de alguno de ellos mediante los parámetros `BUILD_STOCK` y/o `BUILD_ODBETA` al principio del script).

## Utilización de los OPKs generados

Cuando se lanza, pregunta por dos opciones que están desactivadas por defecto:

![Installing options](/images/posts/rg350_ra_installer/installing_options.png)

* Uninstall previous wrappers: Borra los lanzadores OPK de los cores (wrappers) instalados con otro paquete de instalación de RetroArch.
* Install config: Para instalar las configuraciones comentadas en el tercer punto de la lista anterior. Se recomienda instalar las configuraciones la primera vez y no instalarlas en reinstalaciones posteriores para evitar la pérdida de los ajustes personales hechos sobre la configuración básica.

El OPK con el instalador puede obtenerse en las releases de [este repositorio](https://github.com/eduardofilo/RG350_auto_ra_installer/releases/latest).

## Hotkeys

Si se utiliza la opción `Install config` definida anteriormente, entre otras cosas como configuraciones de vídeo para la mayoría de los cores, se ajustarán los siguientes controles:

|Función|Shortcut|
|:-------|:-------|
|Pausa|`Select + A`|
|Reset|`Select + B`|
|Menú RetroArch|`Select + X`|
|Avance rápido|`Select + Y`|
|Guardar savestate|`Select + R1`|
|Cargar savestate|`Select + L1`|
|Cambiar disco|`Select + R2`|
|Abrir bandeja CD|`Select + L2`|
|Cerrar juego|`Select + Start`|
|Cambiar slot savestate|`Select + ←→`|
|Cambiar volumen|`Select + ↑↓`|

## Canal Telegram

Se ha creado este canal de Telegram para comunicar más fácilmente las actualizaciones de este instalador: [https://t.me/RG350_ra_installer](https://t.me/RG350_ra_installer)
