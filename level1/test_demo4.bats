#!/usr/bin/env bats

@test "Flight available with seats" {
run bash -c 'printf "101\nSingapore\n40\n102\nNewYork\n32\n103\nSingapore\n45\n104\nAukland\n23\nSingapore\n" | ./demo4'

[[ "$output" == *"Flight Number"* ]]
[[ "$output" == *"Number of seats available"* ]]
}

@test "Destination not found" {
run bash -c 'printf "101\nSingapore\n40\n102\nNewYork\n32\n103\nSingapore\n45\n104\nAukland\n23\nParis\n" | ./demo4'

[[ "$output" == *"No flight available"* ]]
}

@test "Destination exists but seats unavailable" {
run bash -c 'printf "101\nSingapore\n0\n102\nNewYork\n32\n103\nSingapore\n0\n104\nAukland\n23\nSingapore\n" | ./demo4'

[[ "$output" == *"No flight available"* ]]
}