#!/usr/bin/env bats 

@test "Normal swapping case" {
    run bash -c 'printf "3\n1 2 3\n4 5 6\n" | ./demo5'

    [[ "$output" == *"4"* ]]
    [[ "$output" == *"5"* ]]
    [[ "$output" == *"6"* ]]
}

@test "Single array elements" {
    run bash -c 'printf "1\n10\n20\n" | ./demo5'

    [[ "$output" == *"20"* ]]
    [[ "$output" == *"10"* ]]
}

@test "Arrays with negative elements" {
    run bash -c 'printf "3\n-1 -2 -3\n4 5 6\n" | ./demo5'

    [[ "$output" == *"4"* ]]
    [[ "$output" == *"-1"* ]]
}

@test "Arrays with zeroes" {
    run bash -c 'printf "3\n0 0 0\n1 2 3\n" | ./demo5'

    [[ "$output" == *"1"* ]]
    [[ "$output" == *"2"* ]]
    [[ "$output" == *"3"* ]]
}