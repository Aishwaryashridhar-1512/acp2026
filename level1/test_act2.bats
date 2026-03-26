#!usr/bin/env bats

@test "Units are less than 100" {
    run bash -c 'printf "45\n5\n" | ./act2'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"Total Bill: 225.00"* ]]
}

@test "Units are greater than 100" {
    run bash -c 'printf "150\n3\n" | ./act2'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"High consumption alert! Extra charges applied."* ]]
    [[ "$output" == *"Total Bill: 700.00"* ]]

}

@test "Zero rate" {
    run bash -c 'printf "20\n0\n" | ./act2'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"Invalid Input!"* ]]
}

@test "Zero units" {
    run bash -c 'printf "0\n5.2\n" | ./act2'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"Invalid Input!"* ]]
}

@test "Zero units and Zero rate" {
    run bash -c 'printf "0\n0\n" | ./act2'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"Invalid Input!"* ]]
}

@test "Negative rate" {
    run bash -c 'printf -- "20\n-4.5\n" | ./act2'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"Invalid Input!"* ]]
}

@test "Negative units" {
    run bash -c 'printf -- "-68\n5.2\n" | ./act2'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"Invalid Input!"* ]]
}

@test "Negative units and rate" {
    run bash -c 'printf -- "-78\n-5\n" | ./act2'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"Invalid Input!"* ]]
}

@test "Units are exactly 100" {
    run bash -c 'printf "100\n5\n" | ./act2'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"Total Bill: 500.00"* ]]
}