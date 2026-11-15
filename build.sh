#!/usr/bin/env bash
# Netlify build: install Flutter (stable), build the web app into build/web
set -euo pipefail
if [ ! -d "$HOME/flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$HOME/flutter"
fi
export PATH="$HOME/flutter/bin:$PATH"
flutter config --no-analytics >/dev/null 2>&1 || true
flutter config --enable-web
flutter pub get
flutter build web --release
