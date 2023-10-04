# test_calculator.py

import unittest
from calculator import square, square_root

class TestCalculator(unittest.TestCase):

    def test_square(self):
        self.assertEqual(square(5), 25)
        self.assertEqual(square(0), 0)
        self.assertEqual(square(-3), 9)

    def test_square_root(self):
        self.assertEqual(square_root(25), 5)
        self.assertEqual(square_root(0), 0)
        with self.assertRaises(ValueError):
            square_root(-3)

if __name__ == '__main__':
    unittest.main()
