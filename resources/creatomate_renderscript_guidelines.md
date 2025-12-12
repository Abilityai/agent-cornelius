# Creatomate RenderScript Template Guidelines

**Comprehensive guide to creating video templates using Creatomate's JSON scripting language**

Version: 1.0
Last Updated: 2025-11-14

---

## Table of Contents

1. [Introduction to RenderScript](#introduction-to-renderscript)
2. [Core Concepts](#core-concepts)
3. [Template Structure](#template-structure)
4. [Element Types Guide](#element-types-guide)
5. [Animation Patterns](#animation-patterns)
6. [Common Use Cases](#common-use-cases)
7. [Design Patterns](#design-patterns)
8. [Best Practices](#best-practices)
9. [Template Library](#template-library)
10. [Troubleshooting](#troubleshooting)

---

## Introduction to RenderScript

### What is RenderScript?

RenderScript is Creatomate's JSON-based format for defining videos and images programmatically. Think of it as **"HTML for videos"** - just as HTML describes web pages, RenderScript describes video compositions.

**Key Features:**
- **Declarative** - Describe what you want, not how to render it
- **JSON-based** - Easy to generate, parse, and version control
- **Composable** - Build complex videos from simple elements
- **Dynamic** - Perfect for programmatic video generation at scale

### When to Use RenderScript

**Use RenderScript when you need:**
- Fully programmatic video generation
- Dynamic content based on data (CSV, API responses, databases)
- Complex conditional logic in video creation
- Integration with existing workflows and systems
- Version-controlled video templates

**Use Template Editor when you need:**
- Quick visual design
- Testing and iteration
- Export as starting point for RenderScript
- Simple modifications to existing templates

**Best Approach:** Design in the editor first, export to RenderScript, then enhance with code.

---

## Core Concepts

### 1. The Canvas

Every RenderScript defines a **canvas** - the output video/image dimensions and format.

```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "frame_rate": 30
}
```

**Common Resolutions:**
- **1920x1080** - Full HD (landscape)
- **1080x1920** - Full HD (portrait, social media)
- **1080x1080** - Square (Instagram)
- **1280x720** - HD (smaller file size)
- **3840x2160** - 4K (high quality)

### 2. Elements

Elements are the building blocks of your video. Each element has:
- **Type** - What it is (text, video, image, audio, composition)
- **Timing** - When it appears and for how long
- **Position** - Where it sits on the canvas
- **Properties** - Visual attributes (color, size, effects)
- **Animations** - How it moves or transforms

### 3. Tracks and Layering

Elements are stacked on **tracks** (layers):
- **Higher track numbers** = Front of composition
- **Lower track numbers** = Back of composition
- Elements on same track appear sequentially (unless using `time` offset)

```json
{
  "elements": [
    {"type": "video", "track": 1},      // Background
    {"type": "image", "track": 2},      // Logo overlay
    {"type": "text", "track": 3}        // Text on top
  ]
}
```

### 4. Timing System

RenderScript uses a timeline-based timing system:

**Properties:**
- `time` - When element starts (seconds, or `"auto"` for sequential)
- `duration` - How long it lasts (seconds, `"auto"`, or `"media"`)

**Auto Timing:**
```json
{
  "elements": [
    {"type": "image", "track": 1},  // Starts at 0
    {"type": "image", "track": 1},  // Starts after first ends
    {"type": "image", "track": 1}   // Starts after second ends
  ]
}
```

**Manual Timing:**
```json
{
  "elements": [
    {"type": "text", "time": 2, "duration": 5},    // 2-7 seconds
    {"type": "text", "time": 5, "duration": 3}     // 5-8 seconds (overlap)
  ]
}
```

### 5. Units System

RenderScript supports flexible units for positioning and sizing:

| Unit | Description | Example | Use Case |
|------|-------------|---------|----------|
| `px` | Pixels | `"100px"` | Fixed dimensions |
| `%` | Percentage of element | `"50%"` | Relative to parent |
| `vw` | Viewport width % | `"10vw"` | Responsive to canvas width |
| `vh` | Viewport height % | `"10vh"` | Responsive to canvas height |
| `vmin` | Smaller of vw/vh | `"8 vmin"` | Truly responsive (font sizes) |

**Best Practices:**
- Use `vmin` for font sizes (scales with canvas)
- Use `%` for centering (`x: "50%"`, `y: "50%"`)
- Use `vw`/`vh` for padding and margins
- Use `px` only when you need exact pixel control

---

## Template Structure

### Minimal Valid Template

```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": []
}
```

### Complete Template Anatomy

```json
{
  // --- Canvas Configuration ---
  "output_format": "mp4",           // mp4, gif, jpg, png
  "width": 1920,                    // Canvas width (pixels)
  "height": 1080,                   // Canvas height (pixels)
  "frame_rate": 30,                 // FPS (optional, default: 30)
  "duration": 10,                   // Total duration (optional, auto-calculated)

  // --- Custom Fonts (optional) ---
  "fonts": [
    {
      "family": "CustomFont",
      "weight": "400",
      "style": "normal",
      "source": "https://example.com/font.woff"
    }
  ],

  // --- Elements (composition) ---
  "elements": [
    // ... element definitions
  ]
}
```

### Template Design Workflow

**Step 1: Define Canvas**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080
}
```

**Step 2: Add Background Layer**
```json
{
  "elements": [
    {
      "type": "video",
      "source": "https://cdn.creatomate.com/demo/video1.mp4",
      "track": 1,
      "fit": "cover"
    }
  ]
}
```

**Step 3: Add Overlay Elements**
```json
{
  "elements": [
    {
      "type": "video",
      "source": "https://cdn.creatomate.com/demo/video1.mp4",
      "track": 1,
      "fit": "cover"
    },
    {
      "type": "text",
      "name": "Title",
      "text": "Welcome!",
      "track": 2,
      "time": 1,
      "duration": 3
    }
  ]
}
```

**Step 4: Add Animations**
```json
{
  "type": "text",
  "name": "Title",
  "text": "Welcome!",
  "track": 2,
  "time": 1,
  "duration": 3,
  "animations": [
    {
      "time": 1,
      "duration": 0.5,
      "type": "fade",
      "easing": "quadratic-out"
    }
  ]
}
```

---

## Element Types Guide

### Text Element

**Purpose:** Display text with full typography control

**Minimal Example:**
```json
{
  "type": "text",
  "text": "Hello World"
}
```

**Complete Example:**
```json
{
  "type": "text",
  "name": "Headline",
  "text": "Your Text Here",

  // Typography
  "font_family": "Arial",
  "font_weight": 700,
  "font_size": "10 vmin",
  "letter_spacing": "0%",
  "line_height": "120%",

  // Alignment
  "x_alignment": "50%",        // 0%=left, 50%=center, 100%=right
  "y_alignment": "50%",        // 0%=top, 50%=middle, 100%=bottom

  // Styling
  "fill_color": "#ffffff",
  "stroke_color": "#000000",
  "stroke_width": "2px",
  "shadow_color": "rgba(0,0,0,0.5)",

  // Text Behavior
  "text_wrap": true,
  "text_clip": false,
  "text_transform": "uppercase",

  // Background (optional)
  "background_color": "rgba(0,0,0,0.8)",
  "background_x_padding": "5%",
  "background_border_radius": "10px",

  // Position & Timing
  "x": "50%",
  "y": "50%",
  "track": 2,
  "time": 1,
  "duration": 5
}
```

**Use Cases:**
- Titles and headlines
- Subtitles and captions
- Call-to-action text
- Data overlays (prices, stats)

**Tips:**
- Use `vmin` for responsive font sizes
- Add subtle shadows for readability
- Use `text_transform: "uppercase"` for impact
- Combine with background for contrast

### Video Element

**Purpose:** Display video clips with control over playback, trimming, and audio

**Minimal Example:**
```json
{
  "type": "video",
  "source": "https://example.com/video.mp4"
}
```

**Complete Example:**
```json
{
  "type": "video",
  "name": "Background-Video",
  "source": "https://cdn.creatomate.com/demo/video1.mp4",

  // Fit Behavior
  "fit": "cover",              // cover, contain, fill

  // Audio Control
  "volume": "80%",
  "audio_fade_in": 1,
  "audio_fade_out": 1,

  // Trimming
  "trim_start": 5,             // Skip first 5 seconds
  "trim_duration": 10,         // Use 10 seconds of video

  // Looping
  "loop": false,

  // Position & Timing
  "x": "50%",
  "y": "50%",
  "width": "100%",
  "height": "100%",
  "track": 1,
  "time": 0,
  "duration": 10
}
```

**Fit Options Explained:**
- **`cover`** (default) - Fills frame, crops overflow (best for backgrounds)
- **`contain`** - Fits within frame, may show letterboxing
- **`fill`** - Stretches to fill, may distort

**Use Cases:**
- Background footage
- Product demonstrations
- User-generated content overlays
- Stock footage B-roll

**Tips:**
- Use `fit: "cover"` for fullscreen backgrounds
- Always trim videos to exact length needed (saves credits)
- Fade audio in/out to avoid harsh cuts
- Use `loop: true` for short background clips

### Image Element

**Purpose:** Display static images with positioning and effects

**Minimal Example:**
```json
{
  "type": "image",
  "source": "https://example.com/image.jpg"
}
```

**Complete Example:**
```json
{
  "type": "image",
  "name": "Product-Shot",
  "source": "https://example.com/product.jpg",

  // Fit Behavior
  "fit": "contain",            // cover, contain, fill

  // Styling
  "border_radius": "10px",
  "shadow_color": "rgba(0,0,0,0.3)",
  "opacity": "100%",

  // Effects
  "blur_radius": null,
  "color_filter": null,        // grayscale, sepia, invert

  // Position & Timing
  "x": "50%",
  "y": "50%",
  "width": "80%",
  "height": "80%",
  "track": 2,
  "time": 0,
  "duration": 5,

  // Animation (Ken Burns effect example)
  "animations": [
    {
      "time": 0,
      "duration": 5,
      "type": "scale",
      "x_scale": "120%",
      "y_scale": "120%",
      "easing": "linear"
    }
  ]
}
```

**Use Cases:**
- Product photography
- Logos and branding
- Profile pictures
- Screenshots and mockups

**Tips:**
- Use `fit: "contain"` when aspect ratio matters
- Add `border_radius` for modern look
- Combine with zoom animation (Ken Burns effect)
- Use PNG for transparency

### Audio Element

**Purpose:** Add background music or sound effects

**Minimal Example:**
```json
{
  "type": "audio",
  "source": "https://example.com/music.mp3"
}
```

**Complete Example:**
```json
{
  "type": "audio",
  "name": "Background-Music",
  "source": "https://cdn.creatomate.com/demo/music.mp3",

  // Volume Control
  "volume": "50%",

  // Fade Effects
  "audio_fade_in": 2,
  "audio_fade_out": 3,

  // Looping
  "loop": true,

  // Timing
  "track": 1,
  "time": 0,
  "duration": "auto"           // Extends to end of video
}
```

**Use Cases:**
- Background music
- Sound effects
- Voiceovers
- Ambient audio

**Tips:**
- Keep music at 30-50% volume to avoid overpowering other audio
- Always use fade in/out (2-3 seconds) for smooth transitions
- Use `loop: true` for short music tracks
- Prefer royalty-free music sources

### Composition Element

**Purpose:** Group multiple elements into reusable scenes with nested timelines

**Minimal Example:**
```json
{
  "type": "composition",
  "elements": []
}
```

**Scene Example:**
```json
{
  "type": "composition",
  "name": "Intro-Scene",
  "track": 1,
  "time": 0,
  "duration": 5,
  "elements": [
    {
      "type": "video",
      "source": "https://example.com/intro-bg.mp4",
      "track": 1,
      "fit": "cover"
    },
    {
      "type": "text",
      "text": "Welcome!",
      "track": 2,
      "time": 1,
      "duration": 3,
      "animations": [
        {"time": 1, "duration": 0.5, "type": "fade"}
      ]
    }
  ]
}
```

**Multi-Scene Sequencing:**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "composition",
      "name": "Scene-1-Intro",
      "track": 1,
      "elements": [/* intro content */]
    },
    {
      "type": "composition",
      "name": "Scene-2-Main",
      "track": 1,
      "elements": [/* main content */]
    },
    {
      "type": "composition",
      "name": "Scene-3-Outro",
      "track": 1,
      "elements": [/* outro content */]
    }
  ]
}
```

**Use Cases:**
- Organizing complex videos into scenes
- Creating reusable components
- Building template libraries
- Sequencing multiple segments

**Tips:**
- Name compositions descriptively (`"Intro"`, `"Main"`, `"Outro"`)
- Each composition has its own timeline (starts at 0)
- Use compositions on same track for sequential scenes
- Nest compositions for complex hierarchies

---

## Animation Patterns

### Animation Basics

Every animation is defined by:
1. **When it starts** (`time`)
2. **How long it lasts** (`duration`)
3. **What type** (`type`)
4. **How it accelerates** (`easing`)

**Structure:**
```json
{
  "animations": [
    {
      "time": 0,               // Start time (seconds)
      "duration": 1,           // Animation length (seconds)
      "type": "fade",          // Animation type
      "easing": "quadratic-out" // Easing function
    }
  ]
}
```

### Common Animation Types

#### 1. Fade In/Out

**Fade In:**
```json
{
  "animations": [
    {
      "time": 0,
      "duration": 1,
      "type": "fade",
      "easing": "quadratic-out",
      "fade": true
    }
  ]
}
```

**Fade Out:**
```json
{
  "animations": [
    {
      "time": 4,               // Start fade out 1 sec before end
      "duration": 1,
      "type": "fade",
      "easing": "quadratic-in",
      "fade": false            // Fade out
    }
  ]
}
```

**Fade In + Fade Out:**
```json
{
  "duration": 5,
  "animations": [
    {
      "time": 0,
      "duration": 0.5,
      "type": "fade",
      "easing": "quadratic-out"
    },
    {
      "time": 4.5,
      "duration": 0.5,
      "type": "fade",
      "easing": "quadratic-in"
    }
  ]
}
```

#### 2. Scale/Zoom Effects

**Zoom In (Ken Burns):**
```json
{
  "animations": [
    {
      "time": 0,
      "duration": 5,
      "type": "scale",
      "x_scale": "120%",
      "y_scale": "120%",
      "easing": "linear"
    }
  ]
}
```

**Zoom Out:**
```json
{
  "animations": [
    {
      "time": 0,
      "duration": 3,
      "type": "scale",
      "x_scale": "80%",
      "y_scale": "80%",
      "easing": "quadratic-out"
    }
  ]
}
```

**Pop In:**
```json
{
  "animations": [
    {
      "time": 0,
      "duration": 0.3,
      "type": "scale",
      "x_scale": "0%",
      "y_scale": "0%",
      "easing": "cubic-out"
    }
  ]
}
```

#### 3. Slide Transitions

**Slide In from Left:**
```json
{
  "animations": [
    {
      "time": 0,
      "duration": 0.5,
      "type": "slide",
      "direction": "0°",       // 0°=right, 90°=down, 180°=left, 270°=up
      "easing": "quadratic-out"
    }
  ]
}
```

**Slide Out to Right:**
```json
{
  "animations": [
    {
      "time": 4.5,
      "duration": 0.5,
      "type": "slide",
      "direction": "180°",
      "easing": "quadratic-in"
    }
  ]
}
```

**Named Directions:**
```json
{
  "direction": "up"          // up, down, left, right (or use degrees)
}
```

#### 4. Transitions Between Elements

**Image Slideshow with Slide Transitions:**
```json
{
  "elements": [
    {
      "type": "image",
      "source": "image1.jpg",
      "track": 1,
      "duration": 5
    },
    {
      "type": "image",
      "source": "image2.jpg",
      "track": 1,
      "duration": 5,
      "animations": [
        {
          "time": 0,
          "duration": 1,
          "type": "slide",
          "direction": "180°",
          "transition": true,   // Key: marks as transition
          "easing": "cubic-in-out"
        }
      ]
    },
    {
      "type": "image",
      "source": "image3.jpg",
      "track": 1,
      "duration": 5,
      "animations": [
        {
          "time": 0,
          "duration": 1,
          "type": "slide",
          "direction": "180°",
          "transition": true,
          "easing": "cubic-in-out"
        }
      ]
    }
  ]
}
```

### Easing Functions Guide

| Easing | Acceleration | Best Use Case |
|--------|-------------|---------------|
| `linear` | Constant speed | Subtle effects, zoom, pan |
| `quadratic-in` | Slow → fast | Fade outs, exits |
| `quadratic-out` | Fast → slow | Fade ins, entrances |
| `quadratic-in-out` | Smooth curve | General purpose |
| `cubic-in` | Strong acceleration | Dramatic exits |
| `cubic-out` | Strong deceleration | Dramatic entrances |
| `cubic-in-out` | Strong S-curve | Polished transitions |

**Rule of Thumb:**
- **Entrances**: Use `-out` easing (decelerating)
- **Exits**: Use `-in` easing (accelerating)
- **Continuous**: Use `linear`
- **General**: Use `quadratic-in-out`

### Animation Timing Patterns

**Pattern 1: Fade In, Display, Fade Out**
```json
{
  "time": 2,
  "duration": 5,               // Total duration: 5 seconds
  "animations": [
    {
      "time": 2,               // Fade in at start
      "duration": 0.5,
      "type": "fade",
      "easing": "quadratic-out"
    },
    {
      "time": 6.5,             // Fade out at end (2 + 5 - 0.5)
      "duration": 0.5,
      "type": "fade",
      "easing": "quadratic-in"
    }
  ]
}
```

**Pattern 2: Slide In, Display, Slide Out**
```json
{
  "time": 1,
  "duration": 6,
  "animations": [
    {
      "time": 1,
      "duration": 0.5,
      "type": "slide",
      "direction": "up",
      "easing": "cubic-out"
    },
    {
      "time": 6.5,
      "duration": 0.5,
      "type": "slide",
      "direction": "down",
      "easing": "cubic-in"
    }
  ]
}
```

**Pattern 3: Multiple Simultaneous Animations**
```json
{
  "animations": [
    {
      "time": 0,
      "duration": 0.5,
      "type": "fade",          // Fade in
      "easing": "quadratic-out"
    },
    {
      "time": 0,
      "duration": 0.5,
      "type": "slide",         // + Slide up
      "direction": "up",
      "easing": "quadratic-out"
    },
    {
      "time": 0,
      "duration": 0.5,
      "type": "scale",         // + Scale up
      "x_scale": "80%",
      "y_scale": "80%",
      "easing": "cubic-out"
    }
  ]
}
```

---

## Common Use Cases

### 1. Social Media Video (Square)

**Instagram/Facebook Square Post:**
```json
{
  "output_format": "mp4",
  "width": 1080,
  "height": 1080,
  "frame_rate": 30,
  "elements": [
    {
      "type": "video",
      "source": "https://example.com/background.mp4",
      "track": 1,
      "fit": "cover",
      "volume": "0%"
    },
    {
      "type": "text",
      "name": "Headline",
      "text": "Big Sale!",
      "font_family": "Arial",
      "font_weight": 900,
      "font_size": "15 vmin",
      "fill_color": "#ffffff",
      "stroke_color": "#000000",
      "stroke_width": "3px",
      "track": 2,
      "time": 0.5,
      "duration": 3,
      "animations": [
        {
          "time": 0.5,
          "duration": 0.5,
          "type": "scale",
          "x_scale": "0%",
          "y_scale": "0%",
          "easing": "cubic-out"
        }
      ]
    },
    {
      "type": "text",
      "name": "CTA",
      "text": "Shop Now",
      "font_family": "Arial",
      "font_weight": 700,
      "font_size": "8 vmin",
      "fill_color": "#000000",
      "background_color": "#ffff00",
      "background_x_padding": "10%",
      "background_border_radius": "50px",
      "track": 2,
      "time": 3.5,
      "duration": 2,
      "animations": [
        {
          "time": 3.5,
          "duration": 0.3,
          "type": "fade",
          "easing": "quadratic-out"
        }
      ]
    }
  ]
}
```

### 2. Promotional Video with Text Overlay

**Product Launch Video:**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "video",
      "source": "https://example.com/product-demo.mp4",
      "track": 1,
      "fit": "cover",
      "volume": "100%",
      "audio_fade_in": 1,
      "audio_fade_out": 2
    },
    {
      "type": "image",
      "source": "https://example.com/logo.png",
      "track": 2,
      "x": "10%",
      "y": "10%",
      "width": "15%",
      "height": "15%",
      "time": 0,
      "duration": "auto"
    },
    {
      "type": "text",
      "name": "Title",
      "text": "Introducing Product X",
      "font_family": "Arial",
      "font_weight": 700,
      "font_size": "8 vmin",
      "fill_color": "#ffffff",
      "shadow_color": "rgba(0,0,0,0.8)",
      "x": "50%",
      "y": "80%",
      "track": 3,
      "time": 1,
      "duration": 4,
      "animations": [
        {
          "time": 1,
          "duration": 0.5,
          "type": "slide",
          "direction": "up",
          "easing": "cubic-out"
        }
      ]
    }
  ]
}
```

### 3. Image Slideshow with Music

**Photo Montage:**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "audio",
      "source": "https://example.com/music.mp3",
      "track": 1,
      "volume": "40%",
      "loop": true,
      "audio_fade_in": 2,
      "audio_fade_out": 3
    },
    {
      "type": "image",
      "source": "https://example.com/photo1.jpg",
      "track": 2,
      "duration": 5,
      "fit": "cover",
      "animations": [
        {
          "time": 0,
          "duration": 5,
          "type": "scale",
          "x_scale": "110%",
          "y_scale": "110%",
          "easing": "linear"
        }
      ]
    },
    {
      "type": "image",
      "source": "https://example.com/photo2.jpg",
      "track": 2,
      "duration": 5,
      "fit": "cover",
      "animations": [
        {
          "time": 0,
          "duration": 1,
          "type": "slide",
          "direction": "180°",
          "transition": true,
          "easing": "cubic-in-out"
        },
        {
          "time": 0,
          "duration": 5,
          "type": "scale",
          "x_scale": "110%",
          "y_scale": "110%",
          "easing": "linear"
        }
      ]
    },
    {
      "type": "image",
      "source": "https://example.com/photo3.jpg",
      "track": 2,
      "duration": 5,
      "fit": "cover",
      "animations": [
        {
          "time": 0,
          "duration": 1,
          "type": "slide",
          "direction": "180°",
          "transition": true,
          "easing": "cubic-in-out"
        },
        {
          "time": 0,
          "duration": 5,
          "type": "scale",
          "x_scale": "110%",
          "y_scale": "110%",
          "easing": "linear"
        }
      ]
    }
  ]
}
```

### 4. Lower Third Text Overlay

**News/Interview Style Lower Third:**
```json
{
  "type": "composition",
  "name": "Lower-Third",
  "track": 3,
  "time": 5,
  "duration": 8,
  "x": "50%",
  "y": "85%",
  "width": "90%",
  "height": "20%",
  "elements": [
    {
      "type": "shape",
      "track": 1,
      "fill_color": "rgba(0,0,0,0.8)",
      "width": "100%",
      "height": "100%"
    },
    {
      "type": "text",
      "text": "John Smith",
      "font_family": "Arial",
      "font_weight": 700,
      "font_size": "6 vmin",
      "fill_color": "#ffffff",
      "x_alignment": "0%",
      "x": "5%",
      "y": "35%",
      "track": 2
    },
    {
      "type": "text",
      "text": "CEO, Company Inc.",
      "font_family": "Arial",
      "font_weight": 400,
      "font_size": "4 vmin",
      "fill_color": "#cccccc",
      "x_alignment": "0%",
      "x": "5%",
      "y": "65%",
      "track": 2
    }
  ],
  "animations": [
    {
      "time": 5,
      "duration": 0.5,
      "type": "slide",
      "direction": "up",
      "easing": "cubic-out"
    },
    {
      "time": 12.5,
      "duration": 0.5,
      "type": "slide",
      "direction": "down",
      "easing": "cubic-in"
    }
  ]
}
```

### 5. Video Testimonial with Caption

**Customer Testimonial:**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "video",
      "source": "https://example.com/testimonial.mp4",
      "track": 1,
      "fit": "cover"
    },
    {
      "type": "text",
      "name": "Quote",
      "text": "\"This product changed my life!\"",
      "font_family": "Georgia",
      "font_style": "italic",
      "font_size": "6 vmin",
      "fill_color": "#ffffff",
      "background_color": "rgba(0,0,0,0.7)",
      "background_x_padding": "3%",
      "background_y_padding": "2%",
      "background_border_radius": "10px",
      "x": "50%",
      "y": "15%",
      "width": "80%",
      "track": 2,
      "time": 2,
      "duration": 5,
      "animations": [
        {
          "time": 2,
          "duration": 0.5,
          "type": "fade",
          "easing": "quadratic-out"
        },
        {
          "time": 6.5,
          "duration": 0.5,
          "type": "fade",
          "easing": "quadratic-in"
        }
      ]
    },
    {
      "type": "text",
      "name": "Name",
      "text": "- Sarah Johnson",
      "font_family": "Arial",
      "font_weight": 600,
      "font_size": "4 vmin",
      "fill_color": "#ffff00",
      "x": "50%",
      "y": "25%",
      "track": 2,
      "time": 3,
      "duration": 4,
      "animations": [
        {
          "time": 3,
          "duration": 0.5,
          "type": "fade",
          "easing": "quadratic-out"
        }
      ]
    }
  ]
}
```

---

## Design Patterns

### Pattern 1: Data-Driven Video Generation

**Problem:** Generate videos from dynamic data (CSV, API, database)

**Solution:** Template with named elements, populate with modifications

**Template:**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "image",
      "name": "ProductImage",
      "source": "https://example.com/default.jpg",
      "track": 1
    },
    {
      "type": "text",
      "name": "ProductName",
      "text": "Product Name",
      "track": 2
    },
    {
      "type": "text",
      "name": "Price",
      "text": "$99.99",
      "track": 2
    }
  ]
}
```

**API Call with Modifications:**
```javascript
const products = [
  { name: "Widget Pro", price: "$49.99", image: "widget.jpg" },
  { name: "Gadget Max", price: "$79.99", image: "gadget.jpg" }
];

for (const product of products) {
  await fetch('https://api.creatomate.com/v2/renders', {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer YOUR_API_KEY',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      template_id: 'YOUR_TEMPLATE_ID',
      modifications: {
        'ProductImage': `https://example.com/${product.image}`,
        'ProductName': product.name,
        'Price': product.price
      }
    })
  });
}
```

### Pattern 2: Multi-Scene Storytelling

**Problem:** Create complex video with multiple distinct scenes

**Solution:** Use compositions for each scene

**Structure:**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "composition",
      "name": "Scene-1-Hook",
      "track": 1,
      "duration": 5,
      "elements": [/* hook content */]
    },
    {
      "type": "composition",
      "name": "Scene-2-Problem",
      "track": 1,
      "duration": 8,
      "elements": [/* problem content */]
    },
    {
      "type": "composition",
      "name": "Scene-3-Solution",
      "track": 1,
      "duration": 10,
      "elements": [/* solution content */]
    },
    {
      "type": "composition",
      "name": "Scene-4-CTA",
      "track": 1,
      "duration": 5,
      "elements": [/* CTA content */]
    }
  ]
}
```

