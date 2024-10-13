# Introduction To USD

## Challenges of the production pipeline

Before the adoption of Universal Scene Description (USD), the 3D content creation pipeline faced several significant challenges due to the lack of a standardized scene description protocol. Each stage of the pipeline—modeling, shading, animation, lighting, physics, particle effects, and rendering—utilized its unique data format optimized for specific tasks but not designed for interoperability.

- **Fragmentation of Scene Data**: Different applications in the production pipeline each had their unique formats, necessitating frequent data exports and imports between tools like modeling and animation software. This often led to data loss or corruption due to inconsistencies in handling scene data.

- **Lack of Interoperability**: Without a common scene description format, transferring assets between applications was cumbersome and error-prone. Artists and technicians often relied on intermediate formats or custom scripts for data translation, leading to inefficiencies and potential errors.

- **Scalability Issues**: As 3D scenes became more complex, especially in film and gaming, the need to manage large datasets efficiently grew. Traditional methods did not scale well, causing increased load times, higher resource demands, and difficulties in managing multiple asset versions.
- **Collaboration and Version Control Difficulties**: The disparate nature of scene data hindered easy sharing and modification across teams and locations. Effective version control was hard to achieve, complicating the tracking of changes and the merging of team contributions.

- **Increased Inefficiencies and Cost**: The absence of a unified framework for scene descriptions led to increased redundancy and costs. Teams faced higher expenses and production delays due to the need for multiple tools and significant time spent on data conversion and repair.

## Universal Scene Description (USD) to the rescue

Recognizing these challenges, Pixar released the first open-source version of USD in 2016 as OpenUSD. USD is not just a file format but a comprehensive system which was designed as a solution to these longstanding issues, offering a way to describe, interchange, and augment 3D scene data seamlessly across various applications and platforms.

![Img](./static/openusd_logo.png)

### Core Features and Benefits of USD

- **Unified Language for 3D Data**: USD acts as a comprehensive framework for defining, assembling, and editing 3D data across different content creation software. It organizes low-level data and offers high-level schemas for 3D concepts like meshes and transforms. This consistency greatly reduces errors and streamlines production processes.

- **Interoperability and Flexibility**: USD supports collaborative efforts by enabling multiple artists to work on the same files without interference. USD's layered approach allows for extensive non-destructive editing and sharing of scene components, enhancing collaboration and allowing for iterative updates without compromising underlying data.

- **Increased Iteration Speed**: Designed to efficiently manage large-scale data, USD supports advanced features like streaming and deferred loading, making it ideal for complex, high-end productions. Additionally, it supports the creation of USDC (binary) formats, which significantly improve loading and processing speeds.

- **Version Control and Collaboration**: USD's text-based format is compatible with standard version control systems, enhancing change tracking and collaborative workflows across diverse teams. This compatibility supports better version management and more efficient collaboration among artists and developers.

### What Data Can USD Represent?

USD's versatility extends across a broad range of data types essential for 3D content creation. Its design accommodates diverse aspects of scene descriptions, making it a robust and comprehensive framework for managing complex production pipelines. 

Here are the key data types USD can represent:

- **Geometry (Geo)**: USD can describe various geometric entities, including polygons, curves, and subdivision surfaces. It supports a wide range of geometric primitives, such as meshes, nurbs, and points, making it suitable for representing both simple and highly detailed models.

- **Shading and Materials**: USD provides a powerful shading system that allows the definition of complex material properties and shading networks. It can describe shaders, textures, and material assignments, facilitating consistent rendering across different applications and renderers.

- **Scene Hierarchy**: USD excels in organizing and managing scene hierarchies. It can represent scenes with complex relationships, including parent-child hierarchies, groups, and instancing. This capability ensures that large and intricate scenes are efficiently structured and easily navigable.

- **Transforms and Animation**: USD supports robust transformation and animation data, enabling the precise control of object movements and transformations over time. It can represent keyframe animations, skeletal animations, and blend shapes, providing comprehensive tools for animators.

- **Lighting and Cameras**: USD can describe various lighting types, such as point lights, spotlights, and area lights, along with their properties and behaviors. It also supports camera definitions, including camera settings, lenses, and animation, ensuring accurate and consistent scene rendering.

- **Physics and Simulation**: USD can represent physical properties and simulation data, including collision shapes, rigid bodies, and constraints. This capability is crucial for creating realistic physical interactions and dynamics within a scene.

- **Particles and Volumes**: USD supports the representation of particle systems and volumetric data, enabling the creation of effects like smoke, fire, and fluid simulations. This feature allows for the integration of intricate effects directly within the scene description.

- **Metadata and Custom Data**: USD allows for the inclusion of metadata and custom attributes, providing additional flexibility for specific production requirements. This capability ensures that all necessary information is encapsulated within the USD files, supporting tailored workflows and specialized needs.

