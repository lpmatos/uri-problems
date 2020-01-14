# -*- coding: utf-8 -*-

"""Documentation file 1001.py."""

# =============================================================================
# FUNCTIONS
# =============================================================================

def soma(first: int, last: int) -> int:
    if isinstance(first, int) and isinstance(last, int):
        return first + last

# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":

    first = int(input())
    last = int(input())

    print("X = {0}".format(soma(first, last)))
    