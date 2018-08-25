data Info = I Int Int deriving Show
type Depth = Int
type VarName = String
data Binding = DataBind
type Context = [(String, Binding)]
data Term = TmVar Info Int Depth | TmAbs Info VarName Term | TmApp Info Term Term deriving Show

showTerm :: Context -> Term -> String
showTerm ctx (TmAbs info x t1) = let (ctx', x') = pickFreshName ctx x in "(lambda " ++ x' ++ ". " ++ showTerm ctx t1 ++ ")"
showTerm ctx (TmApp info t1 t2) = "(" ++ showTerm ctx t1 ++ " " ++ showTerm ctx t2 ++ ")"
showTerm ctx (TmVar info x depth) = if contextLength ctx == depth then indexToName info ctx x else "[bad index]"

pickFreshName :: Context -> String -> (Context, String)
pickFreshName c t = (c, t)

contextLength :: Context -> Int
contextLength _ = 1

indexToName :: Info -> Context -> Int -> String
indexToName _ _ s = show s



main :: IO()
main = do
  let ctx = [("a", DataBind)]
  let info = I 1 1
  print $ showTerm ctx (TmVar info 1 1)
