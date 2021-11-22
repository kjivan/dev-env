function edit-git -w "vi $HOME/.config/fish/git.fish"; vi $HOME/.config/fish/git.fish $argv; end

function g -w "git"; git $argv; end

function ga -w "git add"; git add $argv; end
function gap -w "git add --patch"; git add --patch $argv; end
function gaa -w "git add --all"; git add --all $argv; end
function gai -w "git add --interactive"; git add --interactive $argv; end

function gb -w "git branch"; git branch $argv; end
function gba -w "git branch --all"; git branch --all $argv; end
function gbd -w "git branch --delete"; git branch --delete $argv; end
function gbdf -w "git branch --delete --force"; git branch --delete --force $argv; end
function gbl -w "git blame"; git blame $argv; end
function gbls -w "git branch --list | cat"; git branch --list | cat $argv; end
function gbs -w "git bisect"; git bisect $argv; end
function gbsb -w "git bisect bad"; git bisect bad $argv; end
function gbsg -w "git bisect good"; git bisect good $argv; end
function gbsr -w "git bisect reset"; git bisect reset $argv; end
function gbss -w "git bisect start"; git bisect start $argv; end

function gc -w "git commit --verbose"; git commit --verbose $argv; end
function gcam -w "git commit -am"; git commit -am $argv; end
function gcame -w "git commit --allow-empty-message -am """; git commit --allow-empty-message -am "" $argv; end
function gcamg -w "git commit --gpg-sign -am"; git commit --gpg-sign -am $argv; end
function gcams -w "git commit --signoff -am"; git commit --signoff -am $argv; end
function gcamu -w "git commit -am "Update""; git commit -am "Update" $argv; end
function gcem -w "git commit --allow-empty -m"; git commit --allow-empty -m $argv; end
function gcaam -w "git commit --amend -m"; git commit --amend -m $argv; end
function gcaama -w "git commit --amend -am"; git commit --amend -am $argv; end
function gcaan -w "git commit --amend --no-edit"; git commit --amend --no-edit $argv; end
function gcaana -w "git commit --amend --no-edit -a"; git commit --amend --no-edit -a $argv; end
function gcf -w "git config"; git config $argv; end
function gcfl -w "git config --list"; git config --list $argv; end
function gcfls -w "git config --list | cat"; git config --list | cat $argv; end
function gcl -w "git clone --recurse-submodules"; git clone --recurse-submodules $argv; end
function gcm -w "git commit -m"; git commit -m $argv; end
function gcmg -w "git commit --gpg-sign -m"; git commit --gpg-sign -m $argv; end
function gcms -w "git commit --signoff -m"; git commit --signoff -m $argv; end
function gco -w "git checkout"; git checkout $argv; end
function gcop -w "git checkout --patch"; git checkout --patch $argv; end
function gcob -w "git checkout -b"; git checkout -b $argv; end
function gcobb -w "git checkout -"; git checkout - $argv; end
function gcod -w "git checkout develop"; git checkout develop $argv; end
function gcom -w "git checkout (git_main_branch)"; git checkout (git_main_branch) $argv; end
function gcp -w "git cherry-pick"; git cherry-pick $argv; end
function gcpa -w "git cherry-pick --abort"; git cherry-pick --abort $argv; end
function gcpc -w "git cherry-pick --continue"; git cherry-pick --continue $argv; end

function gd -w "git diff"; git diff $argv; end
function gds -w "git diff --staged"; git diff --staged $argv; end
function gdst -w "git diff stash@{0}"; git diff stash@{0} $argv; end

function gf -w "git fetch"; git fetch $argv; end
function gfo -w "git fetch origin"; git fetch origin $argv; end

function ggb -w "git log --graph --all --simplify-by-decoration --date=format:'%d/%m/%y' --pretty=format:'%C(yellow)%h%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n'"; git log --graph --all --simplify-by-decoration --date=format:'%d/%m/%y' --pretty=format:'%C(yellow)%h%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n' $argv; end

function gignore -w "git update-index --skip-worktree"; git update-index --skip-worktree $argv; end
function gunignore -w "git update-index --no-skip-worktree"; git update-index --no-skip-worktree $argv; end
function gignored -w "git ls-files -v | grep ^S"; git ls-files -v | grep ^S $argv; end

function gl -w "git log --pretty=format:'%Cred%h%Creset %s -%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"; git log --pretty=format:'%Cred%h%Creset %s -%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit $argv; end
function glf -w "gl --name-status"; gl --name-status $argv; end
function gls -w "gl --stat"; gl --stat $argv; end
function glp -w "gl --patch"; gl --patch $argv; end
function gg -w "gl --graph"; gl --graph $argv; end
function glt -w "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s'"; git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' $argv; end
function gld -w "glt --date=short"; glt --date=short $argv; end

function gm -w "git merge"; git merge $argv; end
function gmom -w "git merge origin/(git_main_branch)"; git merge origin/(git_main_branch) $argv; end
function gmum -w "git merge upstream/(git_main_branch)"; git merge upstream/(git_main_branch) $argv; end
function gmv -w "git mv"; git mv $argv; end

