---
title: サポートベクター回帰（SVR）
date: 2019-08-26T00:30:46.277Z
dropCap: true
displayInMenu: false
displayInList: false
draft: false
---
# サポートベクター回帰
資料がここに
https://datachemeng.com/supportvectorregression/

やってること：
- 通常の回帰において，誤差だけでなく重み係数の2乗和も入れる
- εチューブと呼ばれる回帰直線の周りの一定領域を不感帯とする：ε-SVR
- 非線形の関数にはカーネルトリックを

ほぼ普通の回帰では…？

## 用語
- スラック変数：不等式制約を「等式制約＋非負制約」へと変換するための一時変数
- カーネルトリック：後で調べる

## カーネルトリック
https://qiita.com/kilometer/items/66e6116cc661019ead59

カーネル関数kを用いた回帰は以下の手順

1. kが求まる。   カーネル関数
2. Kが求まる。　グラム行列
3. wが求まる。　係数
4. f(x)が求まる。

このカーネルkの決定がだるい？
