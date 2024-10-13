# Purpose

**Definition**: In OpenUSD, a purpose allows you to categorize parts of your scene based on their intended visibility use in context of rendering. The primary purposes include:

- **default**: This is for geometry and objects that are always relevant in the scene.
- **render**: Used for objects that are specifically meant to be visible during rendering but might be excluded in other contexts, like previews.
- **proxy**: Represents simplified or lower-resolution versions of assets used to speed up scene interaction or previews without affecting the final rendered quality.
- **guide**: Intended for helper objects like visual guides or rig controls that aid in asset manipulation but don’t appear in the final output.

The purpose feature helps optimize workflows by enabling you to filter, include, or exclude objects based on their role, improving performance and organization during different stages of production.

> [!CAUTION]
> TODO: Add picture here...