#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \w]\$ '
if [ -f ~/.bash_alias ]; then
. ~/.bash_alias
fi

#Not needed? Don't remember what this is for
#eval $(gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK

#exec /usr/bin/virtualenvwrapper.sh

LINUX_KERNEL=`uname -r`
# Realtime LTS kernel
if [ $LINUX_KERNEL != ${LINUX_KERNEL/rt-lts/} ]; then
    # TODO: Figure out what uname -r outputs for rt-lts and format it.
    INSTALLED_VERSION=`pacman -Qi linux-rt-lts | awk -F ':' '/^Version/ {print $2;}' | tr -d ' '`
    RUNNING_VERSION=`uname -r | sed 's/-lts//'`
# LTS kernel
elif [ $LINUX_KERNEL != ${LINUX_KERNEL/lts/} ]; then
    INSTALLED_VERSION=`pacman -Qi linux-lts | awk -F ':' '/^Version/ {print $2;}' | tr -d ' '`
    RUNNING_VERSION=`uname -r | sed 's/-lts//'`
# Realtime kernel
elif [ $LINUX_KERNEL != ${LINUX_KERNEL/rt/} ]; then
    INSTALLED_VERSION=`pacman -Qi linux-rt | awk -F ':' '/^Version/ {print $2;}' | tr -d ' '`
    RUNNING_VERSION=`uname -r | sed -r 's/([0-9]+\.[0-9]+\.[0-9]+)-rt([0-9]+)-arch([0-9]+)-([0-9]+)-rt/\1\.rt\2\.arch\3\-\4/'`
# Regular kernel
else
    INSTALLED_VERSION=`pacman -Qi linux | awk -F ':' '/^Version/ {print $2;}' | tr -d ' '`
    RUNNING_VERSION=`uname -r | sed -r 's/([0-9]+\.[0-9]+\.[0-9]+)-(.*)/\1\.\2/'`
fi
[ $INSTALLED_VERSION != $RUNNING_VERSION ] && echo "New Kernel version available!"
#Set LS colors
eval "$(dircolors $DOTFILES/.dircolors)"
#echo `python $HOME/Code/linuxSays/script.py -p`
NUM_COMMITS=$($HOME/.scripts/password-check.sh)
echo "It has been $NUM_COMMITS commits since you last exported your passwords"