### Pattern 3: Reusable Component Library

**Problem:** Need consistent branding across many videos

**Solution:** Create composition templates for reusable components

**Logo Component:**
```json
{
  "type": "composition",
  "name": "Brand-Logo",
  "x": "10%",
  "y": "10%",
  "width": "15%",
  "height": "15%",
  "elements": [
    {
      "type": "image",
      "source": "https://example.com/logo.png",
      "track": 1
    }
  ]
}
```

**Lower Third Component:**
```json
{
  "type": "composition",
  "name": "Lower-Third-Template",
  "y": "85%",
  "elements": [
    {
      "type": "shape",
      "fill_color": "rgba(0,0,0,0.8)",
      "track": 1
    },
    {
      "type": "text",
      "name": "Primary-Text",
      "text": "Name",
      "track": 2
    },
    {
      "type": "text",
      "name": "Secondary-Text",
      "text": "Title",
      "track": 2
    }
  ]
}
```

**Use in Video:**
```json
{
  "elements": [
    // Main content
    {"type": "video", "source": "...", "track": 1},

    // Add logo component
    {"type": "composition", "name": "Brand-Logo", "track": 2},

    // Add lower third
    {
      "type": "composition",
      "name": "Lower-Third",
      "track": 3,
      "time": 5,
      "duration": 8,
      "elements": [/* lower third template */]
    }
  ]
}
```

