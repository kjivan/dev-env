alias edit-ssl="vi $HOME/.config/fish/openssl.fish \"$@\""

alias sslcert="openssl x509 -text -noout -in \"$@\""
alias sslsite="echo | openssl s_client -showcerts -connect \"$@\""
alias sslsitev="echo | openssl s_client -showcerts -connect \"$@\""
sslsitecert() {
  echo | openssl s_client -connect \"$@\" |\
    sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > \"$@\".crt
}

sslsiteexpire() {
  echo | openssl s_client -connect \"$@\" > \"$@\".crt && openssl x509 -in \"$@\".crt -noout -enddate && rm \"$@\".crt
}

alias sslverify="openssl verify \"$@\""

alias sslcertbundle="openssl crl2pkcs7 -nocrl -certfile \"$@\" | openssl pkcs7 -print_certs -noout"
alias sslcertbundlev="openssl crl2pkcs7 -nocrl -certfile \"$@\" | openssl pkcs7 -print_certs -text -noout"
