#!/bin/bash
# Upload dSYMs to Firebase Crashlytics after an iOS build.
# Usage: sh .vscode/upload_dsyms.sh
#
# Searches DerivedData and build/ for Runner.app.dSYM, then uploads
# all found dSYMs via the Crashlytics upload-symbols tool.

set -e

WORKSPACE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
GSP="$WORKSPACE_ROOT/ios/Runner/GoogleService-Info.plist"
UPLOAD_TOOL=""

# Firebase dejó de venir por CocoaPods: desde la migración a Swift Package
# Manager (`Package.resolved` del workspace, firebase-ios-sdk 12.x) el binario
# `upload-symbols` ya NO está en ios/Pods/FirebaseCrashlytics/. Este script
# apuntaba ahí y fallaba con "Run 'cd ios && pod install' first", un consejo
# que no arregla nada porque Pods ya no trae Firebase.
#
# Se buscan los sitios donde SPM materializa los checkouts, en orden de
# probabilidad, y si no está en ninguno se resuelve con la herramienta de
# Xcode — que respeta la versión fijada en Package.resolved en vez de bajar
# lo que haya de última.
SPM_CACHE="$WORKSPACE_ROOT/ios/.spm-tools"

buscar_tool() {
  # 1) checkouts que Xcode dejó en DerivedData
  # 2) la caché local de este script
  # 3) Pods, por si algún día vuelve
  find \
    "$HOME/Library/Developer/Xcode/DerivedData" \
    "$SPM_CACHE" \
    "$WORKSPACE_ROOT/ios/Pods" \
    -name upload-symbols -type f -perm -u+x 2>/dev/null | head -1
}

UPLOAD_TOOL="$(buscar_tool)"

if [ -z "$UPLOAD_TOOL" ]; then
  echo "upload-symbols no está: resolviendo los paquetes SPM (una sola vez)..."
  ( cd "$WORKSPACE_ROOT/ios" && xcodebuild -resolvePackageDependencies \
      -workspace Runner.xcworkspace -scheme Runner \
      -clonedSourcePackagesDirPath "$SPM_CACHE" >/dev/null 2>&1 )
  UPLOAD_TOOL="$(buscar_tool)"
fi

if [ -z "$UPLOAD_TOOL" ]; then
  echo "ERROR: no encontré upload-symbols."
  echo "Abrí ios/Runner.xcworkspace en Xcode una vez para que resuelva los paquetes,"
  echo "o revisá que firebase-ios-sdk siga en ios/Runner.xcworkspace/xcshareddata/swiftpm/Package.resolved"
  exit 1
fi

echo "Herramienta: $UPLOAD_TOOL"

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
