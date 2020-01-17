# -*- coding: utf-8 -*-

"""Documentation file 1573.py."""

# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":
    while True:
        a, b, c = input().split(" ")
        a, b, c = int(a), int(b), int(c)
        lista = sorted(list([a, b, c]))
        if lista.count(0) == len(lista):
            break
        else:
            volume, aux = a * b * c, 0
            for elemento in range(lista[0], lista[-1]):
                cubo = elemento * elemento * elemento
                if cubo > volume:
                    break
                else:
                    aux = elemento
            print(aux)
