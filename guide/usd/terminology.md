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

**Definition**: Additional static information attached to prims, properties or layers that provides context or supplementary data not directly affecting the scene's visual representation. Metadata can include details like documentation, authoring information, or any custom data that needs to accompany the scene elements.

> [!CAUTION]
> TODO: Add picture here...

## Kind

**Definition**: In OpenUSD, kind is a way to classify objects (prims) into categories that go beyond the basic object type (like geometry or light). Think of kind as a way to assign roles to objects, helping to organize and manage complex scenes.

USD’s **Model Hierarchy** is built on this idea of kind and provides a way to efficiently discover and organize important objects within a scene. Here's how it works, explained simply:

USD provides a hierarchy of kinds that help define **models** (collections of objects) in a scene.

### Key Types of Kinds:

- **model** (abstract): 
  - The base type for all other model kinds. It is not meant to be directly applied to any object (prim). It's like a concept or idea that covers all types of models.
- **group**:
  - A collection of other models. It helps organize models into logical groups. For example, a group could be a city containing buildings and vehicles.
  - Only group models can have other models inside them.
- **component**:
  - A component is a complete object that cannot contain other models. Think of components as the "last level" in the model hierarchy. They are the smallest complete units. This is called a "leaf" model
  - Example: A chair or a lamp is a component. It’s a single object, not a collection.
- **assembly** (a special group):
  - This is a special kind of group, usually representing a published asset, like a car or a complex machine. It is often used for things that are made up of smaller parts but are meant to be treated as a single unit.
- **subcomponent**:
  - Subcomponents, despite the name, are not considered part of the model hierarchy because they don't behave like full models. Instead, they represent identifiable, but smaller, parts of a component. They are more like internal details of a component.

### Example

```
/World
    └── Parking (group)
        ├── Car (assembly)
        │   ├── Car_Body (component)
        │   ├── Doors (group)
        │   │   ├── FrontLeftDoor (component)
        │   │   │   ├── Window (subcomponent)
        │   │   │   └── Handle (subcomponent)
        │   │   ├── OtherDoors...
        │   ├── Wheels (group)
        │   │   ├── FrontLeftWheel (component)
        │   │   │   ├── Tire (subcomponent)
        │   │   │   └── Rim (subcomponent)
        │   │   ├── OtherWheels...
        │   └── Engine (component)
```

Clear Roles: Every part has a clear role, making the hierarchy easy to understand:
- **Assembly**: The complete car assembly.
- **Groups**: Logical collections like doors and wheels.
- **Components**: Independent parts like each door, each wheel, and the engine.
- **Subcomponents**: Smaller, internal parts of components like the handle of a door.

### Why This Matters

The model hierarchy simplifies the process of navigating, organizing, and referencing objects in USD scenes. Instead of having to manually track which assets are grouped or how they’re related, the hierarchy helps the scene "self-organize," especially when models are referenced from external files.

#### Benefits:

- **Efficient scene management**: You can quickly find and manipulate large parts of the scene, like moving all vehicles in the city.
- **Clear relationships**: The hierarchy helps define how assets relate to each other, making it easier to work with complex models.
- **Modularity**: You can reference different parts of the scene (like the car assembly) as needed and manipulate them independently.

## Purpose

**Definition**: In OpenUSD, a purpose allows you to categorize parts of your scene based on their intended visibility use in context of rendering. The primary purposes include:

- **default**: This is for geometry and objects that are always relevant in the scene.
- **render**: Used for objects that are specifically meant to be visible during rendering but might be excluded in other contexts, like previews.
- **proxy**: Represents simplified or lower-resolution versions of assets used to speed up scene interaction or previews without affecting the final rendered quality.
- **guide**: Intended for helper objects like visual guides or rig controls that aid in asset manipulation but don’t appear in the final output.

The purpose feature helps optimize workflows by enabling you to filter, include, or exclude objects based on their role, improving performance and organization during different stages of production.

> [!CAUTION]
> TODO: Add picture here...

## Composition Arcs

Definition: Composition arcs are the fundamental mechanisms in USD that define how scene descriptions from different sources are combined to form a final scene. They specify relationships and composition rules between prims, allowing for complex scene assembly and organization.

#### Types of Composition Arcs:

