
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
bash <(curl -s https://raw.githubusercontent.com/CodeDialect/cysic-verifier/main/cysic_installer.sh)
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
