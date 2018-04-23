## Ex5.2.1.

or = \b. \c. b tru c

not = \b. b fls tru

## Ex5.2.2.

scc = \n. \s. \z. n s (s z)

## Ex5.2.3.

p.46 より以下の2式を得る。

```
  times = \m. \n. m (plus n) c0; ... x
  plus = \m. \n. \s. \z. m s (n s z);
```

α変換により以下を得る

```
  plus = \pm. \pn. \ps. \pz. pm ps (pn ps pz); ... y
```

以下のように変換する

```
  times = \m. \n. m ((\pm. \pn. \ps. \pz. pm ps (pn ps pz)) n) c0; # plus を y で置換
  times = \m. \n. m (\pn. \ps. \pz. n ps (pn ps pz)) c0; # n を適用した
  times = \m. \n. m (\ps. \pz. n ps (c0 ps pz)); # c0 を適用した
  times = \m. \n. m (\ps. \pz. n ps pz); # c0 に ps pz を適用した
  times = \m. \n. \ps. m (\pz. n ps pz); # なんかやって良い気がするんだけどなんでだろう……
  times = \m. \n. \ps. \pz m (n ps pz); # なんかやって良い気がするんだけどなんでだろう……
  times = \m. \n. \s. \z m (n s z); # α変換
```

NOTE: `# c0 を適用した` のところ、 c0 は m に適用されるからダウトな気がしてきた


## Ex5.2.4.

power = \m. \n. m (times n) c1;

## Ex5.2.5.

```
zz = pair c0 c0;
ss = \p. pair (snd p) (plus c1 (snd p));
prd = \m. fst (m ss zz);
```


```
sub = \m. \n. (n prd) m;
```

一応練習...


```
c0 = \s. \z. z;
c1 = \s. \z. s z;
c2 = \s. \z. s (s z);
c3 = \s. \z. s (s (s z));
```


```
  sub c3 c1
= (\m. \n. (n prd) m) c3 c1;
= (\n. (n prd) c3) c1;
= (c1 prd) c3;
= ((\s. \z. s z) prd) c3;
= (\z. prd z) c3
= prd c3
= c2 # 定義からそうなるはず

  sub c4 c2
= (\m. \n. (n prd) m) c4 c2;
= (\n. (n prd) c4) c2;
= (c2 prd) c4;
= ((\s. \z. s (s z)) prd) c4;
= (\z. prd (prd z)) c4;
= prd (prd c4);
= prd c3;
= c2;
```

## Ex5.2.6.

略解: O(n)

まじめに考えようと思ったが評価のステップ数か……
いったんあとで。


## Ex5.2.7.

最初の解答

```
equal = \m. \n. test (iszro m) (equal (prd m) (prd n)) (iszro n)
```

↑
church数 m, n が実数において m > n であるときに評価が途中で行き詰まってしまうよーな
→行き詰まらない。定義的には prd c0 -> c0 になりそう

```
equal = \m. \n. and (iszro (sub m n)) (iszro (sub n m))
```

## Ex5.2.8.

むずい……
考え方のヒントをきく

## Ex5.2.9.

```
fix = \f. (\x. f (\y. x x y)) (\x. f (\y. x x y));
g = \fct. \n. if reqleq n c0
              then c1
              else (times n (fc (prd n)))
```

test だと簡約がめんどい？のかな？

-> Iif 関数 ( VB.NET ) のように療法が評価されて発散してしまう、とのこと

```
g = \fct. \n. test (iszro n) c1 (times n (fc (prd n)))
```

## Ex5.2.10.

```
tmp = \c. (iszro c) 0 (succ (tmp (prd c)))
churchnat = fix tmp
```

memo: Ex5.2.9. の論点を理解していないのでこれも危ういかも。

## Ex5.2.11.

理解しやすかったので別解のほうを使う

```
nil = pair tru tru;
cons = \h. \t. pair fls (pair h t);
head = \z. fst (snd z)
tail = \z. snd (snd z)
isnil = fst
```


