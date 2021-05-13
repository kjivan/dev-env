function edit-keytool -w "vi $HOME/.config/fish/keytool.fish"; vi $HOME/.config/fish/keytool.fish $argv; end

function ktl -w 'keytool -list -keystore'
  keytool -list \
    -keystore $argv[1] \
    | grep -v fingerprint \
    | sort
end

function ktc -w 'keytool -list -keystore'
  keytool -list \
    -v \
    -keystore $argv[1] \
    -alias $argv[2]
end

function ktcr -w 'keytool -list -keystore'
  keytool -list \
    -rfc \
    -keystore $argv[1] \
    -alias $argv[2]
end

function ktic -w 'keytool -import -keystore'
  keytool -import \
    -trustcacerts \
    -keystore $argv[1] \
    -alias $argv[2] \
    -file $argv[3]
end

function ktdc -w 'keytool -delete -keystore'
  keytool -delete \
    -v \
    -keystore $argv[1] \
    -alias $argv[2]
end

function ktec -w 'keytool -export -keystore'
  keytool -export \
    -rfc \
    -keystore $argv[1] \
    -alias $argv[2] \
    -file $argv[3]
end
