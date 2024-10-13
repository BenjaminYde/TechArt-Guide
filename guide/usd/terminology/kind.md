# Kind

**Definition**: In OpenUSD, kind is a way to classify objects (prims) into categories that go beyond the basic object type (like geometry or light). Think of kind as a way to assign roles to objects, helping to organize and manage complex scenes.

USD’s **Model Hierarchy** is built on this idea of kind and provides a way to efficiently discover and organize important objects within a scene. Here's how it works, explained simply:

USD provides a hierarchy of kinds that help define **models** (collections of objects) in a scene.

## Key Types of Kinds:

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

## Example

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

## Why This Matters

The model hierarchy simplifies the process of navigating, organizing, and referencing objects in USD scenes. Instead of having to manually track which assets are grouped or how they’re related, the hierarchy helps the scene "self-organize," especially when models are referenced from external files.

#### Benefits:

- **Efficient scene management**: You can quickly find and manipulate large parts of the scene, like moving all vehicles in the city.
- **Clear relationships**: The hierarchy helps define how assets relate to each other, making it easier to work with complex models.
- **Modularity**: You can reference different parts of the scene (like the car assembly) as needed and manipulate them independently.