### Pattern 4: Conditional Content

**Problem:** Different content based on conditions (A/B testing, personalization)

**Solution:** Generate RenderScript dynamically based on logic

**Example:**
```javascript
function generateVideo(user) {
  const elements = [
    {
      type: "video",
      source: "https://example.com/background.mp4",
      track: 1
    }
  ];

  // Conditional: VIP users get gold badge
  if (user.isVIP) {
    elements.push({
      type: "image",
      source: "https://example.com/vip-badge.png",
      track: 2,
      x: "90%",
      y: "10%"
    });
  }

  // Conditional: Different CTAs based on user segment
  const ctaText = user.segment === 'enterprise'
    ? 'Schedule Enterprise Demo'
    : 'Start Free Trial';

  elements.push({
    type: "text",
    text: ctaText,
    track: 2,
    time: 8,
    duration: 3
  });

  return {
    output_format: "mp4",
    width: 1920,
    height: 1080,
    elements: elements
  };
}
```

---

## Best Practices

### 1. Performance Optimization

**Use Efficient Asset URLs:**
- ✅ Host on CDN with good global coverage
- ✅ Use HTTPS for all media URLs
- ✅ Compress videos/images before uploading
- ❌ Don't use URLs requiring authentication

**Optimize Video Duration:**
```javascript
// Good: Exact trimming
{
  "type": "video",
  "trim_start": 5,
  "trim_duration": 10    // Use exactly 10 seconds
}

// Bad: Full video duration
{
  "type": "video",
  "duration": 30         // Renders entire 2-minute source video
}
```

