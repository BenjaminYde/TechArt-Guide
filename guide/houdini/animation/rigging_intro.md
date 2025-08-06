# Rigging Introduction

## What is Rigging?

Imagine you have a 3D model, like a character or an object, and you want to make it move for an animation or a game. How do you do that? That's where 3D rigging comes in.

### What is Rigging? It's Like Giving Your Model an Invisible Skeleton

Think of 3D rigging as building an invisible skeleton inside your 3D model. This skeleton, often called a "rig," is what defines how the different parts of your model can bend, twist, stretch, and move.

**Joints as Bones**: "Joints" are the main parts of the rig that act just like the bones in a real skeleton. They provide the structure and pivot points for movement.

**Nulls/Groups as Cartilage & Controls**: "Nulls" or "groups" can act like the cartilage around joints, helping to define how much a joint can move or rotate. More importantly, nulls are often used to create easy-to-use "controllers."

**Why Controllers are Great**: Imagine trying to animate a character's hand. Instead of trying to grab and move each tiny finger joint directly, an animator can use a controller designed for the hand. This controller might be a simple shape that, when moved or rotated, controls all the finger joints in a natural way. This makes it much easier and faster for an artist to bring the model to life.


### Making the Skeleton and Model Work Together

**Logical Connections (Parenting)**: For the rig to work correctly, all these joints and controllers need to be connected in a sensible order. For example, a hand joint is connected to an arm joint, which is connected to a shoulder joint. This linking is often called "parenting."

**Convincing Movement (Binding to a Mesh)**: Once this internal skeleton is built and connected, it needs to be "bound" to the actual 3D model (the "mesh" or the "skin" of the character). This binding process tells the model's surface how to move when the underlying skeleton moves. When done well, this allows for very realistic and convincing motion, especially for organic things like people or animals.

**Not Just for Creatures**: Rigging isn't limited to characters. It's incredibly useful for anything with moving parts, like cars (opening doors, spinning wheels), robots, or machinery. Controllers are especially valuable here to manage all the mechanical actions.