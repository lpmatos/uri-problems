# -*- coding: utf-8 -*-

"""Documentation file 1005.py."""

# =============================================================================
# FUNCTIONS
# =============================================================================

def read():
    try:
        return float(input())
    except Exception:
        return None

def calculo(*args):
    return ((args[0] * 3.5) + (args[1] * 7.5))/11 if all(isinstance(elemento, float) for elemento in args) else None

# =============================================================================
# FUNCTIONS
# =============================================================================

if __name__ == "__main__":
    first, last = read(), read()
    print("MEDIA = %0.5f" % (calculo(first, last)))
