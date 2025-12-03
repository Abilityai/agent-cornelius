#!/bin/bash

API_KEY="c1ec8e240f2147a88ff7f2274455edeff873736b73505356de375afa89bcb390c76b4c944b8dbfe5f0cb4a70f12155f5"
TEMPLATE_ID="cbfb6831-83c4-43da-a8ba-90ef59bcb56a"
SOURCE_DIR="/Users/eugene/Dropbox/Agents/Cornelius/Brain/04-Output/HeyGen-Scripts/2025-11-14"

# Remaining videos to process (skipping video-01 which is already done)
videos=(
    "video-02-fake-agents.mp4"
    "video-03-ai-adoption-resistance.mp4"
    "video-04-consistency-vs-accuracy.mp4"
    "video-05-builders-not-coders.mp4"
)

echo "Processing 4 remaining videos..."
echo ""

for video in "${videos[@]}"; do
    echo "========================================="
    echo "Processing: $video"
    echo "========================================="

    video_path="$SOURCE_DIR/$video"
    output_name="${video%.mp4}-vertical.mp4"
    output_path="$SOURCE_DIR/$output_name"

    # Step 1: Upload to tmpfiles.org
    echo "1. Uploading to tmpfiles.org..."
    upload_response=$(curl -s -F file=@"$video_path" https://tmpfiles.org/api/v1/upload)
    url=$(echo "$upload_response" | jq -r '.data.url')
    direct_url=$(echo "$url" | sed 's|tmpfiles.org/|tmpfiles.org/dl/|')
    echo "   ✓ Uploaded: $direct_url"

    # Step 2: Submit render
    echo "2. Submitting render to Creatomate..."
    render_response=$(curl -s -X POST https://api.creatomate.com/v2/renders \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $API_KEY" \
        -d "{
            \"template_id\": \"$TEMPLATE_ID\",
            \"render_scale\": 1.0,
            \"modifications\": {
                \"Video-DHM.source\": \"$direct_url\"
            }
        }")

    render_id=$(echo "$render_response" | jq -r '.id')
    echo "   ✓ Render ID: $render_id"

    # Step 3: Poll render status
    echo "3. Waiting for render to complete..."
    for i in {1..60}; do
        status_response=$(curl -s https://api.creatomate.com/v2/renders/$render_id \
            -H "Authorization: Bearer $API_KEY")

        status=$(echo "$status_response" | jq -r '.status')

        if [ "$status" = "succeeded" ]; then
            render_url=$(echo "$status_response" | jq -r '.url')
            echo "   ✓ Render succeeded!"

            # Step 4: Download
            echo "4. Downloading final video..."
            curl -s -o "$output_path" "$render_url"
            size=$(du -h "$output_path" | cut -f1)
            echo "   ✓ Downloaded: $output_name ($size)"
            echo ""
            echo "✅ SUCCESS: $output_name"
            echo ""
            break
        elif [ "$status" = "failed" ]; then
            echo "   ❌ Render failed"
            break
        else
            if [ $((i % 3)) -eq 0 ]; then
                echo "   Status: $status (${i}s elapsed)"
            fi
        fi

        sleep 5
    done
done

echo ""
echo "========================================="
echo "All videos processed!"
echo "========================================="
ls -lh "$SOURCE_DIR"/*-vertical.mp4
