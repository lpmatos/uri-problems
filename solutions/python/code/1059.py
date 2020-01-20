# -*- coding: utf-8 -*-

"""Documentation file 1059.py."""

# =============================================================================
# FUNCTIONS
# =============================================================================

def show(lista):
    if isinstance(lista, list):
        for elemento in lista:
            print(elemento)

# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":
    pares = [elemento for elemento in range(1, 101) if elemento % 2 == 0]
    show(pares)
