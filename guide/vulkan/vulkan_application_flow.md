Using Vulkan in an application involves several steps, from initializing the API and setting up resources to rendering and presenting the final output. Here's an overview of the typical application flow when using Vulkan:

#todo 

https://subscription.packtpub.com/book/application-development/9781786469809/2/ch02lvl1sec16/fitting-it-all-together

# Engine Initialization

## Vulkan API Initialization

- Load the Vulkan library using a tool like cmake

- Create a Vulkan instance with desired layers and extensions. Using `VkInstance`, an object that represents the entire Vulkan environment within a process. It serves as the main entry point for creating and managing Vulkan objects, including devices, queues, and surfaces.

## Surface creation

- Create a surface for rendering, which represents the target window or display for the application. This can be done using libraries like SDL or a more lightweigth version like GLFW.

## Physical and Logical Device creation

- From the instance, query the available physical devices (GPUs) available on the machine and choose a suitable one based on the application's requirements. Using `VkPhysicalDevice`, you can query the GPUs names, properties, capabilities, etc.
	- For example, if the computer had both a dedicated GPU and integrated graphics, there would be a `VkPhysicalDevice` for each.

- With a `VkPhysicalDevice`, you can create a `VkDevice`. The `VkDevice` is your main handle and it represents a logical connection - i.e. 'I am running Vulkan on this GPU'.
	- A **logical device** is your interface to the GPU, and allows you to allocate data and queue up tasks.
	- When creating a logical device, you will check for: 
		- Suitable device properties`
		- Suitable device features`
		- Suitable queue families (groups of command queues in a GPU that have specific capabilities and characteristics.)
		- Suitable device extensions
	- Retrieve handles to the device queues for graphics, compute, and presentation tasks.

Each of these is a 1-to-many relationship. A `VkInstance` can have many `VkPhysicalDevices`, a `VkPhysicalDevice` can have many `VkDevices`

## Swapchain creation

A swapchain in Vulkan is a collection of image buffers used for presenting rendered images to a display surface, such as a window or a monitor. The swapchain enables efficient double or triple buffering, which reduces screen tearing and stuttering by allowing the GPU to render to a different image buffer while the previous buffer is being presented on the screen.

- **Query the surface capabilities** and supported formats to determine the appropriate parameters for the swapchain. This includes checking for supported image formats, color spaces, and presentation modes, as well as the minimum and maximum number of images the swapchain can hold.

- **Choose the swapchain properties** based on the queried surface capabilities, you need to choose the properties for your swapchain, such as:
	-   The image format and color space: The format determines the number of color channels and their precision, while the color space defines the range of colors that can be displayed.
	-   The presentation mode: This determines how images in the swapchain are presented on the screen. Common presentation modes are immediate, FIFO, mailbox, and relaxed FIFO.
	-   The number of images in the swapchain: This is typically 2 (double buffering) or 3 (triple buffering), but it depends on the surface capabilities and your application's needs.

- **Create a swapchain** with the chosen properties that manages the images to be presented to the surface.

- **Retrieve the swapchain images**: After creating the swapchain, you need to retrieve the image buffers it contains. You can then use to create image views and framebuffers for rendering.

-  **Create image views and framebuffers**: For each swapchain image, create an image view (read/write) that describes how the image data should be accessed and interpreted by the pipeline. Image views are necessary for using images as render targets or shader resources.  After creating image views, create framebuffers that attach the image views as color attachments, which will be used for rendering.

# Graphics Pipeline Creation

In Vulkan, a pipeline is a series of programmable and fixed-function stages that define how the graphics or compute operations are performed. A pipeline describes the entire process of rendering a scene or performing a compute task, including how the input data is processed, the operations applied to the data, and how the results are written to render targets or memory.

The graphics pipeline in Vulkan is set up by creating a `VkPipeline` object. It describes the configurable state of the graphics card.

The following things need to be setup when creating a `VkPipeline`:

- Shader stages
	- Specify the shader modules (vertex, fragment, geometry, tessellation control, tessellation evaluation) used in the pipeline, along with their entry points.
- Vertex input
	- Define the format and layout of the vertex data used in the pipeline.
- Input assembly
	- Specify how the vertices are assembled into primitives (e.g., triangles, lines, points).
- Viewport and scissor
	- Define the viewport and scissor test configuration.
- Rasterization
	- Configure the rasterization process, such as polygon mode (fill, line, or point), face culling mode, and depth bias.
- Multisampling
	- Set up the multisampling parameters, such as sample count, sample mask, and alpha-to-coverage settings.
- Depth and stencil testing
	- Configure the depth and stencil testing parameters.
