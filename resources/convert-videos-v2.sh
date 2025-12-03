#!/bin/bash

# Creatomate Video Conversion Script v2
# Uses tmpfiles.org for temporary hosting

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
echo "Using tmpfiles.org for temporary hosting"
echo "========================================="
echo ""

# Function to upload video to tmpfiles.org
upload_to_tmpfiles() {
    local video_path="$1"
    local video_name=$(basename "$video_path")

    echo "Uploading $video_name to tmpfiles.org..."

    response=$(curl -s -F file=@"$video_path" https://tmpfiles.org/api/v1/upload)

    status=$(echo "$response" | jq -r '.status')

    if [ "$status" != "success" ]; then
        echo "ERROR: Upload failed"
        echo "$response" | jq '.'
        return 1
    fi

    # Get URL and convert to direct download link
    url=$(echo "$response" | jq -r '.data.url')
    # Convert http://tmpfiles.org/ID/file.mp4 to http://tmpfiles.org/dl/ID/file.mp4
    direct_url=$(echo "$url" | sed 's|tmpfiles.org/|tmpfiles.org/dl/|')

    echo "✓ Uploaded: $direct_url"
    echo "$direct_url"
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
    local max_attempts=60  # 5 minutes max
    local attempt=0

    echo "Polling render status (this may take 30-60 seconds)..."

    while [ $attempt -lt $max_attempts ]; do
        response=$(curl -s https://api.creatomate.com/v2/renders/$render_id \
            -H "Authorization: Bearer $API_KEY")

        status=$(echo "$response" | jq -r '.status')

        if [ "$status" = "succeeded" ]; then
            url=$(echo "$response" | jq -r '.url')
            echo "✓ Render completed!"
            echo "$url"
            return 0
        elif [ "$status" = "failed" ]; then
            echo "ERROR: Render failed"
            echo "$response" | jq '.'
            return 1
        else
            echo "  Status: $status (${attempt}s elapsed)"
            sleep 5
            attempt=$((attempt+1))
        fi
    done

    echo "ERROR: Render timed out"
    return 1
}

# Function to download video
download_video() {
    local video_url="$1"
    local output_path="$2"

    echo "Downloading final video..."

    curl -s -o "$output_path" "$video_url"

    if [ -f "$output_path" ]; then
        size=$(du -h "$output_path" | cut -f1)
        echo "✓ Downloaded: $output_path ($size)"
        return 0
    else
        echo "ERROR: Download failed"
        return 1
    fi
}

# Process each video
success_count=0
total_count=${#videos[@]}

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

    # Check if already processed
    if [ -f "$output_path" ]; then
        echo "⚠ Output already exists, skipping: $output_name"
        continue
    fi

    # Step 1: Upload to tmpfiles.org
    video_url=$(upload_to_tmpfiles "$video_path")
    if [ $? -ne 0 ]; then
        echo "❌ Failed at upload stage"
        continue
    fi

    # Step 2: Submit render to Creatomate
    render_id=$(submit_render "$video_url")
    if [ $? -ne 0 ]; then
        echo "❌ Failed at render submission stage"
        continue
    fi

    # Step 3: Poll render status
    render_url=$(poll_render "$render_id")
    if [ $? -ne 0 ]; then
        echo "❌ Failed at rendering stage"
        continue
    fi

    # Step 4: Download final video
    download_video "$render_url" "$output_path"
    if [ $? -ne 0 ]; then
        echo "❌ Failed at download stage"
        continue
    fi

    echo ""
    echo "✅✅✅ SUCCESS: $output_name"
    success_count=$((success_count+1))
done

echo ""
echo "========================================="
echo "Conversion Summary"
echo "========================================="
echo "Processed: $success_count / $total_count videos"
echo ""
echo "Output files:"
ls -lh "$SOURCE_DIR"/*-vertical.mp4 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}'
echo ""
echo "Done!"
