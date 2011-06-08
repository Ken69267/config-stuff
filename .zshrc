# teh profile
source /etc/zsh/zprofile
# for echangelog
export ECHANGELOG_USER="Kenneth Prugh <ken69267@gentoo.org>"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"
# Completion and Prompt
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# Completion Cache
zstyle ':completion::complete:*' use-cache 1

# Options
setopt nohup # don't exit background jobs
setopt nocheckjobs # and don't warn about them
setopt autocd # cd into commands that don't exist
setopt cdablevars # use home instead of $home
setopt hist_ignore_all_dups

# .ssh/known_hosts completion
if [ -e .ssh ] ; then
	local _myhosts
	_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
	zstyle ':completion:*' hosts $_myhosts
fi

# Aliases
alias grep='egrep -n --color=auto'
alias ls='ls -F --color=auto -tr'

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhist

# Key bindings
bindkey -v	# vi key bindings
#bindkey -e	# emacs key bindings

# gnome-terminal
bindkey 'OH' beginning-of-line
bindkey '[5C' forward-word
bindkey '[5D' backward-word
bindkey 'OF' end-of-line

# screen
bindkey '[1~' beginning-of-line
bindkey 'O5C' forward-word
bindkey 'O5D' backward-word
bindkey '[4~' end-of-line

# both+xterm
bindkey '[3~' delete-char

# bash style history searching
bindkey '[5~' history-search-backward
bindkey '[6~' history-search-forward

# xterm (the real one)
bindkey '[1;5C' forward-word
bindkey '[1;5D' backward-word
bindkey '[H' beginning-of-line
bindkey '[F' end-of-line

# aterm
bindkey 'Oc' forward-word
bindkey 'Od' backward-word
bindkey '[7~' beginning-of-line
bindkey '[8~' end-of-line

# schedtool aliases
alias vmware="schedtool -B -e vmware"
alias dosemu="dosemu -B -e dosemu"
alias emerge="schedtool -B -e emerge"
alias make="schedtool -B -e make -j3"
alias eix-sync="schedtool -B -e eix-sync"
alias revdep-rebuild="schedtool -B -e revdep-rebuild -v"

# other aliases
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias df='df -lhT'
alias diff='diff -u'
alias startx='startx -- -ignoreABI'

#random
#alias curl="curl -O"
alias DIAF="pkill -9"
alias open="xdg-open"

alias k7z="7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on"

#Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if [[ -f ~/.dir_colors ]]; then
	eval `dircolors -b ~/.dir_colors`
else
	eval `dircolors -b /etc/DIR_COLORS`
fi

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
###
#
case $TERM in
	*xterm*|*rxvt*|(dt|k|E)term)
		precmd () { print -Pn "\e]0;$TERM - %~\a" }
		preexec () { print -Pn "\e]0;$TERM - $1\a" }
		;;
esac 

elog() {
	vi /usr/portage/$1/ChangeLog
}

#colors
#export TERM='rxvt-unicode256'
export XMODIFIER=@im=SCIM
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE=scim-bridge
export QT_IM_MODULE=scim-bridge
export QT4_IM_MODULE=scim-bridge
