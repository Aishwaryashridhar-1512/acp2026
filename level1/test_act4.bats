#!/usr/bin/env bats

@test "All players scored same runs" {
    run bash -c 'printf "A\n1\n50\nB\n2\n50\nC\n3\n50\nD\n4\n50\nE\n5\n50\nF\n6\n50\nG\n7\n50\nH\n8\n50\nI\n9\n50\nJ\n10\n50\nK\n11\n50\n" | ./act4'

    [ "$status" -eq 0 ]
    [[ "$output" == *"The average runs scored by the team: 50.00"* ]]
}

@test "Increasing runs from 10 to 110" {
    run bash -c 'printf "A\n1\n10\nB\n2\n20\nC\n3\n30\nD\n4\n40\nE\n5\n50\nF\n6\n60\nG\n7\n70\nH\n8\n80\nI\n9\n90\nJ\n10\n100\nK\n11\n110\n" | ./act4'

    [ "$status" -eq 0 ]
    [[ "$output" == *"The average runs scored by the team: 60.00"* ]]
}

@test "All players scored zero" {
    run bash -c 'printf "A\n1\n0\nB\n2\n0\nC\n3\n0\nD\n4\n0\nE\n5\n0\nF\n6\n0\nG\n7\n0\nH\n8\n0\nI\n9\n0\nJ\n10\n0\nK\n11\n0\n" | ./act4'

    [ "$status" -eq 0 ]
    [[ "$output" == *"The average runs scored by the team: 0.00"* ]]
}

@test "Mixed scores" {
    run bash -c 'printf "A\n1\n25\nB\n2\n35\nC\n3\n45\nD\n4\n55\nE\n5\n65\nF\n6\n75\nG\n7\n85\nH\n8\n95\nI\n9\n20\nJ\n10\n30\nK\n11\n40\n" | ./act4'

    [ "$status" -eq 0 ]
    [[ "$output" == *"The average runs scored by the team: 51.82"* ]]
}

@test "One high scorer remaining zero" {
    run bash -c 'printf "A\n1\n100\nB\n2\n0\nC\n3\n0\nD\n4\n0\nE\n5\n0\nF\n6\n0\nG\n7\n0\nH\n8\n0\nI\n9\n0\nJ\n10\n0\nK\n11\n0\n" | ./act4'

    [ "$status" -eq 0 ]
    [[ "$output" == *"The average runs scored by the team: 9.09"* ]]
}