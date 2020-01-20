# -*- coding: utf-8 -*-

"""Documentation file 1002.py."""

import math

# =============================================================================
# FUNCTIONS
# =============================================================================

def read():
  try:
    # read for Python 2.x
    return float(raw_input())
  except NameError:
    # read for Python 3.x
    return float(input())

def area(value: float) -> float:
    return 3.14159 * (math.pow(value, 2)) if isinstance(value, float) else None

# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":
    value = read()
    print(str("A=") + str("{:0.4f}".format(area(value))))
