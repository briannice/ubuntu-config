# -------------------------------------
# Colors
# -------------------------------------
dark="235"
light="255"
green="40"
red="196"
orange="202"
purple="99"
blue="21"
cyan="45"
pink="207"
yellow="221"

# -------------------------------------
# Clock
# -------------------------------------
function clock() {
    local color="%F{$orange}"
    echo "${color} %T"
}

# -------------------------------------
# Username
# -------------------------------------
function user() {
    local color="%F{$purple}"
    local user="%n"
    echo "${color} ${user}"
}

# -------------------------------------
# Computer hostname
# -------------------------------------
function host() {
    local color="%F{$orange}"
    local host="%m"
    echo "  ${color} ${host}"
}

# -------------------------------------
# Directory
# -------------------------------------
function dir() {
    local color="%F{$yellow}"
    local dir=" %4~"
    echo "  $color$dir"
}

# -------------------------------------
# Version control
# -------------------------------------
function vcs() {
    local color="%F{$pink}"
    ZSH_THEME_GIT_PROMPT_PREFIX="${color} "
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=" "
    ZSH_THEME_GIT_PROMPT_CLEAN=" "

    if [ -n "$(git_prompt_info)" ]; then
        echo "  $(git_prompt_info)"
    fi
}

# -------------------------------------
# Python virtual environment
# -------------------------------------
function pyenv() {
    local color="%F{$blue}"
    ZSH_THEME_VIRTUALENV_PREFIX="${color} "
    ZSH_THEME_VIRTUALENV_SUFFIX=""

    if [ -n "$(virtualenv_prompt_info)" ]; then
        echo "  $(virtualenv_prompt_info)"
    fi
}

# -------------------------------------
# Exit status code
# -------------------------------------
function status() {
    local green="%F{$green}"
    local red="%F{$red}"
    echo "%(?.$green.$red)%?   %{$reset_color%}"
}

# -------------------------------------
# Prompt
# -------------------------------------
PROMPT=$'
$(user)$(host)$(dir)$(vcs)$(pyenv)
$(status)'
