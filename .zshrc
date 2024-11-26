#### Path Exports ####

export DUOLINGO_ID=685538814
eval "$(nodenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
#### Custom Commands ####

# For General Terminal Use

alias ll='ls -al'
alias cpwd='pwd | tr -d "\n" | pbcopy'

# For Git

function merge_latest_master() {
    local current_branch=$(git symbolic-ref --short HEAD)
    echo "merge_latest_master: Current branch: $current_branch"

    echo "merge_latest_master: Stashing changes on $current_branch..."
    git stash push -m "Auto-stash before updating master"

    echo "merge_latest_master: Switching to master branch..."
    git checkout master || { echo "merge_latest_master: Failed to switch to master branch"; return 1; }

    echo "merge_latest_master: Pulling latest changes from master..."
    git pull origin master || { echo "merge_latest_master: Failed to pull latest changes from master"; git checkout $current_branch; return 1; }

    echo "merge_latest_master: Switching back to $current_branch..."
    git checkout $current_branch || { echo "merge_latest_master: Failed to switch back to $current_branch"; return 1; }

    echo "merge_latest_master: Merging master into $current_branch..."
    git merge master || { echo "merge_latest_master: Merge conflicts detected. Resolve conflicts and continue manually."; return 1; }

    echo "merge_latest_master: Applying stash..."
    git stash pop || { echo "merge_latest_master: Failed to apply stash"; return 1; }

    echo "merge_latest_master: Successfully updated $current_branch with latest changes from master."
}

alias ga='git add --all'
alias gcm='git commit'
alias gcmn='git commit --no-verify'
alias gg='git log'
alias gg1='git log -1'
alias gk='git checkout'
alias gkm='git checkout master'
alias gl='git pull'
alias gm='git merge'
alias gmm='merge_latest_master'
alias gp='git push'
alias gpu='git push -u origin'
alias gt='git status'
alias gb='git branch'
alias gbd='git branch delete'
alias gst='git stash'
alias gstm='git stash push -m'
alias gsta='git stash apply'
alias gsl="git --no-pager stash list -20"
alias dupw="docker-compose up web"
alias dup="docker-compose up"
alias ddown="docker-compose down"
alias dbuildw="docker-compose build web"
alias dbuild="docker-compose build"
alias rstart="./run.sh start"
alias rbuild="./run.sh build"
alias rstop="./run.sh stop"
alias iff="code ~/code/det-items-factory-frontend"
alias ifb="code ~/code/det-items-factory-backend"
alias examadmin="code ~/code/det-exam-administration-backend"
alias itemsb="code ~/code/det-items-backend"
alias detweb="code ~/code/det-web"
alias detmono="code ~/code/duolingo-englishtest"
alias zshrc="code ~/code/dotfiles/.zshrc"

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
