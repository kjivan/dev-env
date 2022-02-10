function edit-docker -w "vi $HOME/.config/fish/docker.fish"; vi $HOME/.config/fish/docker.fish $argv; end

function d -w "docker"; docker $argv; end

function db -w "docker build ."; docker build $argv .; end

function dr -w "docker run"; docker build run $argv; end

function dbr -w "docker run -it (docker build -q .)"; docker run $argv -it (docker build -q .); end
function dbrc -w "docker run --rm -it (docker build -q .)"; docker run $argv --rm -it (docker build -q .); end

function docker-stop-all -w "docker stop (docker ps -q)"; docker stop (docker ps -q); end
function docker-clean-stopped -w "docker ps --filter status=exited -q | xargs docker rm"; docker ps --filter status=exited -q | xargs docker rm; end
function docker-clean-all -w "docker system prune --volumes"; docker system prune --volumes; end