**Lower Resolution for Previews:**
```json
{
  "template_id": "abc123",
  "render_scale": 0.5,   // 50% resolution for fast preview
  "modifications": { ... }
}
```

### 2. Naming Conventions

**Element Names:**
- Use PascalCase or kebab-case consistently
- Be descriptive: `"Headline-Title"` not `"Text-1"`
- Group related elements: `"Scene1-Title"`, `"Scene1-Subtitle"`

```json
{
  "elements": [
    {"type": "text", "name": "Hero-Headline"},      // ✅ Clear
    {"type": "text", "name": "Hero-Subheadline"},   // ✅ Clear
    {"type": "image", "name": "ProductImage-Main"}, // ✅ Clear
    {"type": "text", "name": "Text-1"}              // ❌ Vague
  ]
}
```

### 3. Responsive Design

**Use Relative Units:**
```json
{
  "type": "text",
  "font_size": "8 vmin",    // ✅ Scales with canvas
  "x": "50%",               // ✅ Always centered
  "y": "50%",               // ✅ Always centered
  "width": "80%"            // ✅ Responsive width
}
```

**Test Multiple Aspect Ratios:**
- 16:9 (1920x1080) - Landscape
- 9:16 (1080x1920) - Portrait
- 1:1 (1080x1080) - Square

