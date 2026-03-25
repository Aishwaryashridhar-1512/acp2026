#!usr/bin/env bats

@test "Two Students" {
    run bash -c 'printf "2\n5\nSam\n56.8\n21\nLara\n91.23\n" | ./demo10'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"Sam"* ]]
    [[ "$output" == *"Lara"* ]]
}

@test "One Student Details" {
    run bash -c 'printf "1\n34\nJoe\n98.78\n" | ./demo10'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"34"* ]]
    [[ "$output" == *"Joe"* ]]
    [[ "$output" == *"98.78"* ]]
}

@test "Zero Students" {
    run bash -c 'printf "0\n" | ./demo10'

    [[ "$status" -eq 0 ]]
}

@test "Multiple Students" {
    run bash -c 'printf "3\n1\nA\n45.6\n2\nB\n78\n3\nC\n90\n" | ./demo10'

    [[ "$status" -eq 0 ]]

    [[ "$output" == *"A"* ]]
    [[ "$output" == *"B"* ]]
    [[ "$output" == *"C"* ]]
}

@test "Marks precision" {
    run bash -c 'printf "1\n19\nRay\n45.5\n" | ./demo10'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"45.50"* ]]
}

@test "Name with different characters" {
    run bash -c 'printf "1\n11\nAnu\n88.8\n" | ./demo10'

    [[ "$status" -eq 0 ]]
    [[ "$output" == *"Anu"* ]]
}