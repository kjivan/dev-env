function edit-npm -w "vi $HOME/.config/fish/npm.fish"; vi $HOME/.config/fish/npm.fish $argv; end

function nrs -w "npm run start"; npm run start $argv; end
function nrb -w "npm run build"; npm run build $argv; end
function nrt -w "npm run test"; npm run test $argv; end
function nrth -w "npm run test-headless"; npm run test-headless $argv; end
function nrl -w "npm run lint"; npm run lint $argv; end
function nre -w "npm run e2e"; npm run e2e $argv; end
function acid-test-gyp -w "curl -sL https://github.com/nodejs/node-gyp/raw/master/macOS_Catalina_acid_test.sh | bash"; curl -sL https://github.com/nodejs/node-gyp/raw/master/macOS_Catalina_acid_test.sh | bash $argv; end
