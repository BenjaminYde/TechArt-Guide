# Aperture

## Introduction to Aperture

At its most fundamental level, aperture is the mechanical iris of your lens. Much like the pupil of a human eye, it expands and contracts to regulate the volume of light allowed to strike the camera sensor. However, in photography, aperture is far more than a simple dimmer switch; it is a primary tool for creative storytelling, dictating what is in focus and what melts into the background.

When you adjust your aperture, you are physically moving a set of overlapping blades (the diaphragm) inside the lens to change the size of the hole. This adjustment impacts three critical pillars of an image:

- **Exposure**: The brightness or darkness of the frame.
- **Depth of Field**: The "thickness" of the focus plane.
- **Sharpness & Diffraction**: The optical quality and detail of the final shot.

![Img](static/aperture/light_passthrough.png)
![Img](static/aperture/exposure.png)
![Img](static/aperture/night.png)

## The "f-stop" Math: Why the Numbers Feel Backward

New photographers are often confused by why a large number (like `f/22`) creates a tiny hole, while a small number (like `f/1.8`) creates a massive opening. This is because the f-stop is actually a fraction.

The "f" stands for **focal length**. The number is the ratio of that focal length divided by the diameter of the opening:

$$\text{f-stop} = \frac{\text{Focal Length}}{\text{Diameter of Aperture}}$$

**The Fraction Rule**: Think of `f/2.8` as `1/2.8` and `f/16` as `1/16`. 

## The Geometry of Light

You have to remember that Aperture is a hole, and light passes through the Area of that hole.
If you want to double the amount of light entering the camera, you need to double the Area of the aperture circle. 

Let’s look at a 50mm lens:

1. At `f/4`: The diameter of the hole is 12.5mm ($50 / 4$)
2. At `f/2.8`: The diameter of the hole is ~17.7mm ($50 / 2.8$).

If you calculate the area of those two circles ($Area = \pi \times r^2$):
1. Area at `f/4` $\approx 122 \text{ mm}^2$
2. Area at `f/2.8` $\approx 246 \text{ mm}^2$

As you can see, 246 is almost exactly double 122. Therefore, `f/2.8` lets in twice as much light as `f/4`, even though the numbers don't look like they have a "double" relationship.

## The "Magic" Number: 1.4

Because we are dealing with circles, every "Full Stop" in photography is calculated by multiplying the previous number by 1.414 which results in an Area that is exactly double because of the square root of 2 ($\sqrt{2} \approx 1.414$). This is why the standard f-stop scale looks so strange:

$$1.0 \rightarrow 1.4 \rightarrow 2.0 \rightarrow 2.8 \rightarrow 4.0 \rightarrow 5.6 \rightarrow 8.0 \rightarrow 11 \rightarrow 16 \rightarrow 22$$

- Moving Left (Smaller number): You are multiplying the area by 2 (Doubling the light).
- Moving Right (Larger number): You are dividing the area by 2 (Halving the light).

You’ll notice that $8 \times 1.414 = 11.312$. For the sake of simplicity and making lenses easier to read, manufacturers rounded these numbers to the nearest standard integers (like `f/11` and `f/22`).

| f-stop Change        | Change in Diameter      | Change in Light     | Stop Adjustment        |
|----------------------|-------------------------|---------------------|------------------------|
| f/5.6 → f/4          | Diameter increases by 1.4× | 2× more light       | +1 Stop (Brighter)     |
| f/5.6 → f/2.8        | Diameter increases by 2×   | 4× more light       | +2 Stops (Brighter)    |
| f/4 → f/5.6          | Diameter decreases by 1.4× | 1/2 the light       | −1 Stop (Darker)       |
| f/4 → f/8            | Diameter decreases by 2×   | 1/4 the light       | −2 Stops (Darker)      |

## Aperture's Impact on Depth of Field

One of the most significant effects of changing the aperture is the alteration of the depth of field (DoF), which refers to the range of distance within a photo that appears acceptably sharp. 

