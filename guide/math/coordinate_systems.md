# 3D Coordinate Systems

## Cartesian Coordinate System

At the heart of 3D graphics lies the Cartesian coordinate system, a mathematical construct that uses three axes (X, Y, Z) to define any point / position in 3D space.

- **X-Axis**: Represents the horizontal direction.
- **Y-Axis**: Represents the vertical direction.
- **Z-Axis**: Represents the depth.

## Left-Handed vs. Right-Handed Systems

The orientation of the coordinate system axes can follow either a left-handed or right-handed convention. It's pretty simple: 
- Turing the **left hand** results in turning clock-wise.
- Turing your **right hand** results in turning anti-clock-wise.

For example, Houdini and Unreal use two different coordinate systems.

- **Houdini** uses a **Y-up right handed** coordinate systems (unit: meter)
- **Unreal** uses a **Z-up left handed** coordinate systems (unit: centimeter)

The following images & gifs to illustrate these systems:

<img src="./static/3d_coordinate_systems/left_right_hand_system.png" width="540">
<img src="./static/3d_coordinate_systems/left_right_hand_system.gif" width="540">

(Houdini (left) and Unreal (right) coordinate systems)

So for example with the **Right-Handed System**, if you align your right hand so that the index finger points along the positive X-axis, the middle finger along the positive Y-axis, and the thumb points along the positive Z-axis.

<img src="./static/3d_coordinate_systems/left_right_hand_system_examples.png" width="540">

(left hand & right hand)

## Coordinate Spaces in Graphics Programming

In graphics programming, several coordinate spaces are used throughout the rendering pipeline, each with a specific purpose for transforming 3D models into 2D images on the screen. Below is an overview of these spaces:

### 1. Object/Local/Model Space

Object space, or model space, is the local coordinate system of a 3D model, where the origin is typically at the model’s center. Vertices are defined relative to this origin, making it convenient to manipulate the model independently of other objects. 

By using **homogeneous coordinates** (x,y,z,w), (i.e., adding a fourth component w), from the start we can handle translation, scaling, and rotation uniformly as matrix multiplications. Without the
w component, translation (shifting position) couldn’t be handled easily with 3x3 matrices.

> [!CAUTION]
> Todo: Add image to illustrate

### 2. World Space

World space positions all objects within a global coordinate system, establishing their locations and orientations relative to their origin. Transforming from object space to world space involves applying the **model matrix**, which uses translation, rotation, and scaling to place the model in the the world / scene.

> [!CAUTION]
> Todo: Add image to illustrate

### 3. View/Camera Space

View space, also called camera space, represents the scene from the camera’s point of view. This transformation is achieved by applying the **view matrix**, which adjusts the world to the camera’s location and orientation, effectively placing the camera at the origin (0,0,0), aimed down the negative Z-axis. This aligns the world so it can be observed directly from the camera's perspective.

> [!CAUTION]
> Todo: Add image to illustrate

### 4. Clip Space

#### 4.1 Projection to Clip Space

After transforming objects into view space, they are further transformed into clip space by applying the **projection matrix**. This matrix uses camera parameters like field of view (FOV) and near/far clipping planes to introduce perspective, making distant objects appear smaller. The projection matrix reshapes the 3D scene into a **clip volume** (a cube with coordinates between `[−1,1]`) where the coordinates remain in homogeneous form as (x,y,z,w), where w encodes depth information.

#### 4.2 Perspective Divide and Normalized Device Coordinates (NDC)

The perspective divide is a final operation to convert 4D clip coordinates into 3D **Normalized Device Coordinates (NDC)** by dividing x, y, and z by w. This standardizes all points to a unit cube ranging from `[−1,1]` on all axes, creating a depth-corrected scene ready for rendering.

#### 4.3 Clipping

Once in NDC, the graphics pipeline clips any geometry outside the `[−1,1]` unit cube. This step discards any geometry outside the viewable volume, improving efficiency. Polygons intersecting the boundaries are adjusted to ensure they fit within NDC, finalizing which parts of the scene will be processed for rasterization.

> [!CAUTION]
> Todo: Add image to illustrate

### 5. Screen Space

Screen space is the final coordinate system, where the 2D coordinates from NDC are mapped to actual pixels on the screen. This involves a viewport transformation, NDC to screen coordinates based on the screen’s resolution and aspect ratio, producing the final 2D image seen on screen.

> [!CAUTION]
> Todo: Add image to illustrate

## References

- https://www.sidefx.com/docs/houdini/unreal/coordinates.html
- https://www.scratchapixel.com/lessons/mathematics-physics-for-computer-graphics/geometry/coordinate-systems.html
- https://learnopengl.com/Getting-started/Coordinate-Systems
- https://jsantell.com/model-view-projection
- https://jsantell.com/3d-projection
- https://jsantell.com/matrix-transformations/#homogeneous-coordinates
- https://www.scratchapixel.com/lessons/3d-basic-rendering/perspective-and-orthographic-projection-matrix/projection-matrix-GPU-rendering-pipeline-clipping.html