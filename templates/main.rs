use std::io::{self, Read};

fn main() {
    // 標準入力を全部読み込む（ここは定型文）
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).unwrap();

    // ここに解答を書く
    // ヒント: input.split_whitespace() で空白区切りに分けられる
}
