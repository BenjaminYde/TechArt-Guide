# Depth of Field

## The Circle of Confusion

### The Focus Point

When light traveling parallel to the optical axis enters a convex lens, the lens concentrates all the light to a single intersection. This exact point where all the light gathers is called the **focal point**. Any object sitting exactly on this plane achieves focus (maximum sharpness).

![Img](static/dof/focus_point.png)

### The Circle of Confusion (CoC)

Imagine a single beam of light from a tiny, distant point shining through a camera lens. This light is focused by the lens to form a sharp dot on the camera's sensor. Now, if we move this point of light slightly closer or farther from the lens, it misses that perfect intersection. Instead of a sharp dot, the light forms a cone that hits the sensor as a blurry circle.

This blurry circle is called the **circle of confusion (CoC)**. When this circle is small enough, our eyes still perceive it as a point, and the image looks sharp. But if this circle gets too big, the point of light appears blurred, and the sharpness of the image is lost.

![Img](static/dof/circle_of_confusion_1.png)

What we actually see in a photo or when we view an image on a screen has a lot to do with how big these circles of confusion are. If these circles are smaller than what our eyes can distinguish as individual points, the image looks sharp. If they're larger, the image starts to look blurry.

![Img](static/dof/circle_of_confusion_2.png)

## The Depth of Field

When taking a photo, there's a specific area that will be in clear focus. This area has a certain distance before and after the exact spot you've focused on, which is usually your main subject. This span, where everything looks sharp and clear, is what photographers call the **Depth of Field** (DoF).

![Img](static/dof/dof_example_tree_1.png)

The DoF consists out of:
- A **focus point**, the point you want to capture and will be your most sharp point in the image you capture.
- A **circle of confusion (CoC) focus limit size**, the treshold of when something becomes blurry which has a start and end distance (radius from the focus point):

![Img](static/dof/dof_example_tree_2.png)

The same circle of confusion (sharpness) but a different DoF area:  
(shallow = small sharp area,  wide = larger sharp area)

![Img](static/dof/shallow_vs_wide_dof.png)

## Factors Affecting Depth of Field

The blurry zone varies from image to image depending on a number of variables, including aperture, sensor size, and subject distance.

### 1. Focal Length & Sensor Size

**Focal Length**: Longer lenses (higher focal length) decrease the DoF (shallow), making it easier to isolate subjects from the background. Shorter lenses (wider angles) increase DoF (wide), keeping more of the scene in focus.

**Sensor Size**: Sensor size does not change DoF directly. However, larger sensors require you to use longer focal lengths or stand closer to your subject to get the same framing as a smaller sensor. This secondary physical adjustment is what causes larger sensors to exhibit a shallower DoF.

### 2. Aperture (f-stop)

The aperture is the physical hole (iris) inside the lens that lets light through.

**Wide Aperture** (e.g., f/1.4 or f/2.8): Opening the hole lets light enter from steep angles, causing the light cones to spread apart very fast. This results in a beautifully blurred background (shallow DoF).

**Small Aperture** (e.g., f/11 or f/16): Closing the hole forces light into a narrow, straight beam. Because the light hardly spreads out at all, almost the entire scene stays in focus (wide DoF).

![Img](static/dof/calculate_dof_2.png)

> [!TIP]  
> While closing your aperture down to f/16 or f/22 gives you the widest possible Depth of Field, it introduces a physics phenomenon called **diffraction**. Light waves scatter and interfere with each other as they squeeze through that tiny hole, making the entire image slightly soft. For absolute peak optical sharpness, most lenses have an aperture "sweet spot" around f/5.6 to f/8.

### 3. Distance To The Subject

The closer the camera is to the subject, the shallower the DoF. Moving away from the subject increases the DoF. Below you can finds 3 different examples where each example moves the focus point a bit farther. Each image has the same **Circle of Confusion Limit** (min treshold for sharpness).

#### Small distance from focus point => Small DoF area:

![Img](./static/dof/distance_1.png)

#### Medium distance from focus point => Medium DoF area:

![Img](./static/dof/distance_2.png)

#### Large distance from focus point => Large DoF area:

![Img](./static/dof/distance_3.png)

## Hyperfocal Distance

### When do you need this?

Consider a landscape where you want a rock in the foreground and a mountain in the background to both appear sharp. If you focus on the rock, the mountain is blurry. If you focus on the mountain, the rock is blurry.

To fix this, you focus at a mathematical "sweet spot" between the two called the **Hyperfocal Distance**.

### Maximizing the Acceptable Zone

The Hyperfocal Distance is a specific focus distance that maximizes your Depth of Field for your current aperture and focal length.

When you set your lens focus exactly to the hyperfocal distance, **everything from half that distance all the way to infinity becomes acceptably sharp**.

> [!NOTE]  
> **The Trade-off**: Hyperfocal distance is a compromise. While it gives you a massive range of acceptable sharpness, objects closer than the hyperfocal distance will lack the absolute "pinpoint" critical sharpness they would have if you focused directly on them.

