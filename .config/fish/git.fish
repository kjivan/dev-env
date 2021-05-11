alias edit-git='vi $HOME/.config/fish/git.fish'

alias g='git'

alias ga='git add'
alias gap='git add --patch'
alias gaa='git add --all'
alias gai='git add --interactive'
alias gam='git commit --amend -m'
alias gama='git commit --amend -am'
alias gan='git commit --amend --no-edit'
alias gana='git commit --amend --no-edit -a'

alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbdf='git branch --delete --force'
alias gbl='git blame'
alias gbls='git branch --list | cat'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit --verbose'
alias gcam='git commit -am'
alias gcame='git commit --allow-empty-message -am ""'
alias gcamg='git commit --gpg-sign -am'
alias gcams='git commit --signoff -am'
alias gcamu='git commit -am "Update"'
alias gcem='git commit --allow-empty -m'
alias gcf='git config'
alias gcfl='git config --list'
alias gcfls='git config --list | cat'
alias gcl='git clone --recurse-submodules'
alias gcm='git commit -m'
alias gcmg='git commit --gpg-sign -m'
alias gcms='git commit --signoff -m'
alias gco='git checkout'
alias gcop='git checkout --patch'
alias gcob='git checkout -b'
alias gcobb='git checkout -'
alias gcod='git checkout develop'
alias gcom='git checkout (git_main_branch)'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gds='git diff --staged'
alias gdst='git diff stash@{0}'

alias gf='git fetch'
alias gfo='git fetch origin'

alias ggb='git log --graph --all --simplify-by-decoration --date=format:"%d/%m/%y" --pretty=format:"%C(yellow)%h%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n"'

alias gignore='git update-index --skip-worktree'
alias gunignore='git update-index --no-skip-worktree'
alias gignored='git ls-files -v | grep ^S'

alias gl="git log --pretty=format:'%Cred%h%Creset %s -%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glf="gl --name-status"
alias gls="gl --stat"
alias glp="gl --patch"
alias gg="gl --graph"
alias glt='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s"'
alias gld='glt --date=short'

alias gm='git merge'
alias gmom='git merge origin/(git_main_branch)'
alias gmum='git merge upstream/(git_main_branch)'
alias gmv='git mv'

alias gp='git push'
alias gpd='git push --delete'
alias gpdo='git push --delete origin'
alias gpf='git push --force-with-lease'
alias gpt='git push && git push --tags'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplrs='git pull --recurse-submodules'

alias gr='git reset --mixed'
alias grhard='git reset --hard'
alias grk='git reset --keep'
alias grs='git reset --soft'
alias grh='git reset head --mixed'
alias grhp='git reset head --patch'
alias grhhard='git reset head --hard'
alias grhk='git reset head --keep'
alias grhs='git reset head --soft'
alias grb='git rebase'
alias grbm='git rebase (git_main_branch)'
alias grem='git remote'
alias grema='git remote add'
alias gremrm='git remote rm'
alias gremset='git remote set-url'
alias gremsh='git remote show'
alias gremv='git remote -v'
alias grl='git reflog'
alias grm='git rm'

alias gs='git status --short --branch'
alias gsh='git show --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n"'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstls='git stash list | cat'
alias gstp='git stash push'
alias gstpop='git stash pop'
alias gstsl='git stash show -l'
alias gstsp='git stash show -p'
alias gsub='git submodule'
alias gsuba='git submodule add'
alias gsubi='git submodule update --init'
alias gsubpl='git submodule foreach git pull'
alias gsubplom='git submodule foreach git pull origin (git_main_branch)'
alias gsubs='git submodule status'
alias gsubu='git submodule update --remote --merge'

alias gt='git tag --sort="-taggerdate"'
alias gt1='gt | head -n 1'
alias gtam='git tag -am'
alias gtsm='git tag -sm'
alias gtd='git tag --delete'
alias gtl='git tag --list'
alias gtls='git tag --list | cat'

alias gwch='git whatchanged -p --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%n%n%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n"'

alias git-delete-working-branches="git branch | grep -v '.*develop\|.*master\|.*main' | xargs git branch -D"
alias git-purge="git checkout develop; git reset --hard HEAD develop; git clean -dfx; git pull"
alias git-reset-repo="git-purge; git-delete-working-branches"

function git_main_branch
  if [ (git branch | grep "main") ]
    echo main
  else
    echo master
  end
end
