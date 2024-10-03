## Image Views

An image view is an object that provides an interface between an image resource and the pipeline that uses it. While an image represents the actual memory storage for image data, an image view describes how that data should be accessed and interpreted by the rendering pipeline. Image views can be used in both read and write operations within the graphics pipeline.

Here are some examples of how image views can be used for both reading and writing:

- **Read**: Image views are used as shader resources, such as textures or uniform data. In this case, the image view is read by the shader stages (e.g., vertex, fragment, or compute shaders) to access the image data during rendering or compute operations.

- **Write**: Image views are used as render targets, such as color, depth, or stencil attachments. In this scenario, the image view is written to by the graphics pipeline during the rendering process. The pipeline writes color, depth, and stencil information to the corresponding attachments in the framebuffer, which are represented by image views.

## Uniform Buffers

Uniform Buffers are a way of passing data from your application to the shaders on the GPU. The "uniform" term indicates that the data does not change, thereby providing consistency across the shaders. This could be data like transformation matrices, light information, or other data that is the same for all vertices and fragments of a single draw call.

The key thing to remember about Uniform Buffers is that they should not be updated while they are in use. That means if you're rendering an image, you shouldn't update the Uniform Buffer until the image is done rendering.

## Descriptors

A descriptor is an object in Vulkan that provides an abstract way to reference resources, such as buffers or images, that are used by shaders in a rendering pipeline. Descriptors act as a **bridge between the application and the shader**, enabling the shader to access the data it requires for rendering. 

Essentially, a descriptor represents a single binding within the shader and how to access the data.

Descriptors can refer to different types of resources, such as:

- **Buffers**: Descriptors can reference buffer resources like uniform buffers, storage buffers, or dynamic uniform/storage buffers. These buffers are typically used for providing per-object or global data to shaders, such as transformation matrices, material properties, or other shader-specific data.

- **Images**: Descriptors can reference image resources like sampled images, storage images, or input attachments. These image resources are used for various purposes, such as textures, render targets, or attachments used in a render pass.

- **Samplers**: Descriptors can reference sampler objects that define how an image should be sampled, including filtering modes, addressing modes, and other properties related to texture sampling.

## Descriptor Set, Layout and Pool

In Vulkan, descriptor sets, descriptor set layouts, and descriptor pools are used to manage and organize resources (such as buffers and images) that shaders need to access during rendering. They exist to facilitate the efficient and organized binding of resources to shaders, ensuring that the GPU can access those resources with minimal overhead.

### Descriptor Set 

A descriptor set bundles together multiple descriptors into a set that can be bound to the pipeline for use by shaders. Each set refers to a specific resource (e.g., buffer, image, or sampler). A descriptor set can be thought of as a resource binding table, where each entry points to a specific resource.

Importantly, these descriptor sets can only be created using a `Descriptor Pool`, which manages the memory that backs these descriptors.

### Descriptor Set Layout

At the time of pipeline creation, descriptor set layouts need to be defined. This layout specification is essential as it tells the pipeline what kind of descriptor sets (and thus, what resources) to expect when it's running. It acts as a blueprint for creating descriptor sets and defines the binding points used by shaders to access resources. 
Each pipeline stage that will access a descriptor set needs to have a matching layout in the pipeline layout.

The descriptor set layout is used to ensure that both the application and the shaders have a consistent understanding of how resources are organized and accessed. When creating a pipeline layout, you define an array of descriptor set layouts, which informs the pipeline about the expected resource bindings.

### Descriptor Pool

A descriptor pool is a memory pool from which descriptor sets are allocated. It is created with a specific configuration that defines the maximum number of descriptor sets and individual descriptors it can hold, based on the different descriptor types (e.g., uniform buffer, sampled image, storage buffer). The descriptor pool allows for efficient memory allocation and management of descriptor sets, as it allocates memory in large chunks and avoids fragmentation.

These components exist and are used for the following reasons:

-  **Organization**: Descriptor sets and descriptor set layouts help organize shader resources in a structured manner, making it easier to manage and update resources throughout the rendering process.

-  **Efficiency**: Descriptor pools enable efficient memory allocation and management for descriptor sets, minimizing memory fragmentation and reducing resource allocation overhead.

-  **Flexibility**: Using descriptor sets and descriptor set layouts allows you to create multiple configurations of resource bindings, enabling you to switch between different sets of resources during rendering.

-  **Abstraction**: Descriptor sets, descriptor set layouts, and descriptor pools abstract the binding process, allowing you to create and manage resources in a platform-agnostic manner, without worrying about the specific details of the underlying GPU hardware.

## Binding Descriptor Sets

Prior to issuing a draw call or dispatching compute commands, you need to bind the descriptor set to the command buffer. The binding operation indicates that the resources in the set are ready to be used in a draw or compute operation. This binding has to be done for each command buffer that uses the descriptor set.

It's important to note that the descriptor set, pipeline, and layout must all be compatible, i.e., they must all agree on the number and type of resources being used. If they don't match, an error will occur.

## Descriptors Summary

1. `Descriptor` points to a resource
	- For example an image descriptor points to an image resource
2. Descriptors are grouped using `Descriptor Set`
	- They can only be created using a `Descriptor Pool`
3. At pipeline creation time, `Descriptor Set Layouts` need to defined to give an idea to the pipeline what to expect
4. Bind `Descriptor Set` before the draw call