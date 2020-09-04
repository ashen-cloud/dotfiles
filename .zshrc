bindkey -v

export PATH="$HOME/Scripts:$HOME/.local/bin:$PATH"
export GOPATH=$HOME/go

export CUPY_GPU_MEMORY_LIMIT="702464000"

export STEAM_COMPAT_DATA_PATH=$HOME/Proton

# alias pacman="sudo pacman"

record_screen() {
  name="/home/$USER/Videos/$1.mp4"
  ffmpeg -video_size 2560x1440 -framerate 60 -f x11grab -i :0.0 -f pulse -ac 2 -i default -acodec opus -loglevel error -strict -2 $name
  echo Written in $name
}

HISTFILE=~/.config/zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory

export KEYTIMEOUT=1
export EDITOR="nvim"
export TERM="xterm-256color"

eval $(thefuck --alias)

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

source ~/Git/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/Git/zsh-plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/Git/zsh-plugins/vi-mode.plugin.zsh
source ~/Git/zsh-plugins/fzf.plugin.zsh
source ~/Git/zsh-plugins/thefuck.plugin.zsh

setopt prompt_subst
#    
PROMPT='%f%F{black}%1 user:%f%F{red}%1 ${USER}%f%F{magenta}%1 %f %F{black}%1 dir:%f%F{red}%1 ${PWD/#$HOME/~}%f %F{white}%1 ${vcs_info_msg_0_}%f%F{cyan}%1 => '
MODE_INDICATOR=""

zstyle ':vcs_info:git*' formats "%F{black}%1 branch:%f%F{red}%1 %b %a"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

autoload -Uz compinit && compinit
autoload -U colors && colors
zmodload zsh/complist

neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

