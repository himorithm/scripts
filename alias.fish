#!/usr/bin/fish

#alias reboot="sudo systemctl reboot"
#alias poweroff="sudo systemctl poweroff"
#alias halt="sudo systemctl halt"
#alias suspendh="systemctl suspend-then-hibernate"
#alias suspend="systemctl suspend"
#alias hibernate="systemctl hibernate"
alias notes="cd ~/work/Documents/notes"
funcsave notes
alias scripts="cd ~/work/scripts"
funcsave scripts
alias chgwall="feh -rz --bg-fill $HOME/media/Pictures/WallPapers/*"
funcsave chgwall
alias technotes="cd ~/work/Documents/notes/latex/technotes"
funcsave technotes
alias bwork="br ~/work/"
funcsave bwork
alias blueh="sh ~/work/scripts/blueHeadSet.sh"
funcsave blueh
alias blues="sh ~/work/scripts/bluestop.sh"
funcsave blues 
alias site="cd ~/work/site/hugo/intothebasket.com/content/"
funcsave site
alias sitescripts="cd ~/work/site/ssh/"
funcsave sitescripts
## Show hidden files ##

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
funcsave grep
#alias egrep='egrep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias bc='bc -l'
alias vi=nvim
funcsave vi
alias vim=nvim
funcsave vim
#alias svi='sudo nvim'
#alias vis='nvim "+set si"'
#alias edit='nvim'
#alias l.='/usr/bin/ls -d .* --color=auto'
#alias ll='/usr/bin/ls --color=auto  -la'
#alias ls='br -dp'

# Stop after sending count ECHO_REQUEST packets #
#alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
#alias fastping='ping -c 100 -s.2'
#alias ports='netstat -tulanp'
alias personalbkp="bash ~/work/scripts/backup_mybook.sh"
funcsave personalbkp
alias sysbkp="bash ~/work/scripts/backup_system.sh"
funcsave sysbkp
alias mobilebkp="bash ~/work/scripts/backup_mobile.sh"
funcsave mobilebkp
alias music=ncmpcpp
funcsave music 
alias lswifi="nmcli conn show"
funcsave lswifi
alias mountbook="~/work/scripts/mount_mybook.sh"
funcsave mountbook 

set -Ux _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.opengl=true"
set -Ux TERM xterm
