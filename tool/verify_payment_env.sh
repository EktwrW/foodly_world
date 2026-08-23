#!/bin/sh
# Falla ANTES de compilar, no en el teléfono del tester ni en la tienda.
#
# Espeja `verify_payment_env!` del Fastfile, que cubría solo el camino de
# fastlane. Los builds de Shorebird —los que suben a Play Store y App Store—
# no pasaban por ahí: un AAB con `pk_test_` salía sin un solo aviso, se
# publicaba, y los pagos fallaban en producción sin ruido en el build.
#
# Con REQUIRE_LIVE=1 una clave de test es ERROR, no advertencia. Ese es el
# modo de los builds que van a una tienda.

set -e

die() {
  printf '\n\033[31m✗ %s\033[0m\n\n' "$1" >&2
  exit 1
}

key="${STRIPE_PUBLISHABLE_KEY:-}"

[ -n "$key" ] || die "Falta STRIPE_PUBLISHABLE_KEY. Sin ella la build sale sin pagos.
    export STRIPE_PUBLISHABLE_KEY=pk_live_...   (o pk_test_ para probar)"

case "$key" in
  pk_test_*|pk_live_*) ;;
  sk_*|rk_*) die "Eso es una clave SECRETA, no la publicable. Nunca la compiles dentro de la app." ;;
  *) die "STRIPE_PUBLISHABLE_KEY no parece una clave publicable (pk_test_/pk_live_)." ;;
esac

modo="TEST"
case "$key" in pk_live_*) modo="LIVE" ;; esac

if [ "${REQUIRE_LIVE:-0}" = "1" ] && [ "$modo" = "TEST" ]; then
  die "Stripe en modo TEST y este build va a una tienda.
    Los pagos fallarían en producción y el build se publica igual.
    export STRIPE_PUBLISHABLE_KEY=pk_live_..."
fi

# Solo los últimos 4, como fastlane: alcanza para distinguir claves y no
# deja la clave entera en el log del build.
printf '\033[32m✓ Stripe %s · …%s\033[0m\n' "$modo" "$(printf '%s' "$key" | tail -c 4)"
