# Node Overview

> [!TIP]
> Checkout the `./reference/houdini/lop_node_overview.hip` where you can find all nodes displayed per section.

## Geometry

### Simple Meshes

![img](./static/node_overview/geometry/simple_meshes.png)

- **cube**: Creates a cube primitive.
- **cone**: Creates a cone primitive.
- **cylinder**: Creates a cylinder primitive.
- **sphere**: Creates a sphere primitive.
- **capsule**: Creates a capsule primitive.

### Common Primitives

![img](./static/node_overview/geometry/common_prims.png)

- **primitive**: Creates or modifies basic USD primitive types or their properties.
- **scope**: Creates a “scope” primitive. Scope is the simplest form of grouping, and does not have a transform. Scopes can be useful for organizing the scene tree.
- **createxform** Creates or edits an Xform prim. Xform represents a transform in the scene tree.

### Custom Meshes

![img](./static/node_overview/geometry/custom_meshes.png)

- **sopimport**: Imports geometry from a SOP network into LOPs as USD primitives.
- **sopcreate**: Creates USD geometry directly from an embedded SOP network.
  - **Example**: Generating procedural terrain using SOPs directly within your LOP graph.
- **sopmodify**: Modifies existing USD geometry using an embedded SOP network.
  - **Example**: Using a Mountain SOP via sopmodify to add detail to a LOP-created sphere.
- **splitprimitive**: Splits a single complex primitive (e.g., a mesh with multiple distinct parts) into multiple separate USD primitives.

### Other Geometry Related Primitives

![img](./static/node_overview/geometry/other_mesh_related.png)

- **mesh**: Creates or modifies a polygon mesh primitive.
- **basiscurves**: Creates or modifies basis curves (like NURBS or Bézier curves) within the USD stage.
- **points**: Creates or modifies point primitives.

### Transform

![img](./static/node_overview/geometry/transform.png)

- **transform**: Applies transformations (translate, rotate, scale) to primitives.
- **edit**: A versatile node for various primitive modifications like reparenting, renaming, or changing visibility. It's a general-purpose editing tool.
- **matchsize**: Resizes a primitive to match the bounding box size of another primitive.
- **setextents**: Sets or computes the bounding box (extents) for primitives, important for optimizations.
- **maskfrombounds**: Creates a mask or collection based on whether primitives are inside or outside a defined bounding box.

## Rendering

### Lights

![img](./static/node_overview/rendering/lights.png)

- **domelight**: Creates a dome light, often using an HDRI for image-based lighting.
  - **Example**: Lighting an outdoor scene with an HDRI of a sky.
- **distantlight**: Creates a distant light, simulating parallel rays from a source like the sun.
- **arealight**: Creates an area light source with definable shape (rectangle, disk, etc.).
  - **Example**: Simulating light from a window or a studio softbox.
- **pointlight**: Creates a point light, emitting light equally in all directions.
- **spotlight**: Creates a spotlight, emitting light in a cone shape.

### Light Control

![img](./static/node_overview/rendering/light_control.png)

- **lightmixer**: A common LOP for interactively adjusting intensities, colors, and other properties of multiple lights in a scene from a single interface. It's very useful for look development.
- **lightlinker**: Controls which lights illuminate which objects (light linking) and shadow linking.
  - **Example**: Making a specific light only affect a character.
- **lightfilterlibrary**: Creates and manages light filters (e.g., gobos, blockers) to modify light appearance.
- **lpetag (Light Path Expression Tag)**: Assigns tags to lights (and objects) for use with Light Path Expressions, allowing precise control over render passes and ray contributions.
  - **Example**: with “Key”, “Fill” and “Rim” LPE Tags, the Beauty AOV (“C”) will be automatically split into “C_Key”, “C_Fill” and “C_Rim” when enabling the “Split per LPE Tag” option.

### Materials

![img](./static/node_overview/rendering/materials.png)

- **materiallibrary**: The node where you define and organize materials (e.g., using MaterialX or VEX shaders) to be assigned in your scene.
- **materiallinker**: Similar to assignmaterial, often for more complex or rule-based material assignments.
- **assignmaterial**: Assigns a material (from a Material Library) to primitives.
  - **Example**: Applying a "metal_rust" material to a "car_body" primitive.
