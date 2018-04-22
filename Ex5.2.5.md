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

