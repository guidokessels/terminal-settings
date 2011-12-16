# Include git info & auto-completion
#source ~/git-completion.bash
source /etc/bash_completion.d/git
#source `brew --prefix git`/etc/bash_completion.d/git

function pre_prompt {
newPWD="${PWD}"
user="whoami"
host=$(echo -n $HOSTNAME | sed -e "s/[\.].*//")
datenow=$(date "+%a, %d %b %y")
let promptsize=$(echo -n "--($user@$host ddd, DD mmm YY)---(${PWD})---" | wc -c | tr -d " ")
let fillsize=${COLUMNS}-${promptsize}
fill=">"
while [ "$fillsize" -gt "0" ] 
do 
    fill="${fill}-"
	let fillsize=${fillsize}-1
done
if [ "$fillsize" -lt "0" ]
then
    let cutt=3-${fillsize}
    newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cutt\}\)\(.*\)/\2/")"
fi
}

PROMPT_COMMAND=pre_prompt

# Colours!
export black="\[\033[0;38;5;0m\]"
export red="\[\033[0;38;5;1m\]"
export green="\[\033[0;38;5;2m\]"
export yellow="\[\033[0;38;5;3m\]"
export blue="\[\033[0;38;5;4m\]"
export magenta="\[\033[0;38;5;55m\]"
export cyan="\[\033[0;38;5;6m\]"
export white="\[\033[0;38;5;7m\]"
export coldblue="\[\033[0;38;5;33m\]"
export smoothblue="\[\033[0;38;5;111m\]"
export iceblue="\[\033[0;38;5;45m\]"
export turqoise="\[\033[0;38;5;50m\]"
export smoothgreen="\[\033[0;38;5;42m\]"

# 
export PS1="$coldblue\$newPWD$green>$white "

# bash_history settings: size and no duplicates and no lines w/ lead spaces
export HISTCONTROL="ignoreboth"
export HISTSIZE=1024

# aliases #############################################

# enable color support of ls and also add handy aliases
eval `dircolors -b`
alias ls='ls --color=auto -latr'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

# some more aliases
alias reloadnginx='sudo /etc/init.d/nginx reload'

# Panda-specific project shortcuts
alias cms='cd ~/bigdisk/docs/LIBS/zapapa-cms/'
alias core='cd ~/bigdisk/docs/LIBS/zapapa-core/'
alias platform='cd ~/bigdisk/docs/LIBS/zapapa-platform/'
alias libs='cd ~/bigdisk/docs/LIBS/'
alias developers='cd /bigdisk/developers/'
alias zpcreate='sudo php /bigdisk/developers/common/zpcreate.php'

alias removesvndirs="rm -rf `find . -type d -name .svn`"

##########################################################
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias ..='cd ..'
alias ...='cd ../../'
