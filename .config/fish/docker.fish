function edit-docker -w "vi $HOME/.config/fish/docker.fish"; vi $HOME/.config/fish/docker.fish $argv; end

function d -w "docker"; docker $argv; end
function docker-stop-all -w "docker stop (docker ps -q)"; docker stop (docker ps -q) $argv; end
