alias edit-docker="vi $HOME/.config/fish/docker.fish \"$@\""

alias d="docker \"$@\""

alias db="docker build \"$@\" ."

alias dr="docker build run \"$@\""

alias dbr="docker run \"$@\" -it (docker build -q .)"
alias dbrc="docker run \"$@\" --rm -it (docker build -q .)"

alias docker-stop-all="docker stop (docker ps -q)"
alias docker-clean-stopped="docker ps --filter status=exited -q | xargs docker rm"
alias docker-clean-all="docker system prune --volumes"
