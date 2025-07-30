# Custom oh-my-zsh theme with time, uv virtual env, git branch, kubectl info, and AWS plugin support

# Color definitions
if [[ $terminfo[colors] -ge 256 ]]; then
    # 256 color support
    blue="%F{33}"
    green="%F{118}"
    yellow="%F{220}"
    red="%F{196}"
    purple="%F{135}"
    cyan="%F{81}"
    gray="%F{240}"
    orange="%F{166}"
else
    # Fallback to 8 colors
    blue="%F{blue}"
    green="%F{green}"
    yellow="%F{yellow}"
    red="%F{red}"
    purple="%F{magenta}"
    cyan="%F{cyan}"
    gray="%F{grey}"
    orange="%F{yellow}"
fi

# Reset color
reset_color="%{$reset_color%}"

# Git prompt customization
ZSH_THEME_GIT_PROMPT_PREFIX="(${yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")${reset_color}"
ZSH_THEME_GIT_PROMPT_DIRTY="${red} ✗${reset_color}"
ZSH_THEME_GIT_PROMPT_CLEAN="${green} ✓${reset_color}"

# Kubectl prompt
if [[ "${plugins[@]}" =~ 'kube-ps1' ]]; then
    local kube_prompt='$(kube_ps1)'
else
    local kube_prompt=''
fi

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

# Function to get AWS prompt info
function aws_info() {
    if [[ -n "$AWS_PROFILE" ]]; then
        echo "${cyan}<aws:${AWS_PROFILE}>${reset_color} "
    fi
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Main prompt
PROMPT='%{$gray%}┌─%{$reset_color%}'
PROMPT+=' '
PROMPT+='%{$blue%}%T%{$reset_color%}'
PROMPT+=' '
PROMPT+='$(virtualenv_prompt_info)'
PROMPT+='%{$green%}%~%{$reset_color%}'
PROMPT+=' '
PROMPT+='$(git_prompt_info)'
PROMPT+=' '
PROMPT+="${kube_prompt}"
PROMPT+=' '
PROMPT+='$(aws_info)'
PROMPT+='
%{$gray%}└─%{$reset_color%}'
PROMPT+=' %{$purple%}%(!.#.$)%{$reset_color%} '

# AWS plugin sets RPROMPT, so we reset

RPROMT="%B${return_code}%b"

