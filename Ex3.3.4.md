# 深さ

## 命題

各項 s に対して以下の命題 p が成立するとき, すべての s について P(s) が成立する.

命題p:

`depth (r) < depth(s)` なる任意の r に対して P(r) が成り立つとき、 P(s) が証明できる

## 証明(っぽいもの

以下、sの形式について3ケースに分類して証明する。

### s が定数の場合

`depth (r) < depth(s)` を満たす r が存在しないので命題 p が成立することは明らかである。

memo:  
これだと例えば P(true) は成立するが P(false) が成立しない述語 P に関して、P(s)が成立するといえないのでは……？  
その場合は s の depth が 2 になったときに任意の depth(r) = 1 な r について成立しないからいいのかな……。


### s が succ s1 あるいは pred s1 あるいは iszero s1 の場合

P(succ s1), P(pred s1), P(iszero s1) のすべてが成り立つことを示せばよい。


定義3.3.2 に含まれる以下の3定義より

- depth(succ s1) = depth(s1) + 1
- depth(pred s1) = depth(s1) + 1
- depth(iszero s1) = depth(s1) + 1

それぞれ s = succ s1, s = pred s1, s = iszero s1 の場合に `depth(s1) < depth(s)` が成立する。

`depth(s1) < depth(s)` と 命題 p より P(s1) が成立するならば P(s) が証明できる。

### s が if s1 then s2 else s3 の場合

P(is s1 then s2 else s3) が成り立つことを示せばよい。

定義3.3.2 に含まれる以下の定義より

`depth(if s1 then s2 else s3) = max(depth(s1), depth(s2), depth(s3)) + 1`

以下の3つの性質が同時に満たされることがわかる。

- `depth(s1) < depth(s)`
- `depth(s2) < depth(s)`
- `depth(s3) < depth(s)`

以上のことと命題 p より 「P(s1) かつ P(s2) かつ P(s3)」 が成立するならば P(s) が証明できる。


上記3ケースによってすべての s について P(s) が成立することが示された。


# サイズ

深さに関する証明について、depth の評価を size に変えれば良い。

定義3.3.2 に含まれる以下の定義よりそれぞれのことが言えることのみ示す。

- `s = succ s1` のとき size(succ s1) = size(s1) + 1 であるため `depth(s1) < depth(s)`
- `s = pred s1` のとき size(pred s1) = size(s1) + 1 であるため `depth(s1) < depth(s)`
- `s = iszero s1` のとき size(iszero s1) = size(s1) + 1 であるため `depth(s1) < depth(s)`
- `s = if s1 then s2 else s3` のとき size(if s1 then s2 else s3) = size(s1) + size(s2) + size(s3) + 1 であるため `depth(s1) < depth(s)` かつ `depth(s2) < depth(s)` かつ `depth(s3) < depth(s)`

# 構造

定義3.3.1 に含まれる以下の定義よりうんぬん


