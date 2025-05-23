# FreakMe.fun Platform Analysis

## Overview

The FreakMe.fun platform is a sophisticated web application designed for content creators with a focus on media streaming, monetization, and creator management. The platform utilizes a modern tech stack with Next.js for the frontend, Convex for the backend database, and Cloudflare Stream for media delivery. The architecture is optimized for scalability, token-based access, and global expansion with internationalization support.

## Platform Architecture

### Frontend Components
The frontend is built on Next.js 13+ with App Router, deployed on Vercel for both production and preview environments. It uses Tailwind CSS for styling and includes internationalization routing with `/pt`, `/sw`, and `/es` language paths. The web components include Super.so for landing and marketing pages, along with React UI and RainbowKit for wallet login functionality.

### Backend Services
The backend utilizes Convex as a realtime database for storing information about Creators, Scenes, and DAO Votes. It employs schema-based TypeScript logic for data management. TanStack Query (React Query) is implemented for caching, mutation state management, and dependent queries, wrapped around Convex functions to ensure form-safe user experiences.

### Media Streaming
Media streaming is handled through Cloudflare Stream, which provides HLS streaming with token-signed URLs for secure content delivery. The upload process is facilitated via Make.com, an automation platform that connects various services.

### Identity Management
The platform implements a dual authentication system with RainbowKit and WalletConnect for Web3 login capabilities, alongside Convex Auth and Sessions as a fallback for users without crypto wallets.

### Monetization System
The monetization strategy includes multiple payment options: USDC/USDT for wallet tips, Stripe for individual content unlocks and subscriptions, and a Watch-Burn-Earn Engine that tracks view counts in Convex and manages scene unlock logic through wallet and stream interactions.

## Workflow Summary

1. **Model Signup**: Creators sign up through the `/freak-me` page, which submits to Make.com. This triggers an HTTP request to a Convex function called `insertCreator`, and automatically creates a Cloudflare folder for the creator.

2. **Creator Dashboard Login**: Creators authenticate using RainbowKit for wallet-based authentication. The system then fetches creator information using a Convex `by_wallet` query, displaying scenes uploaded, tips received, and health check status.

3. **Video Upload Flow**: Content can be uploaded either manually through Google Drive or via the Stream API through Make.com. The automation logs the stream ID and stores it in the Convex `scenes` table, with scene listings automatically appearing in the creator's profile at `/models/:wallet`.

4. **Monetization Flow**: Payments through Stripe or USDT are sent to a TOL multisig wallet. The platform includes a watch counter triggered on play events, with content unlocks becoming available when certain thresholds are reached.

## Deployment Configuration

The provided files in the launch bundle include essential configuration for deploying the platform:

1. **render.yaml**: Defines the service configuration for deployment on Render.com, specifying a Python web service named "freakmefun-api" with appropriate environment variables and deployment settings.

2. **.env.production**: Contains environment variables for the production environment, including Flask configuration, security keys, and Cloudflare Stream API credentials.

3. **run.py**: A simple Python script that starts the Flask application, binding to all interfaces on port 10000.

4. **setup_github_secrets.sh**: A bash script for setting up GitHub secrets and variables required for CI/CD, including security keys and Cloudflare credentials.

5. **cloudflare_stream_guide.md**: Documentation for integrating with Cloudflare Stream, including steps for adding environment variables, using the upload API, and embedding videos.

## Security Considerations

The platform implements several security measures:
- Secure key generation for Flask, JWT, and Fernet encryption
- Token-signed URLs for media streaming
- GitHub secrets management for sensitive credentials
- Environment-specific configuration for development and production

## Deployment Instructions

The Canvas documentation outlines a four-step deployment process:
1. Clone the repository and set up the environment
2. Start the development server
3. Deploy by pushing to the `main` branch, which triggers GitHub Actions and Vercel CI
4. Connect external tools including Make.com, Cloudflare Stream, Stripe, and Convex

## Conclusion

The FreakMe.fun platform represents a comprehensive solution for content creators, combining Web3 technologies with traditional web services. The launch bundle provides the necessary configuration files and documentation to deploy and maintain the platform. The architecture is designed for scalability and future expansion, with mentions of potential additions like NFT mints, affiliate logic, and DAO voting screens.

The provided files align well with the Canvas documentation, offering the practical implementation details needed to deploy the platform as described in the architectural overview.
