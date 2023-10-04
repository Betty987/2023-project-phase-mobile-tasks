# calculator.py

import math  # Import the math module to use the sqrt function.

def square(x):
    """Calculate the square of a number."""
    return x ** 2

def square_root(x):
    """Calculate the square root of a number."""
    if x < 0:
        raise ValueError("Cannot calculate square root of a negative number")
    return math.sqrt(x)
