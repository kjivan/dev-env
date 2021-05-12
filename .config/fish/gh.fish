function edit-gh -w "vi $HOME/.config/fish/gh.fish"; vi $HOME/.config/fish/gh.fish $argv; end

function ghprls -w "gh pr list"; gh pr list $argv; end
function ghprco -w "gh pr checkout"; gh pr checkout $argv; end

function ghrcr -w "gh repo create"; gh repo create $argv; end
function ghrcl -w "gh repo clone"; gh repo clone $argv; end
function ghrf -w "gh repo fork"; gh repo fork $argv; end

function ghgls -w "gh gist list"; gh gist list $argv; end
function ghgv -w "gh gist view"; gh gist view $argv; end
function ghgcr -w "gh gist create"; gh gist create $argv; end
function ghge -w "gh gist edit"; gh gist edit $argv; end
function ghgd -w "gh gist delete"; gh gist delete $argv; end
