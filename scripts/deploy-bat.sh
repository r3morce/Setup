#!/bin/bash
# Configure Bat (cat replacement)

set -e

echo "==> Configuring Bat..."

# Create bat config directory
mkdir -p "$HOME/.config/bat"

# Set Dracula theme
cat > "$HOME/.config/bat/config" << 'EOF'
--theme="Dracula"
EOF

# Build cache
bat cache --build &>/dev/null || true

echo "==> Bat configuration complete!"
