#!/usr/bin/env bash
set -euo pipefail
readonly TARGET_DIR="$1"
source lib/lib.sh
is_dir "${TARGET_DIR}"
find_duplicate_files "${TARGET_DIR}"
