function edit-npm -w "vi $HOME/.config/fish/npm.fish"; vi $HOME/.config/fish/npm.fish $argv; end

function ni -w "npm install"; npm install $argv; end
function nci -w "npm ci"; npm ci $argv; end
function nod -w "npm outdated"; npm outdated $argv; end
function nu -w "npm update"; npm update $argv; end
function ncu -w "npx npm-check -u"; npx npm-check -u; end
function npm-update-all -w "npx npm-check-updates -u"; npx npm-check-updates -u; end

function nrs -w "npm run start"; npm run start $argv; end
function nrb -w "npm run build"; npm run build $argv; end
function nrt -w "npm run test"; npm run test $argv; end
function nrth -w "npm run test-headless"; npm run test-headless $argv; end
function nrl -w "npm run lint"; npm run lint $argv; end
function nre -w "npm run e2e"; npm run e2e $argv; end

function acid-test-gyp -w "curl -sL https://github.com/nodejs/node-gyp/raw/master/macOS_Catalina_acid_test.sh | bash"; curl -sL https://github.com/nodejs/node-gyp/raw/master/macOS_Catalina_acid_test.sh | bash $argv; end
