# Vectors

## Introduction to Vectors

A vector is a mathematical object representing both a **direction** and a **magnitude** (length). In 3D rendering, vectors are crucial for describing positions, directions, and various operations related to object transformations (translation, rotation, scale), lighting, and camera movement.

### Notation and Representation

A vector in 3D is represented as 3 components along an axis: 

![Img](./static/vectors/vector_notation.png)

### Types of Vectors

- **Position Vectors:** Describe points in space relative to the origin (e.g., $\mathbf{p} = (x, y, z)$).
- **Direction Vectors:** Define only the direction and are often normalized (unit vectors, so length 1).


![Img](./static/vectors/vector_3d.png)
![Img](./static/vectors/direction_magnitude.png)

## Applications in 3D Rendering

### Camera Movement

- **View Vector:** Determines the direction the camera is facing.
- **Up Vector:** Helps define the camera's orientation to avoid upside-down views.

### Object Transformations

Vectors are crucial for describing object positions, orientations, and movements within the 3D scene. Basic transformations include:

- **Translation:** Moving an object by adding a vector.
- **Scaling:** Adjusting an object’s size through scalar multiplication of position vectors.

### Lighting Calculations

Lighting models use vectors to calculate illumination:

- **Diffuse Lighting:** Uses the dot product between the light direction and surface normal to compute the brightness of a surface.
- **Specular Lighting:** Uses reflection vectors to simulate shiny surfaces by calculating how closely the view vector aligns with the reflected light vector.

## Calculating the magnitude

**Magnitude (Length):** The length of a vector is calculated using the [Pythagoras' Theorem](https://www.mathsisfun.com/pythagoras.html):

![Img](./static/vectors/length_vector_notation.png)

Let's say you have a position XY of `(3,2)`, then the magnitude is calculated as follows: 

![Img](./static/vectors/magnitude_example_notation.png)
![Img](./static/vectors/magnitude_example.png)

## Vector Operations

### Addition and Subtraction

**Addition:** Adding two vectors results in a new vector that represents moving from the start of the first vector to the end of the second vector:

![Img](./static/vectors/addition_notation.png)
![Img](./static/vectors/addition_example.png)

And it doesn't matter which order we add them, we get the same direction.

**Subtraction:** Represents the vector pointing from one vector to another:

![Img](./static/vectors/subtraction_notation.png)   
![Img](./static/vectors/subtraction_example.png)

### Scalar Multiplication

A scalar is just a number (like 7 or −0.32), so definitely not a vector.    
Multiplying a vector by a scalar changes its magnitude without altering its direction:

![Img](./static/vectors/scalar_multiplication_notation.png)

In the following example the vector in blue is multiplier 2.5x times.
It still points in the same direction, but is 2.5x times longer:

![Img](./static/vectors/scalar_multiplication_example2.png)   
![Img](./static/vectors/scalar_multiplication_example.png)

## Normalization

Normalization scales a vector to a unit vector (length of 1). Basically you divide the vector by its own lenth and you get a normalized vector: 

![Img](./static/vectors/normalization_notation.png)

In the following example we have the vector `(3,4)` which we divide by it's own length to get a normalized vector.

![Img](./static/vectors/normalization_example.png)

**Application:**

- **Direction Vectors:** In lighting and camera movement, normalized vectors help simplify calculations by keeping the focus on direction only.

## Dot Product

The dot product (scalar product) is calculated as:

![Img](./static/vectors/dot_product_notation.png)


In the following example we have 2 vector where we calculate the dot product:

![Img](./static/vectors/dot_product_example2.png)   
![Img](./static/vectors/dot_product_example.png)

**Applications:**

- **Angle Calculation:** The dot product can determine the angle $\theta$ between two vectors:

  $$
  \cos(\theta) = \frac{\mathbf{u} \cdot \mathbf{v}}{|\mathbf{u}|\, |\mathbf{v}|}
  $$

- **Lighting:** The angle between a light direction and a surface normal determines the brightness in diffuse lighting.


> [!CAUTION]
> TODO...


## Cross Product

The cross product between two vectors $\mathbf{u}$ and $\mathbf{v}$ produces a third vector that is perpendicular to both:

$$
\mathbf{u} \times \mathbf{v} = \left( u_y v_z - u_z v_y,\ u_z v_x - u_x v_z,\ u_x v_y - u_y v_x \right)
$$

**Applications:**

- **Surface Normals:** Useful for finding normals in 3D models.
- **Rotations:** Determines rotational directions and axes.

> [!CAUTION]
> TODO...

## References

- https://mathinsight.org/vector_introduction
- https://www.mathsisfun.com/algebra/vectors.html
- https://tutors.com/lesson/what-is-a-vector
- https://www.intmath.com/vectors/vectors-intro.php
- https://latexeditor.lagrida.com/