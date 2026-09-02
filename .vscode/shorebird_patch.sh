#!/bin/sh
# Parchea por OTA la release que corresponde a la versión de `pubspec.yaml`.
#
# Existe porque `--release-version` estaba escrito a mano en tasks.json y se
# quedó en `2.0.2+97` mientras producción iba por `2.0.6+99`. Lo grave no era
# que fallara: `2.0.2+97` SIGUE activa en Shorebird, así que el patch se
# aplicaba en silencio sobre una release que ya no usa nadie y el arreglo no
# llegaba a ningún teléfono. Un número escrito a mano en un sitio que sólo se
# toca cada varias semanas se queda viejo siempre.
#
# Uso:  shorebird_patch.sh <android|ios> [args extra para shorebird...]

set -e

die() {
  printf '\n\033[31m✗ %s\033[0m\n\n' "$1" >&2
  exit 1
}

plataforma="$1"
[ -n "$plataforma" ] || die "Falta la plataforma: android o ios."
shift

case "$plataforma" in
  android|ios) ;;
  *) die "Plataforma '$plataforma' no válida. Sólo android o ios." ;;
esac

[ -f pubspec.yaml ] || die "No hay pubspec.yaml acá. Corré esto desde la raíz del proyecto Flutter."

# `version: 2.0.6+99` → `2.0.6+99`. Se corta en el primer match por si algún
# paquete embebido tuviera la suya.
version=$(grep -m1 '^version:' pubspec.yaml | sed 's/^version:[[:space:]]*//' | tr -d '[:space:]')

[ -n "$version" ] || die "No pude leer 'version:' de pubspec.yaml."

# Un patch OTA sólo admite cambios de Dart. Si tocaste un plugin, un permiso o
# el manifest, esto sube algo que el binario instalado no puede ejecutar.
printf '\033[33m→ Patch %s sobre la release %s\033[0m\n' "$plataforma" "$version"
printf '  Sólo cambios de Dart. Si tocaste código nativo, esto NO es lo que querés.\n\n'

exec "$HOME/.shorebird/bin/shorebird" patch "$plataforma" --release-version="$version" "$@"
