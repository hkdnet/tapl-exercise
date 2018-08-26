data Info = I Int Int deriving Show
type Depth = Int
type VarName = String
type Context = Int
data Term = TmVar Info Int Depth | TmAbs Info VarName Term | TmApp Info Term Term deriving Show

showTerm :: Context -> Term -> String
showTerm ctx (TmAbs info x t1) = let (ctx', x') = pickFreshName ctx x in "(lambda " ++ x' ++ ". " ++ showTerm ctx t1 ++ ")"
showTerm ctx (TmApp info t1 t2) = "(" ++ showTerm ctx t1 ++ " " ++ showTerm ctx t2 ++ ")"
showTerm ctx (TmVar info x depth) = if contextLength ctx == depth then indexToName info ctx x else "[bad index]"

-- 名前を解釈するらしいけどとりあえず数値で出しとく
pickFreshName :: Context -> String -> (Context, String)
pickFreshName c t = (c, t)

contextLength :: Context -> Int
contextLength = id

indexToName :: Info -> Context -> Int -> String
indexToName _ _ s = show s

termShift :: Depth -> Term -> Term
termShift d t = walk 0 d t

walk :: Int -> Depth -> Term -> Term
walk c d (TmVar fi x n) = if x >= c then TmVar fi (x+d) (n+d) else TmVar fi x (n+d)
walk c d (TmAbs fi x t1) = TmAbs fi x (walk (c+1) d t1)
walk c d (TmApp fi t1 t2) = TmApp fi (walk c d t1) (walk c d t2)

main :: IO()
main = do
  let ctx1 = 1
  let info = I 1 1
  print $ showTerm ctx1 (TmVar info 1 1)

  -- ↑2 (\. \. 1 (0 2))
  let ctx2 = 2
  let term = TmAbs info "1" (TmAbs info "0" ( TmApp info (TmVar info 1 2) (TmApp info (TmVar info 0 2) (TmVar info 2 2))))
  print $ showTerm ctx2 term -- "(lambda 1. (lambda 0. (1 (0 2))))"

