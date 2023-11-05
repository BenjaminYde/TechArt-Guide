## From CIE XYZ to RGB

The CIE XYZ color space was groundbreaking because it was based on human visual perception, but it was not directly usable for technology like television or computer displays. That's because XYZ doesn't represent real colors by tangible means; it represents color perception using a mathematical model.
#### Why RGB Was Needed

- **Device Implementation**: The primary colors of light are red, green, and blue (RGB), and they are also the base colors for electronic screens. Devices like cameras, monitors, and televisions use the RGB color model because it aligns with the way their hardware operates—through channels that emit or capture light in these primary colors.

- **Direct Control**: The XYZ color space is not intuitive for artists and designers to work with. RGB provides a more straightforward approach to creating colors by combining the primary colors in ways that are easy to visualize and manipulate.

- **Standardization**: With the advent of color television and later digital screens, there needed to be a standardized way of defining and transmitting color information that could be universally adopted by different manufacturers and industries.
## Understanding RGB in Depth
### The Science Behind RGB

The RGB color model is more than just a practical solution for technology; it's deeply rooted in the science of human color perception. Our eyes have three types of photoreceptors, each sensitive to different wavelengths of light corresponding roughly to red, green, and blue. This trichromatic vision is what RGB mirrors, enabling electronic devices to reproduce a wide spectrum of colors by blending these three primary colors in various intensities.
### RGB in Technology

In digital devices, each pixel is typically composed of three subpixels, one for each primary color. By varying the intensity of each subpixel from 0 (no light) to 255 (full intensity) in 8-bit color depth, it is possible to create over 16 million color combinations. This allows for precise color representation and is the reason why RGB is the cornerstone of color production in most modern technology.
### Advantages of RGB

- **Highly Intuitive**: For designers and artists, RGB's additive color mixing is a process that is intuitive and closely mimics the natural way we perceive light and color.

- **Wide Adoption**: RGB is the standard model used not just in displays but also in photography, digital imaging, and web design, ensuring consistency across different media.

- **Adaptability**: RGB adapts well to various technological 0applications, whether it's LED screens, CRTs, or LCD panels.
### Components of RGB
#### Primaries

The primaries in an RGB color space are the specific hues of red, green, and blue that the color space uses to create all other colors. In essence, they are the cornerstone colors and are defined by their chromaticity coordinates in the CIE 1931 color space. The combination of these primaries at different intensities can produce a wide range of colors. Each RGB color space has its unique set of primaries, and the choice of these primaries affects the range or gamut of colors that can be displayed or reproduced.
#### Chromaticity

Each primary color is defined by its chromaticity, which is a specification of its hue without regard to its luminance. The chromaticity coordinates are defined in a 2D color space, like the CIE 1931 xy chromaticity diagram, which maps the color's position based on its wavelength.
#### Whitepoint

The whitepoint of an RGB color space is the definition of white within that space. It is usually defined by a specific color temperature or a standard illuminant specified in the CIE 1931 color space. The whitepoint provides a reference for color balance; when colors are mixed together to create white, they should match this reference. The chosen whitepoint greatly affects how other colors are perceived and can impact the overall color balance of images. A common whitepoint is D65, which corresponds to the average midday light in Western Europe/Northern Europe and is used in sRGB and many other RGB color spaces.
#### Transfer Functions

Transfer functions, also known as gamma curves, describe how input signals (like voltage to a display or digital values in an image file) are converted into visible light (luminance). They are used to correct the nonlinear way in which our eyes perceive light and color, ensuring that the colors and brightness levels displayed are a true representation of the intended output. These functions are vital for consistent image reproduction across different devices, as they standardize how luminance is interpreted. The sRGB color space, for example, uses a specific transfer function that approximates a gamma of 2.2.
### Disadvantages of RGB
#### Lack of Standardization

The RGB model itself simply defines a color space in terms of three color primaries—red, green, and blue—and does not dictate the exact chromaticity of these primaries. This means that an RGB value like (255,0,0), which theoretically represents the purest form of red the device can produce, doesn't correspond to a precise color across different devices. This absence of a uniform method for translating RGB values into tangible color output led to inconsistency and unpredictability in color reproduction. For instance, a "red" might be oranger on one monitor and more burgundy on another.
#### Non-Uniformity Across Devices

