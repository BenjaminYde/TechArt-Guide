## Introduction

Vulkan graphics rendering is organized into render passes and subpasses. It represents a collection of graphics operations that read from and write to images, typically with the purpose of rendering a scene to a final frame buffer.

Render passes are crucial for defining how images are read and written, and they enable efficient use of GPU resources by providing a clear structure for the rendering process

Render passes are part of the larger rendering pipeline, which includes shaders, vertex buffers, and other elements. They define the overall structure of the image rendering process, from input attachments to output images.

## Render Pass Components

In Vulkan, **drawing commands** are organized into render passes. A render pass is a collection of subpasses that describes how image resources (color, depth/stencil, and input attachments) are used: what their layouts are and how these layouts should be transitioned between subpasses, when we render into attachments or when we read data from them, if their contents are needed after the render pass, or if their usage is limited only to the scope
of a render pass.

**Attachments** are image views that are used as inputs or outputs during the rendering process. They can be color, depth, or stencil attachments, depending on their intended use.

**Attachment descriptions** define the format, samples, load/store operations, and other properties of the attachments.

**Subpasses** are the individual stages within a render pass that perform specific rendering operations. Each subpass can read from input attachments and write to output attachments.

Subpass dependencies between subpasses specify the order of execution and synchronization requirements, ensuring correct data flow and avoiding hazards.

A **framebuffer** is an object that holds the actual image views used as attachments during a render pass. These attachments can be color, depth, or stencil buffers, depending on their intended use. Framebuffers provide the connection between the render pass and the memory locations where the image data is stored.

## Framebuffers

### Components of a framebuffer

**Color attachments**: These are image views that store color information. Typically, one or more color attachments are used to store the final rendered image or intermediate results during multi-pass rendering.

**Depth attachment**: This is an image view that holds depth information, used for depth testing to determine which fragments are visible or occluded in the final image.

**Stencil attachment**: This image view stores stencil information, which is used for stencil testing to control which fragments are rendered based on specific conditions.

### Framebuffer creation

To create a framebuffer, you'll use the `VkFramebufferCreateInfo` structure, which includes the following information:

- **Render pass**: The render pass that the framebuffer will be associated with. This connection ensures that the framebuffer is compatible with the specified render pass. 

- **Attachments**: An array of `VkImageView` objects that represent the color, depth, and stencil attachments. These image views define the format, dimensions, and other properties of the images. 

- **Width, Height, and Layers**: The dimensions of the framebuffer, which determine the size of the images being rendered. The number of layers is used for rendering to layered images, such as cubemaps or array textures.

