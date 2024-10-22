# Composition Arcs

**Definition**: Composition arcs are the fundamental mechanisms in USD that define how scene descriptions from different sources are combined to form a final scene. They specify relationships and composition rules between prims, allowing for complex scene assembly and organization.

## Types of Composition Arcs:

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

## Understanding the Difference Between Inherits and Specializes

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