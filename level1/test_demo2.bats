#!/usr/bin/env bats

@test "Rectangle 1 has the larget area" {
    run bash -c 'printf "A\n5\n6\nB\n2\n3\nC\n4\n3\n" | ./demo2'

    [[ "$output" == *"A has the largest area"* ]]
}

@test "Rectangle 2 has the largest area" {
    run bash -c 'printf "A\n2\n3\B\n6\n7\nC\n2\n2\n" | ./demo2'

    [[ "$output" == *"B has the largest area"* ]]
}

@test "Rectangle 3 has the largest area" {
    run bash -c 'printf "A\n2\n3\nB\n6\n1\nC\n9\n6\n" | ./demo2'

    [[ "$output" == *"C has the largest area"* ]]
}

@test "Two Rectangles have same largest area" {
    run bash -c 'printf "A\n2\n3\nB\n1\n2\nC\n3\n2\n" | ./demo2'

    [[ "$output" == *"A and C have the largest area"* ]]
}

@test "All Rectangles have same area" {
    run bash -c 'printf "A\n3\n4\nB\n4\n3\nC\n3\n4\n" | ./demo2'

    [[ "$output" == *"All rectangles have the same area"* ]]
}