c0 = \s -> \z -> z;
c0 = \ -> \ -> 0;

c2 = \s -> \z -> s (s z);
c2 = \ -> \ -> 1 (1 0);

plus = \m -> \n -> \s -> \z -> m s (n s z);
plus = \ -> \ -> \ -> \ -> 3 1 (2 1 0);

fix = \f -> (\x -> f (\y -> (x x) y)) (\x -> f (\y -> (x x) y));
fix = \ -> (\ -> 1 (\ -> (1 1) 0)) (\ -> 1 (\ -> (1 1) 0));

foo = (\x -> (\x -> x)) (\x -> x)
foo = (\ -> (\ -> 0)) (\ -> 0)