- **Large Apertures (Small numbers like f/1.4 - f/2.8)**: These create a Shallow Depth of Field. This "isolates" your subject by blurring the foreground and background. It is the gold standard for portraiture and macro photography, where you want the viewer's eye to land exactly on a specific detail.

- **Small Apertures (Large numbers like f/8 - f/16)**: These create a Deep Depth of Field. By narrowing the light path, you ensure that objects from the blades of grass at your feet to the distant mountain peaks stay sharp. This is essential for landscapes and architectural photography.

![Img](static/aperture/dof_compare.png)
![Img](static/aperture/chart_wide_narrow.png)

## Practical Application: Choosing the Right Stop

| Scenario        | Recommended Aperture              | Why?                                                                 |
|-----------------|-----------------------------------|----------------------------------------------------------------------|
| Portraits       | `f/1.8` – `f/2.8 `                    | Blurs the background (bokeh) to make the subject pop.               |
| Street / Travel | `f/5.6` – `f/8 `                      | A “safe” range that keeps most things sharp while moving fast.      |
| Landscapes      | `f/11` – `f/16`                       | Ensures everything from front to back is in crisp focus.            |
| Low Light       | Widest possible (e.g., `f/1.4`)     | Maximizes light capture to avoid grainy, dark photos.               |


## The Cost of Speed

In the photography world, lenses with very large maximum apertures (`f/1.2`, `f/1.4`, or `f/2.8`) are called **Fast Lenses**. They are called fast because the massive amount of light they let in allows you to use a "fast" shutter speed even in dark environments.

If you are shooting a indoor basketball game:

1. With an `f/5.6` lens: You might need a shutter speed of 1/30th of a second to get enough light. At that speed, the players will be a blurry mess because they are moving faster than the shutter.

2. With an `f/1.4` lens: Because the lens lets in so much more light, you can use a shutter speed of 1/500th of a second. This speed is "fast" enough to freeze the player mid-air in perfect clarity.

Why do they cost more?

- **Engineering**: To achieve a wide aperture, the glass elements must be physically larger and heavier.

- **Optics**: Light behaves more chaotically at the edges of a wide-open lens. Correcting for blur and "chromatic aberration" (color fringing) at `f/1.4` requires expensive, specialized glass coatings and precision manufacturing.

- **The "Pro" Standard**: Because fast lenses are harder to build, they are usually reserved for a manufacturer's "pro" line, featuring better autofocus and weather-sealing.

## Constant vs. Variable Aperture (Essential for Zoom Lenses)

If you are using "kit lenses" (like an 18-55mm), you may be confused why your aperture changes when you zoom in.

If you look at a standard zoom lens, you might see `f/3.5`-`5.6`. This means that when you are zoomed out (18mm), your widest aperture is `f/3.5`. But as you zoom in (55mm), the lens physically cannot maintain that opening, and the camera will force the aperture to `f/5.6`.

"Pro" zoom lenses have a Constant Aperture (e.g., a 24-70mm `f/2.8`). These allow you to stay at `f/2`.8 no matter how much you zoom, but they are significantly heavier and more expensive.

## Bokeh and Blade Count

"Bokeh" refers to the aesthetic quality of the out-of-focus blur. This is determined by the number of blades in the aperture diaphragm.

- **Cheap lenses** often have 5 or 6 straight blades. This creates "blocky" or hexagonal-shaped light balls in the background.

- **Pro lenses** usually have 9 or 11 rounded blades. This maintains a nearly perfect circle even when stopped down, resulting in the smooth, "creamy" background blur that photographers crave.


## Reference

- https://photographylife.com/what-is-aperture-in-photography
- https://www.opto-e.com/en/basics/optics-basics
- [F/2.8 vs F/4 - Is the Difference Worth the Upgrade?](https://www.youtube.com/watch?v=1Y3rHsr5j9U&t=251s)