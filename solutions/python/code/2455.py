a, b, c, d = input().split(" ")
a, b, c, d = int(a), int(b), int(c), int(d)
esquerda, direita = a * b, c * d

print("0") if esquerda == direita else (print("-1") if esquerda > direita else print("1"))
