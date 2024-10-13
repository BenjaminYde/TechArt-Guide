# Layers

**Definition**: Layers is essentially a file or an in-memory container that holds data representing scene elements like geometry, transforms, materials, lights, and more. Layers are typically saved in file formats like `.usd`, `.usda`, `.usdc`, and `.usdz`. Think of layers as containers for scene data (geometry, transforms, materials, etc.) that can be stacked and composed together to build a final scene. A layer can represent a “piece” of a scene such as a prop, a character, a lighting setup, and so on. 

## Formats

USD layers can be stored in multiple formats:

- `.usda`: A human-readable ASCII format.
- `.usdc`: A binary format optimized for performance.
- `.usd`: A generic extension that could be either ASCII or binary.
- `.usdz`: A zip-compressed package format, often used for asset interchange.

## Layer Composition

USD layers are composed in a hierarchical, non-destructive manner. The idea is that individual layers can define parts of a scene, and multiple layers can be combined to create a final scene. The key principle here is composability, which allows different layers to contribute different parts of the scene without overwriting each other directly.

Layer Types:

- **Root Layer**: The root layer is the top-most layer in the composition hierarchy and serves as the entry point for the scene. It specifies which other layers are included, and these layers can be stacked to create the final composed result.

- **Sublayers**: Layers can reference or include other layers using sub-layers. These sub-layers are added on top of each other, with each sub-layer contributing additional or overriding data to the final scene.

## Layer Stack

The Layer Stack in USD refers to the ordered collection of layers that are combined to form the final scene data.

USD layers allow for a non-destructive editing workflow. When combining layers, the data from a layer lower in the stack can be overridden or supplemented by data from layers higher in the stack, without modifying the original data in the lower layers.

For example:

- You might have a base layer that defines a character’s geometry.
- Another layer can define the character’s animation.
- A third layer could override the character’s material or appearance.

All these layers are combined to form the final result, but each layer can be edited independently without altering the original data in other layers.

## Stage

A stage is a view that represents a composed set of layers. In the context of scene management, the stage serves as a composed view of all layers it references, presenting the final scene based on composition rules. Note that stage is just a name for the result.