## USD's Composition Feature

USD offers powerful composition capabilities, enabling flexible and efficient management of complex scenes. Its composition semantics allow for combining, modifying, and organizing 3D data across multiple layers and assets, making it essential for large-scale productions.

### Layer Stacking

USD allows you to stack layers of data using the subLayers composition arc. Think of it like layers in Photoshop, where you can stack different layers on top of each other to create a scene / image. In USD, each layer can contribute different parts of a scene, and the composition engine merges these layers into a single, coherent scene.

### References and Payloads

- **References**: References: A reference in USD allows one part of a scene to include data from another part of the scene or even from another file. This means you can build a complex scene by combining simpler parts. For example, you might have one file for a car model and another for a building, and you can reference these into a single scene file to create a scene with both the car and the building.

- **Payloads**: Payloads are a special type of reference that you can choose to load or not load based on your needs. This is useful for managing large scenes because you can keep only the parts you need in memory, improving performance. For example, if you are working on a scene with a city, you might only load the parts of the city you are working on and unload the rest.

### VariantSets

VariantSets allow you to bundle different versions of an asset into a single package. For instance, you might have a car model with different colors. Instead of having separate files for each color, you can use VariantSets to store all colors in one file. Users can then switch between these variations as needed, and stronger layers can override the selected variant to change the car's color in the final scene.

### Inherits and Specializes

In the Universal Scene Description (USD), “inherit” and “specialize” are two different types of composition arcs that allow one prim to derive properties from another. Here’s how they differ:

- **Inherit**: When a prim inherits from another prim, it gets all the properties of the inherited prim. However, the opinions in the higher layers (i.e., the layers that are processed later in the composition) are stronger than the opinions in the inheriting prim’s own layer. This means that if there’s a conflict between the properties defined in the inherited prim and the inheriting prim, the properties of the higher layers will take precedence.

- **Specialize**: When a prim specializes another prim, it also gets all the properties of the specialized prim. However, unlike inheritance, the opinions in the higher layers are weaker than the opinions in the specializing prim’s own layer. This means that if there’s a conflict between the properties defined in the specialized prim and the specializing prim, the properties of the specializing prim will take precedence.

Strength of Opinions:

- **Inherit**: Opinions in higher layers are stronger, meaning they override the inheriting prim’s own properties in case of conflict.

- **Specialize**: Opinions in the specializing prim’s own layer are stronger, meaning they override the properties of the higher layers in case of conflict.

## The Alliance of USD

The Alliance for OpenUSD (AOUSD) is an open, non-profit organization dedicated to promoting the interoperability of 3D content through OpenUSD (Universal Scene Description). Standardizing the 3D ecosystem will enable developers and content creators to describe, compose, and simulate large-scale 3D projects and build an ever-widening range of 3D-enabled products and services.

![Img](./static/aousd_logo.png)

### Key Members of the USD Alliance

- **Pixar Animation Studios**: The originator of USD, Pixar continues to lead the development and refinement of the system, ensuring it meets the rigorous demands of high-end animation and visual effects production.

- **Houdini**: SideFX's Houdini is renowned for its powerful procedural generation and visual effects tools. With USD integration, Houdini users can now seamlessly import, export, and manipulate USD files, allowing for more efficient collaboration and asset sharing across different stages of production.

- **NVIDIA**: As a leader in graphics processing and AI, NVIDIA has integrated USD into its Omniverse platform, enabling real-time collaboration and simulation for design and visualization projects.

- **Autodesk**: A major player in 3D design, engineering, and entertainment software, Autodesk supports USD across its suite of tools, including Maya and 3ds Max, facilitating seamless interoperability and enhanced workflow efficiency.

- **Adobe**: Adobe has embraced USD within its Substance suite, providing artists with robust tools for texturing and material creation that are fully compatible with USD's scene description capabilities.

- **Epic Games**: The creator of Unreal Engine, Epic Games has incorporated USD support to enhance its real-time 3D creation capabilities, enabling more streamlined asset management and interoperability.

## References

- [OpenUSD](https://openusd.org/dev/index.html)
- [Houdini Solaris USD](https://www.sidefx.com/docs/houdini/solaris/usd.html)
- [Nvidia Omniverse USD](https://docs.omniverse.nvidia.com/usd/latest/index.html)
- [Book of USD](https://remedy-entertainment.github.io/USDBook/index.html)
- [USD Survival Guide](https://lucascheller.github.io/VFX-UsdSurvivalGuide/index.html)
- [Alliance for OpenUSD](https://aousd.org)
- [USD Working Group](https://lf-aswf.atlassian.net/wiki/spaces/WGUSD/overview?)homepageId=11272194