- **Sublayer**: Incorporates one layer into another, stacking their content while allowing higher layers to override opinions from lower ones.
- **Reference**: Inserts the contents of another USD file or layer into the scene at a specific prim path, enabling asset reuse.
- **Payload**: Similar to references but designed for deferred loading of heavy data to optimize performance.
- **VariantSet**: Provides a mechanism for switching between different variations of a prim, such as LODs or model configurations.
- **Inherits**: Allows a prim to inherit properties from another prim, promoting reuse and consistency.
- **Specializes**: Similar to inherits but with a stronger binding, used for creating specialized versions of prims.

These arcs define how data from different sources is composed, overridden, or augmented to produce the final scene.

### 1. Sublayer

**Definition**: A sublayer is a layer that is included within another layer, contributing its opinions to the composition of the scene. Sublayers are stacked in a specific order, forming a Layer Stack where higher layers can override the opinions of lower ones.

#### How Sublayers Work:

- **Layer Stack Order**: The order of sublayers matters; layers higher in the stack have stronger opinions.
- **Additive Composition**: Sublayers contribute additional data or override existing data without deleting it.
- **Use Cases**: Useful for organizing scene data into separate files, like geometry, animation, or shading layers, which are then combined.

> [!CAUTION]
> TODO: Add picture here...

### 2. Reference

**Definition**: A reference is a composition arc that brings the contents of another USD file or layer into the scene at a specified prim path. It allows for the inclusion and reuse of assets while maintaining a link to their source, enabling updates and consistent asset management.

- **Asset Reuse**: References enable the same asset to be used in multiple places without duplication.
- **Isolation**: Referenced assets can be developed independently and updated without affecting the referencing scene directly.
- **Overriding**: Properties of referenced prims can be overridden or extended in the referencing layer.

> [!CAUTION]
> TODO: Add picture here...

### 3. Payload

**Definition**: A payload is a composition arc similar to a reference but optimized for managing large datasets. Payloads enable deferred loading of heavy assets, improving performance by only loading data when necessary.

- **Lazy Loading**: Payload data is not loaded until explicitly requested, reducing initial load times.
- **Efficient Scene Handling**: Ideal for large scenes where only a subset of data needs to be loaded at any given time.
- **Activation Control**: Payloads can be activated or deactivated, giving fine-grained control over scene content.
- 
### 4. VariantSet

**Definition**: A VariantSet is a composition arc that allows a prim to define multiple variants—alternative representations or configurations—that can be switched dynamically. This facilitates flexibility in choosing different versions of an asset without altering the scene structure.

- **Variants**: Named options within a VariantSet, each representing a different subgraph.
- **Selection**: The active variant can be selected per VariantSet, determining which subgraph is used.
- **Use Cases**: Ideal for LODs, character outfits, prop states (e.g., door open/closed), or material variations.

> [!CAUTION]
> TODO: Add picture here...

### 5. Inherits

**Definition**: Inherits is a composition arc in USD that allows a prim (primitive) to inherit properties and metadata from one or more other prims, known as base or prototype prims. This mechanism promotes reusability by sharing common attributes across multiple prims without duplicating data.

- **Property Inheritance**: The inheriting prim adopts the properties of the prototype prim.
- **Override Capability**: Inherited properties can be overridden or augmented.
- **Multiple Inheritance**: A prim can inherit from multiple prototypes.

**Strength in Composition**: Inherits has a composition strength that allows inherited properties to be overridden by local opinions and stronger arcs, but it can override opinions from references, payloads, and specializes.

Example:

```
def "BasePrim" {
    float size = 1.0
    color3f color = (1, 1, 1)  // White color
}

def "InheritedPrim" (
    inherits = </BasePrim>
)
{
    float size = 2.0  // Local override
    // 'color' is inherited from BasePrim
}
```

> [!CAUTION]
> TODO: Add picture here...

### 6. Specializes

**Definition**: Specializes is a composition arc that allows a prim to incorporate properties from another prim in a way that provides default values that can be overridden by stronger composition arcs. It is used to create specialized versions of assets, but it has the weakest composition strength among the arcs.

- **Strength in Composition**: Specializes is the weakest composition arc. Opinions from specializes can be overridden by all other arcs, including inherits, variants, references, payloads, and local opinions.

