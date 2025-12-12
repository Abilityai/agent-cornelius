#!/usr/bin/env python3
"""
Upload video to Cloudinary and return public URL
"""

import sys
import requests

def upload_to_cloudinary(video_path):
    """Upload video to Cloudinary and return secure URL"""

    cloud_name = "dfs5yfioa"
    upload_url = f"https://api.cloudinary.com/v1_1/{cloud_name}/video/upload"

    # Try with unsigned upload
    with open(video_path, 'rb') as video_file:
        files = {'file': video_file}
        data = {
            'upload_preset': 'ml_default'
        }

        print(f"Uploading {video_path} to Cloudinary...", file=sys.stderr)
        response = requests.post(upload_url, files=files, data=data)

        if response.status_code == 200:
            result = response.json()
            secure_url = result.get('secure_url')
            print(f"✓ Upload successful!", file=sys.stderr)
            print(secure_url)
            return 0
        else:
            print(f"ERROR: Upload failed with status {response.status_code}", file=sys.stderr)
            print(response.text, file=sys.stderr)
            return 1

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: upload-to-cloudinary.py <video_path>", file=sys.stderr)
        sys.exit(1)

    video_path = sys.argv[1]
    sys.exit(upload_to_cloudinary(video_path))
