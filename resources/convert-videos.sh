#!/bin/bash

# Creatomate Video Conversion Script
# Converts horizontal HeyGen videos to vertical with karaoke captions

API_KEY="c1ec8e240f2147a88ff7f2274455edeff873736b73505356de375afa89bcb390c76b4c944b8dbfe5f0cb4a70f12155f5"
TEMPLATE_ID="cbfb6831-83c4-43da-a8ba-90ef59bcb56a"
SOURCE_DIR="/Users/eugene/Dropbox/Agents/Cornelius/Brain/04-Output/HeyGen-Scripts/2025-11-14"

# Array of video files to process
videos=(
    "video-01-ai-scaling-wall.mp4"
    "video-02-fake-agents.mp4"
    "video-03-ai-adoption-resistance.mp4"
    "video-04-consistency-vs-accuracy.mp4"
    "video-05-builders-not-coders.mp4"
)

echo "========================================="
echo "Starting video conversion workflow"
echo "========================================="
echo ""

# Function to upload video to Cloudinary
upload_to_cloudinary() {
    local video_path="$1"
    local video_name=$(basename "$video_path")

    echo "Uploading $video_name to Cloudinary..."

    # Upload using curl (Cloudinary API)
    response=$(curl -s -X POST "https://api.cloudinary.com/v1_1/dfs5yfioa/video/upload" \
        -F "file=@$video_path" \
        -F "upload_preset=ml_default" \
        -F "public_id=heygen-horizontal/$video_name")

    secure_url=$(echo "$response" | jq -r '.secure_url')

    if [ "$secure_url" = "null" ] || [ -z "$secure_url" ]; then
        echo "ERROR: Failed to upload to Cloudinary"
        echo "$response" | jq '.'
        return 1
    fi

    echo "✓ Uploaded successfully: $secure_url"
    echo "$secure_url"
}

# Function to submit render to Creatomate
submit_render() {
    local video_url="$1"

    echo "Submitting render to Creatomate..."

    response=$(curl -s -X POST https://api.creatomate.com/v2/renders \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $API_KEY" \
        -d "{
            \"template_id\": \"$TEMPLATE_ID\",
            \"render_scale\": 1.0,
            \"modifications\": {
                \"Video-DHM.source\": \"$video_url\"
            }
        }")

    render_id=$(echo "$response" | jq -r '.id')

    if [ "$render_id" = "null" ] || [ -z "$render_id" ]; then
        echo "ERROR: Failed to submit render"
        echo "$response" | jq '.'
        return 1
    fi

    echo "✓ Render submitted: $render_id"
    echo "$render_id"
}

# Function to poll render status
poll_render() {
    local render_id="$1"
    local max_attempts=60  # 5 minutes max (5s intervals)
    local attempt=0

    echo "Polling render status..."

    while [ $attempt -lt $max_attempts ]; do
        response=$(curl -s https://api.creatomate.com/v2/renders/$render_id \
            -H "Authorization: Bearer $API_KEY")

        status=$(echo "$response" | jq -r '.status')

        if [ "$status" = "succeeded" ]; then
            url=$(echo "$response" | jq -r '.url')
            echo "✓ Render completed: $url"
            echo "$url"
            return 0
        elif [ "$status" = "failed" ]; then
            echo "ERROR: Render failed"
            echo "$response" | jq '.'
            return 1
        else
            echo "  Status: $status (attempt $((attempt+1))/$max_attempts)"
            sleep 5
            attempt=$((attempt+1))
        fi
    done

    echo "ERROR: Render timed out after 5 minutes"
    return 1
}

# Function to download video
download_video() {
    local video_url="$1"
    local output_path="$2"

    echo "Downloading video to $output_path..."

    curl -s -o "$output_path" "$video_url"

    if [ -f "$output_path" ]; then
        size=$(du -h "$output_path" | cut -f1)
        echo "✓ Downloaded successfully ($size)"
        return 0
    else
        echo "ERROR: Download failed"
        return 1
    fi
}

# Process each video
for video in "${videos[@]}"; do
    echo ""
    echo "========================================="
    echo "Processing: $video"
    echo "========================================="

    video_path="$SOURCE_DIR/$video"
    output_name="${video%.mp4}-vertical.mp4"
    output_path="$SOURCE_DIR/$output_name"

    # Check if source exists
    if [ ! -f "$video_path" ]; then
        echo "ERROR: Source video not found: $video_path"
        continue
    fi

    # Step 1: Upload to Cloudinary
    cloudinary_url=$(upload_to_cloudinary "$video_path")
    if [ $? -ne 0 ]; then
        echo "Skipping $video due to upload error"
        continue
    fi

    # Step 2: Submit render
    render_id=$(submit_render "$cloudinary_url")
    if [ $? -ne 0 ]; then
        echo "Skipping $video due to render submission error"
        continue
    fi

    # Step 3: Poll status
    render_url=$(poll_render "$render_id")
    if [ $? -ne 0 ]; then
        echo "Skipping $video due to render error"
        continue
    fi

    # Step 4: Download
    download_video "$render_url" "$output_path"
    if [ $? -ne 0 ]; then
        echo "Failed to download $video"
        continue
    fi

    echo "✓✓✓ Successfully processed: $output_name"
done

echo ""
echo "========================================="
echo "Conversion complete!"
echo "========================================="
echo ""
echo "Output location: $SOURCE_DIR"
ls -lh "$SOURCE_DIR"/*-vertical.mp4 2>/dev/null || echo "No vertical videos found"
