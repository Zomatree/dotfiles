# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH configuration file.

# Set command aliases.
alias ls='lsd'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ccat='highlight --out-format=ansi'
alias ytdl='youtube-dl'
alias python=python3.9
alias pip='python3.9 -m pip'
alias py='python3.9'
alias python3='python3.9'
alias vim='nvim'
alias yay='paru'

export PATH=~/.local/bin:$PATH

if (grep -qi microsoft /proc/version); then
    export _ip=`(grep nameserver /etc/resolv.conf | awk '{print $2}')`
    export PULSE_SERVER=tcp:$_ip
    export DISPLAY=$_ip:0
fi

# Set the name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set Powerlevel10k font mode.
POWERLEVEL9K_MODE="nerdfont-complete"

# Auto-correction for commands.
ENABLE_CORRECTION="true"

# Command execution timestamp in history command output.
HIST_STAMPS="mm/dd/yyyy"
DISABLE_LS_COLORS="true"

# Plugins to load.
plugins=(
    colorize
    copyfile
    dotenv
    emacs
    git
    gitfast
    safe-paste
    virtualenv
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

setopt HIST_IGNORE_SPACE
autoload -U compinit && compinit

source ~/.oh-my-zsh/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export LIBGL_ALWAYS_INDIRECT=1
[ -f "/home/zomatree/.ghcup/env" ] && source "/home/zomatree/.ghcup/env" # ghcup-env

if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

export PATH=~/.npm-global/bin:$PATH

export $(dbus-launch)
