#!/usr/bin/env bash
# 使い方: ./new.sh 001
# cpp/001.cpp と rust/001.rs をテンプレートから作る（既にあれば上書きしない）
set -eu
cd "$(dirname "$0")"
id="${1:?問題番号を指定してください (例: ./new.sh 001)}"
[ -d "problems/$id" ] || { echo "problems/$id がありません"; exit 1; }
for pair in "cpp:cpp" "rust:rs"; do
  dir="${pair%%:*}"; ext="${pair##*:}"; f="$dir/$id.$ext"
  if [ -e "$f" ]; then echo "skip: $f (既にあります)"
  else cp "templates/main.$ext" "$f"; echo "作成: $f"; fi
done
