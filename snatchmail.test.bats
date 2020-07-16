#!/usr/bin/env bats

load './helpers'

# tests for snatchmail
@test "snatchmail creates a new file" {
  assert_exists "./result.txt"
}

@test "snatchmail extracts all email addresses from a given file, into a new file" {
  expected="4 ./result.txt"
  result="$(wc -w ./result.txt | sed -e 's/^[[:space:]]*//')"
  assert_equal "$result" "$expected"
}

@test "snatchmail exports emails sorted alphabetically" {
  run cat ./result.txt
  assert_equal "${lines[0]}" "four@four.four"
  assert_equal "${lines[1]}" "one@one.one"
  assert_equal "${lines[2]}" "three@three.three"
  assert_equal "${lines[3]}" "two@two.two"
}

setup() {
  run sh snatchmail emails.txt result.txt
  echo "result.txt removed"
}

teardown() {
  [ -f "./result.txt" ] && rm ./result.txt
  echo "result.txt removed"
}