### 4. Animation Guidelines

**Timing Rules:**
- **Fade in/out**: 0.3-0.5 seconds (quick and professional)
- **Slide transitions**: 0.5-1 second (smooth)
- **Ken Burns zoom**: 3-5 seconds (subtle)
- **Text read time**: 1 second per 3-4 words

**Easing Selection:**
- Entrances → `quadratic-out` or `cubic-out`
- Exits → `quadratic-in` or `cubic-in`
- Continuous → `linear`

### 5. Color and Contrast

**Text Readability:**
```json
{
  "type": "text",
  "fill_color": "#ffffff",
  "stroke_color": "#000000",           // Outline for contrast
  "stroke_width": "2px",
  "shadow_color": "rgba(0,0,0,0.7)",   // Drop shadow
  "background_color": "rgba(0,0,0,0.6)" // Semi-transparent background
}
```

### 6. Audio Mixing

**Volume Guidelines:**
- Background music: 30-40%
- Sound effects: 60-80%
- Dialogue/voiceover: 90-100%
- Always use fade in/out (2-3 seconds)

```json
{
  "type": "audio",
  "volume": "35%",
  "audio_fade_in": 2,
  "audio_fade_out": 3
}
```

### 7. Credit Optimization

**Save Credits:**
- Use lower `render_scale` for tests (0.5 or 0.25)
- Choose appropriate output format (GIF < MP4)
- Trim videos to exact length
- Use shorter durations when possible
- Lower resolutions for social media

