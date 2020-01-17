# -*- coding: utf-8 -*-

"""Documentation file 1070.py."""

# =============================================================================
# FUNCTIONS
# =============================================================================

def impar(value: int) -> bool:
    if value % 2 != 0:
        return True
    return False

# =============================================================================

def show(lista):
    for elemento in lista:
        print(elemento)

# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":
    value, lista, stop = int(input()), list(), False
    while not stop:
        value += 1
        if len(lista) >= 6:
            stop = True
        else:
            if impar(value):
                lista.append(value)
            else:
                continue
    show(lista)
