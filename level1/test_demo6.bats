#!usr/bin/env bats

@test "Memory is allocated successfully and later freed" {
    run bash -c 'printf "5\n10\n20\n30\n40\n50\n" | ./demo6'
    
    [[ "$output" == *"10"* ]]
    [[ "$output" == *"50"* ]]
    
}

@test "Array size is zero" {
    run bash -c 'printf "0\n" | ./demo6'

    [[ "$output" == *"Invalid array size!"* ]]
}

@test "Array size is negative" {
    run bash -c 'printf "-5\n" | ./demo6'

    [[ "$output" == *"Invalid array size!"* ]]
}

@test "Single element array" {
    run bash -c 'printf "1\n45\n" | ./demo6'

    [[ "$output" == *"45"* ]]
}

