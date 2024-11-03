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

In scalar multiplication, each element of the matrix is multiplied by a scalar value.

![Img](./static/matrices/scalar_multiplication.png)

## Matrix Multiplication

Matrix multiplication combines two matrices to produce a new matrix. 

The number of columns in the first matrix must equal the number of rows in the second matrix. So `A(mxn)` and `B(mxn)` can be multiplied when `An = Bm`. 

- We can multiply 
  - 2x2 with 2x2
  - 3x3 with 2x2
  - 2x3 with 3x2
- We cannot multiply 
  - 1x4 with 1x4
  - 5x6 with 9x6
  - 3x5 with 3x2

Here is a theoretical example:

![Img](./static/matrices/matrix_dot_color1.png)
![Img](./static/matrices/matrix_dot_color2.png)

- **m1n1**: 1*7 + 2*9 + 3*11 = 58
- **m1n2**: 1*8 + 2*10 + 3*12 = 64
- **m2n1**: 4*7 + 5*9 + 6*11 = 139
- **m2n2**: 4*8 + 5*10 + 6*12 = 154

### Here is a more practical example:

By organizing prices and quantities into matrices, we can efficiently calculate the total sales over multiple days using matrix multiplication.

![Img](./static/matrices/matrix_dot_example.png)

## Matrix Transpose

The transpose of a matrix `A` is denoted as `Aᵗ` and is obtained by flipping the matrix over its diagonal. Rows become columns and columns become rows.

![Img](./static/matrices/transpose.png)

## Matrix Determinant

The determinant is a scalar value that can be calculated from a square matrix (where `m=n`). It provides important information about the matrix, such as whether it is invertible, and is used in solving systems of linear equations, among other applications.

> [!CAUTION]
> A square matrix is **invertible** if and only if its determinant is **not zero**. If the determinant is zero, the matrix does not have an inverse.

We can write "determinant of A" as `|A|`, so by using the vertical bars or by using `det(A)`. In the images below we will use both. But in most places you will see vertical bars.

### Determinant for a 2x2 Matrix

It is easy to remember when you think of a cross:

![Img](./static/matrices/determinant_2x2.png)

- Blue is positive (+ad)
- Red is negative (−bc)

### Determinant for a 3x3 Matrix

For a 3x3 matrix, the determinant is calculated using a more extended formula. It may look complicated, but there is a pattern:

![Img](./static/matrices/determinant_3x3.png)
![Img](./static/matrices/determinant_3x3_calculation.png)

- Multiply a by the determinant of the 2×2 matrix that is not in a's row or column.
- Likewise for b, and for c
- Sum them up, but remember the minus in front of the b

### Determinant for a 4x4 and higher:

The pattern continues for 4×4 matrices:

- plus a times the determinant of the matrix that is not in a's row or column,
- minus b times the determinant of the matrix that is not in b's row or column,
- plus c times the determinant of the matrix that is not in c's row or column,
- minus d times the determinant of the matrix that is not in d's row or column,

![Img](./static/matrices/determinant_4x4.png)

Notice the `+−+−` pattern (+a... −b... +c... −d...). This is important to remember.

## Matrix Inverse

Just like the inverse of the number 5, which is `1/5` (can be written as `5⁻¹`), matrixes also have inverses. When you multiply a number by its inverse you get 1. For example `5 x 5⁻¹ = 1`.

The inverse of a matrix `A` is denoted as `A⁻¹` and is the matrix that, when multiplied by A, results in the **identity** matrix. So `A x A⁻¹ = I`.

> [!CAUTION]
> Not all matrices have inverses. A matrix must be **square** (same number of rows and columns) and have a **non-zero determinant** to be invertible.

### Inverse for a 2x2 Matrix

For a 2x2 matrix, the inverse can be calculated using a straightforward formula:

![Img](./static/matrices/inversion_2x2.png)

> [!NOTE]
> Remember that `ad-bc` is the **determinant** of a matrix.

Applied example:

![Img](./static/matrices/inversion_2x2_example.png)

### Inverse for a 3x3 Matrix and Higher

Calculating the inverse of a 3x3 matrix is more complex and involves the following steps:

1. Compute the matrix of minors.
2. Turn the matrix of minors into a matrix of cofactors.
3. Find the adjugate (transpose of the cofactor matrix).
4. Divide by the determinant of the original matrix.

### Matrix of Minors

For each element of the matrix:

- Ignore the values on the current row and column
- Calculate the determinant of the remaining values

![Img](./static/matrices/inverse_3x3_mom.png)

> [!NOTE]
> The above image only shows 4 values being calculated, but we need to calulcate the determinant of all 3x3 elements.

The final result of the MoM looks as follows:

![Img](./static/matrices/inverse_3x3_mom_result.png)

### Convert to Matrix of Cofactors

Just apply a "checkerboard" of minuses to the "Matrix of Minors". In other words, we need to change the sign of alternate cells, like this:

![Img](./static/matrices/inverse_3x3_cofactor.png)

### Transpose the Matrix

Now "Transpose" all elements of the previous matrix... in other words swap their positions over the diagonal (the diagonal stays the same):

![Img](./static/matrices/inverse_3x3_transpose.png)

### Multiply by 1/Determinant

![Img](./static/matrices/inverse_3x3_multiply_1determinant.png)

And we are done! Now we have an inverse of our matrix!

## Applications of Matrices

- **Computer Graphics**: Used for 2D and 3D transformations, such as scaling, rotating, and translating objects in video games and simulations.

- **Machine Learning**: Used in algorithms for data representation, training neural networks, and dimensionality reduction.

- **Computer Vision**: Analyze and manipulate images and video data for object detection and recognition.

## References

- https://www.mathsisfun.com/algebra/matrix-introduction.html
- https://www.mathsisfun.com/algebra/matrix-multiplying.html
- https://www.mathsisfun.com/algebra/matrix-determinant.html
- https://www.mathsisfun.com/algebra/matrix-inverse-minors-cofactors-adjugate.html