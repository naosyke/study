#!/usr/bin/env bash
# 使い方: ./judge.sh cpp 001   または   ./judge.sh rust 001
# コンパイルして problems/<番号>/inN.txt を入力に実行し、outN.txt と比較する
set -u
cd "$(dirname "$0")"
lang="${1:?言語を指定 (cpp / rust)}"; id="${2:?問題番号を指定 (例: 001)}"
mkdir -p build
bin="build/${lang}_$id"

case "$lang" in
  cpp)  src="cpp/$id.cpp"
        clang++ -std=c++20 -O2 -Wall -Wextra -o "$bin" "$src" || { echo "コンパイルエラー"; exit 1; } ;;
  rust) src="rust/$id.rs"
        rustc --edition 2021 -O -o "$bin" "$src" || { echo "コンパイルエラー"; exit 1; } ;;
  *)    echo "言語は cpp か rust"; exit 1 ;;
esac

pass=0; total=0
for in in problems/$id/in*.txt; do
  n="${in##*/in}"; n="${n%.txt}"; expected="problems/$id/out$n.txt"
  total=$((total+1))
  actual="$("./$bin" < "$in")"
  if [ "$actual" == "$(cat "$expected")" ]; then
    echo "✅ ケース$n AC"; pass=$((pass+1))
  else
    echo "❌ ケース$n WA"
    echo "  入力:";   sed 's/^/    /' "$in"
    echo "  期待値:"; sed 's/^/    /' "$expected"
    echo "  出力:";   echo "$actual" | sed 's/^/    /'
  fi
done
echo "---- $pass / $total ケース正解 ----"
[ "$pass" -eq "$total" ]
