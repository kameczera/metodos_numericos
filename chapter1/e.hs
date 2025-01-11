import Data.List (foldl')

-- Versão do fatorial utilizando programação dinâmica:
fac' :: [Integer]
fac' = scanl (*) 1 [2..]

-- Ele cria uma lista infinita dos fatoriais de todos números inteiros.
-- Isso é possível porque haskell é uma linguagem com lazy evaluation!
-- A função scanl é responsável por passar por todos elementos da lista e ir aplicando a função (nesse caso *)
-- de maneira que o acumulador seja armazenado em uma lista. Essa nova lista é retornada.

-- Exemplo de funcionamento do scanl:
-- scanl (/) 64 [4, 2, 4].              Output: [64]
-- scanl (/) (64 / 4 = 16.0) [2, 4].    Output: [64.0, 16.0]
-- scanl (/) (16 / 2 = 8.0) [4].        Output: [64.0, 16.0, 8.0]
-- scanl (/) (8.0 / 4 = 2.0) [].        Output: [64.0, 16.0, 8.0, 2.0]
-- Output final: [64.0, 16.0, 8.0, 2.0]

-- Versus

-- Função fatorial "normal":
-- fac :: Integer -> Integer
-- fac 0 = 1
-- fac n = n * fac (n - 1)

taylorSeries :: Float -> Int -> Float
taylorSeries x y = sum $ take y $ zipWith (\n facn -> (x ** fromIntegral n) / (fromIntegral facn)) ([0] ++ [0..]) fac'

-- o "zipWith" é uma função que passa por dois listas no mesmo índice e aplica uma função.
-- Nesse caso, ela pega um lista infinito dos números inteiros e o lista gerado pela fac', que como discutido antes
-- gera um lista dos fatoriais de todos números inteiros e aplica a função da série de taylor.
-- n passa a ser um elemento da lista de inteiros e facn um elemento da lista fac'
-- daí, a função "take" pega os primeiros y (passado como parametro) elementos
-- e depois soma com a função "sum"

taylorSeries' :: Float -> Float -> Float
taylorSeries' x 1 = 1
taylorSeries' x n = x + taylorSeries' (x / n) (n - 1)