#!usr/bin/en bats

@test "Rectangle 1 has the largest area" {
    run bash -c 'printf "3\n3\n4\n2\n2\n1\n3\n" | ./demo3'

    [[ "$output" == *"Rectangle with largest area:"* ]]
    [[ "$output" == *"Area = 12"* ]]
    }

@test "Rectangle 2 has the largest area" {
    run bash -c 'printf "3\n1\n2\n5\n6\n2\n6\n" | ./demo3'

    [[ "$output" == *"Rectangle with largest area:"* ]]
    [[ "$output" == *"Area = 30"* ]]
}

@test "Rectangle 3 has the largest area" {
    run bash -c 'printf "3\n1\n2\n5\n6\n7\n6\n" | ./demo3'

    [[ "$output" == *"Rectangle with largest area:"* ]]
    [[ "$output" == *"Area = 42"* ]]
}

@test "More than one rectangles have same largest area" {
    run bash -c 'printf "4\n10\n2\n3\n4\n5\n1\n2\n10\n" | ./demo3'

    [[ "$output" == *"Rectangle with largest area:"* ]]
    [[ "$output" == *"Area = 20"* ]]
}

@test "All rectangles have same area" {
    run bash -c 'printf "4\n4\n5\n10\n2\n5\n4\n2\n10\n" | ./demo3'

    [[ "$output" == *"Rectangle with largest area:"* ]]
    [[ "$output" == *"Area = 20"* ]]
} 