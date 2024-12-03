# metodos_numericos


### Haskell: Resumo Rápido e Objetivo  

#### Principais Características  
- Linguagem puramente funcional: funções são deterministicas e não têm efeitos colaterais.  
- Tipagem forte e estática: os tipos são verificados em tempo de compilação.  
- Avaliação preguiçosa (lazy evaluation): expressões só são calculadas quando necessárias.  
- Imutabilidade: valores não podem ser alterados após a atribuição.  
- Concisão: código tende a ser mais curto e expressivo.  

#### Tipos Primitivos  
- Int: inteiros de tamanho fixo (32 ou 64 bits, dependendo da arquitetura).  
- Integer: inteiros de tamanho arbitrário (mais lento, mas sem limite superior).  
- Double: números de ponto flutuante em precisão dupla.  
- Bool: valores lógicos (True ou False).  
- Char: um único caractere Unicode.  

#### Integer x Int  
- Integer: para cálculos com números muito grandes ou que ultrapassam os limites do Int.  
- Int: mais rápido e eficiente para valores dentro do intervalo limitado.  

#### Tipos Não Primitivos  
- Lista: coleção de elementos do mesmo tipo.  
- Tupla: agrupamento de elementos de diferentes tipos.  

#### Como Declarar uma Lista  
let lista = [1, 2, 3, 4, 5]

#### [Char] == String  
- Em Haskell, uma String é simplesmente uma lista de caracteres ([Char]).  
- Exemplo:  
    let str = "Olá"  -- Equivale a ['O', 'l', 'á']
  

#### Tuplas  
- Podem conter elementos de tipos diferentes:  
    let tupla = (1, "Haskell", True)
    
- São fixas em tamanho e tipo.  

#### Introdução à Função  
- Definidas por padrão como puras e sem efeitos colaterais:  
    soma :: Int -> Int -> Int
  soma x y = x + y
  

#### Funções Built-in  
- `map`: aplica uma função a todos os elementos de uma lista.  
- `filter`: filtra elementos de uma lista com base em uma condição.  
- `head`: retorna o primeiro elemento de uma lista.  
- `tail`: retorna a lista sem o primeiro elemento.  
- `length`: retorna o tamanho de uma lista.  
- `zip`: combina duas listas em pares (tuplas).