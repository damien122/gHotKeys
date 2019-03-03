# gHotKeys - (global Hot Keys) small tool to define media control keys

This tool is a handy way to define media control keys for
    - play/pause music
    - play next song
    - replay previous song



## Installation and using

Copy the EXE file in a folder you like and start it via double click.
The tool will create an INI file for configuration and will create at first run an autostart link and open also this autostart folder for you. This will just happen at first start.



## Configuration

To configure the shortcuts or key combination, close at first the tool by click on the icon in taskbar and click on "Exit" in context menu.
Open the config.ini file and set the values for "Play", "Next" and "Prev".

[Possible values 1](https://www.autoitscript.com/autoit3/docs/functions/HotKeySet.htm)
[Possible values 2](https://www.autoitscript.com/autoit3/docs/appendix/SendKeys.htm)

Example values:

    "^!d" -> Ctrl+Alt+D
    "+!d" -> Shift+Alt+D
    "^" -> Ctrl
    "!" -> Alt
    "+" -> Shift

Just combine the values to a string and add it in the config.ini.



## Build

To build this project install

[Autoit IDE + Compiler](https://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-setup.exe)

[Tools for autoit IDE](https://www.autoitscript.com/cgi-bin/getfile.pl?../autoit3/scite/download/SciTE4AutoIt3.exe)

Open the "gHotKeys.au3" File with the Autoit IDE and press F5 to Run the project or Ctrl+F7 to compile a new EXE file.



## Resources
[Icon](https://findicons.com/icon/175714/diagram_v2_21)
