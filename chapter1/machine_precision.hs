-- Projeto 1: Precisão da Máquina

-- Passo 1:
-- A = 1;
-- s = VAL + A;

-- Passo 2:
-- Enquanto (s) > VAL, faça:
-- A = A/2
-- s = 1 + A

-- Passo 3:
-- Faça Prec = 2A e imprima Prec

precision_2 :: Float -> Float -> Float -> Float
precision_2 a val s
  | s > val   = precision_2 (a / 2) val (val + a)
  | otherwise = 2 * a
-- | é um operador que define *guards*, é tipo um enum, case, if ...
-- nesse caso, ele verifica se o valor s > val, caso não, ele passa no otherwise que é a condição padrão.

precision :: Float -> Float
precision val =
  let a = 1
      s = val + a
  in precision_2 a val s

-- let ... in: operador de declaração de variáveis dentro do escopo de in
-- em outras palavras: utilizando o let, haskell deixa criar variáveis que poderão ser utilizadas dentro de in

main :: IO ()
main = do
  print (precision 10)
  print (precision 17)
  print (precision 100)
  print (precision 184)
  print (precision 1000)
  print (precision 1575)
  print (precision 10000)
  print (precision 17893)
  print (precision 9999)

-- por que prec se altera quando VAL é modificado?
-- acredito que seja porque, quando o número é maior, a mantissa é estoura, ai começa a ter perda da precisão
-- rodei em outra linguagem só para debuggar val + a como seria o código
-- output: 11.0, 10.5, 10.25, ..., 10.0 <- condição de parada
-- deve ter acontecido algo similar em haskell