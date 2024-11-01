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

## Polar Vector Coordinate

Let's say we have the following vector `a`:

![Img](./static/vectors/polar_vector1.png)

To get the X and Y components of the vector we can use trigonometry:

![Img](./static/vectors/polar_component_x.png)
![Img](./static/vectors/polar_component_y.png)

Then vector `a` is noted as follows:

![Img](./static/vectors/polar_vector2.png)

## Dot Product

### Applications

- **Angle Calculation:** The dot product can determine the angle $\theta$ between two vectors.

- **Lighting:** The angle between a light direction and a surface normal determines the brightness in diffuse lighting.

- **Projection**: The dot product helps project one vector onto another.

- **Determining View and Visibility**: In rendering, the dot product can be used to determine if a surface is facing the camera or away from it. This helps with culling and optimizations.

### Cartesian Coordinate Dot Product

The dot product between vector A and vector B is equal to the sum of the products of each component which is calculated as follows:

![Img](./static/vectors/dot_product_notation.png)


In the following example we have 2 vector where we calculate the dot product:

![Img](./static/vectors/dot_product_example2.png)   
![Img](./static/vectors/dot_product_example.png)

### Interpretation

The dot product provides insight into the relationship between two vectors:

- If `a.b > 0`: The angle between `a` and `b` is less than 90°. This means the vectors are pointing in roughly the same direction.
- If `a.b < 0`: The angle between `a` and `b` is greater than 90°. This means the vectors are pointing in roughly opposite directions.
- If `a.b == 0`: The vectors are orthogonal (perpendicular) to each other, meaning they form a 90° angle.

### Polar Coordinate Dot Product

Let's say we have the following vectors `a` and `b`:

![Img](./static/vectors/dot_product_example_polar.png)

Vector `a` and `b` are represented as follows:

![Img](./static/vectors/dot_product_a.png)
![Img](./static/vectors/dot_product_b.png)

Now we can calculate the dot product:

![Img](./static/vectors/dot_product_polar_calculation.png)


> [!NOTE]
> In the calculation above we used the trigonometric identity for the cosine of the difference of two angles:
> ![Img](./static/vectors/cos_identity_rule.png)    
> More info about this [here](https://mymission.lamission.edu/userdata/sargsye2/docs/Math%20240/Proof%20of%20the%20difference%20formula%20for%20cosine.pdf).

Therefore we have:

![Img](./static/vectors/dot_product_polar.png)

### Calculating the Angle Between Vectors

From the above statement we can now easily calculate the angle:

![Img](./static/vectors/dot_product_angle.png)

## Cross Product

The cross product between two vectors `a` and `b` produces a third vector `c` that is perpendicular to both:

![Img](./static/vectors/cross_product_3d.png)

How to calculate the cross product:

![Img](./static/vectors/cross_product.png)

### Applications in 3D Rendering

- **Surface Normals:** These are vectors perpendicular to a surface. They are essential for lighting calculations, as they determine how light interacts with the surface.

## References

- https://mathinsight.org/vector_introduction
- https://www.mathsisfun.com/algebra/vectors.html
- https://tutors.com/lesson/what-is-a-vector
- https://www.intmath.com/vectors/vectors-intro.php
- https://latexeditor.lagrida.com/