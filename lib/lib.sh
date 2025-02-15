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

  if command -v md5 > /dev/null; then # macOS
    temp_file=$(mktemp)
    find "${dir}" -type f -exec md5 -r {} + > "${temp_file}"
    sort "${temp_file}" | cut -f1 -d " " | uniq -d | while read -r hash; do
      grep "${hash}" "${temp_file}" | sed 's/ /  /'
    done
    rm "${temp_file}"
  else
    find "${dir}" -type f -exec md5sum {} + | sort | uniq -w32 -dD
  fi
}
