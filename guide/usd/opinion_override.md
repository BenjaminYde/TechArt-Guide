# Opinions & Overrides

## Opinion

An opinion is simply the value that a layer assigns to a property or prim (object) in the scene. Each layer can have its own opinions about things like:

- What color an object is.
- Where an object is positioned.
- Whether an object is visible or hidden.

Imagine you have a cube in a USD scene:

- **Layer 1** says the cube is at position (0, 0, 0) and has the color red.
- **Layer 2** says the cube is now at position (10, 0, 0).

Each layer provides its own opinion. When layers are composed, USD decides which opinion to use based on the composition rules, which determine how the opinions from different layers combine.

## Overrides

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