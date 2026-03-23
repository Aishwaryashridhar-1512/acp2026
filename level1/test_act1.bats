#!/usr/bin/env bats

@test "Normal mixed values" {
    run bash -c 'printf "25.5\n30.2\n28.0\n22.1\n27.8\n31.0\n26.4\n" | ./act1'

    [[ "$output" == *"31.00"* ]]
    [[ "$output" == *"22.10"* ]]
}

@test "All same values" {
    run bash -c 'printf "25.0\n25.0\n25.0\n25.0\n25.0\n25.0\n25.0\n" | ./act1'
     
    [[ "$output" == *"25.00"* ]]
    [[ "$output" == *"25.00"* ]]
}

@test "Negative values only" {
    run bash -c 'printf -- "-10.2\n-3.4\n-12.34\n-2.11\n-9.87\n-4.56\n-6.56\n" | ./act1'

    [[ "$output" == *"-2.11"* ]]
    [[ "$output" == *"-12.34"* ]]
}

@test "Mixed values" {
    run bash -c 'printf -- "12.4\n-3.4\n4.5\n-1.2\n14.2\n-9.7\n13.2\n" | ./act1'

    [[ "$output" == *"14.20"* ]]
    [[ "$output" == *"-9.70"* ]]

}

@test "Increasing order values" {
    run bash -c 'printf "20.0\n21.0\n22.0\n23.0\n24.0\n25.0\n26.0\n" | ./act1'

    [[ "$output" == *"26.00"* ]]
    [[ "$output" == *"20.00"* ]]
}