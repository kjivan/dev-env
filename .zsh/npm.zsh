alias edit-npm="vi $HOME/.zsh/npm.zsh"

alias ni="npm install $@"
alias nci="npm ci $@"
alias nod="npm outdated $@"
alias nu="npm update $@"
alias ncu="npx npm-check -u"
alias npm-update-all="npx npm-check-updates -u"

alias nrs="npm run start $@"
alias nrb="npm run build $@"
alias nrt="npm run test $@"
alias nrth="npm run test-headless $@"
alias nrl="npm run lint $@"
alias nre="npm run e2e $@"

alias acid-test-gyp="curl -sL https://github.com/nodejs/node-gyp/raw/master/macOS_Catalina_acid_test.sh | bash $@"
