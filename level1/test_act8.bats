#!usr/bin/env bats

@test "Normal case" {
    run bash -c 'printf "Samarth\n" | ./act8'

    [ "$status" -eq 0 ]
    [[ "$output" == *"2"* ]]
    [[ "$output" == *"5"* ]]
}

@test "More number of vowels" {
    run bash -c 'printf "Louie\n" | ./act8'

    [ "$status" -eq 0 ]
    [[ "$output" == *"4"* ]]
    [[ "$output" == *"1"* ]]
}

@test "More number of consonants" {
    run bash -c 'printf "Chad\n" | ./act8'

    [ "$status" -eq 0 ]
    [[ "$output" == *"1"* ]]
    [[ "$output" == *"3"* ]]
}

@test "Same number of vowels and consonants" {
    run bash -c 'printf "Ananya\n" | ./act8'

    [ "$status" -eq 0 ]
    [[ "$output" == *"3"* ]]
    [[ "$output" == *"3"* ]]
}

@test "String with space" {
    run bash -c 'printf "Joe Goldberg\n" | ./act8'

    [ "$status" -eq 0 ]
    [[ "$output" == *"4"* ]]
    [[ "$output" == *"7"* ]]
}

@test "Empty string" {
    run bash -c 'printf "\n" | ./act8'

    [ "$status" -eq 0 ]
    [[ "$output" == *"0"* ]]
    [[ "$output" == *"0"* ]]
}

@test "Numbers as a string" {
    run bash -c 'printf "1234\n" | ./act8'

    [ "$status" -eq 0 ]
    [[ "$output" == *"0"* ]]
    [[ "$output" == *"0"* ]]
}