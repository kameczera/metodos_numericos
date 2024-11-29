
convert :: [Integer] -> Integer
convert [] = 0 -- primeiro caso
convert (x:xs) = x * 2 ^ length xs + convert xs -- segundo caso
-- convert está fazendo uma recursão no array.
-- (x:xs): está decompondo o array em 2 partes: x sendo o primeiro elemento e xs o restante
-- length: função para pegar tamanho do array
-- e.g: convert [1,0,1,0]
-- 1. x = 1, xs = [0,1,0]. 1 * 2^3 + convert [0,1,0] (cai no segundo caso)
-- 2. x = 0, xs = [1,0]. 0 * 2^2 + convert [1,0] (cai no segundo caso)
-- 3. x = 1, xs = [0]. 1 * 2^1 + convert [0] (cai no segundo caso)
-- 3. x = 0, xs = []. 0 * 2^0 + convert [] (cai no segundo caso)
-- 4. [] = 0 (cai no primeiro caso)
-- 1 * 2^3 + 0 * 2^2 + 1 * 2^1 + 0 * 2^0 + 0 = 10

binaryToDecimal :: String -> Integer
binaryToDecimal binary = convert (map (read . pure) binary)

-- map: passa por todos elementos do array
-- pure: transforma caracteres em strings (lista de caracteres): e.g: ['1', '0', '1', '0'] -> ["1", "0", "1", "0"]
-- read: transforma strings em ints: e.g: ["1", "0", "1", "0"] -> [1, 0, 1, 0]
-- read . pure: o "." está compondo 2 funções, read e pure, ou seja, primeiro aplica pure e depois read
-- o map vai aplicar "read . pure" em cada elemento do array
-- map read . pure ['1', '0', '1', '0'] -> ["1", "0", "1", "0"] -> [1, 0, 1, 0]

main :: IO()
main = print(binaryToDecimal "1010")