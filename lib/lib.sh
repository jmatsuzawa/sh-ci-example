is_dir() {
  local dir="$1"
  if [ ! -d "$dir" ]; then
    echo "The directory is not found: ${dir}" >&2
    return 1
  fi
}

find_duplicate_files() {
  local dir="$1"
  echo "find duplicate files: ${dir}"
  find "${dir}" -type f -exec md5sum {} + | sort | uniq -w32 -dD
}