Checkout the following video [MASTERING FOCUSING TECHNIQUES.Where do you put the focus point? What is hyperfocal distance?](https://www.youtube.com/watch?v=nqKqSfyTBx8)

## Calculate The Depth of Field

### Calculate the Hyperfocal Distance

You must calculate the hyperfocal distance first, because it is the foundational variable used to calculate your near and far focus limits.

![Img](./static/dof/hyperfocal_formula.png)

- $H$ = Hyperfocal distance (in mm)
- $f$ = Focal length of the lens (in mm)
- $N$ = F-stop (Aperture, e.g., $2.8$, $5.6$, $16$)
- $c$ = Circle of Confusion (in mm)
  - A common standard for high-end digital calculation is to set the CoC to exactly two pixels wide.

### Calculate The Depth of Field

The depth of field is the distance between the depth of field far limit and the depth of field near limit. We can express that in an equation form like this:

![alt text](./static/dof/dof_near_formula.png)
and     
![alt text](./static/dof/dof_far_formula.png)

- $d$ = distance to of your object (in mm)
- $H$ = Hyperfocal distance (in mm)
- $f$ = Focal length of the lens (in mm)

### Online Calculation Tools

- https://www.omnicalculator.com/other/depth-of-field#how-to-use-the-dof-calculator
- https://dofsimulator.net/en/

## Examples That Illustrate Calculations

For these examples, we assume a **Full-Frame camera** with a **50 mm** lens set to **f/2.8**.

* **Focal length ($f$):** 50 mm
* **Aperture ($N$):** 2.8
* **Circle of Confusion ($c$):** 0.03 mm (standard for full-frame)
* **Hyperfocal Distance ($H$):** 29812 mm (approx. 29.8 meters), calculated as:

$$H = \frac{f^2}{N \times c} + f = \frac{50^2}{2.8 \times 0.03} + 50 \approx 29812\text{ mm}$$


### 1. Small distance from focus point => Small DoF area

* **Distance to subject ($s$):** 500 mm (0.5 meters)
* **What it looks like:** A macro shot of an eye. Only the eyelashes are sharp; the nose is blurry.
* **The Math:**

$$D_{\text{near}} = \frac{500 \times (29812 - 50)}{29812 + 500 - 100} \approx 492.5\text{ mm}$$
$$D_{\text{far}} = \frac{500 \times (29812 - 50)}{29812 - 500} \approx 507.7\text{ mm}$$

* **Total DoF ():** **15.2 mm** (1.5 cm)

### 2. Medium distance from focus point => Medium DoF area

* **Distance to subject ($s$):** 3000 mm (3 meters)
* **What it looks like:** A waist-up portrait. The person is completely sharp, but the trees 5 meters behind them are beautifully blurred out.
* **The Math:**

$$D_{\text{near}} = \frac{3000 \times (29812 - 50)}{29812 + 3000 - 100} \approx 2729.4\text{ mm}$$
$$D_{\text{far}} = \frac{3000 \times (29812 - 50)}{29812 - 3000} \approx 3330.1\text{ mm}$$

* **Total DoF ($D_{\text{far}} - D_{\text{near}}$):** **600.7 mm** (approx. 60 cm)

### 3. Large distance from focus point => Large DoF area

* **Distance to subject ($s$):** 10000 mm (10 meters)
* **What it looks like:** A group photo in front of a house. The entire group and the front of the house are sharp, eliminating the blurry background effect entirely.
* **The Math:**

$$D_{\text{near}} = \frac{10000 \times (29812 - 50)}{29812 + 10000 - 100} \approx 7494.5\text{ mm}$$
$$D_{\text{far}} = \frac{10000 \times (29812 - 50)}{29812 - 10000} \approx 15022.2\text{ mm}$$

* **Total DoF ($D_{\text{far}} - D_{\text{near}}$):** **7527.7 mm** (approx. 7.5 meters)

>[!TIP]
> Checkout this tool: https://jherr.github.io/depth-of-field/

## References

- [Dylan Bennett (MBoffin): A Simple Guide to Depth of Field](https://www.youtube.com/watch?v=34jkJoN8qOI)
- https://www.linkedin.com/pulse/understanding-depth-field-guide-aperture-focus-pyx-photography/
- https://pps.innovatureinc.com/depth-of-field-guide-for-beginners/
- https://www.ipsecu.com/articles/depth-of-field/
- https://www.specim.com/how-to-calculate-the-depth-of-field-dof-with-the-specim-hyperspectral-cameras/
- https://www.digitalcameraworld.com/tutorials/photography-cheat-sheet-what-are-circles-of-confusion
- http://www.alainwillemsphoto.com/wp-content/uploads/2020/06/Equivalent-focal-lenght-post_en.pdf
- https://photographylife.com/hyperfocal-distance-explained