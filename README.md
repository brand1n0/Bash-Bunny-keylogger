# Bash-Bunny-keylogger

This script was 90% made by blue c0sm0, https://github.com/CosmodiumCS/DucKeyhook, go check him out. Before I made changes, anti-virus would flag this keylogger and not allow the keylogger to run. I changed it so this script will disable windows anti-virus and send the keys to the discord a little faster.

This keylogger only works on windows machines, I have only tested it on windows 10.

How it works:
moves c.cmd file to windows startup directory
c.cmd will secretly run p.ps1
p.ps1 will log keystrokes
l.ps1 will execute p.ps1 every minue
this can be changed to a preferred delay
uninstaller.cmd uninstalls the payload from the target computer
