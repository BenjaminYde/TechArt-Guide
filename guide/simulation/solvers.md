# Solvers

## About

### What Is A Solver?

A physics solver is an algorithm or method that computes how objects move or deform over time. It uses equations derived from the laws of physics—like conservation of momentum, mass, and energy—to update positions, velocities, and other properties frame by frame. In practice, a solver helps you get from "initial conditions" (how something looks now) to "next conditions" (how it should look after forces, collisions, or deformations are applied). Different solvers target different phenomena—some focus on solid objects, some on fluids, and others on complex coupled systems.

### What Is Multiphysics?

Many real scenarios involve multiple types of materials interacting: fluids flowing around solids, granular materials mixing with liquids, or flexible cloth interacting with rigid structures. Multiphysics simulations bring these domains together. A multiphysics solver might handle the interplay between fluid and solid, or between thermal and mechanical effects. This complexity often requires multiple solvers working in tandem, carefully exchanging data at each time step.

## Rigid Body Dynamics (RBD)

Rigid Body Dynamics (RBD) solve for the motion of solid objects that do not deform under stress. Each object maintains a fixed shape and volume, and the solver calculates linear and angular motions based on applied forces, collisions, friction, and constraints. RBD simulations are widely used for breaking objects, stacking scenes, and large-scale destruction.

### Houdini Integration

Houdini’s RBD toolset primarily relies on the Bullet Physics engine. Bullet is a well-known open-source physics library that efficiently handles rigid body collisions, constraints (hinges, pins), and integration over time. Within Houdini, you can import geometry into an RBD packed primitive workflow, assign physical properties (density, friction), and let Bullet handle the underlying math. Bullet in Houdini is CPU-based but can be surprisingly fast due to its efficient design, depending on the complexity of the project ofcourse.

#### Common workflows: 

- **Fracturing**: Houdini offers tools like the RBD Material Fracture SOP and Voronoi Fracture SOP to pre-fracture geometry into smaller pieces, enabling realistic breaking and shattering effects. The RBD Material Fracture SOP provides presets for materials such as concrete, glass, and wood, allowing for material-specific fracture patterns.

- **Glue Constraints**: These are used to hold fractured pieces together until a specified force threshold is exceeded, at which point the bonds break, allowing for dynamic destruction effects. Houdini's RBD Constraint Properties SOP facilitates the creation and management of these constraints, providing control over their behavior during simulations.

- **RBD Bullet Solver SOP**: This node handles the simulation of rigid body dynamics within Houdini's SOP (Surface Operators) context, streamlining the workflow by allowing for direct manipulation and visualization of simulation parameters. It supports features like guided simulations, enabling the use of low-resolution proxies to drive high-resolution results, enhancing both efficiency and control.

- **Packed Primitives**: Houdini employs packed primitives to manage large numbers of objects efficiently. This approach reduces memory usage and improves performance by treating groups of geometry as single entities during the simulation. The RBD Pack and Unpack SOPs facilitate this process, ensuring a clean and manageable workflow.

- **Proxy Geometry**: Utilizing simplified proxy geometry for collision calculations can significantly improve simulation performance without compromising visual fidelity. This technique involves using low-resolution meshes for collision detection while retaining high-resolution geometry for rendering, balancing efficiency and detail.

### Links

