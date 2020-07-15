#!/usr/bin/env bats

load './test/libs/bats-support/load'
load './test/libs/bats-assert/load'

# tests for snatchmail
@test "it creates a new file" {
  run sh snatchmail emails.txt result.txt
  test -f "./result.txt"
  [ $? ]
}

@test "it extracts all email addresses from a given file alphabetized, into a new file" {
  run sh snatchmail emails.txt result.txt
  expected="4 ./result.txt"
  result="$(wc -w ./result.txt | sed -e 's/^[[:space:]]*//')"
  run cat ./result.txt
  [ "$result" == "$expected" ]
  [ "${lines[0]}" == "four@four.four" ]
  [ "${lines[1]}" == "one@one.one" ]
  [ "${lines[2]}" == "three@three.three" ]
  [ "${lines[3]}" == "two@two.two" ]
}

@test "it returns true" {
  [ true ]
}

teardown {
  if [ -f "./result.txt" ]
  then
    rm ./result.txt
    echo 'result.txt removed'
  fi

