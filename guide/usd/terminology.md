# Terminology

## Prims (Primitives)

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

## Properties

**Definition**: Properties are named data containers associated with prims. They can be either attributes (holding data values) or relationships (referring to other prims or properties).

### **Attributes**:

- **Data Types**: Attributes can hold various data types, including scalars (int, float), vectors (float3), matrices, arrays, and even custom types. For example, float size = 1.0 defines a Cube prim’s uniform size.
- **Time-Sampled Data**: Attributes can store time-varying data, enabling animation by sampling attribute values over time.

### **Relationships**:

- **References** to other prims or properties, allowing for complex connections within the scene graph like material assignments or hierarchical structures.

> [!CAUTION]
> TODO: Add picture here...

## Paths

**Definition**: Paths are string representations that uniquely identify prims and properties within the USD scene hierarchy. 

### Path Syntax:

Just like folders, paths can be relative or absolute.

- **Absolute Paths**: Always starts with an `/` and provides the full path from the root. For example:`/World/Geometry/Car`. 
- **Relative Paths**: Starts with a dot `.` to specify the current prim location or double dot `..` specify the parent prim location.

### Prim vs. Property Paths:

- **Prim Paths**: These refer to the location of a prim (an object or element) within the scene graph. For example, `/Scene/Character` is a prim path identifying a character in a specific scene.
- **Property Paths**: These are extensions of prim paths and specify properties or attributes of the prim. For example, in `/Scene/Character.xformOp:translate`, `xformOp:translate` refers to a transformation operation property related to the translation of the character.

### The Role of the Colon `:`

In the property path (e.g., `xformOp:translate`), the colon separates the property namespace from the actual property name:

- **Namespace (xformOp)**: A collection of properties that belong to the same conceptual group. Here, xformOp refers to the namespace that handles transformation operations such as translate, rotate, and scale.
- **Property Name (translate)**: This is the specific property within the namespace that defines what part of the transformation operation is being addressed (in this case, translation).

> [!CAUTION]
> TODO: Add picture here...

## Layers

**Definition**: Layers is essentially a file or an in-memory container that holds data representing scene elements like geometry, transforms, materials, lights, and more. Layers are typically saved in file formats like `.usd`, `.usda`, `.usdc`, and `.usdz`. Think of layers as containers for scene data (geometry, transforms, materials, etc.) that can be stacked and composed together to build a final scene. A layer can represent a “piece” of a scene such as a prop, a character, a lighting setup, and so on. 

### Formats

USD layers can be stored in multiple formats:

- `.usda`: A human-readable ASCII format.
- `.usdc`: A binary format optimized for performance.
- `.usd`: A generic extension that could be either ASCII or binary.
- `.usdz`: A zip-compressed package format, often used for asset interchange.

### Layer Composition

USD layers are composed in a hierarchical, non-destructive manner. The idea is that individual layers can define parts of a scene, and multiple layers can be combined to create a final scene. The key principle here is composability, which allows different layers to contribute different parts of the scene without overwriting each other directly.

Layer Types:

- **Root Layer**: The root layer is the top-most layer in the composition hierarchy and serves as the entry point for the scene. It specifies which other layers are included, and these layers can be stacked to create the final composed result.

- **Sublayers**: Layers can reference or include other layers using sub-layers. These sub-layers are added on top of each other, with each sub-layer contributing additional or overriding data to the final scene.

### Layer Stack

The Layer Stack in USD refers to the ordered collection of layers that are combined to form the final scene data.

USD layers allow for a non-destructive editing workflow. When combining layers, the data from a layer lower in the stack can be overridden or supplemented by data from layers higher in the stack, without modifying the original data in the lower layers.

For example:

- You might have a base layer that defines a character’s geometry.
- Another layer can define the character’s animation.
- A third layer could override the character’s material or appearance.

All these layers are combined to form the final result, but each layer can be edited independently without altering the original data in other layers.

## Stage

A stage is a view that represents a composed set of layers. In the context of scene management, the stage serves as a composed view of all layers it references, presenting the final scene based on composition rules. Note that stage is just a name for the result.

## Opinions & Overrides

### Opinion

An opinion is simply the value that a layer assigns to a property or prim (object) in the scene. Each layer can have its own opinions about things like:

- What color an object is.
- Where an object is positioned.
- Whether an object is visible or hidden.

Imagine you have a cube in a USD scene:

- **Layer 1** says the cube is at position (0, 0, 0) and has the color red.
- **Layer 2** says the cube is now at position (10, 0, 0).

Each layer provides its own opinion. When layers are composed, USD decides which opinion to use based on the composition rules, which determine how the opinions from different layers combine.

### Overrides

An override is a special type of opinion. It happens when a layer provides a new value for something that’s already been defined in a lower layer. In other words, an override replaces an opinion from a lower layer with a new one from a higher layer.

#### When Is It an Override?

If a layer assigns a value (opinion) to a property that hasn’t been defined in other layers, it’s just an opinion.
But if a higher layer provides a different value for something already defined in a lower layer, it becomes an override because it’s replacing that existing opinion.

Example of Overrides:

Let’s revisit the cube example:

- **Layer 1** says the cube’s position is (0, 0, 0) and its color is red.
- **Layer 2** says the cube’s position is now (10, 0, 0).
- **Layer 3** says the cube’s color is green.

Here, Layer 2’s position opinion overrides the position from Layer 1. The cube will be positioned at (10, 0, 0) in the final composed scene, but its color remains red, since Layer 2 doesn’t provide an opinion about color. The color in Layer 3 overrides the color from Layer 1, so the cube's color is green.

> [!CAUTION]
> TODO: Add picture here...

## Metadata

todo

> [!CAUTION]
> TODO: Add picture here...

## Composition Arcs

todo

> [!CAUTION]
> TODO: Add picture here...