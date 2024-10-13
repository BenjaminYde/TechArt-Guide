# Schemas

**Definition**: In OpenUSD, schemas define structured templates for prims (primitives) and properties, specifying their types, expected properties, and behaviors. They act as blueprints that ensure consistency and interoperability across different tools and pipelines by providing a standardized way to represent scene elements.

- **Consistency**: Everyone uses the same definitions, so assets work well together.
- **Interoperability**: Different software can read and write USD files correctly because they understand the schemas.

Types of Schemas:

USD schemas are categorized to serve specific purposes within the scene description framework:

- **IsA Schemas**: Define what an object is (e.g., a Mesh, a Cube, a Camera). They are like classes in object-oriented programming.
- **API Schemas**: Define additional capabilities or features an object can have. They are like interfaces that add extra methods and properties to classes.

## 1. IsA Schemas

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

## 2. API Schemas

**Definition**: API schemas are provide additional properties and behaviors to prims without changing their core type. They are used to author and retrieve structured data from prims, enhancing their functionality.

Types of API Schemas:

- **Non-Applied API Schemas**: are used to interact with existing data on prims without changing the prim's definition. They provide convenience methods and are available for use with any prim.
- **Applied API Schemas**: are used when you need to extend a prim with new properties and behaviors, effectively enhancing the prim's capabilities. They must be applied to a prim and modify its definition.


### 2.1 Non-Applied API Schemas

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

### 2.2 Applied API Schemas

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

### 2.3 Using Schemas Together

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