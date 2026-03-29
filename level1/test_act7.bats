#!usr/bin/env bats

@test "Normal case" {
    run bash -c 'printf "Jerry\nMatilda\n" | ./act7'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Student 2 has the longer name."* ]]
}


@test "Student 1 has longer name" {
    run bash -c 'printf "Charles\nJoe\n" | ./act7'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Student 1 has the longer name."* ]]
}

@test "Student 2 has longer name" {
    run bash -c 'printf "Joe\nJonas\n" | ./act7'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Student 2 has the longer name."* ]]
}

@test "Both students have same name length" {
    run bash -c 'printf "Sam\nJoe\n" | ./act7'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Both the students have names of equal length."* ]]
}

@test "Names with space" {
    run bash -c 'printf "Sam Smith\nJoe Goldberg\n" | ./act7'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Student 2 has the longer name."* ]]
}

@test "One of the student names are empty" {
    run bash -c 'printf "Sam\n\n" | ./act7'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Student 1 has the longer name."* ]]
}

@test "Both of the student names are empty" {
    run bash -c 'printf "\n\n" | ./act7'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Both the students have names of equal length."* ]]
}