function gp -w "git push"; git push $argv; end
function gpd -w "git push --delete"; git push --delete $argv; end
function gpdo -w "git push --delete origin"; git push --delete origin $argv; end
function gpf -w "git push --force-with-lease"; git push --force-with-lease $argv; end
function gpt -w "git push && git push --tags"; git push && git push --tags $argv; end
function gpl -w "git pull"; git pull $argv; end
function gplr -w "git pull --rebase"; git pull --rebase $argv; end
function gplrs -w "git pull --recurse-submodules"; git pull --recurse-submodules $argv; end

function gr -w "git reset --mixed"; git reset --mixed $argv; end
function grhard -w "git reset --hard"; git reset --hard $argv; end
function grk -w "git reset --keep"; git reset --keep $argv; end
function grs -w "git reset --soft"; git reset --soft $argv; end
function grh -w "git reset head --mixed"; git reset head --mixed $argv; end
function grhp -w "git reset head --patch"; git reset head --patch $argv; end
function grhhard -w "git reset head --hard"; git reset head --hard $argv; end
function grhk -w "git reset head --keep"; git reset head --keep $argv; end
function grhs -w "git reset head --soft"; git reset head --soft $argv; end
function grb -w "git rebase"; git rebase $argv; end
function grbm -w "git rebase (git_main_branch)"; git rebase (git_main_branch) $argv; end
function grem -w "git remote"; git remote $argv; end
function grema -w "git remote add"; git remote add $argv; end
function gremrm -w "git remote rm"; git remote rm $argv; end
function gremset -w "git remote set-url"; git remote set-url $argv; end
function gremsh -w "git remote show"; git remote show $argv; end
function gremv -w "git remote -v"; git remote -v $argv; end
function grl -w "git reflog"; git reflog $argv; end
function grm -w "git rm"; git rm $argv; end

function gs -w "git status --short --branch"; git status --short --branch $argv; end
function gsh -w "git show --date=format:'%A %B %d %Y at %H:%M' --pretty=format:'%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n'"; git show --date=format:'%A %B %d %Y at %H:%M' --pretty=format:'%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n' $argv; end
function gst -w "git stash"; git stash $argv; end
function gsta -w "git stash apply"; git stash apply $argv; end
function gstd -w "git stash drop"; git stash drop $argv; end
function gstl -w "git stash list"; git stash list $argv; end
function gstls -w "git stash list | cat"; git stash list | cat $argv; end
function gstp -w "git stash push"; git stash push $argv; end
function gstpop -w "git stash pop"; git stash pop $argv; end
function gstsl -w "git stash show -l"; git stash show -l $argv; end
function gstsp -w "git stash show -p"; git stash show -p $argv; end
function gsub -w "git submodule"; git submodule $argv; end
function gsuba -w "git submodule add"; git submodule add $argv; end
function gsubi -w "git submodule update --init"; git submodule update --init $argv; end
function gsubpl -w "git submodule foreach git pull"; git submodule foreach git pull $argv; end
function gsubplom -w "git submodule foreach git pull origin (git_main_branch)"; git submodule foreach git pull origin (git_main_branch) $argv; end
function gsubs -w "git submodule status"; git submodule status $argv; end
function gsubu -w "git submodule update --remote --merge"; git submodule update --remote --merge $argv; end

function gt -w "git tag"; git tag $argv; end
function gtp -w "git tag"; git tag $argv; git push $argv; end
function gtl -w "git tag --format='%(creatordate:short)%09%(refname:strip=2)' --sort=-creatordate"; git tag --format='%(creatordate:short)%09%(refname:strip=2)' --sort=-creatordate; end
function gt1 -w "gtl | head -n 1"; gtl | head -n 1 $argv; end
function gtam -w "git tag -am"; git tag -am $argv; end
function gtsm -w "git tag -sm"; git tag -sm $argv; end
function gtd -w "git tag --delete"; git tag --delete $argv; end

function gdt -w "git describe --tags"; git describe --tags $argv; end

function gwch -w "git whatchanged -p --date=format:'%A %B %d %Y at %H:%M' --pretty=format:'%n%n%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n'"; git whatchanged -p --date=format:'%A %B %d %Y at %H:%M' --pretty=format:'%n%n%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n' $argv; end

function git-delete-working-branches -w "git branch | grep -v '.*develop\|.*master\|.*main' | xargs git branch -D"; git branch | grep -v '.*develop\|.*master\|.*main' | xargs git branch -D $argv; end
function git-purge -w "git checkout develop; git reset --hard HEAD develop; git clean -dfx; git pull"; git checkout develop; git reset --hard HEAD develop; git clean -dfx; git pull $argv; end
function git-reset-repo -w "git-purge; git-delete-working-branches"; git-purge; git-delete-working-branches $argv; end

function git_main_branch
  if [ (git branch | grep "main") ]
    echo main
  else
    echo master
  end
end

function gcb
  git checkout develop
  git pull
  git checkout -b $argv
  git push --set-upstream origin $argv
end