**Cost Estimate Before Production:**
```javascript
// Test with low resolution first
const testRender = {
  template_id: 'abc123',
  render_scale: 0.25,      // 25% for quick test
  modifications: { ... }
};

// Production render after approval
const finalRender = {
  template_id: 'abc123',
  render_scale: 1.0,       // Full resolution
  modifications: { ... }
};
```

### 8. Version Control

**Export Templates:**
```bash
# Fetch template source
curl -X GET https://api.creatomate.com/v1/templates/YOUR_TEMPLATE_ID \
  -H "Authorization: Bearer YOUR_API_KEY" \
  > template-v1.json

# Commit to git
git add template-v1.json
git commit -m "Template: Initial version"
```

**Track Changes:**
```json
{
  "_version": "1.2.0",
  "_lastModified": "2025-11-14",
  "_changelog": "Added fade-in animation to title",
  "output_format": "mp4",
  ...
}
```

---

## Template Library

### Template 1: Simple Text on Color Background

**Use Case:** Quick announcement, quote graphic

```json
{
  "output_format": "jpg",
  "width": 1080,
  "height": 1080,
  "elements": [
    {
      "type": "shape",
      "fill_color": "#1e3a8a",
      "width": "100%",
      "height": "100%",
      "track": 1
    },
    {
      "type": "text",
      "name": "MainText",
      "text": "Your Text Here",
      "font_family": "Arial",
      "font_weight": 700,
      "font_size": "12 vmin",
      "fill_color": "#ffffff",
      "x_alignment": "50%",
      "y_alignment": "50%",
      "track": 2
    }
  ]
}
```