- **Default Definitions**: Specializes provides a way to define base properties that serve as defaults, which can be customized or overridden by stronger opinions.


> [!CAUTION]
> TODO: Add picture here...

### Understanding the Difference Between Inherits and Specializes

The primary difference between inherits and specializes lies in their composition strength and how they resolve property conflicts. Strength in General Composition: Specializes is weaker than inherits.

Example:

```
def "BasePrim" {
    float size = 1.0
    color3f color = (1, 1, 1)    // White
}

def "InheritedPrim" (
    inherits = </BasePrim>
)
{
    float size = 2.0             // Local override
    // 'color' is inherited from BasePrim
}

def "SpecializedPrim" (
    specializes = </BasePrim>
)
{
    color3f color = (0, 0, 1)    // Local override (blue)
    // 'size' is inherited from BasePrim
}

def "MyPrim" (
    inherits = </InheritedPrim>,
    specializes = </SpecializedPrim>
)
{
    // No local overrides
}
```

- Result:
  - `size: 2.0` (from `InheritedPrim` via inherits)
  - `color: (1, 1, 1)` (white, from `InheritedPrim` via inherits)

```
MyPrim
├── inherits: InheritedPrim (stronger)
│   ├── size = 2.0             (local override in InheritedPrim)
│   └── color = (1, 1, 1)      (inherited from BasePrim)
└── specializes: SpecializedPrim (weaker)
    ├── size = 1.0             (inherited from BasePrim)
    └── color = (0, 0, 1)      (local override in SpecializedPrim)
```

#### Variations

1. Example: if `MyPrim` Had a Local Override:

```
def "MyPrim" (
    inherits = </InheritedPrim>,
    specializes = </SpecializedPrim>
)
{
    float size = 4.0        // Local override
    // No local override for 'color'
}
```

- Result:
  - `size = 4.0` (local opinion on `MyPrim` = strongest)
  - `color = (1, 1, 1)` (from InheritedPrim via inherits)

1. Example: If `MyPrim` Did Not Inherit from `InheritedPrim`:

```
def "MyPrim" (
    specializes = </SpecializedPrim>
)
{
    // No local overrides
}
```

- Result:
  - `size = 1.0 `(inherited from `BasePrim` via `SpecializedPrim`)
  - `color = (0, 0, 1)` (local override in `SpecializedPrim` via specializes)


## Strength Ordening (LIVRPS)

**Definition**: Strength ordering in USD determines the precedence of opinions (property values and metadata) from different composition arcs when there are conflicts. This ordering ensures that the final composed scene behaves predictably by defining which opinions override others.

USD defines a specific strength ordering remembered by the acronym LIVRPS, representing the composition arcs from strongest to weakest:

1. **L**ocal Opinions (strongest)
1. **I**nherits
1. **V**ariantSets
1. **R**eferences
1. **P**ayloads
1. **S**pecialized (weakest)

## Schemas

**Definition**: In OpenUSD, schemas define structured templates for prims (primitives) and properties, specifying their types, expected properties, and behaviors. They act as blueprints that ensure consistency and interoperability across different tools and pipelines by providing a standardized way to represent scene elements.

- **Consistency**: Everyone uses the same definitions, so assets work well together.
- **Interoperability**: Different software can read and write USD files correctly because they understand the schemas.

Types of Schemas:

USD schemas are categorized to serve specific purposes within the scene description framework:

- **IsA Schemas**: Define what an object is (e.g., a Mesh, a Cube, a Camera). They are like classes in object-oriented programming.
- **API Schemas**: Define additional capabilities or features an object can have. They are like interfaces that add extra methods and properties to classes.

### 1. IsA Schemas

**Definition**: IsA schemas define the core type of a prim. They specify what an object is, such as a Mesh, Cube, or Camera. Each IsA schema comes with a set of default properties typical for that type of object.

How They Appear in USD Files:

When you see a line like `def Cube "MyCube"`, the word `Cube` is the IsA schema. It tells USD that `MyCube` is a cube and should have all the properties that cubes have.

```
def Cube "MyCube" {
    float size = 1.0  // Size of the cube
}

def Mesh "MyMesh" {
    // Properties like points, normals, and face indices
}

def Camera "MyCamera" {
    float focalLength = 50.0  // Focal length of the camera lens
}
```
Key Points:

