# -*- coding: utf-8 -*-

"""Documentation file 1003.py."""

# =============================================================================
# FUNCTIONS
# =============================================================================

def read():
    try:
        return int(input())
    except Exception as error:
        return None

# =============================================================================

def soma(first, last):
    return first + last if isinstance(first, int) and isinstance(last, int) else None

# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":
    lista = [read() for elemento in range(2)]
    SOMA = soma(lista[0], lista[1])
    print("SOMA = {0}".format(SOMA))
