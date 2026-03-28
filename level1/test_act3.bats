#!/usr/bin/env bats

@test "Single customer" {
    run bash -c 'printf "1\n101\n50\n" | ./act3'

    [ "$status" -eq 0 ]
    [[ "$output" == *"Highest Electricity Bill:"* ]]
    [[ "$output" == *"ID: 101"* ]]
    [[ "$output" == *"Bill Amount: 250.00"* ]]
}

@test "Multiple customers highest is second" {
    run bash -c 'printf "3\n101\n20\n102\n80\n103\n40\n" | ./act3'

    [ "$status" -eq 0 ]
    [[ "$output" == *"ID: 102"* ]]
    [[ "$output" == *"Bill Amount: 400.00"* ]]
}

@test "Multiple customers highest is last" {
    run bash -c 'printf "4\n101\n10\n102\n25\n103\n30\n104\n100\n" | ./act3'

    [ "$status" -eq 0 ]
    [[ "$output" == *"ID: 104"* ]]
    [[ "$output" == *"Bill Amount: 500.00"* ]]
}

@test "All customers same units" {
    run bash -c 'printf "3\n101\n50\n102\n50\n103\n50\n" | ./act3'

    [ "$status" -eq 0 ]
    [[ "$output" == *"ID: 101"* ]]
    [[ "$output" == *"Bill Amount: 250.00"* ]]
}

@test "Decimal units consumed" {
    run bash -c 'printf "2\n101\n45.5\n102\n60.5\n" | ./act3'

    [ "$status" -eq 0 ]
    [[ "$output" == *"ID: 102"* ]]
    [[ "$output" == *"Bill Amount: 302.50"* ]]
}