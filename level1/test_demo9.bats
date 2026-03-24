#!/usr/bin/env bats

# Test 1: Normal case (2 students)
@test "Normal case with 2 students" {
run bash -c 'printf "2\n1 Ram 85\n2 Sita 90\n" | ./demo9'

[ "$status" -eq 0 ]
[[ "$output" == *"Ram"* ]]
[[ "$output" == *"Sita"* ]]
[[ "$output" == *"85.00"* ]]
[[ "$output" == *"90.00"* ]]
}

# Test 2: Single student
@test "Single student case" {
run bash -c 'printf "1\n10 Alex 75\n" | ./demo9'

[ "$status" -eq 0 ]
[[ "$output" == *"Alex"* ]]
[[ "$output" == *"75.00"* ]]
}

# Test 3: Multiple students
@test "Multiple students case" {
run bash -c 'printf "3\n1 A 50\n2 B 60\n3 C 70\n" | ./demo9'

[ "$status" -eq 0 ]
[[ "$output" == *"A"* ]]
[[ "$output" == *"B"* ]]
[[ "$output" == *"C"* ]]
}

# Test 4: Zero students (edge case)
@test "Zero students case" {
run bash -c 'printf "0\n" | ./demo9'

[ "$status" -eq 0 ]
}

# Test 5: Large input
@test "Large input case" {
run bash -c 'printf "5\n1 A 10\n2 B 20\n3 C 30\n4 D 40\n5 E 50\n" | ./demo9'

[ "$status" -eq 0 ]
[[ "$output" == *"E"* ]]
[[ "$output" == *"50.00"* ]]
}

# Test 6: Negative and unusual marks
@test "Negative and high marks" {
run bash -c 'printf "2\n1 Test -10\n2 Demo 150\n" | ./demo9'

[ "$status" -eq 0 ]
[[ "$output" == *"-10.00"* ]]
[[ "$output" == *"150.00"* ]]
}

# Test 7: Same names
@test "Duplicate names" {
run bash -c 'printf "2\n1 Ram 80\n2 Ram 80\n" | ./demo9'

[ "$status" -eq 0 ]
[[ "$output" == *"Ram"* ]]
}

# Test 8: Check file creation
@test "File creation check" {
run bash -c 'printf "1\n1 FileTest 99\n" | ./demo9'

[ -f students.txt ]
}