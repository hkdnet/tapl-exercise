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
