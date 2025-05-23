# Cloudflare Stream Integration Guide

## Step 1: Add Environment Variables
- CLOUDFLARE_ACCOUNT_ID
- CLOUDFLARE_STREAM_API_TOKEN
- CLOUDFLARE_STREAM_ENDPOINT

## Step 2: Upload API
curl -X POST "https://api.cloudflare.com/client/v4/accounts/$CLOUDFLARE_ACCOUNT_ID/stream" \
  -H "Authorization: Bearer $CLOUDFLARE_STREAM_API_TOKEN" \
  -F "file=@video.mp4"

## Step 3: Embed Video
<iframe
  src="https://iframe.videodelivery.net/your_video_uid"
  allowfullscreen
  width="100%"
  height="400">
</iframe>