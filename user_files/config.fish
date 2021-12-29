set -l local_config ~/.config/fish/config_local.fish
if test -f $local_config
    source $local_config
end

function fish_prompt
    set -l err $status
    if test $err -eq 0
        echo -n (set_color cyan)"[^_^] "
    else
        echo -n (set_color red)"$err [>_<] "
    end
    echo -n (set_color yellow)(prompt_hostname)(set_color brblack)":"(set_color normal)(prompt_pwd)(set_color red)" "
    if set -q prompt_char
        echo -n "$prompt_char"
    else
        echo -n '$'
    end
    if set -q fish_git_prompt
        echo -n (set_color green)(fish_git_prompt)" "
    else
        echo -n " "
    end
end

# disable help message
set fish_greeting

# For when your computer is doing a good job
alias thank-you='echo "You'"'"'re welcome! <3"'

# Mac's ls has a different option for colored output
if which sw_vers > /dev/null
    set color_opt "-G"
else
    set color_opt "--color"
end
alias ls='ls $color_opt -hF'
alias l='ls $color_opt -hF'
alias la='ls $color_opt -AhF'
alias ll='ls $color_opt -lhF'
alias lla='ls $color_opt -lAhF'

alias pvi='vi -'
alias vi='vi -p'

alias gs='git status'

alias du='du -hs'

alias df='df -h'

# to train myself to use vi command
alias grep='grep --color'
alias ag='ag --color-path=35'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
if which sw_vers > /dev/null
    alias alert='osascript -e "display alert \"command finished\""'
else
    alias alert='notify-send --urgency=critical "command finished"'
end

#alias mus='cd ~/music && cmus'

alias vba='source venv/bin/activate.fish'
alias vba2='source venv2/bin/activate.fish'

alias dc=docker-compose

function pr
    #set -l repo (basename (git rev-parse --show-toplevel))
    set -l repo (git remote get-url origin | sed 's#.*/\(.*\)\.git#\1#')
    set -l branch (git branch --show-current)
    open "https://github.com/truenorthfleet/$repo/pull/new/$branch"
end

alias pushit="git push --set-upstream origin (git branch --show-current)"

alias mi=micro
