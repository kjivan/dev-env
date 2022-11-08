alias edit-git="vi $HOME/.zsh/git.zsh"

alias g="git $@"

alias ga="git add $@"
alias gap="git add --patch $@"
alias gaa="git add --all $@"
alias gai="git add --interactive $@"

alias gb="git branch $@"
alias gba="git branch --all $@"
alias gbd="git branch --delete $@"
alias gbdp="git branch --delete $@; git push origin --delete $@"
alias gbdf="git branch --delete --force $@"

alias gbl="git blame $@"

alias gbs="git bisect $@"
alias gbsb="git bisect bad $@"
alias gbsg="git bisect good $@"
alias gbsr="git bisect reset $@"
alias gbss="git bisect start $@"

alias gc="git commit --verbose"
alias gcm="git commit -m $@"
alias gca="git commit -a --verbose"
alias gcam="git commit -am $@"
alias gcem="git commit --allow-empty -m $@"

alias gcamend="git commit --amend"
alias gcamm="git commit --amend -m $@"
alias gcamam="git commit --amend -am $@"
alias gcamn="git commit --amend --no-edit"
alias gcaman="git commit --amend -a --no-edit"

alias gcf="git config $@"
alias gcfl="git config --list"

alias gcl="git clone --recurse-submodules $@"

alias gco="git checkout $@"
alias gcop="git checkout --patch "
alias gcob="git checkout -b $@"
alias gcobb="git checkout - $@"
gcom() { git checkout $(gmb) }
alias gcom="git checkout (gmb)"
alias gcp="git cherry-pick $@"
alias gcpa="git cherry-pick --abort $@"
alias gcpc="git cherry-pick --continue $@"

alias gd="git diff -w $@"
alias gds="git diff -w --staged $@"
alias gdst="git diff -w stash@{0} $@"

alias gf="git fetch $@"
alias gfo="git fetch origin $@"

alias ggb="git log --graph --all --simplify-by-decoration --date=format:'%d/%m/%y' --pretty=format:'%C(yellow)%h%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n' $@"

alias gignore="git update-index --skip-worktree $@"
alias gunignore="git update-index --no-skip-worktree $@"
alias gignored="git ls-files -v | grep ^S $@"

alias gl="git log --pretty=format:'%Cred%h%Creset %s -%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit $@"
alias glf="gl --name-status $@"
alias gls="gl --stat $@"
alias glp="gl --patch $@"
alias gg="gl --graph $@"
alias glt="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' $@"
alias gld="glt --date=short $@"

alias gm="git merge $@"
alias gmom="git merge origin/(gmb) $@"
alias gmum="git merge upstream/(gmb) $@"
alias gmv="git mv $@"

alias gp="git push $@"
alias gpd="git push --delete $@"
alias gpdo="git push --delete origin $@"
alias gpf="git push --force-with-lease $@"
alias gpt="git push && git push --tags $@"
alias gpl="git pull $@"
alias gplr="git pull --rebase $@"
alias gplrs="git pull --recurse-submodules $@"

alias gr="git reset --mixed $@"
alias grhard="git reset --hard $@"
alias grk="git reset --keep $@"
alias grs="git reset --soft $@"
alias grh="git reset head --mixed $@"
alias grhp="git reset head --patch $@"
alias grhhard="git reset head --hard $@"
alias grhk="git reset head --keep $@"
alias grhs="git reset head --soft $@"
alias grb="git rebase $@"
alias grbm="git rebase (gmb) $@"
alias grem="git remote $@"
alias grema="git remote add $@"
alias gremrm="git remote rm $@"
alias gremset="git remote set-url $@"
alias gremsh="git remote show $@"
alias gremv="git remote -v $@"
alias grl="git reflog $@"
alias grm="git rm $@"

alias gs="git status --short --branch $@"
alias gsh="git show --date=format:'%A %B %d %Y at %H:%M' --pretty=format:'%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n' $@"
alias gst="git stash $@"
alias gsta="git stash apply $@"
alias gstd="git stash drop $@"
alias gstl="git stash list $@"
alias gstls="git stash list | cat $@"
alias gstp="git stash push $@"
alias gstpop="git stash pop $@"
alias gstsl="git stash show -l $@"
alias gstsp="git stash show -p $@"
alias gsub="git submodule $@"
alias gsuba="git submodule add $@"
alias gsubi="git submodule update --init $@"
alias gsubpl="git submodule foreach git pull $@"
alias gsubplom="git submodule foreach git pull origin (gmb) $@"
alias gsubs="git submodule status $@"
alias gsubu="git submodule update --remote --merge $@"

alias gt="git tag $@"
alias gtp="git tag $@; git push origin $@"
alias gtl="git tag --format='%(creatordate:short)%09%(refname:strip=2)' --sort=-creatordate"
alias gt1="gtl | head -n 1 $@"
alias gtam="git tag -am $@"
alias gtsm="git tag -sm $@"
alias gtd="git tag --delete $@"
alias gtdp="git tag --delete $@; git push --delete origin $@"

alias gdt="git describe --tags $@"

alias gwch="git whatchanged -p --date=format:'%A %B %d %Y at %H:%M' --pretty=format:'%n%n%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n' $@"

alias gmb="git remote show origin | grep 'HEAD branch' | cut -d' ' -f5"
alias git-delete-working-branches="git branch | grep -v (gmb) | xargs git branch -D $@"
alias git-purge="git checkout (gmb); git reset --hard HEAD (gmb); git clean -dfx; git pull $@"
alias git-reset-repo="git-purge; git-delete-working-branches $@"

gcb () {
  git checkout (gmb)
  git pull
  git checkout -b $@
  git push --set-upstream origin $@
}
