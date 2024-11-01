# Matrices

## Notation

A matrix is an array of numbers arranged in rows and columns. Matrices are used to represent and solve linear equations, perform geometric transformations efficiently.

An general `m x n` matrix has `m` rows and `n` columns and looks like:

![Img](./static/matrices/matrix.png)

The following matrix has 2 Rows and 3 Columns:

![Img](./static/matrices/matrix_example.png)

## Square Identity Matrix

This is a square matrix (`m = n`) with ones on the diagonal and zeros elsewhere.        
Example of a `4x4` identiry matrix:

![Img](./static/matrices/identity.png)

## Basic Matrix Operations

### Addition and Subtraction

The two matrices must be the same size, i.e. the rows must match in size, and the columns must match in size.

![Img](./static/matrices/addition_color.png)

- **m1n1**: 3 + 4 = 7
- **m1n2**: 8 + 0 = 8
- **m2n1**: 4 + 1 = 4
- **m2n2**: 6 + (-9) = -3

> [!NOTE]
> Example: a matrix with 3 rows and 5 columns can be added to another matrix of 3 rows and 5 columns.
> 
>  But it could not be added to a matrix with 3 rows and 4 columns (the columns don't match in size)

To subtract two matrices: subtract the numbers in the matching positions:

![Img](./static/matrices/subtraction_color.png)

- **m1n1**: 3 - 4 = -1
- **m1n2**: 8 - 0 = 8
- **m2n1**: 4 - 1 = 3
- **m2n2**: 6 - (-9) = 15

### Scalar Multiplication

![Img](./static/matrices/scalar_multiplication.png)

## Matrix Multiplication

> [!CAUTION]
> todo

## Matrix Inverse

> [!CAUTION]
> todo

## Matrix Transpose

> [!CAUTION]
> todo

## References

- https://www.mathsisfun.com/algebra/matrix-introduction.html
- https://www.mathsisfun.com/algebra/matrix-multiplying.html