### Template 2: Video with Animated Title Card

**Use Case:** Video opener with branding

```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "video",
      "name": "BackgroundVideo",
      "source": "https://cdn.creatomate.com/demo/video1.mp4",
      "track": 1,
      "fit": "cover",
      "volume": "50%"
    },
    {
      "type": "shape",
      "fill_color": "rgba(0,0,0,0.5)",
      "width": "100%",
      "height": "100%",
      "track": 2
    },
    {
      "type": "text",
      "name": "Title",
      "text": "Welcome",
      "font_family": "Arial",
      "font_weight": 900,
      "font_size": "15 vmin",
      "fill_color": "#ffffff",
      "track": 3,
      "time": 1,
      "duration": 3,
      "animations": [
        {
          "time": 1,
          "duration": 0.5,
          "type": "scale",
          "x_scale": "0%",
          "y_scale": "0%",
          "easing": "cubic-out"
        },
        {
          "time": 3.5,
          "duration": 0.5,
          "type": "fade",
          "easing": "quadratic-in"
        }
      ]
    }
  ]
}
```

### Template 3: Product Showcase (Square)

**Use Case:** E-commerce product video for Instagram

```json
{
  "output_format": "mp4",
  "width": 1080,
  "height": 1080,
  "elements": [
    {
      "type": "shape",
      "fill_color": "#f3f4f6",
      "width": "100%",
      "height": "100%",
      "track": 1
    },
    {
      "type": "image",
      "name": "ProductImage",
      "source": "https://example.com/product.jpg",
      "fit": "contain",
      "width": "80%",
      "height": "60%",
      "y": "40%",
      "track": 2,
      "time": 0,
      "duration": 5,
      "animations": [
        {
          "time": 0,
          "duration": 5,
          "type": "scale",
          "x_scale": "105%",
          "y_scale": "105%",
          "easing": "linear"
        }
      ]
    },
    {
      "type": "text",
      "name": "ProductName",
      "text": "Product Name",
      "font_family": "Arial",
      "font_weight": 700,
      "font_size": "8 vmin",
      "fill_color": "#000000",
      "y": "85%",
      "track": 3,
      "time": 1,
      "duration": 4,
      "animations": [
        {
          "time": 1,
          "duration": 0.5,
          "type": "slide",
          "direction": "up",
          "easing": "quadratic-out"
        }
      ]
    },
    {
      "type": "text",
      "name": "Price",
      "text": "$99.99",
      "font_family": "Arial",
      "font_weight": 900,
      "font_size": "10 vmin",
      "fill_color": "#dc2626",
      "y": "92%",
      "track": 3,
      "time": 1.5,
      "duration": 3.5,
      "animations": [
        {
          "time": 1.5,
          "duration": 0.5,
          "type": "scale",
          "x_scale": "0%",
          "y_scale": "0%",
          "easing": "cubic-out"
        }
      ]
    }
  ]
}
```

### Template 4: Multi-Scene Story Video

**Use Case:** Educational content, explainer video

```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "audio",
      "source": "https://example.com/background-music.mp3",
      "track": 1,
      "volume": "30%",
      "loop": true,
      "audio_fade_in": 2
    },
    {
      "type": "composition",
      "name": "Scene-1-Problem",
      "track": 2,
      "duration": 6,
      "elements": [
        {
          "type": "shape",
          "fill_color": "#ef4444",
          "track": 1
        },
        {
          "type": "text",
          "text": "The Problem",
          "font_size": "12 vmin",
          "fill_color": "#ffffff",
          "track": 2
        }
      ]
    },
    {
      "type": "composition",
      "name": "Scene-2-Solution",
      "track": 2,
      "duration": 6,
      "elements": [
        {
          "type": "shape",
          "fill_color": "#10b981",
          "track": 1
        },
        {
          "type": "text",
          "text": "The Solution",
          "font_size": "12 vmin",
          "fill_color": "#ffffff",
          "track": 2
        }
      ]
    },
    {
      "type": "composition",
      "name": "Scene-3-CTA",
      "track": 2,
      "duration": 5,
      "elements": [
        {
          "type": "shape",
          "fill_color": "#3b82f6",
          "track": 1
        },
        {
          "type": "text",
          "text": "Get Started",
          "font_size": "12 vmin",
          "fill_color": "#ffffff",
          "track": 2
        }
      ]
    }
  ]
}
```

---

## Troubleshooting

### Issue 1: Video Renders But Looks Wrong

