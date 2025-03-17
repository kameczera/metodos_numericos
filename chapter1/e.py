import numpy as np
import matplotlib.pyplot as plt
import math

def taylorSeries(x, n):
    """Aproximação de e^x usando n termos fixos."""
    result = 0.0
    for i in range(n):
        result += (x ** i) / math.factorial(i)
    return result

def taylorSeries2(x, tol=1e-10):
    """Aproximação de e^x usando critério de parada baseado na tolerância."""
    result = 1.0
    term = 1.0
    k = 1

    while abs(term) > tol:
        term *= x / k
        result += term
        k += 1

    return result, k

x_values = np.linspace(0, 5, 100)
actual_values = np.exp(x_values)

approx_fixed_10 = [taylorSeries(x, 10) for x in x_values]  # 10 termos fixos
approx_fixed_20 = [taylorSeries(x, 20) for x in x_values]  # 20 termos fixos
approx_adaptive = [taylorSeries2(x)[0] for x in x_values]  # Critério de parada por tolerância

plt.figure(figsize=(8, 6))

plt.plot(x_values, actual_values, 'k--', label="e^x (Real)")
plt.plot(x_values, approx_fixed_10, label="Taylor (10 termos)")
plt.plot(x_values, approx_fixed_20, label="Taylor (20 termos)")
plt.plot(x_values, approx_adaptive, label="Taylor (Critério de Parada)")

plt.xlabel("x")
plt.ylabel("f(x)")
plt.title("Comparação das Aproximações da Série de Taylor para e^x")
plt.legend()
plt.grid()
plt.show()
