#----------------------------------------------------------------------
# Initialize environment and alias
#----------------------------------------------------------------------
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color=tty'
alias nvim='/usr/local/opt/bin/vim --cmd "let g:vim_startup=\"nvim\""'
alias mvim='/usr/local/opt/bin/vim --cmd "let g:vim_startup=\"mvim\""'
alias tmux='tmux -2'

# default editor
export EDITOR=vim
# export TERM=xterm-256color

# disable ^s and ^q
# stty -ixon 2> /dev/null

# setup for go if it exists
if [ -d "$HOME/.local/go" ]; then
	export GOPATH="$HOME/.local/go"
	if [ -d "$HOME/.local/go/bin" ]; then
		export PATH="$HOME/.local/go/bin:$PATH"
	fi
fi

# setup for go if it exists
if [ -d /usr/local/app/go ]; then
	export GOROOT="/usr/local/app/go"
	export PATH="/usr/local/app/go/bin:$PATH"
fi

# setup for nodejs
if [ -d /usr/local/app/node ]; then
	export PATH="/usr/local/app/node/bin:$PATH"
fi

# setup for cheat
if [ -d "$HOME/.vim/vim/cheat" ]; then
	export DEFAULT_CHEAT_DIR=~/.vim/vim/cheat
fi


#----------------------------------------------------------------------
# detect vim folder
#----------------------------------------------------------------------
if [ -n "$VIM_CONFIG" ]; then
	[ ! -d "$VIM_CONFIG/etc" ] && VIM_CONFIG=""
fi

if [ -z "$VIM_CONFIG" ]; then
	if [ -d "$HOME/.vim/vim/etc" ]; then
		VIM_CONFIG="$HOME/.vim/vim"
	elif [ -d "/mnt/d/ACM/github/vim/etc" ]; then
		VIM_CONFIG="/mnt/d/ACM/github/vim"
	elif [ -d "/d/ACM/github/vim/etc" ]; then
		VIM_CONFIG="/d/ACM/github/vim/etc"
	elif [ -d "/cygdrive/d/ACM/github/vim/etc" ]; then
		VIM_CONFIG="/cygdrive/d/ACM/github/vim"
	fi
fi

[ -z "$VIM_CONFIG" ] && VIM_CONFIG="$HOME/.vim/vim"

export VIM_CONFIG

[ -d "$VIM_CONFIG/cheat" ] && export DEFAULT_CHEAT_DIR="$VIM_CONFIG/cheat"

export CHEATCOLORS=true

if [ -f "$HOME/.local/lib/python/compinit.py" ]; then
	export PYTHONSTARTUP="$HOME/.local/lib/python/compinit.py"
fi


#----------------------------------------------------------------------
# exit if not bash/zsh, or not in an interactive shell
#----------------------------------------------------------------------
[ -z "$BASH_VERSION" ] && [ -z "$ZSH_VERSION" ] && return
[[ $- != *i* ]] && return


#----------------------------------------------------------------------
# keymap
#----------------------------------------------------------------------

# default bash key binding
if [ -n "$BASH_VERSION" ]; then
	bind '"\eh":"\C-b"'
	bind '"\el":"\C-f"'
	bind '"\ej":"\C-n"'
	bind '"\ek":"\C-p"'
	bind '"\eH":"\eb"'
	bind '"\eL":"\ef"'
	bind '"\eJ":"\C-a"'
	bind '"\eK":"\C-e"'
	bind '"\e;":"ll\n"'
elif [ -n "$ZSH_VERSION" ]; then
	bindkey -s '\e;' 'll\n'
	bindkey -s '\eu' 'ranger_cd\n'
fi


#----------------------------------------------------------------------
# https://github.com/rupa/z
#----------------------------------------------------------------------
if [ -n "$BASH_VERSION" ]; then
	if [ -z "$(type -t _z)" ]; then
		[ -f "$HOME/.local/etc/z.sh" ] && . "$HOME/.local/etc/z.sh"
	fi
fi


#----------------------------------------------------------------------
# other interactive shell settings
#----------------------------------------------------------------------
export GCC_COLORS=1
export EXECIGNORE="*.dll"


