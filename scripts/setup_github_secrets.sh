
#!/bin/bash

REPO="Tolani-Corp/freakme.fun"

# Generate secure keys (copy/paste outputs as needed)
echo "📌 Suggested secure keys:"
echo "FLASK_SECRET_KEY=$(openssl rand -hex 32)"
echo "JWT_SECRET_KEY=$(openssl rand -hex 32)"
echo "FERNET_KEY=$(python3 -c 'from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())')"

# Set required GitHub secrets
gh secret set FLASK_SECRET_KEY --repo "$REPO" --body "your-flask-secret-key"
gh secret set JWT_SECRET_KEY --repo "$REPO" --body "your-jwt-secret-key"
gh secret set FERNET_KEY --repo "$REPO" --body "your-fernet-key"

gh secret set CLOUDFLARE_ACCOUNT_ID --repo "$REPO" --body "your-cloudflare-account-id"
gh secret set CLOUDFLARE_STREAM_API_TOKEN --repo "$REPO" --body "your-cloudflare-stream-token"
gh secret set CLOUDFLARE_STREAM_ENDPOINT --repo "$REPO" --body "https://api.cloudflare.com/client/v4/accounts/your-cloudflare-account-id/stream"

# Set optional deployment variables
gh variable set DEPLOY_ENV --repo "$REPO" --body "production"
gh variable set PORT --repo "$REPO" --body "10000"

echo "✅ All GitHub secrets and variables have been added."
