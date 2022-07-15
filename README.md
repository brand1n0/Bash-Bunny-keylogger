# Bash-Bunny-keylogger

Majority of his script was made by blue c0sm0, https://github.com/CosmodiumCS/DucKeyhook, go check him out and check out his youtube channel. Before I made changes, anti-virus would flag this keylogger and not allow the keylogger to run. I changed it so this script and now it will disable windows anti-virus and send the keys to the discord a little faster.

This keylogger only works on windows machines, I have only tested it on windows 10.

How it works:
moves c.cmd file to windows startup directory
c.cmd will secretly run p.ps1
p.ps1 will log keystrokes
l.ps1 will execute p.ps1 every minue
this can be changed to a preferred delay
uninstaller.cmd uninstalls the payload from the target computer
