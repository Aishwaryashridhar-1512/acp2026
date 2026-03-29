#!usr/bin/env bats

@test "Normal Case" {
    run bash -c 'printf "Joe\nKate\n" | ./act5'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Kate"* ]]
    [[ "$output" == *"Joe"* ]]

}

@test "Same Strings" {
    run bash -c 'printf "Joe\nJoe\n" | ./act5'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"Joe"* ]]
    [[ "$output" == *"Joe"* ]]
}

@test "one empty string" {
    run bash -c 'printf "\nJoe\n" | ./act5'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"Joe"* ]]
    [[ "$output" == *" "* ]]
}

@test "Two empty strings" {
    run bash -c 'printf "\n\n" | ./act5'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *" "* ]]
    [[ "$output" == *" "* ]]
}

@test "Numbers as strings" {
    run bash -c 'printf "123\n456\n" | ./act5'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"456"* ]]
    [[ "$output" == *"123"* ]]

}

@test "Mixture of characters and numbers" {
    run bash -c 'printf "2ac\n3bg\n" | ./act5'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"3bg"* ]]
    [[ "$output" == *"2ac"* ]]
}

@test "Strings with special characters" {
    run bash -c 'printf "Joe!\n#Kate\n" | ./act5'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"#Kate"* ]]
    [[ "$output" == *"Joe!"* ]]
}