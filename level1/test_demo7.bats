#!usr/bin/env bats

@test "String one is greater" {
    run bash -c 'printf "banana\napple\n" | ./demo7'

    [[ "$output" == *"First String is lexicographically greater."* ]]
}

@test "String two is greater" {
    run bash -c 'printf "apple\nbanana\n" | ./demo7'

    [[ "$output" == *"Second String is lexicographically greater."* ]]
}

@test "Equal Strings" {
    run bash -c 'printf "apple\napple\n" | ./demo7'

    [[ "$output" == *"Strings are equal."* ]]
}

@test "Case sensitivity 1" {
    run bash -c 'printf "abcd\nABCD\n" | ./demo7'

    [[ "$output" == *"First String is lexicographically greater."* ]]
}

@test "Case sensitivity 2" {
    run bash -c 'printf "ABCD\nabcd\n" | ./demo7'

    [[ "$output" == *"Second String is lexicographically greater."* ]]
}

@test "Different length" {
    run bash -c 'printf "app\napple\n" | ./demo7'

    [[ "$output" == *"Second String is lexicographically greater."* ]]
}

@test "Numbers inside Strings" {
    run bash -c 'printf "str2\nstr1\n" | ./demo7'

    [[ "$output" == *"First String is lexicographically greater."* ]]
}

@test "Special characters inside Strings" {
    run bash -c 'printf "abc#\nabc!\n" | ./demo7'

    [[ "$output" == *"First String is lexicographically greater."* ]]
}