**Problem:** Output doesn't match expectations

**Checklist:**
1. **Check asset URLs** - Are they accessible? Use `curl` to test
2. **Verify fit mode** - Use `cover` for backgrounds, `contain` for products
3. **Review positioning** - Use `x: "50%"`, `y: "50%"` for centering
4. **Check track order** - Higher tracks are on top
5. **Verify timing** - Use timeline visualization tool or calculate manually

### Issue 2: Text Not Visible

**Problem:** Text doesn't appear in render

**Solutions:**
```json
{
  "type": "text",
  "text": "Your Text",
  "fill_color": "#ffffff",         // Make sure color contrasts with background
  "stroke_color": "#000000",       // Add outline
  "stroke_width": "2px",
  "shadow_color": "rgba(0,0,0,0.8)", // Add shadow
  "font_size": "10 vmin",          // Make sure size is visible
  "track": 10                      // Ensure it's on top layer
}
```

### Issue 3: Animations Not Working

**Problem:** Elements don't animate as expected

**Common Mistakes:**
```json
// ❌ Wrong: Animation time doesn't match element time
{
  "time": 5,
  "duration": 3,
  "animations": [
    {"time": 0, "duration": 1, "type": "fade"}  // Should be time: 5
  ]
}

// ✅ Correct: Animation time matches element time
{
  "time": 5,
  "duration": 3,
  "animations": [
    {"time": 5, "duration": 1, "type": "fade"}
  ]
}
```

### Issue 4: Media Not Loading

**Problem:** "Failed to load video/image from URL" error

**Solutions:**
1. **Test URL accessibility:**
   ```bash
   curl -I https://example.com/video.mp4
   ```
2. **Ensure HTTPS** (not HTTP)
3. **Check CORS headers** (must allow Creatomate's servers)
4. **Verify file format** (MP4 for video, JPG/PNG for images)
5. **No authentication required** - URLs must be publicly accessible

### Issue 5: Audio Not Playing

**Problem:** Video renders silently

**Checklist:**
```json
{
  "type": "video",
  "source": "...",
  "volume": "100%",    // Check volume isn't 0%

  // If using audio element:
  "type": "audio",
  "source": "...",
  "volume": "50%",
  "track": 1           // Make sure track is defined
}
```

### Issue 6: Duration Calculation Wrong

**Problem:** Video ends too early or too late

**Solution: Manual duration calculation**
```javascript
// Calculate total duration from elements
function calculateDuration(elements) {
  let maxDuration = 0;

  for (const element of elements) {
    const startTime = element.time || 0;
    const duration = element.duration || 5;
    const endTime = startTime + duration;

    if (endTime > maxDuration) {
      maxDuration = endTime;
    }
  }

  return maxDuration;
}
```

### Issue 7: Render Failed (Generic Error)

**Problem:** Render status shows "failed" with vague error

**Debugging Steps:**
1. **Simplify the template** - Remove elements one by one to isolate issue
2. **Test with minimal example:**
   ```json
   {
     "output_format": "mp4",
     "width": 1920,
     "height": 1080,
     "elements": [
       {
         "type": "text",
         "text": "Test"
       }
     ]
   }
   ```
3. **Check JSON validity** - Use a JSON validator
4. **Review error message carefully** - Often contains specific element name
5. **Contact support** with render ID if issue persists

---

## Additional Resources

### Official Documentation
- **RenderScript Reference:** https://creatomate.com/docs/json/introduction
- **API Documentation:** https://creatomate.com/docs/api
- **Template Editor:** https://creatomate.com/editor

### Code Examples
- **Node.js Examples:** https://github.com/Creatomate/node-examples
- **PHP Examples:** https://github.com/Creatomate/php-examples

### Learning Path

**Step 1: Visual Designer (No Code)**
- Use template editor to create videos visually
- Export templates to see RenderScript structure
- Understand element properties and positioning

**Step 2: Template Modifications (Light Code)**
- Start with existing template
- Use API modifications to change text/images
- Learn dynamic content replacement

**Step 3: Custom RenderScript (Full Code)**
- Build templates from scratch using JSON
- Implement complex logic and conditionals
- Create fully programmatic video generation

### Tips for Success

1. **Start simple** - Begin with text and images before complex animations
2. **Use the editor** - Design visually, then export to understand JSON structure
3. **Test incrementally** - Build templates piece by piece, test after each addition
4. **Name everything** - Use descriptive element names for easier modification
5. **Version control** - Keep template history in git for rollback capability
6. **Optimize credits** - Test with low resolution, render final at full quality
7. **Monitor webhooks** - Use webhooks instead of polling for better efficiency

---

## Summary

**RenderScript Essentials:**
- JSON-based video definition language
- Declarative: describe what you want, not how to render
- Composable: build complex videos from simple elements
- Dynamic: perfect for data-driven video generation

**Key Components:**
- **Canvas** - Output format and dimensions
- **Elements** - Text, video, image, audio, composition
- **Timing** - When elements appear and for how long
- **Animations** - How elements move and transform
- **Tracks** - Layering system (higher = front)

**Best Practices:**
- Use relative units (`vmin`, `%`, `vw`, `vh`) for responsive design
- Name elements descriptively for easier modifications
- Optimize for credits (lower resolution for tests)
- Use webhooks for efficient render status notifications
- Version control templates in git

**Workflow:**
1. Design in visual editor (fast iteration)
2. Export to RenderScript JSON (understand structure)
3. Enhance with code (add dynamic logic)
4. Test with low resolution (save credits)
5. Render final at full quality (production)

---

**End of Guidelines**

*For the latest updates and advanced features, always refer to the official Creatomate documentation at creatomate.com/docs*
