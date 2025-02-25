# exports

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# options

setopt extended_glob # enable extended globbing
setopt promptsubst # enable command, parameter substitution in prompt.
VIRTUAL_ENV_DISABLE_PROMPT=1

# prompt configuration

function git_branch_rprompt() {
	
	RPROMPT=""
	local gbranch=$(git branch --show-current 2>/dev/null)

	if [ ! -z "$gbranch" ]; then
		local gmark=""
        if [ ! -z "$(git status --short)" ]; then
			gmark="!"
		fi 
		RPROMPT="%B%F{red}$gmark%f%F{green} $gbranch%f%b"
	fi
}

function exit_status_rprompt() {

	RPROMPT+=$' %(?.. %? %F{red}%B%b%F{reset})%(1j. %j %F{yellow}%B%b%F{reset}.)'

}

function set_indicators_prompt() {
    
    INDICATORS=''
    [ $VIRTUAL_ENV ] && INDICATORS+=' (%F{#90EE90} '$(basename $VIRTUAL_ENV)'%f)' # python virtual environment indicator.
}

precmd_functions+=(git_branch_rprompt)
precmd_functions+=(exit_status_rprompt)
precmd_functions+=(set_indicators_prompt)

case $(tty) in 
  (/dev/tty[1-9]) PROMPT_ARROW='->';; 
              (*) PROMPT_ARROW='󰁕';; 
esac

PROMPT=$'\n%B┌──[%F{#FFFF00}%n@%M%f $PROMPT_ARROW %F{#00AFFF}%~%f]$INDICATORS\n└─%F{#FFFF00}%(#.#.$)%f%b '

# word config

WORDCHARS=${WORDCHARS//\/}

# history config

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user 

alias history="history 0"

# auto completion

fpath=($HOME/.zsh/completions $fpath)    # additional local completions

autoload -Uz compinit
compinit
zstyle ':completion::complete:*' gain-privileges 1

# fzf menu for tab completion
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' fzf-bindings 'Tab:toggle+down' 'Shift-Tab:toggle+up'
zstyle ':fzf-tab:*' switch-group '<' '>'

# key bindings

bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end

# fzf keybindings

source <(fzf --zsh)

# aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias pacdiff='DIFFPROG="nvim -d" pacdiff'
alias gdb='gdb -q'
alias sbcl='rlwrap -c sbcl'
alias wa='firefox web.whatsapp.com'


# syntax highlighting

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

fast-theme XDG:sid > /dev/null

export LS_COLORS="$LS_COLORS:di=1;34:" 

# auto suggestion

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
