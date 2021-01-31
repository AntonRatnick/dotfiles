# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export TERM=alacritty
export TERMINAL=alacritty
export BROWSER=/var/lib/flatpak/exports/bin/org.mozilla.firefox
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export EDITOR="/usr/bin/nvim"


alias ls="exa"
alias la="exa -la"
alias top="ytop"
alias vim="nvim"
alias v="nvim"
alias vi="nvim"
alias find="fd"
alias bw="bandwhich"
alias ps="procs"
alias cat="bat"
alias so="source"
alias grep="rg"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source ~/.antigen.zsh
antigen bundle npm
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen theme denysdovhan/spaceship-prompt
antigen apply

SPACESHIP_PROMPT_ORDER=(time user dir host git exit_code line_sep char)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
