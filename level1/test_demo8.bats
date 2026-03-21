#!usr/bin/env bats

@test "Normal case" {
    run bash -c 'printf "Joe\nGoldberg\n" | ./demo8'

    [[ "$output" == *"Concatenated string:"* ]]
    [[ "$output" == *"JoeGoldberg"* ]]
}

@test "First string is empty" {
    run bash -c 'printf " \nGoldberg\n" | ./demo8'

    [[ "$output" == *"Concatenated string:"* ]]
    [[ "$output" == *" Goldberg"* ]]
}

@test "Second string is empty" {
    run bash -c 'printf "Joe\n \n" | ./demo8'

    [[ "$output" == *"Concatenated string:"* ]]
    [[ "$output" == *"Joe "* ]]
}

@test "Both strings are empty" {
    run bash -c 'printf " \n \n" | ./demo8'

    [[ "$output" == *"Concatenated string:"* ]]
    [[ "$output" == *"  "* ]]
}

@test "Number concatenation" {
    run bash -c 'printf "123\n456\n" | ./demo8'

    [[ "$output" == *"Concatenated string:"* ]]
    [[ "$output" == *"123456"* ]]
}

@test "Strings with special characters" {
    run bash -c 'printf "Joe@\n#Goldberg\n" | ./demo8'

    [[ "$output" == *"Concatenated string:"* ]]
    [[ "$output" == *"Joe@#Goldberg"* ]]
}
