1. removenames

関数とは……
演習の解説をみるとアルゴリズムの定義ではなく、それぞれの項について場合分けすることが望まれているようである。

単項
removenames(n, x) = n から xのインデックスを探して返す

ラムダ
removenames(n, \x -> t1) = removenames(push(n, x), t1)
push(n, x) は名前付け文脈 n の最右に x を付け加えるものとする

適用
removenames(n, t1 t2) = removenames(n, t1) removenames(n, t2)
