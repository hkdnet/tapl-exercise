equal = \m. \n. test (iszro m) (equal (prd m) (prd n)) (iszro n)

↑
church数 m, n が実数において m > n であるときに評価が途中で行き詰まってしまうよーな

equal = \m. \n. and (iszro (sub m n)) (iszro (sub n m))
