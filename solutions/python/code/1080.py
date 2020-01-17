lista = [int(input()) for elemento in range(1, 101)]

other = sorted(lista, reverse=True) 

print(other[0])
print(lista.index(other[0]) + 1)
