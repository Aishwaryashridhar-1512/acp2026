#!usr/bin/env bats

@test "One Player" {
    run bash -c 'printf "1\n30\n" | ./act6'

    [ "$status" -eq 0 ]
    [[ "$output" == *"30"* ]]
}

@test "Multiple Players" {
    run bash -c 'printf "4\n30\n20\n12\n45\n" | ./act6'

    [ "$status" -eq 0 ]
    [[ "$output" == *"107"* ]]
}

@test "Zero Players" {
    run bash -c 'printf "0\n" | ./act6'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Invalid number of players."* ]]
}

@test "Negative Players" {
    run bash -c 'printf -- "-10\n" | ./act6'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Invalid number of players."* ]]   
}

@test "Same Scores" {
    run bash -c 'printf "4\n30\n30\n30\n30\n" | ./act6'

    [ "$status" -eq 0 ]
    [[ "$output" == *"120"* ]]   
}

@test "Some of the scores are zero" {
    run bash -c 'printf "4\n30\n0\n12\n0\n" | ./act6'

    [ "$status" -eq 0 ]
    [[ "$output" == *"42"* ]]
}

@test "All of the scores are zero" {
    run bash -c 'printf "4\n0\n0\n0\n0\n" | ./act6'

    [ "$status" -eq 0 ]
    [[ "$output" == *"0"* ]]
}