# MaterialX

## What is MaterialX

MaterialX is an open standard for representing rich material and look-development content in computer graphics, enabling its platform-independent description and exchange across applications and renderers. Launched at Industrial Light & Magic in 2012, MaterialX has been a key technology in their feature films and real-time experiences since Star Wars: The Force Awakens and Millennium Falcon: Smugglers Run. The project was released as open source in 2017, with companies including Sony Pictures Imageworks, Pixar, Autodesk, Adobe, and SideFX contributing to its ongoing development. In 2021, MaterialX became the seventh hosted project of the Academy Software Foundation.

### Origin:

MaterialX was developed to tackle the challenge of transferring complex material definitions between various tools that are typically used in a visual effects (VFX) pipeline. Given that studios use a myriad of software for modeling, animation, and rendering, it became necessary to have a standard format that could encapsulate material attributes in a way that was both application and renderer agnostic.

### Development Purpose:

The core purpose behind the development of MaterialX is to enable the interoperability of visual effects and look-development data among various software applications. This includes textures, shading graphs, and geometric assignments. With MaterialX, artists and engineers can create materials that can be faithfully transferred between different systems without the need to manually rebuild materials or shaders, thus saving time and preserving creative intent.

### Adoption and Industry Impact:

MaterialX is becoming increasingly important in the VFX and animation industries. Its importance is underlined by its adoption by major software vendors and studios, which is facilitated by the fact that it is an open standard, making it accessible and modifiable according to specific production needs.

With the rise of physically based rendering (PBR) and the need for highly complex and portable material definitions, MaterialX serves as a critical component in modern production pipelines. Its development is ongoing, with contributions from a community of users and organizations who are invested in the evolution of this standard to keep up with the growing demands of the industry.

## PBR Workflow

MaterialX utilizes a PBR (Physically Based Rendering) metallic workflow. This workflow is designed to provide a more realistic representation of materials by using physical principles to model the interaction between light and materials. In the metallic workflow, materials are categorized into either metallic or non-metallic, and the parameters such as base color, metalness, and roughness are used to define the appearance of the material. This contrasts with the specular workflow which uses parameters like diffuse color, specular color, and glossiness to define material appearance.

## MaterialX in Houdini

#todo

[MtlX Standard Surface (sidefx.com)](https://www.sidefx.com/docs/houdini/nodes/vop/mtlxstandard_surface.html)