{ pkgs }:

pkgs.writeShellScriptBin "copilot" ''
  #!/usr/bin/env bash
  set -euo pipefail

  # Local installation directory
  export PREFIX="$HOME/.local/share/copilot-cli"
  export NPM_CONFIG_PREFIX="$PREFIX"

  # Ensure Node from Nixpkgs
  export PATH="${pkgs.nodejs_22}/bin:$PREFIX/bin:$PATH"

  if ! command -v "$PREFIX/bin/copilot" >/dev/null; then
    echo "Installing GitHub Copilot CLI..."
    mkdir -p "$PREFIX"
    npm install -g @github/copilot@latest
  fi

  exec "$PREFIX/bin/copilot" "$@"
''