See the following links for more info:
- [Houdini Docs: RBD Solver](https://www.sidefx.com/docs/houdini/nodes/dop/rbdsolver.html)
- [Houdini: New RBD Workflow Tools in Houdini 18 | Nick Petit | SIGGRAPH Asia 2019](https://www.youtube.com/watch?v=cRibpsJgVx0)
- [Entagma: New in Houdini 18: RBD Solver - Guided Simulation](https://www.youtube.com/watch?v=tKHawC_fZLs)
- [Houdini RDB Tutorial Playlist](https://www.youtube.com/playlist?list=PLD1NUdtJHVZnzITc9OFQURxwhtmAp32Xs)

## 2. Fluid-Implicit Particle (FLIP)

FLIP (Fluid-Implicit Particle) solvers are a type of fluid simulation technique used in visual effects (VFX) to create realistic water, lava, honey, blood, paint, chocolate, ... and many more fluild-like materials. They combine two methods: grid-based and particle-based simulations.

They combine two methods: grid-based and particle-based simulations:

- **Grid-Based Simulation**: Think of a grid as a 3D checkerboard that helps calculate the pressure and movement of the fluid. This grid ensures that the fluid behaves correctly and doesn't compress too much, maintaining its volume. This grid-based approach provides a structured framework for solving the Navier-Stokes equations, which govern fluid motion.

- **Particle-Based Simulation**: Particles are utilized to capture detailed motion and surface information within the fluid. They carry velocity and other attributes, allowing for the representation of complex behaviors such as splashes, waves, and intricate surface details. The particles help in reducing numerical dissipation, preserving the fine details of the fluid's motion over time.

#### Houdini Integration

Houdini's FLIP solver is a core component of its fluid simulation toolkit. By default, it operates on the CPU, but certain aspects of the solver can leverage GPU acceleration through OpenCL to enhance performance.

Additionally, Houdini's FLIP solver allows for integration with other solvers and forces. It contains an embedded POP (Particle Operator) solver, enabling the use of POP forces by connecting them into the Particle Velocity input or inline below any Volume Source emitters. This flexibility allows for the combination of different simulation techniques to achieve complex effects.

### Links

See the following links for more info:
- [Houdini Docs: Flip Solver](https://www.sidefx.com/docs/houdini/nodes/dop/flipsolver.html)
- [INDIAN VFX SCHOOL: White Water Simulation Course - Basic To Advanced](https://www.youtube.com/watch?v=f_KqILuBtgs&list=PLe2s57SAKpD_eM0zGpBtQeRTaOn1YISBv)
- [What I Found: Houdini Retime FLIP Sim -- Short Version](https://www.youtube.com/watch?v=2okztk2OTmY)
- [Entagma: Guest Tutorial: Meshing Small Scale Flip Sims](https://www.youtube.com/watch?v=HcBxUj4yGQ4&list=PL_SQGC2hOGpuJdP-ejXF1Vw-Y03Fb_3DM)
- [Entagma: Using Houdini To Simulate Paint Smearing](https://www.youtube.com/watch?v=8TvAe3GxNFs)
- [Houdini Tutorial: Speed up fluid simulation using opencl](https://www.sidefx.com/tutorials/speed-up-fluid-simulation-using-opencl/)
- [Houdini Tutorial: FLIP-Pyro Interaction](https://www.youtube.com/watch?v=NNg2Gw3wliQ)

## 3. Finite Element Method (FEM)

The Finite Element Method (FEM) is a numerical simulation technique used to solve problems in engineering and physics, particularly those involving stress, strain, and deformation of solids. FEM divides a continuous object into discrete finite elements, typically tetrahedra (3D), creating a mesh that approximates the geometry of the object. Each element is connected to its neighbors at shared nodes, and the solver computes how external forces cause stress and strain within these elements.

FEM is grounded in physics, solving equations derived from continuum mechanics. It is computationally intensive but highly accurate for simulating material deformation, elasticity, plasticity, and even fracture.

### Use Cases for FEM

#### General:

- **Soft-body simulations**: Simulating the deformation of objects like rubber, gelatin, or tissue.
- **Structural analysis**: Testing how materials respond to stress and strain.
- **Fracture and tearing**: Creating realistic material breaking and tearing under load.
- **Biomechanics**: Modeling muscles, ligaments, and organic tissue.

#### Houdini:

- **Character effects**: Muscle and skin simulations for realistic animation.
- **Deforming objects**: Accurate modeling of bending or stretching materials, such as bending pipes or smashing cars.
- **Destruction**: Creating advanced fracture effects that account for internal stress and material properties.

### What FEM is Not

- FEM is not a particle-based method (like FLIP or MPM); it operates on a continuous mesh.
- It is not suited for granular simulations or fluids, as it focuses on the deformation of solids.
- FEM is not ideal for real-time applications due to its high computational cost.

### Houdini Integration

Houdini's FEM implementation is based on a tetrahedral mesh (tet mesh) to simulate deformable solids like rubber, tissue, or metal. The solver supports complex material properties and can model behaviors like stretching, bending, and tearing.

- **Mesh Preparation**: Houdini requires geometry to be converted into a tet mesh. Tools like the Tet Conform and Tet Embed SOPs ensure the geometry is volumetrically represented for FEM calculations.

- **Material Assignment**: Materials in Houdini are defined by properties such as elasticity (how much it can stretch), damping (how much it resists motion), plasticity (permanent deformation), and density (mass per unit volume). These properties govern how the object reacts under applied forces, such as stretching, bending, and tearing.

- **Simulation in DOPs**: The Finite Element Solver is used in Houdini's DOP (Dynamic Operators)context to simulate behavior under external forces and collisions. You can combine FEM simulations with other solvers for hybrid effects.
  - It's possible to combine the Finite Element Method (FEM) solver with other solvers to create complex, multi-physics simulations. This integration allows for interactions between different types of materials and behaviors within a single simulation environment.
  - Houdini's Multi-Solver node facilitates the combination of different solvers within a single DOP (Dynamics Operator) network. By connecting multiple solvers to the Multi-Solver, you can define how various simulation aspects interact during each timestep. However, it's essential to note that not all solver combinations are straightforwar

### Limitations of FEM

- **High Computation Cost**: FEM is computationally intensive, requiring fine tet meshes and small time steps for stability and accuracy.
- **Complex Setup**: Preparing tet meshes and assigning material properties can be tedious and error-prone.
- **In Houdini**:
  - FEM simulations can be slow compared to Vellum or RBD solvers.
  - Stability issues may arise with very thin or irregular geometry.
  - GPU acceleration is not natively supported for FEM, making simulations slower on large meshes.

### Links

See the following links for more info:

- [Houdini Docs: FEM Solver](https://www.sidefx.com/docs/houdini/nodes/dop/femsolver.html)
- [Houdini Tutorials: FEM Compression Simulation](https://www.sidefx.com/tutorials/fem-compression-simulation/)
- [Houdini Tutorials: Rope Simulation Using FEM](https://www.sidefx.com/tutorials/rope-simulation-using-fem/)
- [Houdini Tutorials: Softbody FEM Workflow Tips](https://www.sidefx.com/tutorials/soft-body-fem-workflow-tips-emily-fung-toronto-houdini-user-group-thug-january-2020/)
- [Howiseedat: Houdini Tutorial FEM Solver](https://www.youtube.com/watch?v=cTyx5hKbqcQ)

## 4. Position-Based Dynamics (PBD)

Position-Based Dynamics (PBD) is a simulation technique that resolves constraints on positions rather than forces. Instead of solving differential equations derived from physics (as FEM does), PBD iteratively adjusts object positions to satisfy constraints, like distance, stretch, or collision avoidance. This makes PBD highly stable, fast, and art-directable, but less physically accurate. Offering significant control to artists, but it trades physical accuracy for speed and ease of use.

### Key features of PBD:

- **Stability**: PBD is inherently stable, making it well-suited for simulations where plausible behavior is prioritized over exact physical realism.
- **Simplicity**: The iterative constraint-solving approach is relatively straightforward to implement, enabling fast computation.
- **Flexibility**: It can handle a wide range of simulation types, including cloth, soft bodies, and granular materials. The Vellum solver is optimized for performance, but large-scale simulations (e.g., high-resolution cloth or dense granular systems) may require careful optimization.

### Houdini Integration (Vellum)

Houdini’s Vellum Solver is built on PBD principles and provides an intuitive workflow for simulating cloth, hair, grains, and soft bodies. Vellum combines stability and speed with artistic control, making it a go-to choice for many simulations in games and VFX.

### Use Cases for PBD

#### In Houdini (Vellum):

- **Cloth**: Simulate realistic fabrics with stretch, bend, and collision constraints.
- **Hair**: Efficiently simulate hair and fur, including self-collision and interaction with other objects.
- **Soft Bodies**: Create squishy, deformable objects like balloons or cushions with a blend of volume preservation and elasticity.
- **Granular Materials**: Simulate sand, snow, or other particulate materials using grain constraints.

#### Outside Houdini:

- **Game Engines**: Real-time simulations of cloth, hair, and character physics, where performance is critical.
- **Interactive Applications**: Simulations for virtual reality or augmented reality, where speed and stability are more important than accuracy.

### What PBD is Not

- **Not Physically Rigorous**: Unlike FEM, PBD does not compute forces or stress/strain; it simplifies physics for speed and stability.
- **Not Ideal for High-Precision Needs**: PBD cannot accurately replicate behaviors like metal fatigue, detailed stress-strain deformation, or fluid dynamics.
- **Limited to Position-Based Operations**: It’s not well-suited for solving dynamic systems driven by energy conservation, such as fluid flows or thermal simulations.

### FEM vs. PBD in Houdini

| **Aspect**           | **FEM**                                       | **PBD (Vellum)**                                 |
|----------------------|-----------------------------------------------|--------------------------------------------------|
| **Accuracy**         | High (physics-based)                          | Moderate (constraint-based)                      |
| **Performance**      | Slower (CPU-intensive)                        | Faster (optimized for performance)               |
| **Use Case**         | Realistic soft-body deformation, stress-strain analysis | Art-directable cloth, hair, and soft-body setups  |
| **Ease of Use**      | Requires tet meshing, more complex setup      | Simpler, especially with SOP-level integration    |
| **Interactions**     | Works well with forces and physics-driven simulations | Highly interactive, less dependent on physical laws |
| **Examples in Houdini** | Muscle simulation, detailed material tearing | Cloth, hair, grains, and low-complexity soft bodies |

### Links

- [Houdini Docs: Vellum](https://www.sidefx.com/docs/houdini/vellum/index.html)
- [Project 50: Houdini Vellum tutorials](https://www.youtube.com/playlist?list=PLt4A5rjDfosWhgsxvV1fj2xmTkwXppl9W)
- [Houdini Tutorials: Vellum Beginners Guide](https://www.sidefx.com/tutorials/vellum-beginners-guide/)
- [PhysX 5 Docs: PBD](https://nvidia-omniverse.github.io/PhysX/physx/5.5.0/docs/GPURigidBodies.html#pdb-particle-systems)

## 5. Discrete Element Method (DEM)

The Discrete Element Method (DEM) is a numerical simulation technique used to model granular and particulate materials. It treats each particle (grain, pebble, etc.) as a discrete entity and computes interactions such as collisions, friction, and cohesion between individual particles. DEM is particularly effective for simulating granular flows, soil mechanics, and materials that consist of large numbers of individual particles.

### Key Features of DEM:

- **Particle-Based**: Each particle is modeled as an individual entity with its own position, velocity, and rotation.
- **Collision Detection**: Tracks interactions between particles using contact mechanics, including frictional and cohesive forces.
- **Granular Behavior**: Models materials like sand, snow, gravel, or powders realistically, including pile formation, avalanches, or flow dynamics.
- **Non-Continuum**: Unlike FEM or PBD, DEM does not approximate materials as continuous; it explicitly resolves interactions between particles.

### Use Cases for DEM

### Common Applications:

- **Granular Flow**: Simulating sand, gravel, or soil moving under gravity, as in landslides or hourglass effects.
- **Powders and Particles**: Modeling industrial processes like powder mixing, material transport, or bulk handling.
- **Geomechanics**: Analyzing soil behavior, pile driving, or foundations for civil engineering.
- **Snow and Avalanches**: Realistic simulations of snow accumulation and flow dynamics.

### In Houdini:

- DEM-like approximations in Houdini are often used for visual effects involving sand piles, scattering debris, or granular flows.
- Combining Vellum grains or POP solvers with custom forces allows for creative control over granular materials in Houdini's simulation pipeline.

### Houdini Integration

Houdini does not currently offer a native DEM solver; however, granular simulations in Houdini can approximate some aspects of DEM using the Vellum Grains Solver or the POP Solver. These tools are not true DEM solvers but can be creatively used to simulate granular materials with reasonable accuracy for visual effects.

#### Approximation with Vellum Grains:

- **Vellum Grains** uses Position-Based Dynamics (PBD) to handle granular materials like sand or snow. While not physically rigorous like DEM, it provides fast and stable simulations that are highly art-directable.

- **Collision Handling**: Interactions between grains and objects can mimic some DEM behaviors, but detailed particle-particle forces (e.g., cohesion or angular momentum transfer) may require additional customization.

### What DEM is Not

**Not a Fluid Solver**: DEM does not simulate continuous materials like liquids or gases (though it can be combined with fluid solvers for multiphysics scenarios).

- **Not Real-Time**: DEM simulations are computationally expensive and rarely suitable for real-time applications without heavy approximations.

- **Not a Substitute for FEM or PBD**: DEM excels at modeling particulate systems but cannot handle continuum mechanics like deformation or stress-strain relationships in solids.

### Limitations of DEM

- **High Computational Cost**: Simulating large numbers of particles (thousands to millions) requires significant computational power, especially with complex collision and cohesion modeling.
- **Scaling Challenges**: The performance bottleneck increases with particle count, making large-scale simulations difficult without heavy optimization.
- **Setup Complexity**: DEM simulations often require careful tuning of particle properties (e.g., mass, friction, cohesion) and solver parameters.
- **Lack of Native Houdini Support**: Houdini lacks a true DEM solver, so achieving DEM-level fidelity requires workarounds or external tools.
- **Limited to Granular Systems**: DEM is specifically designed for particulate systems and is not suitable for simulating deformable solids or continuous fluids.

### Links

- [Algoryx: Granular simulation in AGX Dynamics - Overview](https://www.youtube.com/watch?v=7OA-54FNYVQ)
- [Altair: EDEM Applications](https://altair.com/edem-applications/)
- [graphicINmotion: Understanding Vellum Grains Simulation Basics](https://www.youtube.com/watch?v=cw-4trw2TNY)
- [Houdini Docs: Vellum configure grains](https://www.sidefx.com/docs/houdini//vellum/configuregrains.html)

## 6. Material Point Method (MPM)

The Material Point Method (MPM) is a hybrid simulation technique that combines particle-based and grid-based methods to model complex materials. It is particularly effective for simulating materials that transition between solid and fluid states, such as snow, mud, foam, or slush. MPM tracks material properties using particles, but computational operations (like stress calculations) are performed on a grid, making it highly versatile and stable for a wide range of materials.

### Key Features of MPM:

- **Hybrid Nature**: Combines particles (for material representation) and grids (for solving equations) to achieve stability and detail.
- **Material Versatility**: Handles elastoplastic materials, granular flows, and even multiphase materials (e.g., mixtures of solids and fluids).
- **State Transitions**: Captures the behavior of materials transitioning between solid and fluid, like snow melting or sand liquefying.
- **Stress and Strain**: Can compute stress-strain relationships, making it suitable for materials that deform or fracture.

### MPM vs. Other Solvers: Key Comparisons

- **State Transitions**:
  - MPM excels at solid-to-fluid transitions (e.g., snow melting, sand liquefying).
  - Other solvers like FLIP (fluid-focused) or FEM (solid-focused) cannot handle mixed-state materials as effectively.
- **Stress-Strain Modeling**:
  - MPM computes internal forces and deformation gradients, making it ideal for materials that deform, fracture, or flow plastically.
  - FLIP lacks stress-strain modeling, and PBD simplifies physics for speed.
- **Material Versatility**:
  - MPM is perfect for hybrid materials like snow, mud, or wet sand, where behaviors change dynamically.
  - DEM handles granular materials explicitly but struggles with fluid-like behaviors; FEM is better for purely solid deformation.
- **Grid-Particle Hybrid**:
  - Particles store material properties, while grids handle computational steps (forces, collisions). This ensures stability during extreme deformations and complex interactions.
- **Realistic Phase Behavior**:
  - MPM captures phase transitions between states, unlike FLIP (fluid-only) or DEM (particle-only).

### Houdini Integration

Houdini’s MPM solver is fully GPU-accelerated using OpenCL, allowing for efficient and detailed simulations of complex materials. This makes it a strong choice for effects requiring detailed interactions between particles and physical forces.

#### Use Cases in Houdini:

- **Snow and Slush**: Detailed simulations of snow accumulating, compressing, and transitioning to slush.
- **Mud and Soil**: Realistic interactions of wet or dry soil with other objects.
- **Foam and Elastoplastic Materials**: Simulate materials that deform under stress but retain or regain their structure.

### Other Integrations and Software Supporting MPM

MPM has gained traction in both VFX and scientific research, and several tools and libraries provide robust MPM solvers:

- **Taichi**: A popular open-source MPM library designed for high-performance simulations.
- **Disney’s Hyperion Pipeline**: MPM has been used internally for films to simulate materials like snow and sand.
- **Custom Implementations**: Many studios implement proprietary MPM solvers for specific use cases.

### What MPM is Not

- **Not a Real-Time Solver**: MPM is computationally intensive and is not suitable for real-time applications like games or VR.
- **Not a Fluid Solver**: While it can simulate fluid-like behaviors, dedicated fluid solvers like FLIP or SPH are better suited for pure liquid simulations.
- **Not a Rigid Body Solver**: MPM excels at soft or transitioning materials, but rigid body interactions are typically handled by other solvers.

### Limitations of MPM

- **Computationally Intensive**: MPM simulations require significant computational power, especially for high-resolution simulations.
- **Grid Resolution**: The accuracy and detail of the simulation depend heavily on the resolution of the computational grid, which can lead to high memory usage.
- **Setup Complexity**: MPM requires careful tuning of material properties (e.g., elasticity, plasticity) to achieve realistic results.
- **Lack of Generalized Tools**: While Houdini offers GPU-accelerated MPM, many other software packages either lack native support or require external libraries for MPM simulations.
- **Limited Real-Time Applications**: MPM’s computational demands make it impractical for real-time effects without heavy approximations.

### Links

- [Houdini Docs: MPM](https://www.sidefx.com/docs/houdini/mpm/index.html)
- [Houdini Tutorials: MPM Masterclass](https://www.sidefx.com/tutorials/mpm-h205-masterclass/)
- [INDIAN VFX SCHOOL: Houdini 20.5 MASTERING MPM - Part 1 - Basic Setup](https://www.youtube.com/watch?v=VMstxK6Xl0s)
- [Houdini: Adventures in MPM-land: the Fine Art of Balancing Numbers | Anse Vandevelde | Houdini Horizon](https://www.youtube.com/watch?v=j4cFhX2KXro&t=16s)