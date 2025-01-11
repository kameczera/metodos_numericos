import numpy as np

# Parte A: Estimar a precisão da máquina em ponto flutuante simples e dupla

print("Parte A: Estimando a precisão da máquina em ponto flutuante simples e dupla\n")

# Algoritmo para precisão simples
A_simples = np.float32(1)  # Precisão simples
s_simples = np.float32(2)
while s_simples > 1:
    A_simples /= 2
    s_simples = 1 + A_simples
prec_simples = 2 * A_simples  # Precisão da máquina
print(f"Precisão em ponto flutuante simples: {prec_simples}\n")

# Algoritmo para precisão dupla
A_dupla = np.float64(1)  # Precisão dupla
s_dupla = np.float64(2)
while s_dupla > 1:
    A_dupla /= 2
    s_dupla = 1 + A_dupla
prec_dupla = 2 * A_dupla  # Precisão da máquina
print(f"Precisão em ponto flutuante dupla: {prec_dupla}\n")

# Parte B: Justificativa do passo 3
# O valor de "Prec" é definido como o dobro do último valor de "A" porque, no momento em que
# a condição "s > 1" não é mais satisfeita, o valor de "A" foi reduzido ao ponto em que 
# "1 + A" é indistinguível de 1 devido à precisão da máquina. Portanto, para obter o menor valor
# de "A" ainda detectável, é necessário voltar ao último valor válido antes da divisão final.
# Multiplicando esse valor por 2, obtemos a precisão da máquina.

# Parte C: Algoritmo modificado com VAL como entrada

print("Parte C: Testando o algoritmo com diferentes valores de VAL\n")

# Função para calcular a precisão usando VAL como referência
def calcular_precisao_com_val(val):
    A = 1.0  # Iniciando A como 1
    s = val + A
    while s > val:
        A /= 2
        s = val + A
    prec = 2 * A
    return prec

# Lista de valores de VAL para teste
valores_val = [10, 17, 100, 184, 1000, 1575, 10000, 17893]

# Executando o algoritmo para cada valor de VAL
for val in valores_val:
    prec = calcular_precisao_com_val(val)
    print(f"Para VAL = {val}, Precisão estimada: {prec}")

# Justificativa: A precisão da máquina (Prec) muda com VAL porque, ao aumentar VAL, o tamanho relativo
# do número A em relação a VAL diminui mais rapidamente. Isso ocorre porque "s = VAL + A" depende
# diretamente do valor de VAL, e o ponto em que "s > VAL" deixa de ser verdadeiro será alcançado
# mais rapidamente para valores maiores de VAL. Assim, o menor valor de A ainda detectável varia
# com a escala de VAL.