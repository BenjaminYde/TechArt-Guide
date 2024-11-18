# Transformations

In VEX, transformations involve:

- **Translation**: Moving points or primitives in space.
- **Rotation**: Rotating elements around an axis.
- **Scaling**: Changing the size of geometry.

But also
- **Matrices**: Combining translation, rotation, and scaling into unified transformations.
- **Quaternions**: Representing and interpolating rotations smoothly.

## Translation

To move geometry in space:

```cpp
// Translate points along the X-axis
@P += {1, 0, 0};
```

```cpp
// Translate points by a user-defined offset
vector offset = chv("offset");
@P += offset;
```

## Rotation

#### Example 1: Simple rotation around the Y-axis:

```cpp
float angle = radians(chf("angle"));
matrix3 rot = ident();
rot = rotate(rot, angle, {0, 1, 0});
@P *= rot;
```

#### Example 2: Rotation around a pivot:

```cpp
vector pivot = chv("pivot");
vector offset = @P - pivot;
matrix3 rot = ident();
rot = rotate(rot, radians(chf("angle")), {0, 1, 0});
offset *= rot;
@P = offset + pivot;
```

## Scaling

#### Uniform scaling:

```cpp
float scale = chf("scale");
@P *= scale;
```

#### Non-uniform scaling:

```cpp
vector scale = chv("scale");
@P *= set(scale.x, scale.y, scale.z);
```

## Matrix Transformations

Matrices combine translation, rotation, and scaling in a single operation.

#### Example: Full transformation matrix:

```cpp
vector translate = chv("translate");
vector rotate = radians(chv("rotate")); // XYZ rotation in degrees
vector scale = chv("scale");

matrix xform = ident();
xform = translate(xform, translate);
xform = rotate(xform, rotate.x, {1, 0, 0});
xform = rotate(xform, rotate.y, {0, 1, 0});
xform = rotate(xform, rotate.z, {0, 0, 1});
xform = scale(xform, scale);

@P *= xform;
```

## Quaternions

Quaternions (`vector4`) are used to represent rotations efficiently and avoid gimbal lock.

#### Creating a Quaternion

```cpp
vector axis = {0, 1, 0};
float angle = radians(45);
vector4 q = quaternion(angle, axis);
```

#### Combining Quaternions

```cpp
vector4 q1 = quaternion(radians(30), {1, 0, 0});
vector4 q2 = quaternion(radians(45), {0, 1, 0});
vector4 q_result = qmultiply(q1, q2);
```

#### Rotating a Vector with a Quaternion

```cpp
vector v = {1, 0, 0};
vector rotated_v = qrotate(q, v);
```

#### Converting a Quaternion to a Rotation Matrix

```cpp
matrix3 rot = qconvert(q);
```

### The `@orient` Attribute

The `@orient` attribute defines orientation using quaternions, often used in workflows involving instancing or smooth rotations.

#### Creating an Orientation Quaternion

```cpp
vector axis = {0, 1, 0}; // Axis of rotation
float angle = radians(chf("angle")); // Angle of rotation
@orient = quaternion(angle, axis);
```

##### Convert `@orient` Back to a Rotation Matrix

```cpp
matrix3 rot = qconvert(@orient);
@P *= rot;
```

## Matrices

### Matrix vs Matrix3

- **`matrix3`**: A 3x3 matrix used for rotation and scaling.
- **`matrix`**: A 4x4 matrix that includes translation in addition to rotation and scaling.

Example:

```cpp
// Scaling with matrix3
matrix3 scale3 = ident();
scale3 = scale(scale3, {2, 2, 2});
@P *= scale3;

// Full transformation with matrix
matrix xform = ident();
xform = translate(xform, {1, 0, 0});
xform = scale(xform, {2, 2, 2});
@P *= xform;
```

### Constructing Matrices

#### `maketransform`

Create a 4x4 transformation matrix from translation, rotation, and scaling components:

```cpp
matrix xform = maketransform(0, 0, translate, rotate, scale);
```

#### `lookat`

Construct a matrix to orient geometry toward a target:

```cpp
vector target = chv("target");
matrix3 rot = lookat(@P, target, {0, 1, 0});
@P *= rot;
```

#### `optransform`

Retrieve the transformation matrix of an object in the scene.

### Example
```cpp
matrix xform = optransform("/obj/my_object");
@P *= xform;
```

Use this to apply transformations from another object directly to your geometry.

## Inverting Transformations

Reverse a transformation using the `invert` function.

#### Matrix Inversion

```cpp
matrix xform = ...; // Transformation matrix
matrix inv_xform = invert(xform); // Inverted matrix
@P *= inv_xform;
```

#### Quaternion Inversion

```cpp
vector4 q = quaternion(radians(45), {0, 1, 0});
vector4 q_inv = invert(q); // Inverse quaternion
```