# Prims (Primitives)

- **Definition**: Prims are the fundamental building blocks in USD. They represent scene elements such as models, lights, cameras, groups and more.

- **Types of Prims**:
  - **Xform**: Represents a transformation node that can apply translation, rotation, and scaling to child prims.
  - **Mesh**: Defines polygonal geometry using vertices, faces, normals, and UVs.
  - **Scope**: A grouping prim that does not apply any transformations; used for logical organization.
  - **Camera, Light, Material**: Specialized prims that hold specific data for rendering.

- **Hierarchy**: Prims are organized in a hierarchical namespace, forming a tree structure akin to a filesystem. Prims can thus have parents/children which are also Prims.

- **Composition**: Prims can be composed using various composition arcs like references, inherits, and variants.

- **Creating Prims**: Prims are created on a USD stage and can have properties, metadata, and relationships.

- **Customization**: Prims can be extended using schemas to add custom behavior or data.

> [!CAUTION]
> TODO: Add picture here...

# Properties

**Definition**: Properties are named data containers associated with prims. They can be either attributes (holding data values) or relationships (referring to other prims or properties).

### **Attributes**:

- **Data Types**: Attributes can hold various data types, including scalars (int, float), vectors (float3), matrices, arrays, and even custom types. For example, float size = 1.0 defines a Cube prim’s uniform size.
- **Time-Sampled Data**: Attributes can store time-varying data, enabling animation by sampling attribute values over time.

### **Relationships**:

- **References** to other prims or properties, allowing for complex connections within the scene graph like material assignments or hierarchical structures.

> [!CAUTION]
> TODO: Add picture here...

# Paths

**Definition**: Paths are string representations that uniquely identify prims and properties within the USD scene hierarchy. 

### Path Syntax:

Just like folders, paths can be relative or absolute.

- **Absolute Paths**: Always starts with an `/` and provides the full path from the root. For example:`/World/Geometry/Car`. 
- **Relative Paths**: Starts with a dot `.` to specify the current prim location or double dot `..` specify the parent prim location.

### Prim vs. Property Paths:

- **Prim Paths**: These refer to the location of a prim (an object or element) within the scene graph. For example, `/Scene/Character` is a prim path identifying a character in a specific scene.
- **Property Paths**: These are extensions of prim paths and specify properties or attributes of the prim. For example, in `/Scene/Character.xformOp:translate`, `xformOp:translate` refers to a transformation operation property related to the translation of the character.

### The Role of the Colon `:` (Namespace)

In the property path (e.g., `xformOp:translate`), the colon separates the property namespace from the actual property name. Namespaces in USD are a way to organize properties and avoid naming conflicts. They are indicated using a colon `:` in property names.

- **Namespace (xformOp)**: A collection of properties that belong to the same conceptual group. Here, xformOp refers to the namespace that handles transformation operations such as translate, rotate, and scale.
- **Property Name (translate)**: This is the specific property within the namespace that defines what part of the transformation operation is being addressed (in this case, translation).

> [!CAUTION]
> TODO: Add picture here...

## Metadata

**Definition**: Additional static information attached to prims, properties or layers that provides context or supplementary data not directly affecting the scene's visual representation. Metadata can include details like documentation, authoring information, or any custom data that needs to accompany the scene elements.

> [!CAUTION]
> TODO: Add picture here...