- **Declaration**: Specify the type of a prim using the schema name after `def`.
- **Default Properties**: Each IsA schema includes properties standard to that type.
- **Type Checking**: You can check a prim's type in code (e.g., `prim.IsA(UsdGeom.Mesh)`).

### 2. API Schemas

**Definition**: API schemas are provide additional properties and behaviors to prims without changing their core type. They are used to author and retrieve structured data from prims, enhancing their functionality.

Types of API Schemas:

- **Non-Applied API Schemas**: are used to interact with existing data on prims without changing the prim's definition. They provide convenience methods and are available for use with any prim.
- **Applied API Schemas**: are used when you need to extend a prim with new properties and behaviors, effectively enhancing the prim's capabilities. They must be applied to a prim and modify its definition.


#### 2.1 Non-Applied API Schemas

**Definition**: Provide methods to interact with existing data on any prim. They do not need to be applied and do not modify the prim's definition. Think of them as utility classes or helpers.

- **No Application Needed**: Use them directly without applying.
- **No Changes to Prim**: Do not add new properties or modify the prim's definition.
- **Universal Use**: Can be used with any prim.

Examples:

1. **UsdModelAPI**: Interact with model-level metadata, like kind or asset information.

```python
from pxr import Usd, Kind

prim = stage.GetPrimAtPath("/MyModel")
modelAPI = Usd.ModelAPI(prim)
modelAPI.SetKind(Kind.Tokens.component)
```

2. **UsdGeomImageable**: Access common properties of geometric prims, such as visibility.

```python
from pxr import UsdGeom

prim = stage.GetPrimAtPath("/MyGeom")
imageable = UsdGeom.Imageable(prim)
visibility = imageable.GetVisibilityAttr().Get()
```

#### 2.2 Applied API Schemas

**Definition**: Must be explicitly applied to a prim to take effect. They modify the prim's definition by adding new properties and behaviors. Applied API schemas are recorded in the prim's `apiSchemas` metadata.

- **Must Be Applied**: Use the Apply method or apiSchemas metadata.
- **Modify Prim Definition**: Add new properties to the prim.
- **Presence Check**: Use prim.HasAPI(SchemaName) to check if applied.

Examples:

1. **UsdPhysicsCollisionAPI**: Adds collision properties for physics simulations.

```python
from pxr import UsdPhysics

prim = stage.GetPrimAtPath("/MyMesh")
UsdPhysics.CollisionAPI.Apply(prim)
collisionAPI = UsdPhysics.CollisionAPI(prim)
collisionAPI.CreateCollisionEnabledAttr(True)
```

```
def Mesh "MyMesh" (
    apiSchemas = ["PhysicsCollisionAPI"]
) {
    bool physics:collisionEnabled = true
}
```

2. **UsdShadeMaterialBindingAPI**: Allows binding materials to prims.

```python
from pxr import UsdShade

prim = stage.GetPrimAtPath("/MyMesh")
UsdShade.MaterialBindingAPI.Apply(prim)
bindingAPI = UsdShade.MaterialBindingAPI(prim)
bindingAPI.Bind(materialPrim)
```

#### 2.3 Using Schemas Together

Define a Mesh Prim:

```
def Mesh "Ball" {
    # Mesh data
}
```

Apply the Physics API Schemas:

```
def Mesh "Ball" (
    apiSchemas = ["PhysicsCollisionAPI", "PhysicsMassAPI"]
) {
    float physics:mass = 1.0                # From PhysicsMassAPI
    bool physics:collisionEnabled = true    # From PhysicsCollisionAPI
}
```

Access In Code:

```python
from pxr import UsdPhysics

prim = stage.GetPrimAtPath("/Ball")

if prim.HasAPI(UsdPhysics.CollisionAPI):
    collisionAPI = UsdPhysics.CollisionAPI(prim)
    collisionEnabled = collisionAPI.GetCollisionEnabledAttr().Get()

if prim.HasAPI(UsdPhysics.MassAPI):
    massAPI = UsdPhysics.MassAPI(prim)
    mass = massAPI.GetMassAttr().Get()
```