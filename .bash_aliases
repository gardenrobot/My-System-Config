# Aliases
alias ls='ls --color -hF'
alias la='ls --color -AhF'
alias ll='ls --color -lhF'
alias lla='ls --color -lAhF'

alias du='du -hs'
alias df='df -h'

alias grep='grep --color'

alias pim='vim -'
alias vim='vim -p'

alias grr=grr_func
grr_func() {
    grep -r "$1" .
}

alias ag='ag --color-path=35'

# Command line printing for korra
alias myprint='lp -d Deskjet_3000_J310'

alias gitl='git lg|head'
alias gs='git status'
