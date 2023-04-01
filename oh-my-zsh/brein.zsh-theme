function clock() {
    local color="%F{202}"
    echo "${color} %T"
}

function user() {
    local color="%F{99}"
    local user="%n"
    echo "${color} ${user}"
}

function host() {
    local color="%F{045}"
    local host="%m"
    echo "  ${color} ${host}"
}

function dir() {
    local color="%F{221}"
    local dir=" %4~"
    echo "  $color$dir"
}

function vcs() {
    local color="%F{207}"
    ZSH_THEME_GIT_PROMPT_PREFIX="${color} "
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=" "
    ZSH_THEME_GIT_PROMPT_CLEAN=" "

    if [ -n "$(git_prompt_info)" ]; then
        echo "  $(git_prompt_info)"
    fi
}

function pyenv() {
    local color="%F{39}"
    ZSH_THEME_VIRTUALENV_PREFIX="${color} "
    ZSH_THEME_VIRTUALENV_SUFFIX=""

    if [ -n "$(virtualenv_prompt_info)" ]; then
        echo "  $(virtualenv_prompt_info)"
    fi
}

function status() {
    local green="%F{40}"
    local red="%F{196}"
    echo "%(?.$green.$red)%?   %{$reset_color%}"
}

PROMPT=$'
 $(user)$(host)$(dir)$(vcs)$(pyenv)
 $(status)'
