function edit-gradle -w "vi $HOME/.config/fish/gradle.fish"; vi $HOME/.config/fish/gradle.fish $argv; end

function grd -w "./gradlew"; ./gradlew $argv; end
function grdtsk -w "./gradlew tasks"; ./gradlew tasks $argv; end
function grddep -w "./gradlew dependencies"; ./gradlew dependencies $argv; end
function grdspot -w "./gradlew :spotlessApply"; ./gradlew :spotlessApply $argv; end
function grdrefresh -w "./gradlew --refresh-dependencies"; ./gradlew --refresh-dependencies $argv; end


function grdb -w "./gradlew build"; ./gradlew build $argv; end
function grdcb -w "./gradlew clean build"; ./gradlew clean build $argv; end
function grdcbp -w "./gradlew clean build publishToMavenLocal"; ./gradlew clean build publishToMavenLocal $argv; end

function grdc -w "./gradlew classes"; ./gradlew classes $argv; end
function grdcc -w "./gradlew clean classes"; ./gradlew clean classes $argv; end

function grdbj -w "./gradlew bootjar"; ./gradlew bootjar $argv; end
function grdcbj -w "./gradlew clean bootjar"; ./gradlew clean bootjar $argv; end

function grdbr -w "./gradlew bootrun"; ./gradlew bootrun $argv; end
function grdcbr -w "./gradlew clean bootrun"; ./gradlew clean bootrun $argv; end

function grdns -w "./gradlew npmStart"; ./gradlew npmStart $argv; end
function grdcns -w "./gradlew clean npmStart"; ./gradlew clean npmStart $argv; end

function grdt -w "./gradlew test"; ./gradlew test $argv; end
function grdtt -w "./gradlew test --tests"; ./gradlew test --tests $argv; end
function grdct -w "./gradlew cleanTest test"; ./gradlew clean test $argv; end

function grdit -w "./gradlew :integrationTest"; ./gradlew :integrationTest $argv; end
function grditt -w "./gradlew :integrationTest --tests"; ./gradlew :integrationTest --tests $argv; end
function grdcit -w "./gradlew clean :integrationTest"; ./gradlew clean :integrationTest $argv; end

function grdt4; ./gradlew test  2>&1 | rg error -A2 | head -n12 $argv; end
function grdb4; ./gradlew build  2>&1 | rg error -A2 | head -n12 $argv; end
