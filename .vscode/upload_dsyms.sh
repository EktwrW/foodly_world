#!/bin/bash
# Upload dSYMs to Firebase Crashlytics after an iOS build.
# Usage: sh .vscode/upload_dsyms.sh
#
# Searches DerivedData and build/ for Runner.app.dSYM, then uploads
# all found dSYMs via the Crashlytics upload-symbols tool.

set -e

WORKSPACE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
UPLOAD_TOOL="$WORKSPACE_ROOT/ios/Pods/FirebaseCrashlytics/upload-symbols"
GSP="$WORKSPACE_ROOT/ios/Runner/GoogleService-Info.plist"

if [ ! -f "$UPLOAD_TOOL" ]; then
  echo "ERROR: upload-symbols not found at $UPLOAD_TOOL"
  echo "Run 'cd ios && pod install' first."
  exit 1
fi

if [ ! -f "$GSP" ]; then
  echo "ERROR: GoogleService-Info.plist not found at $GSP"
  exit 1
fi

echo "Searching for dSYMs..."

# Search DerivedData (Xcode builds) and build/ (flutter build)
DSYM_PATHS=$(find \
  "$HOME/Library/Developer/Xcode/DerivedData" \
  "$WORKSPACE_ROOT/build" \
  -name "*.dSYM" \
  -path "*Runner*" \
  -newer "$WORKSPACE_ROOT/pubspec.yaml" \
  2>/dev/null | head -10)

if [ -z "$DSYM_PATHS" ]; then
  echo "No recent Runner dSYMs found. Build iOS first."
  exit 1
fi

echo "Found dSYMs:"
echo "$DSYM_PATHS"
echo ""

for DSYM in $DSYM_PATHS; do
  echo "Uploading: $DSYM"
  "$UPLOAD_TOOL" -gsp "$GSP" -p ios "$DSYM"
  echo ""
done

echo "dSYM upload complete."