- **editmaterialproperties**: Modifies parameters of assigned materials without altering the original material in the library.
  - **Example**: Tweaking the color of a specific instance of a chair that shares a material with other chairs.
- **quicksurfacematerial**: Quickly creates and assigns a simple surface material, often for previews.
- **unassignmaterial**: Removes material assignments from primitives.
- **materialvariation**: Creates variations of a material (e.g., "car_paint" with "red" and "blue" variations).
- **coordsys (Coordinate System)**: Defines or modifies coordinate systems, important for asset alignment.

### Render Settings

![img](./static/node_overview/rendering/rendering.png)

- **camera**: Creates a camera in the scene.
- **karmarendersettings**: Configures global render settings specifically for the Karma renderer (sampling, AOVs, resolution, etc.).
- **rendervar**: Defines or modifies render variables (AOVs) for output.
- **renderproduct**: Defines a specific render output (e.g., an image file), specifying path, format, and AOVs.
- **rendersettings**: Configure Render Properties for Karma.
- **usdrender_rop**: The ROP node that triggers the rendering process for a LOP network, sending USD data to a renderer like Karma.
- **rendergeometrysettings**: Applies renderer-specific geometry settings to geometry in the scene graph.
- **backgroundplate**: Imports an image or sequence as a background for your render. 

## Composition

### Layering

![img](./static/node_overview/composition/layering.png)

- **sublayer**: Adds an existing USD file as a sublayer to the current layer stack, fundamental for USD composition.
- **reference**: References an external USD asset into the current stage (1 asset added to the scene as 1 prim).
- **merge**: Combines scene graph information from multiple input LOP nodes.
- **assetreference**: Reference, Transform, and select variants of a USD Asset. This node combines the most common features of the Reference, Xform, and Set Variant LOPs into a convenient tool.
- **fetch**: Grabs the output of another LOP, potentially in another LOP network.

### Layering Edit

![img](./static/node_overview/composition/layering_edit.png)

- **loadlayer**: Loads an existing USD layer file (.usd, .usda, .usdc) into the LOP network's layer stack. This is fundamental for bringing in pre-existing scene components or cached data. However, while `Sublayer` points to the layer on disk, this node creates a new anonymous in-memory layer. (so it will not be saved by default)
  - **Example**: This can be useful to load a layer file, edit it, and save out a modified copy, without dealing with recursion issues. This node will often be used in a “one-off” network that only exists to load the file, perform some “surgery”, and save it out again. After that the network can be deleted.
- **layerbreak**: Inserts a "break" in the USD layer stack. Edits made by nodes after a layerbreak will go into a new, stronger layer. This is crucial for non-destructive workflows, allowing overrides without altering upstream layers.
  - **Example**: After loading a base set dressing layer, use a layerbreak before adding character-specific props, ensuring those props are in a separate, stronger layer.
- **layerreplace**: Replaces the content of an existing layer or a set of layers within the current stage with new content, often from another LOP branch or an external USD file.
  - **Example**: Swapping out a low-resolution proxy layer with a high-resolution final asset layer.
- **edittargetlayer**: Specifies which layer in the USD layer stack subsequent edits should be applied to. This gives you precise control over where your changes are recorded in the layer stack.
  - **Example**: Ensuring that lighting adjustments are written to a specific "lighting" layer, separate from the "animation" or "set" layers.

### Configuring

![img](./static/node_overview/composition/configuring.png)

- **configureprimitive**: Modifies properties of a specified primitive like its kind, purpose, or visibility.
- **configureproperty**: Allows modification of nearly any named property (attribute) on a primitive.
- **configurelayer**: Modifies properties of the current USD layer (save path, comment, etc.).
- **configurestage**: Sets global stage-level properties (up-axis, FPS, time codes).
- **editproperties**: A node for modifying almost any attribute (property) on any primitive.
- **copyproperty**: Copies attribute values from one primitive to another.

### Structure

![img](./static/node_overview/composition/structure.png)

