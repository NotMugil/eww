source ${ZDOTDIR}/environment.zsh # Source envvars
source ${ZDOTDIR}/profile.zsh # Source zprofile
source ${ZDOTDIR}/options.zsh # Source zsh options
source ${ZDOTDIR}/compinit.zsh # Source completion conf
source ${ZDOTDIR}/aliases.zsh # Source zsh aliases
source ${ZDOTDIR}/keybinds.zsh # Source zsh keybinds
source ${ZDOTDIR}/functions.zsh # Source custom functions
source ${ZDOTDIR}/keybinds-late.zsh # Source late load keybinds
source ${ZDOTDIR}/aliases-late.zsh

PROMPT='%F{yellow}%3~%f $ '
PROMPT='%n@%m %1~ %# '

eval "$(starship init zsh)"

export PATH=$PATH:/home/rei/.spicetify
