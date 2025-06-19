#!/bin/bash
set -e
# === Colors ===
GREEN="\\033[0;32m"
YELLOW="\\033[1;33m"
RED="\\033[0;31m"
NC="\\033[0m"

# BANNER
echo -e "${GREEN}"
cat << 'EOF'
 ______              _         _                                             
|  ___ \            | |       | |                   _                        
| |   | |  ___    _ | |  ____ | | _   _   _  ____  | |_   ____   ____  _____ 
| |   | | / _ \  / || | / _  )| || \ | | | ||  _ \ |  _) / _  ) / ___)(___  )
| |   | || |_| |( (_| |( (/ / | | | || |_| || | | || |__( (/ / | |     / __/ 
|_|   |_| \___/  \____| \____)|_| |_| \____||_| |_| \___)\____)|_|    (_____)
EOF
echo -e "${NC}"

# === Banner ===
echo -e "${GREEN}╔═════════════════════════════════════════════╗"
echo -e "║  CYSIC Phase 3 Multi-Node Setup via PM2     ║"
echo -e "╚═════════════════════════════════════════════╝${NC}"
# === Ask for reward address and number of instances ===
read -rp "🔹 Enter your reward address (starts with 0x): " addr
if ! [[ "$addr" =~ ^0x[0-9a-fA-F]{40}$ ]]; then
  echo -e "${RED}❌  Invalid address format.${NC}"
  exit 1
fi
read -rp "🔸 How many verifier nodes do you want to run? " COUNT
if ! [[ "$COUNT" =~ ^[0-9]+$ ]] || [[ "$COUNT" -lt 1 ]]; then
  echo -e "${RED}❌  Please enter a valid positive number.${NC}"
  exit 1
fi
# === Install NVM and Node.js if not installed ===
if ! command -v node &> /dev/null; then
  echo -e "${YELLOW} 📦 Installing NVM and Node.js...${NC}"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1090
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install --lts
fi
# === Install PM2 if not installed ===
if ! command -v pm2 &> /dev/null; then
  echo -e "${YELLOW}📦 Installing PM2 globally...${NC}"
  npm install -g pm2
fi
# === Create instances ===
BASE_DIR="$HOME/cysic_instances"
mkdir -p "$BASE_DIR"
for i in $(seq 1 $COUNT); do
  INSTANCE="node$i"
  WORKDIR="$BASE_DIR/$INSTANCE"
  echo -e "${YELLOW}➡️ Setting up instance: $INSTANCE${NC}"
  mkdir -p "$WORKDIR"
  cd "$WORKDIR"
  curl -sL https://github.com/cysic-labs/cysic-phase3/releases/download/v1.0.0/setup_linux.sh -o ./setup_linux.sh
  chmod +x ./setup_linux.sh
  echo -e "${YELLOW}⚙️ Running setup script in isolated HOME=$WORKDIR...${NC}"
  HOME="$WORKDIR" bash ./setup_linux.sh "$addr"
  cat > "$WORKDIR/start.sh" <<EOF
#!/bin/bash
cd "$WORKDIR/cysic-verifier"
bash start.sh
EOF
  chmod +x "$WORKDIR/start.sh"
  pm2 start "$WORKDIR/start.sh" --name "cysic-$INSTANCE"
done
pm2 save
echo -e "${GREEN}✅  All $COUNT verifier node(s) started with PM2!${NC}"
echo -e "${YELLOW}Use 'pm2 list' and 'pm2 logs' to monitor.${NC}"
""
