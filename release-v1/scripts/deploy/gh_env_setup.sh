#!/bin/bash

REPO="Tolani-Corp/freakme.fun"

# Required secrets
gh secret set DOCKER_USERNAME --repo "$REPO" --body "tolanicorpdev"
gh secret set DOCKER_PASSWORD --repo "$REPO" --body "dckr_pat_-FVb-fHRrM4B4_ck9CC3ZBD3GNY"
gh secret set FLASK_SECRET_KEY --repo "$REPO" --body "$(openssl rand -hex 32)"
gh secret set JWT_SECRET_KEY --repo "$REPO" --body "$(openssl rand -hex 32)"
gh secret set FERNET_KEY --repo "$REPO" --body "$(python3 -c 'from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())')"

# Optional variables
gh variable set IMAGE_NAME --repo "$REPO" --body "tolanicorpdev/freakme.fun"
gh variable set PORT --repo "$REPO" --body "5000"
gh variable set CONTAINER_NAME --repo "$REPO" --body "freakme-fun"
gh variable set DEPLOY_ENV --repo "$REPO" --body "production"

echo "✅ GitHub Secrets and Variables successfully set for $REPO"
