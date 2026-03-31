#!/usr/bin/env bats

@test "Test Case 1: Normal Input" {
    run bash -c 'printf "2\n101\nJohn Doe\n30000\n102\nAlice Smith\n40000\n" | ./act9'
    [[ "$output" == *"70000.00"* ]]
}

@test "Test Case 2: Single Employee" {
    run bash -c 'printf "1\n201\nBob\n50000\n" | ./act9'
    [[ "$output" == *"50000.00"* ]]
}

@test "Test Case 3: Zero Employees" {
    run bash -c 'printf "0\n" | ./act9'
    [[ "$output" == *"Invalid number of employees"* ]]
}

@test "Test Case 4: Multiple Employees" {
    run bash -c 'printf "3\n301\nRahul Sharma\n25000\n302\nPriya Mehta\n35000\n303\nAmit Singh\n45000\n" | ./act9'
    [[ "$output" == *"105000.00"* ]]
}

@test "Test Case 5: Decimal Salaries" {
    run bash -c 'printf "2\n401\nNeha Kapoor\n12345.50\n402\nArjun Reddy\n67890.75\n" | ./act9'
    [[ "$output" == *"80236.25"* ]]
}