# INSTALL (Flying)

## Condor

Runs perfectly with Lutris - original [instructions here](https://www.condorsoaring.com/forums/viewtopic.php?t=20991).
```
apt-get install lutris
```

Download [condor setup binary](https://www.condorsoaring.com/index.php?eddfile=197286%3A17917%3A2%3A0&ttl=1705095058&file=2&token=f75a475f808d2b04d1e7b17a1922817a83c02d5028d9c4d311078848e0e3a204).

Install Windows game from an executable in Lutris:
* Windows 10 64-bit
* Select condor setup file
* Runner Wine (i.e. wine-ge-lol-8-27-x86_64)

### Scenery

Available in [condor club](https://www.condor.club/sceneries/197/). Map to select from [here](https://www.condor.club/sceneriesmap/241/).

[Installations instructions here](https://www.condor.club/generic/240/) but basically after downloading the landscape file:
```
cd Games/condor/drive_c/Condor2/Landscapes
7z x AA_v1.0_main.7z
rm AA_v1.0_main.7z
```

### SeeYou Navigator Dongle (NMEA)

Generic instructions are available for the [Naviter Condor dongle](https://kb.naviter.com/en/kb/naviter-condor-dongle/).

To set it up:
* On the machine
```
ln -s /dev/ttyUSB0 ~/Games/condor/dosdevices/com33
```
* On Condor / Setup / Options:
** Enable NMEA Output
** Select COM33
* On the SeeYou Navigator (needed only once):
** Launch SeeYou Navigator, and under Menu (three lines in map) / Devices, find `Naviter BLE` and select `Connect`
** DO NOT use the Android device management, trying to connect there will screw things up - to fix, remove the device from SeeYou Navigator and repeat the step above

When playing, just plug-in the dongle, launch Condor, and in SeeYou Navigator connect the device.

### Open Issues

* Asks for LICENSE activation on every run, not sure yet how to fix this (this seems to have no impact though. once it was activated once, it all works fine)