- Color blending
	- Define how the final color values are blended with the existing values in the framebuffer.
- Dynamic state
	- Specify which pipeline states can be changed dynamically during command buffer recording without recreating the pipeline.
- Pipeline layout
	- Define descriptor set layouts that describe the resource bindings used by shaders (e.g., uniform buffers, textures, samplers).
- Render pass
	- Specify the render pass and subpass index that the pipeline is compatible with, which determines the framebuffer attachments, their formats, and the load/store operations.

One of the most distinctive features of Vulkan compared to existing APIs, is that almost all configuration of the graphics pipeline needs to be set in advance. That means that if you want to switch to a different shader or slightly change your vertex layout, then you need to entirely recreate the graphics pipeline.

## Command buffer creation and recording

Commands in Vulkan, like drawing operations and memory transfers, are not executed directly using function calls. You have to record all of the operations you want to perform in command buffer objects. The advantage of this is that when we are ready to tell the Vulkan what we want to do, all of the commands are submitted together and Vulkan can more efficiently process the commands since all of them are available together. In addition, this allows command recording to happen in multiple threads if so desired.

A `VkCommandBuffer` isn't created directly, it is allocated from a `VkCommandPool`. When executing a draw command, command buffers are submitted to a `VkQueue`.

# Render loop

- Wait until previous frame is finished
- Acquire an image from the swapchain to render to.
- Submit the recorded command buffers to the graphics or compute queue, specifying the appropriate synchronization primitives (e.g., semaphores, fences).
- Present the rendered image to the surface using the presentation queue.

Repeat these steps for each frame, updating any dynamic data or resources as needed.

## Cleanup

- Wait for the device to finish all outstanding operations.
- Destroy resources, pipelines, descriptor sets, command buffers, and other Vulkan objects.
- Destroy the swapchain, surface, and logical device.
- Terminate the Vulkan instance and unload the library.
- This overview provides a high-level understanding of the typical application flow when using Vulkan. Each step involves various detailed configurations and API calls. The complexity and flexibility of Vulkan allow developers to create highly optimized rendering and compute pipelines tailored to their application's specific requirements.

# Vulkan Main Objects

-   `VkInstance` : The Vulkan context, used to access drivers. Represents the connection between the application and the Vulkan runtime. It is used to query available physical devices and their properties, as well as to create logical devices.

-   `VkPhysicalDevice` : Represents a physical GPU or device in the system. It is used to query device properties, features, queue families, and supported extensions, memory size, etc.

-   `VkDevice` : Represents a logical device, created from a physical device. It is used to manage GPU resources, create pipelines, allocate memory, and create command buffers. Here you actually execute things on.

-  `VkQueue` : Represents a device queue used to submit rendering or compute commands. Queues are organized into families based on their capabilities, such as graphics, compute, or presentation. GPUs will have a set of queues with different properties. Some allow only graphics commands, others only allow memory commands, etc. Command buffers are executed by submitting them into a queue, which will copy the rendering commands onto the GPU for execution. 

- `VkCommandPool`:  This is a simple object that is used to allocate CommandBuffers. It’s connected to a specific Queue Family.

-  `VkCommandBuffer` : This is allocated from a specific CommandPool. It represents a buffer of various commands to be executed by a logical Device. They are used to specify the order, type and parameters of tasks that should be performed when the CommandBuffer is submitted to a Queue and is finally consumed by the Device.

- `VkPipeline`: Encapsulates the complete state for a rendering or compute operation, including shader stages, input assembly, rasterization, and other settings.

-  `VkRenderPass` : Describes the structure of a rendering pass, including the attachments (color, depth, stencil), their formats, and the load/store operations.

-   `VkImage` : A texture you can write to and read from.

-   `VkBuffer` : Represents a region of memory that can store various types of data, such as vertex data, index data, uniform data, or staging data for transferring to other resources.

-   `VkFrameBuffer` : Holds the target images for a renderpass.

-   `VkDescriptorSet` : Contains bindings to resources (buffers, images, samplers) used by shaders in a pipeline such as `VkBuffer` resources and `VkImage` textures. Think of it as a set of gpu-side pointers that you bind once.

-   `VkSwapchainKHR` : Holds the images for the screen. It allows you to render things into a visible window. The `KHR` suffix shows that it comes from an extension, which in this case is `VK_KHR_swapchain`

-   `VkSemaphore` : Synchronizes GPU to GPU execution of commands. Used for syncing multiple command buffer submissions one after other.

-   `VkFence` : Synchronizes GPU to CPU execution of commands. Used to know if a command buffer has finished being executed on the GPU.