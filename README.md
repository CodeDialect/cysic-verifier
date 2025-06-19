# 🛠️ CYSIC Phase 3 Verifier Auto Installer

This script automates the setup of the [CYSIC Phase 3 Verifier sign up here](https://cysic.xyz/zk/verifier) use invite code `0d07f` on Linux. It prompts for your reward address, runs the official setup, and launches the verifier in a background `screen` session.

---

## 🚀 Features

- ✅ One-click setup
- 🔒 Reward address validation
- 📦 Official setup script from CYSIC
- 🖥️ Verifier runs in a `screen` session (`cysic`)
- 💡 Easy to reattach and monitor

---

## 📦 Requirements

- Linux (Ubuntu recommended)
- `curl`
- `screen`

Install `screen` if not already installed:

```bash
sudo apt update && sudo apt install screen curl -y
```

---

## ⚙️ How to Use

### One-liner

Just copy and paste the following into your terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/CodeDialect/cysic-verifier/main/cysic_installer.sh)
```

---

## Monitoring Your Workers

```bash
# View all PM2 processes
pm2 list

# View logs for all
pm2 logs

# Restart all workers
pm2 restart all

# Stop all workers
pm2 stop all

# Clear logs
pm2 flush

# Restart specific worker
pm2 restart <worker number>

# Check specific worker logs
pm2 logs <worker number>

```
---

## 🛡️ Disclaimer

This script uses the official setup script from CYSIC. Please review the source if you have any concerns. You are responsible for keeping your reward address and system secure.

---

## 🌐 Links

- 🔗 [CYSIC Phase 3 GitHub](https://github.com/cysic-labs/cysic-phase3)
- 🔗 [Nodehunterz](https://t.me/nodehunterz)

---
