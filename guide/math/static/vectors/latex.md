
# Polar

![Img](./polar_component_x.png)
```
\cos\alpha = \frac{a1}{||\overrightarrow{a}||} \Rightarrow a1 = ||\overrightarrow{a}|| \cos \alpha
```

![Img](./polar_component_y.png)
```
\sin\alpha = \frac{a2}{||\overrightarrow{a}||} \Rightarrow a2 = ||\overrightarrow{a}|| \sin \alpha
```

# Dot Product

![Img](./dot_product_a.png)
```
\overrightarrow{a} = ||\overrightarrow{a}||(\cos \alpha, \sin \alpha)
```

![Img](./dot_product_b.png)
```
\overrightarrow{b} = ||\overrightarrow{b}||(\cos (\beta), \sin (\beta))
```

![Img](./dot_product_polar.png)
```
\mathbf{a} \cdot \mathbf{b} = a_x b_x + a_y b_y \\
\hspace{12.25cm} = (||\overrightarrow{a}||\cos(\alpha))(||\overrightarrow{b}||\cos(\beta))+(||\overrightarrow{a}||\sin(\alpha))(||\overrightarrow{b}||\sin(\beta)) \\
\hspace{7cm} = ||\overrightarrow{a}||||\overrightarrow{b}||(\cos\alpha\cos\beta + \sin\alpha\sin\beta)\\
\hspace{3.35cm} = ||\overrightarrow{a}||||\overrightarrow{b}|| \cos(\alpha-\beta)\\
\hspace{1.78cm} = ||\overrightarrow{a}||||\overrightarrow{b}|| \cos\theta\\
```

![Img](./cos_identity_rule.png)
```
\cos (\alpha - \beta) = \cos \alpha \cos \beta + \sin \alpha \sin \beta
```

![Img](./dot_product_polar.png)
```
\mathbf{a} \cdot \mathbf{b} = ||\overrightarrow{a}||||\overrightarrow{b}|| \cos\theta
```

![Img](./dot_product_angle.png)
```
\theta = arccos \left( \frac{\mathbf{a} \cdot \mathbf{b}}{||\overrightarrow{a}|| ||\overrightarrow{b}||} \right)
```

# Cross Product

```
\mathbf{a} \times \mathbf{b} = 
\begin{pmatrix}a_1
 \\a_2
 \\a_3
\end{pmatrix}
\times
\begin{pmatrix}b_1
 \\b_2
 \\b_3
\end{pmatrix}
=
\begin{pmatrix}a_2 b_3 - a_3 b_2
 \\a_3 b_1 - a_1 b_3
 \\a_1 b_2 - a_2 b_1
\end{pmatrix}
```