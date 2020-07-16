#!/usr/bin/env bats

load './helpers'

setup() {
  git checkout -b test_0
}

teardown() {
  git checkout master
  git push --delete origin test_0
  git branch -d test_0
}

# git-pun is a small script I wrote to create a remote branch on origin,
# based on the current branch name, and push, setting up the local branch to
# track the remote branch
@test "git-pun creates a remote branch and pushes" {
  expected="remote: Create a pull request for 'test_0' on GitHub by visiting:"
  expected2="Branch 'test_0' set up to track remote branch 'test_0' from 'origin'."
  run sh git-pun
  # check for a specific substring to avoid differences in trailing whitespace
  assert_equal "${lines[1]:8:41}" "${expected:8:41}"
  assert_equal "${lines[6]:0:69}" "${expected2}"
}
