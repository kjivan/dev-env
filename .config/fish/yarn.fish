function edit-yarn -w "vi $HOME/.config/fish/yarn.fish"; vi $HOME/.config/fish/yarn.fish $argv; end

function yi -w "yarn install"; yarn install $argv; end

function yrs -w "yarn run start"; yarn run start $argv; end
function yrb -w "yarn run build"; yarn run build $argv; end
function yrt -w "yarn run test"; yarn run test $argv; end
function yrth -w "yarn run test-headless"; yarn run test-headless $argv; end
function yrl -w "yarn run lint"; yarn run lint $argv; end
function yre -w "yarn run e2e"; yarn run e2e $argv; end
