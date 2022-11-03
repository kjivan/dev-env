alias edit-gradle="vi $HOME/.config/fish/gradle.fish \"$@\""

alias grd="./gradlew \"$@\""
alias grdtsk="./gradlew tasks \"$@\""
alias grddep="./gradlew dependencies \"$@\""
alias grdspot="./gradlew spotlessApply \"$@\""
alias grdrefresh="./gradlew --refresh-dependencies \"$@\""

alias grdb="./gradlew build \"$@\""
alias grdb2="divider; ./gradlew build 2>&1 | grep -i '(?:error|failed)' -A3 | head -n6 \"$@\""
alias grdcb="./gradlew clean build \"$@\""
alias grdcbp="./gradlew clean build publishToMavenLocal \"$@\""

alias grdc="./gradlew check \"$@\""
alias grdcc="./gradlew clean check \"$@\""

alias grdcls="./gradlew classes \"$@\""
alias grdccls="./gradlew clean classes \"$@\""

alias grdbj="./gradlew bootjar \"$@\""
alias grdcbj="./gradlew clean bootjar \"$@\""

alias grdbr="./gradlew bootrun \"$@\""
alias grdbrd="./gradlew bootrun --debug-jvm \"$@\""
alias grdcbr="./gradlew clean bootrun \"$@\""

alias grdns="./gradlew npmStart \"$@\""
alias grdcns="./gradlew clean npmStart \"$@\""

alias grdt="./gradlew test \"$@\""
alias grdt2="divider; ./gradlew test 2>&1 | grep -i '(?:error|failed)' -A3 | head -n6"
alias grdtt="divider; ./gradlew test --tests \"$@\""
alias grdtt2="divider; ./gradlew test --tests \"$@\" 2>&1 | grep -i '(?:error|failed)' -A3 | head -n6"
alias grdct="./gradlew clean test \"$@\""

alias grdit="./gradlew integrationTest \"$@\""
alias grdit2="divider; ./gradlew integrationTest 2>&1 | grep -i '(?:error|failed)' -A3 | head -n6"
alias grditt="divider; ./gradlew integrationTest --tests \"$@\""
alias grditt2="divider; ./gradlew integrationTest --tests \"$@\" 2>&1 | grep -i '(?:error|failed)' -A3 | head -n6"
alias grdcit="./gradlew clean integrationTest \"$@\""
