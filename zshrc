# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' expand suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format '%B%F{green}--- Completing %d ---%f%b'
zstyle ':completion:*' ignore-parents parent pwd directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'm:{a-z}={A-Z}'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle :compinstall filename ~/.zshrc
autoload -Uz compinit
compinit -i
# End of lines added by compinstall

PROMPT='%B%F{yellow}%T%f %F{blue}%(?..%? )%(1j.[%j&] .)%f%F{cyan}%n%f %F{red}%#%f%b '
RPROMPT='%B%F{green}%/%f@%F{magenta}%m%f%b'

#bindkey "\e[3~" delete-char
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[3~" delete-char
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "^R" history-incremental-search-backward

if which dircolors > /dev/null ; then
    eval $(dircolors -b)
fi
if ls --color=auto > /dev/null 2>&1 ; then
    alias ls="ls --color=auto"
fi
export CLICOLOR=

alias less="less -r"
alias rm="rm -v"
alias ll="ls -alh"
alias l="ls -lh"
alias cp="cp -vi"
alias grep="grep --color=auto"
alias mv="mv -iv"
alias ping="ping -n"
alias ping6="ping6 -n"
alias tmux="tmux -2 -u"

export EDITOR=vim
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/sbin:/Library/TeX/texbin/:~/Library/Python/2.7/bin:$PATH
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=1

if which mesg > /dev/null ; then
    mesg n
fi

true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
