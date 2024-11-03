# General Matrix

![Img](./matrix.png)
```latex
M = \begin{bmatrix}
a_{11} & a_{12} & \dots  & a_{1n} \\
a_{21} & a_{22} & \dots  & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \dots  & a_{mn} \\
\end{bmatrix}
```

# Matrix example

![Img](./matrix_example.png)

```latex
M = \begin{bmatrix}
14 & 8 & -9\\
0 & -31 & 6\\
\end{bmatrix}
```

# Square idendity matrix

![Img](./identity.png)

```latex
M = \begin{bmatrix}
1 & 0 & 0 & 0\\
0 & 1 & 0 & 0\\
0 & 0 & 1 & 0\\
0 & 0 & 0 & 1\\
\end{bmatrix}
```

# Addition

![Img](./addition.png)

```latex
A + B = \begin{bmatrix}
3 & 8 \\
4 & 6 \\
\end{bmatrix}
+
\begin{bmatrix}
4 & 0 \\
1 & -9 \\
\end{bmatrix}
= 
\begin{bmatrix}
7 & 8 \\
5 & -3 \\
\end{bmatrix}
```

# Subtraction

![Img](./subtraction.png)

```latex
A - B = \begin{bmatrix}
3 & 8 \\
4 & 6 \\
\end{bmatrix}
-
\begin{bmatrix}
4 & 0 \\
1 & -9 \\
\end{bmatrix}
= 
\begin{bmatrix}
-1 & 8 \\
3 & 15 \\
\end{bmatrix}
```

# Scalar multiplication

![Img](./scalar_multiplication.png)

```latex
2M = 2 \cdot \begin{bmatrix}
3 & 8 \\
4 & 6 \\
\end{bmatrix}
= 
\begin{bmatrix}
6 & 16 \\
8 & 12 \\
\end{bmatrix}
```

# Dot

![Img](./matrix_dot.png)


```latex
A \cdot B = \begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
\end{bmatrix}
\cdot
\begin{bmatrix}
7 & 8 \\
9 & 10 \\
11 & 12 \\
\end{bmatrix}
= 
\begin{bmatrix}
58 & 64 \\
139 & 154 \\
\end{bmatrix}
```

![Img](./matrix_dot_example.png)

```latex
\text{Prices} = \begin{bmatrix} \$3 & \$4 & \$2 \end{bmatrix}
\\
\text{Quantities} = \begin{bmatrix}
13 & 9 & 7 & 15 \\
8 & 7 & 4 & 6 \\
6 & 4 & 0 & 3 \\
\end{bmatrix}
\\
\begin{align*}
\hspace{4cm}  \text{Total Sales} &= \text{Prices} \times \text{Quantities} \\
&= \begin{bmatrix} \$3 & \$4 & \$2 \end{bmatrix} \times \begin{bmatrix}
13 & 9 & 7 & 15 \\
8 & 7 & 4 & 6 \\
6 & 4 & 0 & 3 \\
\end{bmatrix} \\
&= \begin{bmatrix}
\$83 & \$63 & \$37 & \$75
\end{bmatrix}
\end{align*}
```

# Transpose

![Img](./transpose.png)

```latex
A = \begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
\end{bmatrix}
\longrightarrow 
A^\top = \begin{bmatrix}
1 & 4 \\
2 & 5 \\
3 & 6 \\
\end{bmatrix}
```

# Determinant

## 2x2

![Img](./determinant_2x2.png)

```latex
A = \begin{bmatrix}
a & b \\
c & d \\
\end{bmatrix}
\longrightarrow 
\det(A) = ad - bc
\\
\hspace{6.9cm} A = \begin{bmatrix}
3 & 8 \\
4 & 6 \\
\end{bmatrix}
\longrightarrow 
\det(A) = (3)(6) - (8)(4) = 18 - 32 = -14
```

## 3x3

![Img](./determinant_3x3.png)

```latex
A = \begin{bmatrix}
a & b & c \\
d & e & f \\
g & h & i \\
\end{bmatrix}
\longrightarrow
\det(A) = a(ei - fh) - b(di - fg) + c(dh - eg)
```

