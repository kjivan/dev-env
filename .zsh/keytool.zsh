alias edit-keytool="vi $HOME/.zsh/keytool.zsh"

ktl() {
  keytool -list \
    -keystore $1 \
    | grep -v fingerprint \
    | sort
}

ktc() {
  keytool -list \
    -v \
    -keystore $1 \
    -alias $2
}

ktcr() {
  keytool -list \
    -rfc \
    -keystore $1 \
    -alias $2
}

ktcr() {
  keytool -list \
    -rfc \
    -keystore $1 \
    -alias $2
}

ktic() {
  keytool -import \
    -trustcacerts \
    -keystore $1 \
    -alias $2 \
    -file $3
}

ktdc() {
  keytool -delete \
    -v \
    -keystore $1 \
    -alias $2
}

ktec() {
  keytool -export \
    -rfc \
    -keystore $1 \
    -alias $2 \
    -file $3
}
