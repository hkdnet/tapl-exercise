import Data.List

data Info = I Int Int deriving Show
type Depth = Int
type VarName = String
type Context = [String]
data Term = TmVar Info Int Depth | TmAbs Info VarName Term | TmApp Info Term Term deriving Show

showTerm :: Context -> Term -> String
showTerm ctx (TmAbs info x t1) = let (ctx', x') = pickFreshName ctx x in "(lambda " ++ x' ++ ". " ++ showTerm ctx' t1 ++ ")"
showTerm ctx (TmApp info t1 t2) = "(" ++ showTerm ctx t1 ++ " " ++ showTerm ctx t2 ++ ")"
showTerm ctx (TmVar info x depth) = if contextLength ctx == depth then indexToName ctx x else "[bad index]" ++ show depth ++ "of" ++ show (contextLength ctx)

pickFreshName :: Context -> String -> (Context, String)
pickFreshName c s = case find (\x -> x == s) c of
  Just e -> pickFreshName c ('\'':s)
  Nothing -> ((s:c), s)

contextLength :: Context -> Int
contextLength = length

indexToName :: Context -> Int -> String
indexToName ctx n = ctx !! n

termShift :: Depth -> Term -> Term
termShift d t = walk 0 t
  where
    walk c (TmVar fi x n) = if x >= c then TmVar fi (x+d) (n+d) else TmVar fi x (n+d)
    walk c (TmAbs fi x t1) = TmAbs fi x (walk (c+1) t1)
    walk c (TmApp fi t1 t2) = TmApp fi (walk c t1) (walk c t2)

main :: IO()
main = do
  let ctx1 = ["b", "a"]
  let info = I 1 1
  print $ showTerm ctx1 (TmVar info 1 1)

  let ctx2 = ["b","a","z","y","x"]
  -- \w.\a.x
  let term2 = TmApp info (TmVar info 4 5) (TmApp info (TmVar info 3 5) (TmVar info 2 5))
  print $ showTerm ctx2 term2
  let term3 = TmAbs info "w" (TmApp info (TmVar info 4 6) (TmVar info 0 6))
  print $ showTerm ctx2 term3
  let term4 = TmAbs info "w" (TmAbs info "a" (TmVar info 4 7))
  print $ showTerm ctx2 term4

  -- ↑2 (\. \. 1 (0 2))
  let ctx3 = ["a"]
  let term3 = TmAbs info "a" (TmAbs info "a" ( TmApp info (TmVar info 1 3) (TmApp info (TmVar info 0 3) (TmVar info 2 3))))
  print $ showTerm ctx3 term3