Non-uniformity in the interpretation of RGB values is another substantial problem. It's not just that different brands interpret RGB differently, but even within the same brand, different models can interpret colors uniquely due to the use of different components and manufacturing processes. This results in a situation where a designer could not reliably predict how their work would appear on another device, even if they knew the exact RGB values used. In professional fields where precise color rendition is crucial, this lack of predictability was a major drawback.
#### No Reference White Point

The white point of a display refers to the color temperature of white on the screen. In the RGB model, because there is no standardized white point, two displays can have vastly different ideas of what "white" is. If one monitor has a white point that is 'cooler' (bluer, akin to daylight), and another has a 'warmer' (yellower, similar to tungsten light), then images will have a noticeably different color cast when viewed on each display, despite having identical RGB values.
## Gamma Variance

Gamma variance in the context of RGB color spaces refers to the differences in how various devices interpret the brightness of colors.
### Understanding Gamma

Gamma defines the relationship between the numerical value of a pixel and its actual luminance. Without a standard gamma, the same RGB value can result in a pixel that is lighter or darker on different displays. This lack of a standardized gamma response means that images can appear with correct or identical colors but with varying levels of contrast and brightness across different devices. This affects not only the lightness or darkness of an image but also the perceived saturation and mix of colors.

It defines the relationship between the voltage input to a display and the resulting intensity of the light output. In simpler terms, gamma correction ensures that the brightness of an image is perceived correctly by the human eye, compensating for a display's natural nonlinear response to a linear signal.
### The Role of Gamma in RGB

In an RGB color space, each color channel (Red, Green, and Blue) has a gamma value associated with it. When an image is displayed, the signal for each pixel's color intensity is raised to the power of the inverse of this gamma value. This nonlinear transformation is what makes the displayed image appear more visually accurate to human eyes, which do not perceive changes in darkness and light linearly.
### Variance of Gamma Across Devices

Gamma variance arises because different devices such as monitors, televisions, and cameras may use different gamma values for the same RGB color space. 

For instance: one monitor might use a gamma value of 2.2 and another monitor might use a gamma value of 1.8, which was commonly used in older Macintosh displays.

This difference in gamma means that the same image with the same RGB values could appear darker on the monitor with a gamma of 2.2 and lighter on the monitor with a gamma of 1.8.
### Consequences of Gamma Variance

The implications of gamma variance are significant when it comes to color reproduction:

- **Brightness and Contrast**: An incorrect gamma can either wash out the details in the light areas or crush the details in the darks, affecting the overall contrast of the image.

- **Color Balance**: Since gamma affects each of the RGB channels, a discrepancy can also lead to shifts in color balance, skewing the intended hues.

- **Matching Across Devices**: If you're working in a field that requires precise color matching across different devices, gamma variance can be a major issue. For instance, a photographer editing photos on a display with one gamma setting might find that the prints look significantly different because the printer interprets gamma differently.
### Addressing Gamma Variance

To manage gamma variance, professionals use calibration tools and standardized color spaces. These tools can adjust a display's gamma settings to match a predetermined standard (like sRGB, which specifies a gamma of approximately 2.2). By calibrating all devices in a workflow to the same gamma setting, one can achieve consistent brightness and color rendition across different devices.

![](./_Img/Gamma_Workflow.png)

**INPUT:** The graph represents an image in its initial encoded format as it comes from common file types.

**CONVERSION:** At this stage, the image undergoes a transformation to remove the initial encoding, which prepares it for accurate processing.

**CALCULATIONS:** Here, images are in a linear state that allows for precise lighting calculations and other image manipulations.

**OUTPUT:** After processing, the images are saved in a linear format that preserves the accuracy of the calculations, suitable for further post-processing or storage.

**VIEWING:** Finally, the image is re-encoded for proper viewing on typical display devices, ensuring the visual output matches the intended appearance.
## References

[RGB color model - Wikipedia](https://en.wikipedia.org/wiki/RGB_color_model)

[Understanding Gamma Correction (cambridgeincolour.com)](https://www.cambridgeincolour.com/tutorials/gamma-correction.htm)

