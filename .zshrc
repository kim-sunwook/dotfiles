#### Path Exports ####

export DUOLINGO_ID=685538814
eval "$(nodenv init -)"

#### Custom Commands ####

# For General Terminal Use

alias ll='ls -al'
alias cpwd='pwd | tr -d "\n" | pbcopy'

# For Git

alias ga='git add --all'
alias gcm='git commit'
alias gcmn='git commit --no-verify'
alias gg='git log'
alias gg1='git log -1'
alias gk='git checkout'
alias gkm='git checkout master'
alias gl='git pull'
alias gm='git merge'
alias gmm='git merge master'
alias gp='git push'
alias gpu='git push -u origin'
alias gt='git status'
alias gb='git branch'
alias gbd='git branch delete'
alias gst='git stash'
alias gsta='git stash apply'
#### Show current git branch on terminal ####

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

#### Duolingo CLI - https://github.com/duolingo/cli ####
. "${HOME}/.duolingo/init.sh"

