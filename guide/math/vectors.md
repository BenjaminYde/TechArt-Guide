# Vectors

## Introduction to Vectors

A vector is a mathematical object representing both a **direction** and a **magnitude** (length). In 3D rendering, vectors are crucial for describing positions, directions, and various operations related to object transformations (translation, rotation, scale), lighting, and camera movement.

### Notation and Representation

- **Components:** A vector in 3D is represented as $\mathbf{v} = (x, y, z)$, where $x$, $y$, and $z$ are its components along each axis.

- **Magnitude (Length):** The length of a vector $\mathbf{v} = (x, y, z)$ is calculated as: $|\mathbf{v}| = \sqrt{x^2 + y^2 + z^2}$ 

    (see [Pythagoras' Theorem](https://www.mathsisfun.com/pythagoras.html))

### Types of Vectors

- **Position Vectors:** Describe points in space relative to the origin (e.g., $\mathbf{p} = (x, y, z)$).
- **Direction Vectors:** Define only the direction and are often normalized (unit vectors, so length 1).

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

Let's say you have a position XY of `(3,2)`, then the magnitude is calculated as follows: $|\mathbf{a}| = \sqrt{x^2 + y^2} = \sqrt{3^2 + 2^2} = 3.61$       
See image below:

![Img](./static/vectors/magnitude.png)

## Vector Operations

### Addition and Subtraction

**Addition:** Adding two vectors results in a new vector that represents moving from the start of the first vector to the end of the second vector:

$$
\mathbf{u} + \mathbf{v} = (u_x + v_x,\ u_y + v_y,\ u_z + v_z)
$$

> [!CAUTION]
> TODO...

**Subtraction:** Represents the vector pointing from one vector to another:

$$
\mathbf{u} - \mathbf{v} = (u_x - v_x,\ u_y - v_y,\ u_z - v_z)
$$

> [!CAUTION]
> TODO...

### Scalar Multiplication

Multiplying a vector by a scalar changes its magnitude without altering its direction:

$$
k \cdot \mathbf{v} = (k \cdot x,\ k \cdot y,\ k \cdot z)
$$

See https://www.mathsisfun.com/algebra/vectors.html image

> [!CAUTION]
> TODO...

## Normalization

Normalization scales a vector to a unit vector (length of 1). Basically you divide the vector by its own lenth and you get a normalized vector: 

$\hat{\mathbf{a}} = \frac{\mathbf{a}}{|\mathbf{a}|}$

**Application:**

- **Direction Vectors:** In lighting and camera movement, normalized vectors help simplify calculations by keeping the focus on direction only.

## Dot Product

The dot product (scalar product) is calculated as:

$$
\mathbf{u} \cdot \mathbf{v} = u_x v_x + u_y v_y + u_z v_z
$$

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