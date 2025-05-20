
# 🚀 /scripts/deploy/

This folder contains CLI tools and automation scripts used to deploy and manage the **FREAKME.FUN** production environment.

---

## 📜 Scripts Included

### `run_freakme_fun.sh`
- Logs in to DockerHub
- Pulls the latest Docker image
- Stops and removes existing container
- Runs the app container on port 5000
- Prints container status

### `gh_env_setup.sh` *(optional)*
- Automates setting GitHub repository secrets and variables using GitHub CLI
- Useful for onboarding new developers or rotating keys

---

## ✅ Usage Instructions

1. Make script executable:
   ```bash
   chmod +x run_freakme_fun.sh
   ```

2. Run the script:
   ```bash
   ./run_freakme_fun.sh
   ```

3. Ensure Docker is installed and running on your local or cloud VM.

---

## 🔐 Pro Tips

- Never commit secrets or `.env.production` with real credentials.
- Use environment variables or GitHub Secrets for secure CI/CD execution.
- Run these scripts only in **trusted environments** (CI, VPS, DevOps terminals).

---

Maintained by **TolaniCorp6**
