# Creatomate API Reference

**Complete API Documentation for Video and Image Generation**

Last Updated: 2025-11-13

---

## Table of Contents

1. [API Overview](#api-overview)
2. [Authentication](#authentication)
3. [Rate Limits and Concurrency](#rate-limits-and-concurrency)
4. [REST API Endpoints](#rest-api-endpoints)
5. [Direct API](#direct-api)
6. [RenderScript JSON Structure](#renderscript-json-structure)
7. [Element Types and Properties](#element-types-and-properties)
8. [Animations](#animations)
9. [Render Object](#render-object)
10. [Webhooks](#webhooks)
11. [Credit System and Pricing](#credit-system-and-pricing)
12. [Code Examples](#code-examples)
13. [Best Practices](#best-practices)
14. [Error Handling](#error-handling)

---

## API Overview

Creatomate is a cloud-based video and image generation platform that provides a REST API for programmatic media creation. The API enables developers to:

- Generate videos and images from templates or pure JSON
- Create dynamic, personalized media content at scale
- Automate video production workflows
- Integrate video generation into existing applications

**Key Capabilities:**
- Template-based rendering with dynamic modifications
- Full JSON-based video/image creation (RenderScript)
- Multiple output formats: MP4, GIF, JPEG, PNG
- Asynchronous rendering with webhook notifications
- Synchronous Direct API for client-side usage

**API Types:**
1. **REST API** - Asynchronous, server-side, for generating renders and managing templates
2. **Direct API** - Synchronous, client-side, URL-based rendering (up to 100 seconds)

**Base URL:**
```
https://api.creatomate.com
```

**API Versions:**
- `/v1/` - Original API version
- `/v2/` - Current API version (recommended)

---

## Authentication

Creatomate uses API key authentication via Bearer tokens.

### Obtaining API Keys

1. Log in to your Creatomate account
2. Navigate to Project Settings
3. Copy the API key for your project
4. Each project has a unique API key

### Authentication Method

Include your API key in the `Authorization` header of every request:

```http
Authorization: Bearer YOUR_API_KEY_HERE
```

### Example Requests

**cURL:**
```bash
curl -X GET https://api.creatomate.com/v1/templates \
  -H "Authorization: Bearer YOUR_API_KEY_HERE"
```

**Node.js:**
```javascript
const response = await fetch('https://api.creatomate.com/v1/templates', {
  headers: {
    'Authorization': 'Bearer YOUR_API_KEY_HERE'
  }
});
```

**Python:**
```python
import requests

headers = {
    'Authorization': 'Bearer YOUR_API_KEY_HERE'
}
response = requests.get('https://api.creatomate.com/v1/templates', headers=headers)
```

### Security Best Practices

- **Never expose API keys** in client-side code or public repositories
- Use environment variables to store API keys
- Rotate API keys periodically
- Use project-specific API keys for isolation
- For client-side usage, use the Direct API with access restrictions

---

## Rate Limits and Concurrency

### API Rate Limits

**Limit:** 30 requests per 10-second window

- All API requests from your account count toward this limit
- Rate limit applies per account, not per API key
- Exceeding the limit returns HTTP 429 (Too Many Requests)

**Example Rate Limit Response:**
```json
{
  "error": "Rate limit exceeded. Please try again later.",
  "status": 429
}
```

### Render Concurrency

Concurrency refers to the number of videos/images processed simultaneously.

**Key Points:**
- No hard limit on render queue size
- Can enqueue 30+ renders per 10 seconds (within rate limit)
- Actual concurrency depends on subscription plan
- Higher plans receive priority in render queue

**Usage Guidelines:**
- Typically, you can use ~20% of monthly quota within 24 hours
- Example: 200,000 credits/month = 40,000 credits/day capacity

### Best Practices for Rate Limits

1. **Implement request queuing** to distribute API calls over time
2. **Use webhooks** instead of polling for render status
3. **Batch operations** where possible
4. **Monitor rate limit headers** (if provided)
5. **Implement exponential backoff** for retries

**Queue Strategy Example:**
```javascript
// Queue mechanism to handle usage spikes
const queue = [];
const REQUESTS_PER_WINDOW = 30;
const WINDOW_MS = 10000;

async function queueRender(renderData) {
  queue.push(renderData);
  await processQueue();
}

async function processQueue() {
  const batch = queue.splice(0, REQUESTS_PER_WINDOW);
  await Promise.all(batch.map(data => createRender(data)));

  if (queue.length > 0) {
    setTimeout(processQueue, WINDOW_MS);
  }
}
```

**With webhook and queue mechanisms, you can handle over 10,000 video/image requests per hour.**

---

## REST API Endpoints

### 1. Create a Render

**POST /v2/renders**

Creates a new render job (video or image) from a template or RenderScript JSON.

**Endpoint:**
```
POST https://api.creatomate.com/v2/renders
```

**Headers:**
```http
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY_HERE
```

**Request Body Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `template_id` | string | Optional* | UUID of template from your project |
| `source` | object | Optional* | Complete RenderScript JSON (alternative to template_id) |
| `modifications` | object | Optional | Key-value pairs to modify template elements |
| `render_scale` | number | Optional | Scaling factor (0.1 - 10.0). Default: 1.0 |
| `max_width` | number | Optional | Maximum output width in pixels |
| `max_height` | number | Optional | Maximum output height in pixels |
| `webhook_url` | string | Optional | URL to receive render completion notification |
| `metadata` | string | Optional | Custom data passed to webhook |

**\*Note:** Must provide either `template_id` or `source`.

**Example Request (Template-based):**
```bash
curl -X POST https://api.creatomate.com/v2/renders \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_KEY_HERE" \
  -d '{
    "template_id": "c937d125-b99b-4690-96f0-6aa1f09438c9",
    "modifications": {
      "Text-1": "Custom text content",
      "Video-1": "https://example.com/video.mp4",
      "Image-1": "https://example.com/image.jpg"
    },
    "render_scale": 0.75,
    "webhook_url": "https://example.com/webhook",
    "metadata": "order_id_12345"
  }'
```

**Example Request (RenderScript-based):**
```bash
curl -X POST https://api.creatomate.com/v2/renders \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_KEY_HERE" \
  -d '{
    "source": {
      "output_format": "mp4",
      "width": 1920,
      "height": 1080,
      "elements": [
        {
          "type": "text",
          "text": "Hello, World!",
          "font_family": "Arial",
          "font_size": "10 vmin",
          "duration": 5
        }
      ]
    }
  }'
```

**Response (202 Accepted):**
```json
{
  "id": "a862048b-d0dc-4029-a4ef-e172e8ded827",
  "status": "processing",
  "template_id": "c937d125-b99b-4690-96f0-6aa1f09438c9",
  "template_name": "My Template",
  "template_tags": ["promotional", "social"],
  "created_at": "2025-11-13T10:30:00.000Z"
}
```

### 2. Get Render Status

**GET /v2/renders/:id**

Retrieves the current status of a render job.

**Endpoint:**
```
GET https://api.creatomate.com/v2/renders/:id
```

**Parameters:**
- `:id` (path) - The render ID returned from POST /v2/renders

**Example Request:**
```bash
curl -X GET https://api.creatomate.com/v2/renders/a862048b-d0dc-4029-a4ef-e172e8ded827 \
  -H "Authorization: Bearer YOUR_API_KEY_HERE"
```

**Response (Success):**
```json
{
  "id": "a862048b-d0dc-4029-a4ef-e172e8ded827",
  "status": "succeeded",
  "url": "https://cdn.creatomate.com/renders/a862048b-d0dc-4029-a4ef-e172e8ded827.mp4",
  "snapshot_url": "https://cdn.creatomate.com/renders/a862048b-d0dc-4029-a4ef-e172e8ded827.jpg",
  "template_id": "c937d125-b99b-4690-96f0-6aa1f09438c9",
  "template_name": "My Template",
  "template_tags": ["promotional", "social"],
  "output_format": "mp4",
  "render_scale": 1.0,
  "width": 1920,
  "height": 1080,
  "frame_rate": 30,
  "duration": 10.5,
  "file_size": 2458624,
  "created_at": "2025-11-13T10:30:00.000Z",
  "completed_at": "2025-11-13T10:30:45.000Z"
}
```

**Response (Failed):**
```json
{
  "id": "a862048b-d0dc-4029-a4ef-e172e8ded827",
  "status": "failed",
  "error_message": "Invalid video source URL",
  "template_id": "c937d125-b99b-4690-96f0-6aa1f09438c9",
  "created_at": "2025-11-13T10:30:00.000Z",
  "completed_at": "2025-11-13T10:30:15.000Z"
}
```

**Status Values:**
- `processing` - Render is in progress
- `succeeded` - Render completed successfully
- `failed` - Render encountered an error

**Important Notes:**
- The `url` field is only available when status is `succeeded`
- Files are stored for **30 days maximum** after rendering
- Use webhooks instead of polling for better efficiency

### 3. Get All Templates

**GET /v1/templates**

Retrieves metadata for all templates in your project.

**Endpoint:**
```
GET https://api.creatomate.com/v1/templates
```

**Example Request:**
```bash
curl -X GET https://api.creatomate.com/v1/templates \
  -H "Authorization: Bearer YOUR_API_KEY_HERE"
```

**Response:**
```json
[
  {
    "id": "c937d125-b99b-4690-96f0-6aa1f09438c9",
    "name": "Promotional Video",
    "tags": ["promo", "social", "instagram"],
    "created_at": "2025-10-01 14:23:00.000 +0000",
    "updated_at": "2025-11-10 09:15:00.000 +0000"
  },
  {
    "id": "087d94b5-cef6-44b7-96d4-4c651beec61d",
    "name": "Product Showcase",
    "tags": ["product", "ecommerce"],
    "created_at": "2025-09-15 11:30:00.000 +0000",
    "updated_at": "2025-09-20 16:45:00.000 +0000"
  }
]
```

**Note:** This endpoint returns only template metadata, not the full template source.

### 4. Get Template by ID

**GET /v1/templates/:id**

Retrieves complete details including RenderScript source for a specific template.

**Endpoint:**
```
GET https://api.creatomate.com/v1/templates/:id
```

**Parameters:**
- `:id` (path) - Template UUID (found in template editor URL or from GET /v1/templates)

**Example Request:**
```bash
curl -X GET https://api.creatomate.com/v1/templates/c937d125-b99b-4690-96f0-6aa1f09438c9 \
  -H "Authorization: Bearer YOUR_API_KEY_HERE"
```

**Response:**
```json
{
  "id": "c937d125-b99b-4690-96f0-6aa1f09438c9",
  "name": "Promotional Video",
  "tags": ["promo", "social", "instagram"],
  "created_at": "2025-10-01 14:23:00.000 +0000",
  "updated_at": "2025-11-10 09:15:00.000 +0000",
  "source": {
    "output_format": "mp4",
    "width": 1920,
    "height": 1080,
    "elements": [
      {
        "type": "text",
        "name": "Text-1",
        "text": "Default Text",
        "font_family": "Arial",
        "font_size": "8 vmin",
        "x": "50%",
        "y": "50%",
        "duration": 5
      }
    ]
  }
}
```

**Use Case:** Retrieve template configuration for advanced modifications beyond basic element replacement.

---

## Direct API

The Direct API provides **synchronous, URL-based rendering** for client-side applications.

### Key Differences from REST API

| Feature | REST API | Direct API |
|---------|----------|------------|
| **Operation** | Asynchronous | Synchronous |
| **Usage** | Server-side | Client-side |
| **Timeout** | No timeout | 100 seconds max |
| **Parameters** | JSON body | URL-encoded |
| **Use Case** | Batch processing, workflows | Real-time embeds, emails |

### Direct API URL Format

**Base URL:**
```
https://api.creatomate.com/render
```

**URL Structure:**
```
https://api.creatomate.com/render?template_id={TEMPLATE_ID}&modifications={MODIFICATIONS_JSON}
```

### Access Control

Direct API access can be configured in Project Settings:

- **Restricted** (Default) - Only templates in your project can be rendered
- **Unprotected** - All requests accepted (not recommended for public URLs)

### Use Cases

1. **Dynamic images in emails**
```html
<img src="https://api.creatomate.com/render?template_id=abc123&modifications={...}">
```

2. **Real-time video previews**
```html
<video src="https://api.creatomate.com/render?template_id=abc123&modifications={...}"></video>
```

3. **Social media OG images**
```html
<meta property="og:image" content="https://api.creatomate.com/render?template_id=abc123&modifications={...}">
```

### Important Notes

- Direct API shares the same rate limits as REST API
- Renders can take up to 100 seconds
- URL parameters must be properly encoded
- Best for client-side scenarios where webhooks aren't possible

---

## RenderScript JSON Structure

RenderScript is Creatomate's JSON-based format for defining videos and images programmatically. Think of it as "HTML for videos."

### Top-Level Structure

**Minimal RenderScript:**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": []
}
```

### Top-Level Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `output_format` | string | Yes | Output format: `"mp4"`, `"gif"`, `"jpg"`, `"png"` |
| `width` | number | Yes | Canvas width in pixels |
| `height` | number | Yes | Canvas height in pixels |
| `elements` | array | Yes | Array of element objects (can be empty) |
| `duration` | number | Optional | Total duration in seconds (auto-calculated if omitted) |
| `frame_rate` | number | Optional | Frames per second. Default: 30 |
| `fonts` | array | Optional | Custom font declarations |

### Output Formats

| Format | Use Case | Features |
|--------|----------|----------|
| `mp4` | Videos | Full animation, audio support |
| `gif` | Animated images | No audio, lower quality, web-friendly |
| `jpg` | Static images | Good compression, no transparency |
| `png` | Static images | Lossless, supports transparency |

### Complete Example

```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "frame_rate": 30,
  "fonts": [
    {
      "family": "CustomFont",
      "weight": "400",
      "style": "normal",
      "source": "https://example.com/font.woff"
    }
  ],
  "elements": [
    {
      "type": "video",
      "source": "https://cdn.creatomate.com/demo/video1.mp4",
      "track": 1,
      "time": 0,
      "duration": 10
    },
    {
      "type": "text",
      "text": "Hello, World!",
      "font_family": "Arial",
      "font_size": "10 vmin",
      "x": "50%",
      "y": "50%",
      "track": 2,
      "time": 2,
      "duration": 5
    }
  ]
}
```

### Default Behavior

- **Duration:** 5 seconds if not specified
- **Element positioning:** Centered by default (`x: "50%"`, `y: "50%"`)
- **Element size:** Full width by default (`width: "100%"`, `height: "100%"`)
- **Frame rate:** 30 fps if not specified

---

## Element Types and Properties

### Common Element Properties

All elements share these base properties:

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `type` | string | - | Element type: `"text"`, `"video"`, `"image"`, `"audio"`, `"composition"`, `"shape"` |
| `name` | string | null | Unique identifier for modifications |
| `track` | number | null | Layer number for stacking (higher = front) |
| `time` | number/string | null | Start time in seconds or `"auto"` |
| `duration` | number/string | null | Duration in seconds, `"auto"`, or `"media"` |
| `x` | string | `"50%"` | Horizontal position (px, %, vw) |
| `y` | string | `"50%"` | Vertical position (px, %, vh) |
| `width` | string | `"100%"` | Element width (px, %, vw) |
| `height` | string | `"100%"` | Element height (px, %, vh) |
| `x_padding` | string | `"0vw"` | Horizontal padding |
| `y_padding` | string | `"0vh"` | Vertical padding |
| `x_scale` | string | `"100%"` | Horizontal scale |
| `y_scale` | string | `"100%"` | Vertical scale |
| `x_rotation` | number | 0 | X-axis rotation (degrees) |
| `y_rotation` | number | 0 | Y-axis rotation (degrees) |
| `z_rotation` | number | 0 | Z-axis rotation (degrees) |
| `opacity` | string | `"100%"` | Element opacity (0-100%) |
| `fill_color` | string/array | null | Fill color (hex, rgb, or gradient) |
| `fill_mode` | string | `"solid"` | Fill type: `"solid"`, `"linear"`, `"radial"` |
| `stroke_color` | string | null | Border color |
| `stroke_width` | string | null | Border thickness |
| `border_radius` | string | null | Corner rounding |
| `shadow_color` | string | null | Drop shadow color |
| `blur_radius` | string | null | Blur intensity |
| `blend_mode` | string | null | Layer blending mode |
| `color_filter` | string | null | Visual effect (e.g., `"grayscale"`) |
| `animations` | array | [] | Array of animation keyframes |

### Text Element

**Type:** `"text"`

**Additional Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | string | `""` | Text content |
| `font_family` | string | `"Aileron"` | Font family name |
| `font_weight` | number | 400 | Font weight (100-900) |
| `font_style` | string | `"normal"` | Font style: `"normal"`, `"italic"` |
| `font_size` | string | null | Font size (e.g., `"8 vmin"`, `"48px"`) |
| `font_size_minimum` | string | `"2 vmin"` | Minimum font size for auto-sizing |
| `font_size_maximum` | string | `"50 vmin"` | Maximum font size for auto-sizing |
| `x_alignment` | string | `"50%"` | Horizontal text alignment (0%=left, 50%=center, 100%=right) |
| `y_alignment` | string | `"50%"` | Vertical text alignment (0%=top, 50%=middle, 100%=bottom) |
| `letter_spacing` | string | `"0%"` | Letter spacing |
| `line_height` | string | `"100%"` | Line height |
| `text_wrap` | boolean | false | Enable text wrapping |
| `text_clip` | boolean | true | Clip overflow text |
| `text_transform` | string | null | Transform: `"uppercase"`, `"lowercase"`, `"capitalize"` |
| `background_color` | string | null | Text background color |
| `background_x_padding` | string | `"0%"` | Background horizontal padding |
| `background_border_radius` | string | `"0%"` | Background corner rounding |

**Example:**
```json
{
  "type": "text",
  "name": "Title",
  "text": "Dynamic Title",
  "font_family": "Arial",
  "font_weight": 700,
  "font_size": "10 vmin",
  "fill_color": "#ffffff",
  "x_alignment": "50%",
  "y_alignment": "50%",
  "track": 2,
  "time": 1,
  "duration": 8,
  "animations": [
    {
      "time": 1,
      "duration": 0.5,
      "easing": "quadratic-out",
      "type": "fade"
    }
  ]
}
```

### Video Element

**Type:** `"video"`

**Additional Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `source` | string | null | URL or GUID of video file |
| `provider` | string | null | AI video generation provider |
| `fit` | string | `"cover"` | Resize behavior: `"cover"`, `"contain"`, `"fill"` |
| `volume` | string | `"100%"` | Audio volume (0-100%) |
| `loop` | boolean | false | Loop video continuously |
| `trim_start` | number | null | Trim start time (seconds) |
| `trim_duration` | number | null | Trim duration (seconds) |
| `audio_fade_in` | number | null | Audio fade-in duration (seconds) |
| `audio_fade_out` | number | null | Audio fade-out duration (seconds) |

**Fit Options:**
- `"cover"` - Fills element bounds, crops overflow (default)
- `"contain"` - Fits within bounds, may show letterboxing
- `"fill"` - Stretches to fill bounds, may distort

**Example:**
```json
{
  "type": "video",
  "name": "Background-Video",
  "source": "https://cdn.creatomate.com/demo/video1.mp4",
  "fit": "cover",
  "volume": "80%",
  "trim_start": 5,
  "trim_duration": 10,
  "audio_fade_in": 1,
  "audio_fade_out": 1,
  "track": 1,
  "time": 0,
  "duration": 10
}
```

### Image Element

**Type:** `"image"`

**Additional Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `source` | string | null | URL or GUID of image file |
| `fit` | string | `"cover"` | Resize behavior: `"cover"`, `"contain"`, `"fill"` |

**Example:**
```json
{
  "type": "image",
  "name": "Product-Image",
  "source": "https://example.com/product.jpg",
  "fit": "contain",
  "track": 1,
  "time": 0,
  "duration": 5,
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

### Audio Element

**Type:** `"audio"`

**Additional Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `source` | string | null | URL or GUID of audio file |
| `volume` | string | `"100%"` | Audio volume (0-100%) |
| `loop` | boolean | false | Loop audio continuously |
| `audio_fade_in` | number | null | Audio fade-in duration (seconds) |
| `audio_fade_out` | number | null | Audio fade-out duration (seconds) |

**Example:**
```json
{
  "type": "audio",
  "name": "Background-Music",
  "source": "https://cdn.creatomate.com/demo/music.mp3",
  "volume": "50%",
  "loop": true,
  "audio_fade_in": 2,
  "audio_fade_out": 3,
  "track": 1,
  "time": 0,
  "duration": "auto"
}
```

### Composition Element

**Type:** `"composition"`

A composition groups multiple elements into a single unit, functioning as a nested template with its own timeline.

**Additional Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `elements` | array | [] | Array of nested elements |
| `loop` | boolean | false | Loop composition continuously |
| `plays` | number/string | 1 | Number of loops or `"auto"` for endless |

**Use Cases:**
- Grouping elements into reusable scenes
- Creating nested timelines
- Sequencing multiple scenes on the same track

**Example:**
```json
{
  "type": "composition",
  "name": "Scene-1",
  "track": 1,
  "time": 0,
  "duration": 10,
  "elements": [
    {
      "type": "video",
      "source": "https://cdn.creatomate.com/demo/video1.mp4",
      "track": 1
    },
    {
      "type": "text",
      "text": "Scene 1 Title",
      "track": 2,
      "time": 1,
      "duration": 3
    }
  ]
}
```

**Sequencing Scenes:**
```json
{
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "elements": [
    {
      "type": "composition",
      "name": "Intro",
      "track": 1,
      "elements": [...]
    },
    {
      "type": "composition",
      "name": "Main",
      "track": 1,
      "elements": [...]
    },
    {
      "type": "composition",
      "name": "Outro",
      "track": 1,
      "elements": [...]
    }
  ]
}
```

---

## Animations

Animations are defined as an array of keyframes in the `animations` property of any element.

### Animation Structure

```json
"animations": [
  {
    "time": 0,
    "duration": 1,
    "easing": "quadratic-out",
    "type": "fade",
    "transition": false,
    "fade": true
  }
]
```

### Animation Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `time` | number | Yes | When animation starts (seconds) |
| `duration` | number | Yes | Animation length (seconds) |
| `type` | string | Yes | Animation type (see below) |
| `easing` | string | Optional | Easing function (see below) |
| `transition` | boolean | Optional | Use as transition between elements |
| `fade` | boolean | Optional | Include fade effect |
| `direction` | string | Optional | Direction for directional animations (e.g., `"180°"`, `"up"`) |

### Available Animation Types

**Basic Animations:**
- `fade` - Fade in/out
- `scale` - Scale/zoom effect
- `slide` - Slide in/out
- `spin` - Rotation effect
- `wipe` - Wipe transition

**Text-Specific Animations:**
- `text-slide` - Slide text characters
- `text-fly` - Flying text characters
- `text-fade` - Fade text characters

**Custom Animations:**
You can combine multiple animations and transform properties for custom effects.

### Easing Functions

Common easing options:
- `linear` - Constant speed
- `quadratic-in` - Accelerating
- `quadratic-out` - Decelerating
- `quadratic-in-out` - Ease in and out
- `cubic-in` - Strong acceleration
- `cubic-out` - Strong deceleration
- `cubic-in-out` - Strong ease in and out

### Animation Examples

**Fade In:**
```json
{
  "animations": [
    {
      "time": 0,
      "duration": 1,
      "type": "fade",
      "easing": "linear"
    }
  ]
}
```

**Zoom Effect:**
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

**Slide Transition:**
```json
{
  "animations": [
    {
      "time": 4.5,
      "duration": 1,
      "type": "slide",
      "direction": "180°",
      "easing": "cubic-in-out",
      "transition": true
    }
  ]
}
```

**Multiple Animations:**
```json
{
  "animations": [
    {
      "time": 0,
      "duration": 0.5,
      "type": "fade",
      "easing": "quadratic-out"
    },
    {
      "time": 0,
      "duration": 0.5,
      "type": "slide",
      "direction": "up",
      "easing": "quadratic-out"
    },
    {
      "time": 9.5,
      "duration": 0.5,
      "type": "fade",
      "easing": "quadratic-in"
    }
  ]
}
```

### Transitions Between Elements

Set `transition: true` to animate one element transitioning to another on the same track.

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
      "animations": [
        {
          "time": 0,
          "duration": 1,
          "type": "slide",
          "direction": "180°",
          "transition": true
        }
      ]
    }
  ]
}
```

---

## Render Object

The render object represents a render job and its status.

### Render Object Fields

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique render identifier (UUID) |
| `status` | string | Render status: `"processing"`, `"succeeded"`, `"failed"` |
| `url` | string | URL to rendered file (only when succeeded) |
| `snapshot_url` | string | URL to preview/thumbnail image |
| `template_id` | string | Template UUID (if template-based) |
| `template_name` | string | Template name |
| `template_tags` | array | Template tags |
| `output_format` | string | Output format: `"mp4"`, `"gif"`, `"jpg"`, `"png"` |
| `render_scale` | number | Scaling factor applied |
| `width` | number | Output width in pixels |
| `height` | number | Output height in pixels |
| `frame_rate` | number | Frames per second |
| `duration` | number | Duration in seconds (for videos) |
| `file_size` | number | File size in bytes |
| `error_message` | string | Error description (only when failed) |
| `created_at` | string | ISO 8601 timestamp |
| `completed_at` | string | ISO 8601 timestamp (when finished) |
| `metadata` | string | Custom metadata passed to webhook |

### Status Flow

```
[Created] → [Processing] → [Succeeded/Failed]
```

### Accessing Rendered Files

**Important:**
- The `url` field is **only available** when `status` is `"succeeded"`
- Files are stored for a **maximum of 30 days**
- After 30 days, files are automatically deleted
- Download and store renders if long-term access is needed

### Polling vs Webhooks

**Polling (Not Recommended):**
```javascript
async function pollRender(renderId) {
  while (true) {
    const response = await fetch(`https://api.creatomate.com/v2/renders/${renderId}`, {
      headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
    });
    const render = await response.json();

    if (render.status === 'succeeded') {
      return render.url;
    } else if (render.status === 'failed') {
      throw new Error(render.error_message);
    }

    await new Promise(resolve => setTimeout(resolve, 5000));
  }
}
```

**Webhooks (Recommended):**
```javascript
// Send render request with webhook
await fetch('https://api.creatomate.com/v2/renders', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer YOUR_API_KEY'
  },
  body: JSON.stringify({
    template_id: 'abc123',
    webhook_url: 'https://myapp.com/webhook'
  })
});

// Webhook endpoint receives notification
app.post('/webhook', (req, res) => {
  const render = req.body;

  if (render.status === 'succeeded') {
    console.log('Render complete:', render.url);
    // Process the rendered file
  } else if (render.status === 'failed') {
    console.error('Render failed:', render.error_message);
  }

  res.sendStatus(200);
});
```

---

## Webhooks

Webhooks provide real-time notifications when renders complete or fail, eliminating the need for polling.

### Setting Up Webhooks

**Two Configuration Methods:**

1. **Project-level webhook** (in Project Settings)
   - Applies to all renders by default
   - Can be overridden per render

2. **Render-level webhook** (in API request)
   - Specified in `webhook_url` parameter
   - Overrides project-level setting

### Webhook Request

When a render completes or fails, Creatomate sends an HTTP POST request to your webhook URL.

**Request:**
```http
POST https://your-app.com/webhook
Content-Type: application/json

{
  "id": "a862048b-d0dc-4029-a4ef-e172e8ded827",
  "status": "succeeded",
  "url": "https://cdn.creatomate.com/renders/a862048b-d0dc-4029-a4ef-e172e8ded827.mp4",
  "snapshot_url": "https://cdn.creatomate.com/renders/a862048b-d0dc-4029-a4ef-e172e8ded827.jpg",
  "template_id": "c937d125-b99b-4690-96f0-6aa1f09438c9",
  "template_name": "My Template",
  "output_format": "mp4",
  "width": 1920,
  "height": 1080,
  "duration": 10.5,
  "file_size": 2458624,
  "metadata": "order_id_12345",
  "created_at": "2025-11-13T10:30:00.000Z",
  "completed_at": "2025-11-13T10:30:45.000Z"
}
```

### Webhook Payload

The webhook payload is identical to the render object returned by GET /v2/renders/:id.

### Using Metadata

The `metadata` field allows you to pass custom data through to your webhook for context.

**Example:**
```javascript
// Create render with metadata
await fetch('https://api.creatomate.com/v2/renders', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer YOUR_API_KEY'
  },
  body: JSON.stringify({
    template_id: 'abc123',
    modifications: { ... },
    webhook_url: 'https://myapp.com/webhook',
    metadata: JSON.stringify({
      order_id: '12345',
      user_id: '67890',
      campaign: 'summer-2025'
    })
  })
});

// Webhook handler
app.post('/webhook', (req, res) => {
  const render = req.body;
  const metadata = JSON.parse(render.metadata);

  // Use metadata for context
  console.log(`Render for order ${metadata.order_id} completed`);
  updateOrder(metadata.order_id, render.url);

  res.sendStatus(200);
});
```

### Webhook Best Practices

1. **Return 200 OK quickly** - Process asynchronously if needed
2. **Validate webhook source** - Check IP addresses or use signed URLs
3. **Handle retries** - Creatomate may retry if your endpoint fails
4. **Use HTTPS** - Always use secure webhook URLs
5. **Log webhook data** - For debugging and auditing
6. **Test thoroughly** - Use tools like webhook.site for testing

### Webhook Implementation Examples

**Node.js (Express):**
```javascript
const express = require('express');
const app = express();

app.use(express.json());

app.post('/webhook', (req, res) => {
  const render = req.body;

  console.log('Webhook received:', render.id);

  if (render.status === 'succeeded') {
    // Process successful render
    processCompletedRender(render);
  } else if (render.status === 'failed') {
    // Handle failed render
    logRenderError(render);
  }

  res.sendStatus(200);
});

app.listen(3000);
```

**Python (Flask):**
```python
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/webhook', methods=['POST'])
def webhook():
    render = request.json

    print(f"Webhook received: {render['id']}")

    if render['status'] == 'succeeded':
        # Process successful render
        process_completed_render(render)
    elif render['status'] == 'failed':
        # Handle failed render
        log_render_error(render)

    return '', 200

if __name__ == '__main__':
    app.run(port=3000)
```

---

## Credit System and Pricing

Creatomate uses a credit-based pricing model. Every render consumes credits based on complexity.

### Pricing Plans

| Plan | Monthly Cost | Credits | Estimated Renders* |
|------|-------------|---------|-------------------|
| **Essential** | $54 | 2,000 | ~200 videos (15s, 720p) |
| **Growth** | $129 | 10,000 | ~1,000 videos (15s, 720p) |
| **Beyond** | $329 | 50,000 | ~5,000 videos (15s, 720p) |

**\*Estimates** based on short 15-second videos at 720p resolution. Actual usage varies.

### Free Trial

- **50 free API credits** to test all features
- No credit card required
- Full API access during trial

### Credit Calculation Factors

Credits consumed depend on:

1. **Resolution** - Higher resolution = more credits
2. **Duration** - Longer videos = more credits
3. **Output format** - Videos cost more than images
4. **Complexity** - More elements and effects = more processing

### Transcription Costs

- **10 credits per minute** of transcription
- Billed only if transcription cost > rendering cost
- Final cost is the higher of the two

### Usage Guidelines

**Daily Usage Capacity:**
- Approximately **20% of monthly quota** can be used per day
- Example: 200,000 credits/month = 40,000 credits/day capacity

### Optimization Tips

1. **Lower resolution** when high quality isn't critical
2. **Shorter durations** reduce credit usage
3. **Use images** instead of videos when animation isn't needed
4. **Batch operations** to maximize efficiency
5. **Test with low-res** renders before final production

### API Availability

- API access available on **all plans**
- No API-specific pricing tiers
- Same credit costs across all plan levels

---

## Code Examples

### Official SDKs and Libraries

Creatomate provides official libraries for popular languages:

| Language | Repository | Package Manager |
|----------|------------|-----------------|
| **Node.js** | [creatomate-node](https://github.com/Creatomate/creatomate-node) | npm: `creatomate` |
| **PHP** | [creatomate-php](https://github.com/Creatomate/creatomate-php) | Packagist: `creatomate/creatomate` |
| **Preview SDK** | [creatomate-preview](https://github.com/Creatomate/creatomate-preview) | npm: `@creatomate/preview` |

**Example Repositories:**
- [Node.js examples](https://github.com/Creatomate/node-examples)
- [PHP examples](https://github.com/Creatomate/php-examples)

### Node.js SDK Example

**Installation:**
```bash
npm install creatomate
```

**Basic Usage:**
```javascript
const Creatomate = require('creatomate');

const client = new Creatomate.Client('YOUR_API_KEY_HERE');

async function createRender() {
  const render = await client.render({
    template_id: 'c937d125-b99b-4690-96f0-6aa1f09438c9',
    modifications: {
      'Text-1': 'Custom Text',
      'Video-1': 'https://example.com/video.mp4'
    }
  });

  console.log('Render created:', render.id);

  // Wait for completion
  const completed = await client.waitForRender(render.id);
  console.log('Render complete:', completed.url);
}

createRender();
```

### cURL Examples

**Create Render:**
```bash
curl -X POST https://api.creatomate.com/v2/renders \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_KEY_HERE" \
  -d '{
    "template_id": "c937d125-b99b-4690-96f0-6aa1f09438c9",
    "modifications": {
      "Text-1": "Hello, World!",
      "Video-1": "https://cdn.creatomate.com/demo/video1.mp4"
    },
    "webhook_url": "https://myapp.com/webhook"
  }'
```

**Get Render Status:**
```bash
curl -X GET https://api.creatomate.com/v2/renders/a862048b-d0dc-4029-a4ef-e172e8ded827 \
  -H "Authorization: Bearer YOUR_API_KEY_HERE"
```

**List Templates:**
```bash
curl -X GET https://api.creatomate.com/v1/templates \
  -H "Authorization: Bearer YOUR_API_KEY_HERE"
```

### Python Examples

**Basic Render:**
```python
import requests
import time

API_KEY = 'YOUR_API_KEY_HERE'
BASE_URL = 'https://api.creatomate.com'

def create_render():
    headers = {
        'Authorization': f'Bearer {API_KEY}',
        'Content-Type': 'application/json'
    }

    data = {
        'template_id': 'c937d125-b99b-4690-96f0-6aa1f09438c9',
        'modifications': {
            'Text-1': 'Dynamic Text',
            'Image-1': 'https://example.com/image.jpg'
        }
    }

    response = requests.post(f'{BASE_URL}/v2/renders', headers=headers, json=data)
    render = response.json()

    print(f"Render created: {render['id']}")
    return render['id']

def get_render_status(render_id):
    headers = {
        'Authorization': f'Bearer {API_KEY}'
    }

    response = requests.get(f'{BASE_URL}/v2/renders/{render_id}', headers=headers)
    return response.json()

def wait_for_render(render_id):
    while True:
        render = get_render_status(render_id)

        if render['status'] == 'succeeded':
            print(f"Render complete: {render['url']}")
            return render
        elif render['status'] == 'failed':
            raise Exception(f"Render failed: {render.get('error_message')}")

        time.sleep(5)

# Usage
render_id = create_render()
completed = wait_for_render(render_id)
```

### JavaScript (Fetch API)

**Create and Poll Render:**
```javascript
const API_KEY = 'YOUR_API_KEY_HERE';
const BASE_URL = 'https://api.creatomate.com';

async function createRender() {
  const response = await fetch(`${BASE_URL}/v2/renders`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${API_KEY}`
    },
    body: JSON.stringify({
      template_id: 'c937d125-b99b-4690-96f0-6aa1f09438c9',
      modifications: {
        'Text-1': 'Dynamic Content',
        'Video-1': 'https://example.com/video.mp4'
      }
    })
  });

  return await response.json();
}

async function getRenderStatus(renderId) {
  const response = await fetch(`${BASE_URL}/v2/renders/${renderId}`, {
    headers: {
      'Authorization': `Bearer ${API_KEY}`
    }
  });

  return await response.json();
}

async function waitForRender(renderId) {
  while (true) {
    const render = await getRenderStatus(renderId);

    if (render.status === 'succeeded') {
      console.log('Render complete:', render.url);
      return render;
    } else if (render.status === 'failed') {
      throw new Error(`Render failed: ${render.error_message}`);
    }

    await new Promise(resolve => setTimeout(resolve, 5000));
  }
}

// Usage
(async () => {
  const render = await createRender();
  console.log('Render created:', render.id);

  const completed = await waitForRender(render.id);
  console.log('Download URL:', completed.url);
})();
```

### Template Modifications Examples

**Replace Text and Images:**
```json
{
  "template_id": "abc123",
  "modifications": {
    "Title": "New Product Launch",
    "Subtitle": "Available Now",
    "ProductImage": "https://example.com/product.jpg",
    "LogoImage": "https://example.com/logo.png"
  }
}
```

**Advanced Modifications (Dot Notation):**
```json
{
  "template_id": "abc123",
  "modifications": {
    "Text-1": "Custom Text",
    "Text-1.font_size": "12 vmin",
    "Text-1.fill_color": "#ff0000",
    "Video-1": "https://example.com/video.mp4",
    "Video-1.volume": "50%",
    "Scene-1.duration": 15
  }
}
```

### RenderScript from Scratch

**Complete Video from JSON:**
```javascript
const renderData = {
  source: {
    output_format: "mp4",
    width: 1920,
    height: 1080,
    frame_rate: 30,
    elements: [
      {
        type: "video",
        source: "https://cdn.creatomate.com/demo/video1.mp4",
        track: 1,
        time: 0,
        duration: 10,
        fit: "cover"
      },
      {
        type: "text",
        text: "Hello, World!",
        font_family: "Arial",
        font_weight: 700,
        font_size: "10 vmin",
        fill_color: "#ffffff",
        x: "50%",
        y: "50%",
        track: 2,
        time: 2,
        duration: 6,
        animations: [
          {
            time: 2,
            duration: 0.5,
            type: "fade",
            easing: "quadratic-out"
          },
          {
            time: 7.5,
            duration: 0.5,
            type: "fade",
            easing: "quadratic-in"
          }
        ]
      }
    ]
  }
};

// Send to API
await fetch('https://api.creatomate.com/v2/renders', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer YOUR_API_KEY'
  },
  body: JSON.stringify(renderData)
});
```

### Image Slideshow Example

**Dynamic Image Slideshow:**
```javascript
const images = [
  'https://example.com/image1.jpg',
  'https://example.com/image2.jpg',
  'https://example.com/image3.jpg',
  'https://example.com/image4.jpg'
];

const elements = images.map((url, index) => ({
  type: 'image',
  source: url,
  track: 1,
  duration: 5,
  fit: 'cover',
  animations: index > 0 ? [{
    time: 0,
    duration: 1,
    type: 'slide',
    direction: '180°',
    transition: true,
    easing: 'cubic-in-out'
  }] : []
}));

const renderData = {
  source: {
    output_format: 'mp4',
    width: 1280,
    height: 720,
    elements: elements
  }
};

// Send to API
await fetch('https://api.creatomate.com/v2/renders', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer YOUR_API_KEY'
  },
  body: JSON.stringify(renderData)
});
```

---

## Best Practices

### API Usage Optimization

1. **Use Webhooks, Not Polling**
   - Webhooks provide immediate notifications
   - Polling wastes API quota and adds latency
   - Set up reliable webhook endpoints with proper error handling

2. **Implement Request Queuing**
   - Respect 30 requests/10-second rate limit
   - Distribute requests over time during high-volume periods
   - Use queue mechanisms for spikes in demand

3. **Leverage Template Modifications**
   - Create reusable templates in the editor
   - Use modifications for dynamic content
   - Avoid sending full RenderScript when templates suffice

4. **Optimize Media Assets**
   - Compress images and videos before uploading
   - Use appropriate resolutions (don't over-size)
   - Host media on fast, reliable CDNs

5. **Cache Template Data**
   - GET /v1/templates data changes infrequently
   - Cache template IDs and metadata locally
   - Reduce unnecessary API calls

### Performance Optimization

1. **Resolution and Quality**
   - Use lower `render_scale` for previews (e.g., 0.5)
   - Generate full-quality renders only when needed
   - Consider output format (GIF vs MP4 vs image)

2. **Duration Management**
   - Shorter videos render faster and use fewer credits
   - Trim source videos to exact length needed
   - Remove unnecessary padding from compositions

3. **Asset Hosting**
   - Host source media on fast, reliable servers
   - Use HTTPS URLs for all media assets
   - Ensure media URLs are publicly accessible

4. **Concurrent Renders**
   - Plan for your subscription's concurrency limits
   - Higher plans get faster processing
   - Contact support for custom concurrency needs

### Error Handling

1. **Validate Before Sending**
   - Check template IDs exist
   - Validate media URLs are accessible
   - Ensure modifications reference valid element names

2. **Handle Failed Renders**
   - Parse `error_message` for debugging
   - Log failed renders for analysis
   - Implement retry logic for transient errors

3. **Monitor Webhook Reliability**
   - Log all webhook receipts
   - Implement webhook retry handling
   - Fall back to polling if webhook fails

### Security Best Practices

1. **API Key Management**
   - Store API keys in environment variables
   - Never commit API keys to version control
   - Use separate keys for dev/staging/production
   - Rotate keys periodically

2. **Webhook Security**
   - Use HTTPS webhook URLs only
   - Validate webhook source (IP whitelist if possible)
   - Implement request signing if handling sensitive data

3. **Direct API Access Control**
   - Use "Restricted" mode in production
   - Only allow rendering of project templates
   - Avoid "Unprotected" mode for public-facing URLs

### Development Workflow

1. **Test in Template Editor First**
   - Design and test templates visually
   - Export RenderScript for API usage
   - Validate animations and timing

2. **Start with Template Modifications**
   - Begin with simple element replacements
   - Progress to advanced dot-notation modifications
   - Only use full RenderScript when necessary

3. **Use Preview SDK for Client-Side**
   - Preview changes before rendering
   - Reduce wasted API credits
   - Improve user experience

4. **Version Control Templates**
   - Export template RenderScript to version control
   - Track template changes over time
   - Enable rollback to previous versions

### Cost Optimization

1. **Estimate Credits Before Production**
   - Test render costs with representative content
   - Calculate expected monthly usage
   - Choose appropriate subscription plan

2. **Optimize for Credit Efficiency**
   - Lower resolution when quality isn't critical
   - Use static images instead of videos where possible
   - Batch similar renders together

3. **Monitor Usage Patterns**
   - Track render costs over time
   - Identify expensive render patterns
   - Adjust workflows to reduce costs

### Scalability Considerations

1. **Design for Asynchronous Processing**
   - Never block on render completion
   - Use webhooks for notifications
   - Implement robust queue mechanisms

2. **Handle High Volume**
   - Distribute requests across time windows
   - Implement rate limit backoff
   - Contact support for custom arrangements

3. **Archive Rendered Files**
   - Download and store renders beyond 30 days
   - Implement CDN hosting for long-term access
   - Set up automated archival workflows

---

## Error Handling

### HTTP Status Codes

| Status Code | Meaning | Action |
|-------------|---------|--------|
| **200 OK** | Success | Process response data |
| **201 Created** | Resource created | Use returned ID for tracking |
| **202 Accepted** | Render accepted | Poll or wait for webhook |
| **400 Bad Request** | Invalid request data | Fix request parameters |
| **401 Unauthorized** | Invalid/missing API key | Check authentication |
| **404 Not Found** | Resource not found | Verify template/render ID |
| **429 Too Many Requests** | Rate limit exceeded | Implement backoff, retry later |
| **500 Internal Server Error** | Server error | Retry request, contact support if persists |

### Common Error Scenarios

#### 1. Invalid API Key

**Error Response:**
```json
{
  "error": "Unauthorized",
  "message": "Invalid API key",
  "status": 401
}
```

**Solution:**
- Verify API key is correct
- Check API key is active in project settings
- Ensure `Bearer` prefix in Authorization header

#### 2. Rate Limit Exceeded

**Error Response:**
```json
{
  "error": "Too Many Requests",
  "message": "Rate limit exceeded. Please try again later.",
  "status": 429
}
```

**Solution:**
- Implement exponential backoff
- Reduce request frequency
- Use request queuing

**Retry Logic:**
```javascript
async function createRenderWithRetry(data, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      const response = await fetch('https://api.creatomate.com/v2/renders', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${API_KEY}`
        },
        body: JSON.stringify(data)
      });

      if (response.status === 429) {
        const delay = Math.pow(2, i) * 1000; // Exponential backoff
        await new Promise(resolve => setTimeout(resolve, delay));
        continue;
      }

      return await response.json();
    } catch (error) {
      if (i === maxRetries - 1) throw error;
    }
  }
}
```

#### 3. Template Not Found

**Error Response:**
```json
{
  "error": "Not Found",
  "message": "Template not found",
  "status": 404
}
```

**Solution:**
- Verify template ID is correct
- Ensure template exists in your project
- Check template hasn't been deleted

#### 4. Invalid Modifications

**Error Response:**
```json
{
  "error": "Bad Request",
  "message": "Invalid modification key: 'NonExistentElement'",
  "status": 400
}
```

**Solution:**
- Verify element names match template
- Use exact element names from template editor
- Check template structure with GET /v1/templates/:id

#### 5. Invalid Media URL

**Render Failure:**
```json
{
  "id": "abc123",
  "status": "failed",
  "error_message": "Failed to load video from URL: https://example.com/video.mp4"
}
```

**Solution:**
- Verify URL is accessible
- Ensure URL uses HTTPS
- Check media file format is supported
- Confirm URL doesn't require authentication

#### 6. Render Timeout

**Render Failure:**
```json
{
  "id": "abc123",
  "status": "failed",
  "error_message": "Render timeout exceeded"
}
```

**Solution:**
- Reduce render complexity
- Shorten video duration
- Lower resolution
- Contact support for complex renders

### Error Handling Best Practices

1. **Log All Errors**
   ```javascript
   try {
     const render = await createRender(data);
   } catch (error) {
     console.error('Render creation failed:', {
       error: error.message,
       data: data,
       timestamp: new Date().toISOString()
     });
     throw error;
   }
   ```

2. **Implement Retry Logic**
   - Retry on 429 (rate limit)
   - Retry on 500 (server error)
   - Don't retry on 400 (bad request)
   - Use exponential backoff

3. **Validate Before Sending**
   ```javascript
   function validateRenderData(data) {
     if (!data.template_id && !data.source) {
       throw new Error('Must provide template_id or source');
     }

     if (data.modifications) {
       for (const [key, value] of Object.entries(data.modifications)) {
         if (typeof value !== 'string') {
           throw new Error(`Modification value for ${key} must be string`);
         }
       }
     }
   }
   ```

4. **Monitor Render Failures**
   - Track failure rates
   - Analyze error patterns
   - Alert on unexpected errors

5. **Graceful Degradation**
   ```javascript
   async function createRenderWithFallback(data) {
     try {
       return await createRender(data);
     } catch (error) {
       if (error.status === 429) {
         // Queue for later
         await queueRender(data);
         return { queued: true };
       } else {
         // Use fallback template
         return await createRender({
           ...data,
           template_id: FALLBACK_TEMPLATE_ID
         });
       }
     }
   }
   ```

### Webhook Error Handling

1. **Return 200 Quickly**
   ```javascript
   app.post('/webhook', (req, res) => {
     // Return 200 immediately
     res.sendStatus(200);

     // Process asynchronously
     processWebhook(req.body).catch(error => {
       console.error('Webhook processing failed:', error);
     });
   });
   ```

2. **Handle Missing Webhooks**
   ```javascript
   // Fallback polling if webhook doesn't arrive
   const webhookTimeout = setTimeout(async () => {
     console.warn('Webhook timeout, falling back to polling');
     await pollRender(renderId);
   }, 300000); // 5 minutes

   // Clear timeout when webhook arrives
   clearTimeout(webhookTimeout);
   ```

3. **Idempotent Processing**
   ```javascript
   const processedRenders = new Set();

   app.post('/webhook', (req, res) => {
     const render = req.body;

     if (processedRenders.has(render.id)) {
       console.log('Duplicate webhook, ignoring');
       return res.sendStatus(200);
     }

     processedRenders.add(render.id);
     processRender(render);

     res.sendStatus(200);
   });
   ```

---

## Additional Resources

### Official Links

- **Website:** [creatomate.com](https://creatomate.com)
- **Documentation:** [creatomate.com/docs/api](https://creatomate.com/docs/api)
- **Template Editor:** [creatomate.com/editor](https://creatomate.com/editor)
- **Pricing:** [creatomate.com/pricing](https://creatomate.com/pricing)

### GitHub Repositories

- **Node.js SDK:** [github.com/Creatomate/creatomate-node](https://github.com/Creatomate/creatomate-node)
- **PHP SDK:** [github.com/Creatomate/creatomate-php](https://github.com/Creatomate/creatomate-php)
- **Preview SDK:** [github.com/Creatomate/creatomate-preview](https://github.com/Creatomate/creatomate-preview)
- **Node Examples:** [github.com/Creatomate/node-examples](https://github.com/Creatomate/node-examples)

### Support

- **Email:** support@creatomate.com
- **Documentation:** Comprehensive guides and quick-start tutorials
- **Community:** Integration guides for Zapier, Make.com, and other platforms

---

## Summary

### Endpoints Covered

**REST API:**
1. `POST /v2/renders` - Create a render
2. `GET /v2/renders/:id` - Get render status
3. `GET /v1/templates` - List all templates
4. `GET /v1/templates/:id` - Get template by ID

**Direct API:**
- URL-based synchronous rendering

### Key Capabilities

1. **Template-Based Rendering**
   - Create templates visually in editor
   - Modify dynamically via API
   - Reusable and version-controlled

2. **RenderScript JSON**
   - Full programmatic control
   - Create videos entirely from JSON
   - Comparable to HTML for video creation

3. **Element Types**
   - Text, Video, Image, Audio, Composition
   - Extensive property customization
   - Advanced animations and effects

4. **Webhooks**
   - Real-time notifications
   - Efficient alternative to polling
   - Custom metadata support

5. **Output Formats**
   - MP4 (video)
   - GIF (animated)
   - JPG, PNG (static images)

6. **Flexible Pricing**
   - Credit-based system
   - Plans from $54/month
   - 50 free credits trial

### API Versions

- **v1** - Original endpoints (templates)
- **v2** - Current recommended version (renders)
- Both versions active and supported

---

**End of Documentation**

*This comprehensive reference covers all major aspects of the Creatomate API. For the latest updates, always refer to the official documentation at creatomate.com/docs/api.*
