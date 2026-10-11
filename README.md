# study

C++ と Rust を競技プログラミング形式で勉強するリポジトリ。
同じ問題を **C++ と Rust の両方で解いて** 書き方の違いを比べる。

## フォルダ構成
```
problems/NNN/   問題文 (README.md) とサンプル (inN.txt / outN.txt)
cpp/NNN.cpp     C++ の解答（自分で書く）
rust/NNN.rs     Rust の解答（自分で書く）
templates/      解答のひな形
```

## 使い方
```bash
./new.sh 001          # cpp/001.cpp と rust/001.rs をひな形から作る
./judge.sh cpp 001    # C++ の解答をサンプルで採点
./judge.sh rust 001   # Rust の解答をサンプルで採点
```
自分で試したい入力があれば `problems/NNN/` に `in9.txt` / `out9.txt` のように追加すればOK。

## 進み具合
| # | 問題 | テーマ | C++ | Rust |
|---|------|--------|-----|------|
| 001 | 足し算 | 入出力 | | |
| 002 | 偶数か奇数か | if / 余り | | |
| 003 | 合計と最大値 | 配列 / オーバーフロー | | |
| 004 | 回文判定 | 文字列 | | |
| 005 | FizzBuzz | ループ / match | | |

## 次のステップ
慣れてきたら [AtCoder](https://atcoder.jp/) の ABC の A・B 問題へ。
