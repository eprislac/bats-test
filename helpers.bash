#! ./bin/bash

load './test/libs/bats-support/load'
load './test/libs/bats-assert/load'

assert_exists() {
  assert [ -e "$1" ]
}

refute_exists() {
  assert [ ! -e "$1" ]
}

assert_contains() {
  local item
  for item in "${@:2}"; do
    if [[ "$item" == "$1" ]]; then
      return 0
    fi
  done

  batslib_print_kv_single_or_multi 8 \
        'expected' "$1" \
        'actual'   "$(echo ${@:2})" \
      | batslib_decorate 'item was not found in the array' \
      | fail
}

