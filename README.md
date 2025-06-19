
# 🛠️ CYSIC Phase 3 Verifier Auto Installer

This script automates the setup of the [CYSIC Phase 3 Verifier](https://github.com/cysic-labs/cysic-phase3) on Linux. It prompts for your reward address, runs the official setup, and launches the verifier in a background `screen` session.

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
read -rp "🔹 Enter your reward address (starts with 0x): " addr && [[ $addr =~ ^0x[a-fA-F0-9]{40}$ ]] && curl -sL https://github.com/cysic-labs/cysic-phase3/releases/download/v1.0.0/setup_linux.sh -o ~/setup_linux.sh && bash ~/setup_linux.sh "$addr" && screen -S cysic -dm bash -c 'cd ~/cysic-verifier && bash start.sh' && echo "✅ Verifier started in screen session: cysic" || echo "❌ Invalid address. Please try again."
```

---

## 🧭 Screen Session Commands

- Reattach the session:
  ```bash
  screen -r cysic
  ```

- Detach and leave it running:
  ```
  Ctrl + A, then D
  ```

- Kill the session:
  ```bash
  screen -S cysic -X quit
  ```

---

## 🛡️ Disclaimer

This script uses the official setup script from CYSIC. Please review the source if you have any concerns. You are responsible for keeping your reward address and system secure.

---

## 🌐 Links

- 🔗 [CYSIC Phase 3 GitHub](https://github.com/cysic-labs/cysic-phase3)
- 🔗 [Nodehunterz](https://t.me/nodehunterz)

---
