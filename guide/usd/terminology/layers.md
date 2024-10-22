# Layers

**Definition**: Layers is essentially a file or an in-memory container that holds data representing scene elements like geometry, transforms, materials, lights, and more. Layers are typically saved in file formats like `.usd`, `.usda`, `.usdc`, and `.usdz`. Think of layers as containers for scene data (geometry, transforms, materials, etc.) that can be stacked and composed together to build a final scene. 

USD's layer-based system allows artists and developers to modularize a scene into manageable pieces like props, characters, lighting setups, or entire environments. This modularity is key for building large, complex scenes without losing control over individual assets.

## Formats

USD layers can be stored in multiple formats:

- `.usda`: Human-readable ASCII format. Useful for debugging, version control, and situations where readability is essential.
- `.usdc`: Binary format optimized for performance. Used in production for faster loading times and smaller file sizes.
- `.usd`: Generic extension, either ASCII or binary. Often used when the file format is not a concern, allowing the underlying implementation to decide which format is more appropriate.
- `.usdz`: A zip-compressed package format, primarily used for asset interchange in portable and AR-friendly formats. This is commonly used in environments like Apple's ARKit.

## Why Layers Are Important

- **Non-Destructive Workflow**: Layers allow you to modify a scene incrementally without altering the original data. Different layers can override or add to previous ones in a stack, offering flexibility when multiple teams work on different aspects of a scene.

- **Collaborative Asset Management**: Multiple teams or departments can work on different layers—such as modeling, animation, lighting—without interfering with each other's work. Changes in one layer won't directly affect others unless the layers are explicitly composed.

- **Performance Optimization**: Using binary formats like .usdc allows efficient memory use and faster access for production environments, while .usdz enables easy sharing and portability of entire assets.

## Layer Composition

USD layers are composed in a hierarchical, non-destructive manner. The idea is that individual layers can define parts of a scene, and multiple layers can be combined to create a final scene. The key concept here is composability where layers can add new data or override existing data without modifying the original source. This enables multiple teams to work on different parts of the scene simultaneously.

Layer Types:

- **Root Layer**: The primary layer that serves as the entry point of a scene. It is the top layer in a stack and typically references other layers.

- **Sublayers**: These are layers that get referenced by the root or other sublayers. Each sublayer either augments or overrides content defined in previous layers. For example, one sublayer might define base geometry, while another could add textures or animations, providing a non-destructive way to refine the scene.

- **References**: A reference brings the contents of another USD file or layer into the scene at a specified location (prim path). When a layer references another, it pulls in the content from the referenced layer—such as geometry, materials, or lights—without duplicating the data. This means that changes made to the referenced layer will automatically propagate to all scenes that reference it, ensuring consistency across different parts of a project. 

- **Payloads**: are specialized references designed to optimize performance by deferring the loading of scene data. While references bring in the full content immediately, payloads are only loaded when explicitly needed. This feature is particularly beneficial when working with large or complex scenes, as it allows the system to manage resources more efficiently. By loading only what’s necessary at a given moment, payloads help keep memory usage low and reduce scene load times, improving both performance and scalability in large-scale projects.

> [!CAUTION]
> TODO: Add picture here...

## Layer Stack

The Layer Stack is the ordered sequence of layers that are composed together. Layers at the top of the stack can override or add to data from layers lower in the stack, allowing for fine-grained control over the final scene.

### For example:

Imagine a large-scale production where different teams handle different aspects of a scene:

1. **Base Geometry Layer**: One layer defines the base geometry for characters and environment.
2. **Animation Layer**: A sublayer contains animation data for the characters, adjusting positions over time.
3. **Lighting Layer**: Another sublayer adds lighting and shadowing details.
4. **Material Override Layer**: A higher layer overrides some of the base materials with specific shaders or textures for final rendering.

Each layer contributes specific elements without modifying the others, preserving the original content and enabling non-destructive workflows.

## Stage

A Stage represents the composed view of all the layers referenced by it. It’s where you interact with the final scene, query properties, and make edits. Although stages hold references to the layers, they do not directly store any data. They serve as a real-time, composed view, allowing artists and developers to see the outcome of layer compositions.

- **Interactive Environment**: The stage provides an interface for viewing and interacting with the composed scene, making it essential for workflows in USD-compatible tools.
- **Dynamic Composition**: Changes in any of the referenced layers are immediately reflected in the stage, ensuring that the composed view stays up-to-date with all underlying modifications.
- **Central Hub**: Acts as the central hub for all scene data, aggregating information from various layers into a unified representation.

## Session Layer

The Session Layer is a transient, in-memory layer that exists only for the duration of a USD stage's lifecycle. It is not saved to disk and is primarily used for temporary overrides and adjustments that are specific to a particular session or user.

- **Isolation**: Since it’s in-memory, modifications in the session layer do not affect the underlying layers, ensuring that temporary changes remain isolated.

- **Override Capabilities**: Allows users to override properties from other layers without altering the original data, facilitating experimentation and quick adjustments.

## Default Prim

The Default Prim is the primary prim that USD stages and tools reference when interacting with a scene. It serves as the entry point for operations and determines the context in which the scene is presented or manipulated.

**Example**: If a USD stage has a root prim named "World," setting this prim as the default prim means that operations like viewing or editing will focus on the "World" prim and its descendants.

## How do USD Layers look like?

> [!CAUTION]
> TODO