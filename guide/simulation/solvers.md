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