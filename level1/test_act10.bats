#!/usr/bin/env bats

@test "Test Case 1: Normal input with distinct prices" {
  run bash -c "printf '3\n101 Delhi 5000\n102 Mumbai 7500\n103 Chennai 6000\n' | ./act10"

  [[ "$output" == *"Flight Number: 102"* ]]
}
@test "Single flight" {
  run bash -c "printf '1\n201 Bangalore 4500\n' | ./act10"

  [[ "$output" == *"Flight Number: 201"* ]]
}

@test "All flights same price" {
  run bash -c "printf '3\n301 Goa 5000\n302 Pune 5000\n303 Kochi 5000\n' | ./act10"

  [[ "$output" == *"Ticket Price: 5000.00"* ]]
}

@test "Highest price is last entry" {
  run bash -c "printf '3\n401 Jaipur 3000\n402 Surat 4000\n403 Hyderabad 9000\n' | ./act10"

  [[ "$output" == *"Flight Number: 403"* ]]
}

@test "Zero flights" {
  run bash -c "printf '0\n' | ./act10"

  [[ "$output" == *"Invalid number of flights."* ]]
}

@test "Negative flights" {
  run bash -c "printf --'-5\n' | ./act10"

  [[ "$output" == *"Invalid number of flights."* ]]
}