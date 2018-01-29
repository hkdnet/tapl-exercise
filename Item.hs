module Item where
import Control.Monad

data Item = Qtrue
  | Qfalse
  | Zero
  | Succ Item
  | Pred Item
  | Iszero Item
  | IfExpr Item Item Item
  deriving (Show, Eq)

s :: Int -> [Item]
s (-1) = []
s 0 = []
s n = [Qtrue, Qfalse, Zero] ++ (s1 >>= \x -> [Succ x, Pred x, Iszero x]) ++ ([IfExpr x y z | x <- s1, y <- s1, z <- s1])
  where s1 = s (n - 1)

sCount :: Int -> Int
sCount (-2) = 0
sCount (-1) = 0
sCount 0 = 0
sCount n = 3 + sc1*3 + sc1 * sc1 * sc1
  where sc1 = sCount (n - 1)
