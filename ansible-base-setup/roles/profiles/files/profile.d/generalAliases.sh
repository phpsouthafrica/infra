#!/bin/bash

alias l='ls -l'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ~="cd ~"

alias scpresume='rsync -Pazhv  -e ssh'
alias scpsudo='rsync  -Pazhv -e "ssh -t" --rsync-path="sudo rsync"'

alias delSSHHost='ssh-keygen -R'
alias portsActive="netstat -lntup"

alias grep='grep --color'

alias cpuavail='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors'
alias cpushow='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpuhigh='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
