#!/usr/bin/env bash

set -u
shopt -u dotglob

S_RESET=$'\033[0m'
S_RED=$'\033[0;31m'
S_RED_BOLD=$'\033[1;31m'

SCHEME_ROOT="$(dirname "$(readlink -f "$0")")"
SRC_DIR="$SCHEME_ROOT"

if [[ "${1-}" == '-q' ]]; then
  QUIET=true
  QUERY=''
else
  QUIET=false
  QUERY="${1-}"
fi

cd "$SRC_DIR" || exit 1

FOUND=false

while IFS= read -rd '' FILE; do
  FOUND=true
  "$QUIET" || echo "# $FILE"
  cd "$(dirname "$SRC_DIR/$FILE")" && { echo -n "$S_RED"; plt-r5rs "$(basename "$FILE")"; echo -n "$S_RESET"; }
done < <(find -- * -type f -name "*-test.scm" -path "*$QUERY*" -print0)

if ! "$FOUND"; then
  echo "${S_RED_BOLD}error$S_RESET: no tests found for '$QUERY'" >&2
  exit 1
fi