- **graftbranches**: Takes a scene graph branch and copies or instances it under different parent primitives.
- **graftstages**: Merges an entire external USD stage (or part of it) into the current stage under a specified path.
- **splitscene**: Used to divide the scene into different layers or files.
- **duplicate**: Duplicates primitives in the scene.
- **isolatescene**: Temporarily prunes parts of the scene graph to focus on specific primitives.
- **stagemanager**: Utility for managing and inspecting the overall USD stage (layers, composition).
- **collection**: Creates a collection of primitives based on rules or selection, used for targeting operations.
- **restructurescenegraph**:This node allows for more destructive editing of prim paths, variant sets, and composition arcs.
- **loftpayloadinfo**: Inspects or provides information about payloads, especially related to lofted/procedural geometry.
- **prune**: Removes primitives from the scene graph based on patterns or selections.

### Variants

![img](./static/node_overview/composition/variants.png)

- **variantblock_begin / variantblock_end**: These would define a scope for authoring variant opinions. `variantblock_begin` starts defining opinions for a specific variant, and `variantblock_end` finalizes them.
- **addvariant**: Adds a new variant to an existing variant set on a primitive.
- **explorevariants**: Utility to easily view and switch between available variants on primitives.
- **setvariant**: Switches the active variant for a primitive that has a variant set defined.
- **componentgeometryvariants**: Manages variants for different geometric representations of a component.
- **createlod**: Manages the creation and definition of Level of Detail (LOD) variants for an asset.
- **autoselectlod**: Automatically selects a Level of Detail (LOD) for referenced assets based on camera distance or screen space.

### Caching

![img](./static/node_overview/composition/caching.png)

- **cache**: Caches the LOP network's output to a USD file or memory to speed up workflows.
- **filecache** (filecache_v1.usd): Specifically writes the LOP network's output to a USD file, often with versioning implied.
- **valueclip & geoclipsequence**: In USD, a value clip is a way of storing data sets in separate files.
  - **Example**: This allows you to split large data across multiple files. For example, simulations or other animated data where the size of each time sample is so large that authoring all time samples to a single file is unwieldy.
    
## Tooling

### Control Flow

![img](./static/node_overview/tooling/control_flow.png)

- **switch**: Allows you to switch between different input LOP branches, passing only one through.
- **null**: An empty node that performs no operation, used for organization or placeholders.
- **error**: Generates an error or warning in the LOP network.
- **subnet**: A container node to group other LOP nodes, crucial for organization and creating HDAs.
- **foreach_begin / foreach_end**: Creates a loop to process each primitive (or item) in a group individually.
- **output (Output #0)**: Designates the final output of the LOP network.

### Programming

![img](./static/node_overview/tooling/programming.png)

- **attribwrangle**: Allows manipulation of primitive attributes using VEX script.
  - **Example**: Conditionally setting primitive visibility based on custom logic.
- **pythonscript**: Allows execution of Python code to interact with and modify the USD stage.
  - **Example**: Procedurally generating an array of objects based on external data.
- **inlineusd**: Allows embedding USD data directly (as USDA text) within the LOP network.
- **storeparametervalues**: Lets you store temporary (unsaved) data in the stage.

## Simulation

### constraints

![img](./static/node_overview/tooling/constraints.png)

- **pinconstraint**: Pins a primitive or parts of it in place.
- **blendconstraint**: Blends the effect of multiple constraints applied to the same primitive.
- **followpathconstraint**: Constrains a primitive to follow a specified curve or path.
- **alignconstraint**: Constrains one primitive to another, often for alignment.
- **pointsconstraint**: Applies constraints specifically to points of a geometry.
- **surfaceconstraint**: Constrains a primitive to stay on the surface of another primitive.
- **lookatconstraint**: Constrains a primitive to always orient itself towards a target.

### Simulation

![img](./static/node_overview/tooling/simulation.png)

- **timeshift**: Offsets or retimes animation data passing through it.
- **simulationproxy**: Represents or manages proxies for complex simulation data within LOPs.
- **rbddestruction**: Imports or manages data from an RBD simulation (e.g., fractured geometry) for rendering.
- **drop**: Utility node, often for simulating objects dropping or settling (suggests physics).
- **resampletransforms**: Resamples transformation animation curves, useful for retiming or adjusting baked animation.