![Img](./determinant_3x3_calculation.png)

```latex
A = \begin{bmatrix}
1 & 2 & 3 \\
0 & 4 & 5 \\
1 & 0 & 6 \\
\end{bmatrix}
\longrightarrow 
\begin{align*}
\det(A) &= 1 \times (4 \times 6 - 5 \times 0) - 2 \times (0 \times 6 - 5 \times 1) + 3 \times (0 \times 0 - 4 \times 1) \\
&= 1 \times (24 - 0) - 2 \times (0 - 5) + 3 \times (0 - 4) \\
&= 24 - (-10) + (-12) \\
&= 24 + 10 -12 \\
&= 22
\end{align*}
```

## 4x4

![Img](./determinant_4x4.png)

```latex
A = \begin{bmatrix}
a & b & c & d \\
e & f & f & h \\
i & j & l & l \\
m & n & o & p
\end{bmatrix}
\longrightarrow \det(A) = a \cdot\begin{vmatrix}
f & g & h \\
j & k & l \\
n & o & p
\end{vmatrix} 
- b \cdot\begin{vmatrix}
e & g & h \\
i & k & l \\
m & o & p
\end{vmatrix}
+ c \cdot\begin{vmatrix}
e & f & h \\
i & j & l \\
m & n & p
\end{vmatrix}
- d \cdot\begin{vmatrix}
e & f & g \\
i & j & k \\
m & n & o
\end{vmatrix}
```

# Matrix Inversion

## 2x2

![Img](./inversion_2x2.png)
![Img](./inversion_2x2_example.png)

```latex
% Then in your document
\begin{align*}
A &= \begin{bmatrix}
a & b \\
c & d \\
\end{bmatrix} \\[12pt]
A^{-1} &= \dfrac{1}{ad - bc} \begin{bmatrix}
d & -b \\
- c & a \\
\end{bmatrix} \\[12pt]
A &= \begin{bmatrix}
4 & 7 \\
2 & 6 \\
\end{bmatrix}
\\
A^{-1} &= \frac{1}{10} \begin{bmatrix}
6 & -7 \\
-2 & 4 \\
\end{bmatrix} = \begin{bmatrix}
0.6 & -0.7 \\
-0.2 & 0.4 \\
\end{bmatrix}
\end{align*}
```

## 3x3

![Img](inverse_3x3_mom_result.png)

```latex
A = \begin{bmatrix}
2 & 5 & 3 \\
1 & -2 & -1 \\
1 & 3 & 4 \\
\end{bmatrix}
```

![Img](inverse_3x3_cofactor.png)

```latex
\text{Cofactor}(A) = \begin{bmatrix}
+A_{11} & -A_{12} & +A_{13} \\
-A_{21} & +A_{22} & -A_{23} \\
+A_{31} & -A_{32} & +A_{33} \\
\end{bmatrix}
```

![Img](inverse_3x3_transpose.png)

```latex
A^\top = \begin{bmatrix}
-5 & 5 & 5 \\
11 & 5 & 1 \\
1 & 5 & -9 \\
\end{bmatrix}\top = 
\begin{bmatrix}
-5 & -11 & 1 \\
-5 & 5 & 5 \\
5 & 1 & -9 \\
\end{bmatrix}
```

![Img](inverse_3x3_multiply_1determinant.png)

```latex
\begin{align*}
A^{-1} &= \frac{1}{\det(A)} \cdot \begin{bmatrix}
-5 & -11 & 1 \\
-5 & 5 & 5 \\
5 & -1 & -9 \\
\end{bmatrix} 
\\
&= \frac{1}{-20} \cdot \begin{bmatrix}
-5 & -11 & 1 \\
-5 & 5 & 5 \\
5 & -1 & -9 \\
\end{bmatrix} 
\\
&= \begin{bmatrix}
0.25 & 0.55 & -0.05 \\
0.25 & -0.25 & -0.25 \\
-0.25 & 0.05 & 0.45 \\
\end{bmatrix}
\end{align*}
```