# ========================================
# POWERLEVEL10K: Instant prompt (VERY TOP)
# ========================================
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ========================================
# Powerlevel10k theme
# ========================================
source ~/REPOS/powerlevel10k/powerlevel10k.zsh-theme

# ========================================
# PATH tweaks
# ========================================
export PATH="$PATH:/home/kira/.spicetify"
export PATH="$PATH:~/.spicetify"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH=$PATH:$HOME/go/bin
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# ========================================
# Zsh options (fast & comfy)
# ========================================
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY      # save history immediately
setopt HIST_IGNORE_DUPS        # no duplicates
setopt AUTO_CD                 # auto cd when typing a folder name
setopt PUSHD_IGNORE_DUPS

# ========================================
# Completion system
# ========================================
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit
compinit

# ========================================
# Plugins
# ========================================
# zsh-syntax-highlighting (must be last for colors to work correctly)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF key bindings & completion
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# ========================================
# Zoxide (modern directory jumper)
# ========================================
eval "$(zoxide init zsh)"          # tab completion included by default

# ========================================
# Smart cd override with fuzzy fallback
# ========================================
cd() {
    if [[ $# -eq 0 ]]; then
        builtin cd ~
    else
        if builtin cd "$1" 2>/dev/null; then
            return
        fi

        # Fuzzy match using zoxide (case-insensitive)
        target=$(zoxide query "$1" | fzf --height 40% --reverse --prompt="CD> " --ansi --ignore-case --select-1)
        if [[ -n "$target" ]]; then
            builtin cd "$target"
        else
            echo "cd: no such directory: $1"
        fi
    fi
}

# Fuzzy cd alias
alias zd='cd $(zoxide query | fzf --height 40% --reverse --prompt="ZD> " --ansi --ignore-case)'

# ========================================
# Aliases & Utils
# ========================================
alias ll='ls -alh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias c='clear'
alias vi='nvim'
alias grep='rg'
alias cat='bat'

# ========================================
# Instant prompt fallback (optional)
# ========================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH="/home/kira/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/kira/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# NPM global bin (added by Qwen Code installer)
export PATH="$HOME/.npm-global/bin:$PATH"

