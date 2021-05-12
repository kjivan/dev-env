function edit-aws -w "vi $HOME/.config/fish/aws.fish"; vi $HOME/.config/fish/aws.fish $argv; end

function a -w "aws"; aws $argv; end
function ak -w "aws --region us-east-1  --profile kj"; aws --region us-east-1  --profile kj $argv; end
