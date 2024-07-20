function _dg++() {
    source_name=${1}
    binary_name=${1%.cpp}.exe
    clang++ -std=gnu++20 -I /home/sho/ghq/github.com/pachicobue/cp-environment/algolib/src -I /home/sho/ghq/github.com/pachicobue/cp-environment/ac-library -O0 -g3 -fsanitize=undefined,address -DHOGEPACHI ${source_name} -o ${binary_name}
}
function _fg++() {
    source_name=${1}
    binary_name=${1%.cpp}.exe
    clang++ -std=gnu++20 -I /home/sho/ghq/github.com/pachicobue/cp-environment/algolib/src -I /home/sho/ghq/github.com/pachicobue/cp-environment/ac-library -O2 -DHOGEPACHI ${source_name} -o ${binary_name}
}
