set ALGOLIB_PATH /home/sho/programming/oj-environment/algolib
set ACL_PATH /home/sho/programming/oj-environment/ac-library

set CXX_COMPILER g++
set CXX_COMMON_OPTIONS -std=gnu++20 -Wall -Wextra -I$ALGOLIB_PATH/src -I$ACL_PATH
set CXX_DEBUG_OPTIONS -O0 -g3 -fsanitize=undefined,address -DHOGEPACHI
set CXX_RELEASE_OPTIONS -O2 -DHOGEPACHI

function dg++
    set source_name $argv[1]
    set binary_name (string replace -r '(.*)\.cpp' '$1.exe' $source_name)
    command $CXX_COMPILER $CXX_COMMON_OPTIONS $CXX_DEBUG_OPTIONS $source_name -o $binary_name
end

function fg++
    set source_name $argv[1]
    set binary_name (string replace -r '(.*)\.cpp' '$1.exe' $source_name)
    command $CXX_COMPILER $CXX_COMMON_OPTIONS $CXX_RELEASE_OPTIONS $source_name -o $binary_name
end

function dgch
    set source_name $argv[1]
    set binary_name $source_name.dg++.gch
    command $CXX_COMPILER $CXX_COMMON_OPTIONS $CXX_DEBUG_OPTIONS $source_name -o $binary_name
end

function fgch
    set source_name $argv[1]
    set binary_name $source_name.fg++.gch
    command $CXX_COMPILER $CXX_COMMON_OPTIONS $CXX_RELEASE_OPTIONS $source_name -o $binary_name
end
