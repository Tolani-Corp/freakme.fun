# FreakMe.fun Web2 Production Deployment Guide

## 1. Backend Deployment (Flask on Render.com)

The FreakMe.fun backend is configured to deploy on Render.com using a Python web service. The following components are essential for deployment:

### Render.yaml Configuration
```yaml
services:
  - type: web
    name: freakmefun-api
    env: python
    rootDirectory: server
    buildCommand: ""
    startCommand: "python run.py"
    envVars:
      - key: FERNET_KEY
        sync: false
    autoDeploy: true
    plan: free
    region: oregon
```

### Flask Application Entry Point (run.py)
```python
from app.routes.upload import app

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=10000)
```

### Environment Variables (.env.production)
The following environment variables need to be configured in Render.com:
- FLASK_ENV=production
- FLASK_SECRET_KEY (generate a secure key)
- JWT_SECRET_KEY (generate a secure key)
- FERNET_KEY (generate using cryptography.fernet)
- DEPLOY_ENV=production
- PORT=10000
- CLOUDFLARE_ACCOUNT_ID
- CLOUDFLARE_STREAM_API_TOKEN
- CLOUDFLARE_STREAM_ENDPOINT

### Deployment Steps
1. Create a Render.com account if you don't have one
2. Connect your GitHub repository to Render
3. Use the render.yaml file for automatic configuration
4. Set up the required environment variables in Render dashboard
5. Deploy the service and verify it's running correctly

## 2. Cloudflare Stream Integration

Cloudflare Stream is used for video hosting and delivery. The integration requires:

### Environment Variables
- CLOUDFLARE_ACCOUNT_ID: Your Cloudflare account identifier
- CLOUDFLARE_STREAM_API_TOKEN: API token with Stream permissions
- CLOUDFLARE_STREAM_ENDPOINT: Full API endpoint URL

### Video Upload Implementation
Implement the following API call for video uploads:
```
curl -X POST "https://api.cloudflare.com/client/v4/accounts/$CLOUDFLARE_ACCOUNT_ID/stream" \
  -H "Authorization: Bearer $CLOUDFLARE_STREAM_API_TOKEN" \
  -F "file=@video.mp4"
```

### Video Embedding
Use the following iframe format to embed videos in your frontend:
```html
<iframe
  src="https://iframe.videodelivery.net/your_video_uid"
  allowfullscreen
  width="100%"
  height="400">
</iframe>
```

### Integration Steps
1. Create a Cloudflare account if you don't have one
2. Enable Cloudflare Stream in your account
3. Generate an API token with Stream permissions
4. Update your environment variables with Cloudflare credentials
5. Implement the upload API in your backend
6. Implement the embed code in your frontend

## 3. Frontend Deployment (Next.js on Vercel)

The frontend is built with Next.js 13+ using the App Router and deployed on Vercel.

### Key Frontend Components
- Framework: Next.js 13+ with App Router
- Styling: Tailwind CSS
- Internationalization: Routes for `/pt`, `/sw`, `/es`
- Landing Pages: Super.so integration

### Deployment Steps
1. Create a Vercel account if you don't have one
2. Connect your GitHub repository to Vercel
3. Configure the build settings:
   - Framework Preset: Next.js
   - Build Command: `next build`
   - Output Directory: `.next`
4. Set up environment variables in Vercel dashboard
5. Deploy and verify the frontend is working correctly

## 4. Make.com Automation Setup

Make.com (formerly Integromat) is used for workflow automation, particularly for model onboarding and video uploads.

### Key Automations
1. **Model Onboarding Flow**:
   - Trigger: Form submission on `/freak-me` page
   - Action: HTTP request to Convex `insertCreator` function
   - Result: Creator record created in database

2. **Video Upload Flow**:
   - Trigger: Manual upload or API call
   - Action: Upload to Cloudflare Stream
   - Result: Stream ID stored in database

### Setup Steps
1. Create a Make.com account if you don't have one
2. Create a new scenario for model onboarding
3. Configure the HTTP webhook trigger
4. Add HTTP request module to call your backend API
5. Test and activate the scenario
6. Repeat for video upload automation

## 5. Super.so Integration

Super.so is used for landing and marketing pages.

### Integration Steps
1. Create a Super.so account if you don't have one
2. Connect your domain to Super.so
3. Create your landing pages in Notion
4. Connect Notion pages to Super.so
5. Configure custom domains for your marketing pages
6. Link these pages to your main Next.js application

## 6. Stripe Integration for Monetization

Stripe is used for processing payments in the Web2 version, replacing the Web3 wallet payments.

### Key Components
- Solo content unlocks
- Subscription payments
- Creator payouts

### Implementation Steps
1. Create a Stripe account if you don't have one
2. Set up your products and price points in Stripe dashboard
3. Implement Stripe Checkout for one-time purchases
4. Implement Stripe Billing for subscriptions
5. Set up webhook endpoints in your backend to handle Stripe events
6. Test the payment flow end-to-end

## 7. Production Checklist

Before going live, ensure:

- [ ] All environment variables are properly set in production
- [ ] Backend services are deployed and accessible
- [ ] Cloudflare Stream is properly configured
- [ ] Frontend is deployed and connected to backend services
- [ ] Make.com automations are tested and active
- [ ] Super.so landing pages are published and accessible
- [ ] Stripe integration is tested with test cards
- [ ] Error logging and monitoring are in place
- [ ] Database backups are configured
- [ ] SSL certificates are valid

## 8. Monitoring and Maintenance

After deployment:

1. Set up monitoring for your Render.com service
2. Configure alerts for critical errors
3. Implement regular database backups
4. Monitor Cloudflare Stream usage and costs
5. Track Stripe payments and disputes
6. Schedule regular security updates

## Next Steps

Once the Web2 version is stable in production, you can begin planning the Web3 integration:
- RainbowKit + WalletConnect integration
- USDC/USDT wallet tips
- Watch-Burn-Earn Engine
- DAO voting functionality
