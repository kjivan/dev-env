function edit-ssl -w "vi $HOME/.config/fish/openssl.fish"; vi $HOME/.config/fish/openssl.fish $argv; end

function sslcert -w "openssl x509 -text -noout -in"; openssl x509 -text -noout -in $argv; end
function sslsite -w "echo | openssl s_client -connect"; echo | openssl s_client -showcerts -connect $argv; end
function sslsitev -w "echo | openssl s_client -showcerts -connect"; echo | openssl s_client -showcerts -connect $argv; end
function sslsitecert
  echo | openssl s_client -connect $argv |\
    sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > $argv.crt
end
function sslsiteexpire
  echo | openssl s_client -connect $argv > $argv.crt && openssl x509 -in $argv.crt -noout -enddate && rm $argv.crt
end

function sslverify -w "openssl verify"; openssl verify $argv; end
