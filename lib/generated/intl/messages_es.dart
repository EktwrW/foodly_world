// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(current, total) => "Analizando ${current} de ${total}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'Sin items para importar', one: 'Se agregará 1 item a tu menú', other: 'Se agregarán ${count} items a tu menú')}";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Detectamos 1 item', other: 'Detectamos ${count} items')}";

  static String m3(count) =>
      "${Intl.plural(count, one: '1 foto seleccionada', other: '${count} fotos seleccionadas')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '1 combo', other: '${count} combos')}";

  static String m5(count) =>
      "${Intl.plural(count, one: '1 bebida', other: '${count} bebidas')}";

  static String m6(count) =>
      "${Intl.plural(count, one: '1 plato', other: '${count} platos')}";

  static String m7(items, categories) =>
      "Importamos ${items} items en ${categories} categorías.";

  static String m8(current, total) => "Subiendo ${current} de ${total}";

  static String m9(count) =>
      "Genera título (máx. 36 caracteres), subtítulo (máx. 99) y descripción (máx. 369) para tu promoción. Te quedan ${count} usos este mes.";

  static String m10(limit) =>
      "Has utilizado las ${limit} promociones generadas con IA disponibles este mes. Tu cuota se renovará el 1ro del próximo mes.";

  static String m11(name) =>
      "¿Bloquear a ${name}? No verás más su contenido, ni él el tuyo.";

  static String m12(businessName) => "Nueva actividad en ${businessName}";

  static String m13(actor, businessName) =>
      "${actor} interactuó con ${businessName}";

  static String m14(businessName) =>
      "El menú de ${businessName} está llamando la atención!";

  static String m15(businessName) =>
      "Un plato de ${businessName} es tendencia!";

  static String m16(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} es tendencia!";

  static String m17(actor, businessName) =>
      "A ${actor} le gustó un plato de ${businessName}";

  static String m18(actor, entityName, businessName) =>
      "A ${actor} le gustó \"${entityName}\" de ${businessName}";

  static String m19(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} está llamando la atención!";

  static String m20(actor, businessName) =>
      "${actor} guardó un menú de ${businessName}";

  static String m21(actor, entityName, businessName) =>
      "${actor} guardó el menú \"${entityName}\" de ${businessName}";

  static String m22(businessName) =>
      "Una promoción de ${businessName} es popular!";

  static String m23(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} es popular!";

  static String m24(actor, businessName) =>
      "${actor} guardó una promo de ${businessName}";

  static String m25(actor, entityName, businessName) =>
      "${actor} guardó la promo \"${entityName}\" de ${businessName}";

  static String m26(businessName) => "${businessName} tiene un nuevo seguidor!";

  static String m27(businessName) =>
      "${businessName} acaba de publicar una nueva promoción!";

  static String m28(businessName) => "Nueva reseña en ${businessName}!";

  static String m29(actor, businessName) =>
      "${actor} dejó una reseña en ${businessName}";

  static String m30(businessName) => "${businessName} actualizó una promoción";

  static String m31(currentLabel) => "Renombrar sección \"${currentLabel}\"";

  static String m32(year) =>
      "Copyright © ${year} - Todos los derechos reservados";

  static String m33(businessName) => "Editar tu reseña para ${businessName}";

  static String m34(phone) => "Ingresá el código enviado a ${phone}";

  static String m35(errorMsg) =>
      "Error al eliminar las fotos del artículo:\n\n${errorMsg}";

  static String m36(business) =>
      "${business} ya lo está preparando. Podés seguir pidiendo — pagás todo al final.";

  static String m37(amount) => "Pagar la cuenta · ${amount}";

  static String m38(name, amount) => "¿Pagar la parte de ${name} (${amount})?";

  static String m39(amount) => "Tiempo extra: faltan ${amount}";

  static String m40(business, code) =>
      "¡Únete a nuestra orden en ${business}! Abre Foodly, entra al menú del restaurante y usa el código ${code}";

  static String m41(name) => "Pagado por ${name}";

  static String m42(paid, total) => "${paid} de ${total} pagado";

  static String m43(amount) => "¿Pagar todo lo pendiente (${amount})?";

  static String m44(amount) => "Pagar todo lo pendiente · ${amount}";

  static String m45(amount) => "Pagar la cuenta · ${amount}";

  static String m46(amount) => "Pagar la orden · ${amount}";

  static String m47(amount) => "Pagar mi parte · ${amount}";

  static String m48(total) =>
      "Pagos completos · ${total}. El recibo llegó a tu email.";

  static String m49(amount) =>
      "Esta tarifa fija de ${amount} por transacción corresponde a la plataforma que procesa tu pago con tarjeta de forma segura. No es un cobro de Foodly ni del restaurante.";

  static String m50(amount) =>
      "Incluye ${amount} de tarifa de la plataforma de pagos";

  static String m51(total) =>
      "Cuenta cerrada · ${total}. El recibo llegó a tu email.";

  static String m52(base, fee) =>
      "Tu pago: ${base} + ${fee} de tarifa de procesamiento";

  static String m53(name) => "¿Transferir la titularidad a ${name}?";

  static String m54(n) => "TANDA ${n}";

  static String m55(total) =>
      "La mesa consumió ${total}. Foodly no procesó este pago, así que no cobra comisión.";

  static String m56(guests, items) => "${guests} comensales · ${items} ítems";

  static String m57(count, total) => "${count} órdenes · ${total}";

  static String m58(delivered, total) =>
      "${delivered}/${total} ítems entregados";

  static String m59(n) => "RONDA ${n}";

  static String m60(item) =>
      "¿Quitar \"${item}\" de la cuenta? Seguirá visible para el comensal, marcado como removido por el negocio.";

  static String m61(size) => "máx. ${size}";

  static String m62(maxSize) => "Máx. ${maxSize}";

  static String m63(count) => "${count} mensajes nuevos";

  static String m64(radius) =>
      "No hay comercios cercanos en esta categoría dentro de ${radius} km.";

  static String m65(text) => "Notas: ${text}";

  static String m66(count) => "Comensales: ${count}";

  static String m67(count) => "Tienes ${count} reservaciones pendientes";

  static String m68(max) => "Máximo ${max} fotos";

  static String m69(max) => "Fotos (opcional, hasta ${max})";

  static String m70(action, errorMsg) =>
      "Ocurrió un error al ${action} la(s) foto(s) del artículo: ${errorMsg}";

  static String m71(maxImages) =>
      "Presiona para agregar fotos, hasta un máximo de ${maxImages} imágenes";

  static String m72(currency, price) => "desde ${currency}${price}";

  static String m73(seconds) => "Reenviar en ${seconds}s";

  static String m74(businessName) => "Reservar mesa en ${businessName}";

  static String m75(city) => "Search in ${city}...";

  static String m76(businessName, appName, menuUrl) =>
      "🍽️ Échale un vistazo al menú de ${businessName} en 🌟 ${appName}: \n${menuUrl}";

  static String m77(text) => "Solicitudes especiales: ${text}";

  static String m78(count) => "hace ${count}d";

  static String m79(count) => "hace ${count}h";

  static String m80(count) => "hace ${count}m";

  static String m81(seconds) =>
      "Demasiados intentos seguidos. Probá de nuevo en ${seconds} s.";

  static String m82(date) => "Visitado el ${date}";

  static String m83(businessName) => "Escribe una reseña para ${businessName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Acerca de"),
    "aboutEvolving": MessageLookupByLibrary.simpleMessage(
      "Apenas estamos comenzando. Foodly esta disenado para evolucionar junto a los negocios y comunidades a los que sirve. Tu opinion define lo que viene.",
    ),
    "aboutEvolvingTitle": MessageLookupByLibrary.simpleMessage(
      "Hecho para Evolucionar",
    ),
    "aboutForBusiness": MessageLookupByLibrary.simpleMessage(
      "Muestra tu menu, lanza promociones, gestiona reservas, fideliza a tus clientes y deja que te descubran de forma natural — todo desde un solo lugar, sin costo.\n\nFoodly crece contigo. Metricas, estadisticas y pedidos dentro de la app estan en camino.",
    ),
    "aboutForBusinessTitle": MessageLookupByLibrary.simpleMessage(
      "Para Negocios",
    ),
    "aboutForCustomers": MessageLookupByLibrary.simpleMessage(
      "Explora lo que hay cerca, descubre nuevos favoritos, guarda las mejores promociones, reserva mesa en segundos y apoya a los negocios que hacen unica a tu ciudad.",
    ),
    "aboutForCustomersTitle": MessageLookupByLibrary.simpleMessage(
      "Para Clientes",
    ),
    "aboutFree": MessageLookupByLibrary.simpleMessage(
      "Foodly es gratis — para negocios y clientes por igual. Una comision del 3% se aplica solo a las ordenes que los clientes pagan a traves de Foodly, y ya cubre el procesamiento del pago. Lo que se paga en barra o en efectivo no tiene coste. Sin suscripciones, sin cargos ocultos, sin sorpresas.",
    ),
    "aboutFreeTitle": MessageLookupByLibrary.simpleMessage("Gratis para Todos"),
    "aboutMission": MessageLookupByLibrary.simpleMessage(
      "Foodly nace de una conviccion simple: cada negocio — ya sea una cocina familiar, una franquicia en crecimiento o una panaderia de barrio — merece herramientas poderosas para conectar con su comunidad.\n\nEstamos construyendo el puente entre los negocios y las personas que aman lo que ofrecen.",
    ),
    "aboutMissionTitle": MessageLookupByLibrary.simpleMessage(
      "Por que Foodly?",
    ),
    "aboutTagline": MessageLookupByLibrary.simpleMessage(
      "Donde cada sabor encuentra su audiencia.",
    ),
    "aboutVideoPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Manifiesto Foodly",
    ),
    "acceptAndContinue": MessageLookupByLibrary.simpleMessage(
      "Aceptar y continuar",
    ),
    "acceptServiceRequests": MessageLookupByLibrary.simpleMessage(
      "Aceptar solicitudes",
    ),
    "accessiblePMR": MessageLookupByLibrary.simpleMessage("Accesible PMR"),
    "account": MessageLookupByLibrary.simpleMessage("Cuenta"),
    "active": MessageLookupByLibrary.simpleMessage("Activo"),
    "activePackageHint": MessageLookupByLibrary.simpleMessage(
      "Los paquetes activos son visibles para los clientes",
    ),
    "addADescription": MessageLookupByLibrary.simpleMessage(
      "Añadir una descripción",
    ),
    "addANewTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Agregar un nuevo periodo de tiempo",
    ),
    "addAdditionalInformation": MessageLookupByLibrary.simpleMessage(
      "Agrega información adicional",
    ),
    "addAnotherBlock": MessageLookupByLibrary.simpleMessage(
      "Agregar otro bloqueo",
    ),
    "addCertification": MessageLookupByLibrary.simpleMessage(
      "Agregar certificación",
    ),
    "addContact": MessageLookupByLibrary.simpleMessage(
      "Agregar canales de contacto",
    ),
    "addCuisine": MessageLookupByLibrary.simpleMessage("Agregar cocina"),
    "addItem": MessageLookupByLibrary.simpleMessage("Agregar ítem"),
    "addLanguage": MessageLookupByLibrary.simpleMessage("Agregar idioma"),
    "addName": MessageLookupByLibrary.simpleMessage("Añadir nombre"),
    "addNewCategory": MessageLookupByLibrary.simpleMessage(
      "Añadir nueva categoría",
    ),
    "addNewItem": MessageLookupByLibrary.simpleMessage("Añadir nuevo artículo"),
    "addNoteOptional": MessageLookupByLibrary.simpleMessage(
      "Añadir una nota (opcional)",
    ),
    "addOpeningHours": MessageLookupByLibrary.simpleMessage(
      "Añadir Horarios de Apertura",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Agregar foto"),
    "addServices": MessageLookupByLibrary.simpleMessage("Agregar Servicios"),
    "addSpecialtiesAndDetails": MessageLookupByLibrary.simpleMessage(
      "Agrega tus especialidades y detalles",
    ),
    "addSpecialty": MessageLookupByLibrary.simpleMessage(
      "Agregar especialidad",
    ),
    "addTagline": MessageLookupByLibrary.simpleMessage(
      "Agrega una frase destacada",
    ),
    "addTitle": MessageLookupByLibrary.simpleMessage("Agrega un título"),
    "addToCalendar": MessageLookupByLibrary.simpleMessage(
      "Agregar al calendario",
    ),
    "addToFavorites": MessageLookupByLibrary.simpleMessage(
      "Añadir a favoritos",
    ),
    "addYoutubeUrl": MessageLookupByLibrary.simpleMessage(
      "Agregar URL de YouTube",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Dirección"),
    "admin": MessageLookupByLibrary.simpleMessage("Administrador"),
    "aiMenuImportAnalyzeCta": MessageLookupByLibrary.simpleMessage(
      "Analizar con IA",
    ),
    "aiMenuImportCamera": MessageLookupByLibrary.simpleMessage("Cámara"),
    "aiMenuImportDisclaimer": MessageLookupByLibrary.simpleMessage(
      "Esta función usa IA para extraer items del menú a partir de tus fotos. La IA puede cometer errores — revisá nombres, precios y descripciones antes de confirmar.",
    ),
    "aiMenuImportEmptyStateCta": MessageLookupByLibrary.simpleMessage(
      "Importar con IA",
    ),
    "aiMenuImportEmptyStateManualHint": MessageLookupByLibrary.simpleMessage(
      "Para cargarlos a mano, abrí el menú flotante y tocá Editar",
    ),
    "aiMenuImportEmptyStateSubtitle": MessageLookupByLibrary.simpleMessage(
      "Subí fotos de las secciones de tu menú y la IA extrae los items, categorías y precios automáticamente.",
    ),
    "aiMenuImportEmptyStateTitle": MessageLookupByLibrary.simpleMessage(
      "Digitalizá tu menú",
    ),
    "aiMenuImportGallery": MessageLookupByLibrary.simpleMessage("Galería"),
    "aiMenuImportHeroSubtitle": MessageLookupByLibrary.simpleMessage(
      "Subí fotos de tu menú y la IA extrae los items, categorías y precios automáticamente.",
    ),
    "aiMenuImportHeroTitle": MessageLookupByLibrary.simpleMessage(
      "Digitalizá tu menú con IA",
    ),
    "aiMenuImportParsing": m0,
    "aiMenuImportParsingHint": MessageLookupByLibrary.simpleMessage(
      "La IA puede tardar unos segundos por foto",
    ),
    "aiMenuImportReviewConfidenceCheck": MessageLookupByLibrary.simpleMessage(
      "Revisar",
    ),
    "aiMenuImportReviewConfidenceOk": MessageLookupByLibrary.simpleMessage(
      "OK",
    ),
    "aiMenuImportReviewConfidenceVerify": MessageLookupByLibrary.simpleMessage(
      "Verificar",
    ),
    "aiMenuImportReviewConfirmCta": MessageLookupByLibrary.simpleMessage(
      "Agregar al menú",
    ),
    "aiMenuImportReviewConfirming": MessageLookupByLibrary.simpleMessage(
      "Guardando…",
    ),
    "aiMenuImportReviewDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Agregar descripción (opcional)",
    ),
    "aiMenuImportReviewFooterCount": m1,
    "aiMenuImportReviewHeaderHint": MessageLookupByLibrary.simpleMessage(
      "Revisá nombres y precios. Tocá la X para eliminar items que no quieras.",
    ),
    "aiMenuImportReviewHeaderTitle": m2,
    "aiMenuImportReviewPending": MessageLookupByLibrary.simpleMessage(
      "Revisión en construcción — pronto podrás editar antes de confirmar",
    ),
    "aiMenuImportReviewTitle": MessageLookupByLibrary.simpleMessage(
      "Revisá tu menú",
    ),
    "aiMenuImportReviewVersionBig": MessageLookupByLibrary.simpleMessage(
      "Grande",
    ),
    "aiMenuImportReviewVersionMedium": MessageLookupByLibrary.simpleMessage(
      "Mediano",
    ),
    "aiMenuImportReviewVersionRegular": MessageLookupByLibrary.simpleMessage(
      "Regular",
    ),
    "aiMenuImportSelectedPhotosLabel": m3,
    "aiMenuImportSuccessCta": MessageLookupByLibrary.simpleMessage(
      "Ver mi menú",
    ),
    "aiMenuImportSuccessHint": MessageLookupByLibrary.simpleMessage(
      "Ahora podés agregar fotos a cada item, ajustar precios o reordenarlos cuando quieras.",
    ),
    "aiMenuImportSuccessStatCombos": m4,
    "aiMenuImportSuccessStatDrinks": m5,
    "aiMenuImportSuccessStatFood": m6,
    "aiMenuImportSuccessSubtitle": m7,
    "aiMenuImportSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "¡Tu menú está listo!",
    ),
    "aiMenuImportTips": MessageLookupByLibrary.simpleMessage(
      "Para mejor resultado: una foto por sección, buena luz, sin reflejos, sin columnas paralelas.",
    ),
    "aiMenuImportTitle": MessageLookupByLibrary.simpleMessage(
      "Importar menú con IA",
    ),
    "aiMenuImportUploading": m8,
    "aiMenuImportUploadingHint": MessageLookupByLibrary.simpleMessage(
      "Subiendo tus fotos a Foodly de forma segura",
    ),
    "aiPromoContent": m9,
    "aiPromoGenerate": MessageLookupByLibrary.simpleMessage("Generar"),
    "aiPromoImageLabel": MessageLookupByLibrary.simpleMessage(
      "Incluir imagen promocional (16:9)",
    ),
    "aiPromoImageNatural": MessageLookupByLibrary.simpleMessage("Natural"),
    "aiPromoImageVivid": MessageLookupByLibrary.simpleMessage("Vívido"),
    "aiPromoQuotaExhaustedContent": m10,
    "aiPromoQuotaExhaustedTitle": MessageLookupByLibrary.simpleMessage(
      "Cuota Mensual Alcanzada",
    ),
    "aiPromoTitle": MessageLookupByLibrary.simpleMessage(
      "Generador de Promociones AI",
    ),
    "all": MessageLookupByLibrary.simpleMessage("Todos"),
    "allBookings": MessageLookupByLibrary.simpleMessage("Todas"),
    "allowLocationInSettings": MessageLookupByLibrary.simpleMessage(
      "Permitir en Ajustes",
    ),
    "allowLocationInSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Toca para abrir los ajustes de la app y habilitar la ubicación",
    ),
    "allowReservations": MessageLookupByLibrary.simpleMessage(
      "Permitir Reservas",
    ),
    "alphabetical": MessageLookupByLibrary.simpleMessage("A-Z"),
    "alreadyReviewedPrompt": MessageLookupByLibrary.simpleMessage(
      "Ya reseñaste este negocio.\n¿Quieres editar tu reseña?",
    ),
    "analytics": MessageLookupByLibrary.simpleMessage("Analíticas"),
    "analyticsAvailabilityChecks": MessageLookupByLibrary.simpleMessage(
      "Disponibilidad consultada",
    ),
    "analyticsAvgResponseHours": MessageLookupByLibrary.simpleMessage(
      "Tiempo de respuesta",
    ),
    "analyticsBookingSuccessRate": MessageLookupByLibrary.simpleMessage(
      "Tasa de éxito",
    ),
    "analyticsBookings": MessageLookupByLibrary.simpleMessage("Bookings"),
    "analyticsBookingsTotal": MessageLookupByLibrary.simpleMessage(
      "Reservas de servicio",
    ),
    "analyticsComingSoon": MessageLookupByLibrary.simpleMessage(
      "Panel de Analíticas — Próximamente\nConoce el rendimiento real de tu negocio: visitas, platos más pedidos, tendencias de clientes e ingresos. Todo en un solo lugar.",
    ),
    "analyticsInquiryToBooking": MessageLookupByLibrary.simpleMessage(
      "Consulta → Booking",
    ),
    "analyticsLabelBookingStarted": MessageLookupByLibrary.simpleMessage(
      "Booking iniciado",
    ),
    "analyticsLabelBookingSubmitted": MessageLookupByLibrary.simpleMessage(
      "Booking enviado",
    ),
    "analyticsLabelBookingSucceeded": MessageLookupByLibrary.simpleMessage(
      "Booking confirmado",
    ),
    "analyticsLabelBusinessOpen": MessageLookupByLibrary.simpleMessage(
      "Visitas al negocio",
    ),
    "analyticsLabelCtaClicked": MessageLookupByLibrary.simpleMessage(
      "Toques de contacto",
    ),
    "analyticsLabelCtaDirections": MessageLookupByLibrary.simpleMessage(
      "Cómo llegar",
    ),
    "analyticsLabelCtaInstagram": MessageLookupByLibrary.simpleMessage(
      "Instagram",
    ),
    "analyticsLabelCtaPhone": MessageLookupByLibrary.simpleMessage("Llamadas"),
    "analyticsLabelCtaWebsite": MessageLookupByLibrary.simpleMessage(
      "Visitas al sitio web",
    ),
    "analyticsLabelCtaWhatsapp": MessageLookupByLibrary.simpleMessage(
      "WhatsApp",
    ),
    "analyticsLabelFavoriteAdded": MessageLookupByLibrary.simpleMessage(
      "Agregado a favoritos",
    ),
    "analyticsLabelFavoriteRemoved": MessageLookupByLibrary.simpleMessage(
      "Quitado de favoritos",
    ),
    "analyticsLabelMenuViewed": MessageLookupByLibrary.simpleMessage(
      "Vistas del menú",
    ),
    "analyticsLabelPackageInquiry": MessageLookupByLibrary.simpleMessage(
      "Consultas",
    ),
    "analyticsLabelPackageView": MessageLookupByLibrary.simpleMessage(
      "Vistas de paquetes",
    ),
    "analyticsLabelProfileView": MessageLookupByLibrary.simpleMessage(
      "Visitas a perfil",
    ),
    "analyticsLabelReservationStarted": MessageLookupByLibrary.simpleMessage(
      "Reservas iniciadas",
    ),
    "analyticsLabelReservationSubmitted": MessageLookupByLibrary.simpleMessage(
      "Reservas enviadas",
    ),
    "analyticsLabelReservationSucceeded": MessageLookupByLibrary.simpleMessage(
      "Reservas completadas",
    ),
    "analyticsLabelReviewCreated": MessageLookupByLibrary.simpleMessage(
      "Reseñas recibidas",
    ),
    "analyticsLabelSearchResult": MessageLookupByLibrary.simpleMessage(
      "Apariciones en búsqueda",
    ),
    "analyticsLabelShare": MessageLookupByLibrary.simpleMessage("Compartidos"),
    "analyticsStatusCancelled": MessageLookupByLibrary.simpleMessage(
      "Cancelada",
    ),
    "analyticsStatusCompleted": MessageLookupByLibrary.simpleMessage(
      "Completada",
    ),
    "analyticsStatusConfirmed": MessageLookupByLibrary.simpleMessage(
      "Confirmada",
    ),
    "analyticsStatusNoShow": MessageLookupByLibrary.simpleMessage("No asistió"),
    "analyticsStatusPending": MessageLookupByLibrary.simpleMessage("Pendiente"),
    "analyticsStatusRejected": MessageLookupByLibrary.simpleMessage(
      "Rechazada",
    ),
    "analyticsTitle": MessageLookupByLibrary.simpleMessage("Analíticas"),
    "analyticsTopPackagesTitle": MessageLookupByLibrary.simpleMessage(
      "Top paquetes",
    ),
    "analyticsViewToBooking": MessageLookupByLibrary.simpleMessage(
      "Vista → Booking",
    ),
    "analyticsViewToInquiry": MessageLookupByLibrary.simpleMessage(
      "Vista → Consulta",
    ),
    "and": MessageLookupByLibrary.simpleMessage("y"),
    "andCreateContentToThese": MessageLookupByLibrary.simpleMessage(
      "y gestionar contenido, promociones y más",
    ),
    "approveQuote": MessageLookupByLibrary.simpleMessage("Aprobar cotización"),
    "april": MessageLookupByLibrary.simpleMessage("Abril"),
    "arabic": MessageLookupByLibrary.simpleMessage("Árabe"),
    "areYouSureCancelReservation": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que deseas cancelar esta reservación?",
    ),
    "argentinian": MessageLookupByLibrary.simpleMessage("Argentina"),
    "asian": MessageLookupByLibrary.simpleMessage("Asiática"),
    "askRecommendationsByTextSmart": MessageLookupByLibrary.simpleMessage(
      "Pedir recomendaciones por texto inteligente",
    ),
    "askRecommendationsByYourVoice": MessageLookupByLibrary.simpleMessage(
      "Pedir recomendaciones por voz",
    ),
    "at": MessageLookupByLibrary.simpleMessage("a las"),
    "attachVideo": MessageLookupByLibrary.simpleMessage("Adjuntar video"),
    "audioNotUnderstood": MessageLookupByLibrary.simpleMessage(
      "No se pudo entender el audio. Por favor, intenta de nuevo.",
    ),
    "audioProcessingError": MessageLookupByLibrary.simpleMessage(
      "Error al procesar el audio. Por favor, intenta de nuevo.",
    ),
    "august": MessageLookupByLibrary.simpleMessage("Agosto"),
    "availability": MessageLookupByLibrary.simpleMessage("Disponibilidad"),
    "availabilityCalendar": MessageLookupByLibrary.simpleMessage(
      "Calendario de disponibilidad",
    ),
    "avgRating": MessageLookupByLibrary.simpleMessage("Calificación prom."),
    "awaitingQuote": MessageLookupByLibrary.simpleMessage(
      "Esperando cotización",
    ),
    "babyChangingStation": MessageLookupByLibrary.simpleMessage(
      "Cambiador de Bebés",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Volver"),
    "bakeryAndDesserts": MessageLookupByLibrary.simpleMessage(
      "Pasteleria y Postres",
    ),
    "barsAndPubs": MessageLookupByLibrary.simpleMessage("Bares y Pubs"),
    "big": MessageLookupByLibrary.simpleMessage("Grande"),
    "biometricSnackbarTextSpanA": MessageLookupByLibrary.simpleMessage(
      "El sistema operativo de este dispositivo no admite o no tiene configurados, los accesos de tipo patrón o biométricos.",
    ),
    "biometricSnackbarTextSpanB": MessageLookupByLibrary.simpleMessage(
      "La sesión ha caducado, debes ingresar con tu usuario y contraseña, o acceder con Google Sign-In.",
    ),
    "birthday": MessageLookupByLibrary.simpleMessage("Cumpleaños"),
    "blockAction": MessageLookupByLibrary.simpleMessage("Bloquear"),
    "blockDate": MessageLookupByLibrary.simpleMessage("Bloquear fecha"),
    "blockUser": MessageLookupByLibrary.simpleMessage("Bloquear usuario"),
    "blockUserConfirm": m11,
    "blockedSuccess": MessageLookupByLibrary.simpleMessage("Usuario bloqueado"),
    "blockedUsers": MessageLookupByLibrary.simpleMessage("Usuarios bloqueados"),
    "blockedUsersEmpty": MessageLookupByLibrary.simpleMessage(
      "No bloqueaste a nadie.",
    ),
    "blocksOn": MessageLookupByLibrary.simpleMessage("Bloqueos del"),
    "bookingDetail": MessageLookupByLibrary.simpleMessage("Detalle de reserva"),
    "bookingMessages": MessageLookupByLibrary.simpleMessage("Mensajes"),
    "bookingPricing": MessageLookupByLibrary.simpleMessage(
      "Reservas y precios",
    ),
    "brands": MessageLookupByLibrary.simpleMessage("marcas"),
    "brazilian": MessageLookupByLibrary.simpleMessage("Brasilera"),
    "brunch": MessageLookupByLibrary.simpleMessage("Brunch"),
    "budgetEstimate": MessageLookupByLibrary.simpleMessage(
      "Presupuesto estimado",
    ),
    "business": MessageLookupByLibrary.simpleMessage("Negocio"),
    "businessAccountUpgradeInfo": MessageLookupByLibrary.simpleMessage(
      "Te dirigiremos al formulario de registro empresarial. Tu solicitud será revisada para verificación en la plataforma. Ten en cuenta que la creación de negocios falsos, apropiación indebida o suplantación de marcas y establecimientos puede acarrear consecuencias legales.",
    ),
    "businessCategory": MessageLookupByLibrary.simpleMessage(
      "Categoria de Negocio",
    ),
    "businessDisclaimer": MessageLookupByLibrary.simpleMessage(
      "actúa únicamente como plataforma de visualización. Los precios, disponibilidad, contenido y calidad de los productos, así como la información nutricional y alergénica en este menú, son responsabilidad exclusiva del establecimiento comercial. Foodly no se hace responsable por discrepancias, inexactitudes o cambios en la información proporcionada por el comercio.",
    ),
    "businessInfoNote": MessageLookupByLibrary.simpleMessage(
      "Nota sobre la información del comercio:",
    ),
    "businessInformationNotFound": MessageLookupByLibrary.simpleMessage(
      "Información del negocio no encontrada",
    ),
    "businessName": MessageLookupByLibrary.simpleMessage("Nombre comercial"),
    "businessNotAcceptingRequestsNow": MessageLookupByLibrary.simpleMessage(
      "Este negocio no está aceptando solicitudes por ahora",
    ),
    "businessRegister": MessageLookupByLibrary.simpleMessage(
      "Registrar Negocio",
    ),
    "businesses": MessageLookupByLibrary.simpleMessage("negocios"),
    "buzz": MessageLookupByLibrary.simpleMessage("Novedades"),
    "buzzDefaultActivity": m12,
    "buzzDefaultActivitySocial": m13,
    "buzzEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "La actividad de la comunidad aparecerá aquí",
    ),
    "buzzEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Aún no hay novedades cerca",
    ),
    "buzzNewFavoriteMenu": m14,
    "buzzNewFavoriteMenuItem": m15,
    "buzzNewFavoriteMenuItemNamed": m16,
    "buzzNewFavoriteMenuItemSocial": m17,
    "buzzNewFavoriteMenuItemSocialNamed": m18,
    "buzzNewFavoriteMenuNamed": m19,
    "buzzNewFavoriteMenuSocial": m20,
    "buzzNewFavoriteMenuSocialNamed": m21,
    "buzzNewFavoritePromotion": m22,
    "buzzNewFavoritePromotionNamed": m23,
    "buzzNewFavoritePromotionSocial": m24,
    "buzzNewFavoritePromotionSocialNamed": m25,
    "buzzNewFollower": m26,
    "buzzNewPromotion": m27,
    "buzzNewReview": m28,
    "buzzNewReviewSocial": m29,
    "buzzPromotionUpdate": m30,
    "cafesAndBreakfasts": MessageLookupByLibrary.simpleMessage(
      "Cafés y Desayunos",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Camara"),
    "canNotContainSpecialCharactersBut_": MessageLookupByLibrary.simpleMessage(
      "No puede contener espacios ni caracteres especiales excepto \'_\'",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cancelEdit": MessageLookupByLibrary.simpleMessage("Cancelar edición"),
    "cancelReservation": MessageLookupByLibrary.simpleMessage(
      "Cancelar Reserva",
    ),
    "cancelReservationConfirm": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que quieres cancelar esta reserva?",
    ),
    "cancellationDetails": MessageLookupByLibrary.simpleMessage(
      "Detalles de cancelación",
    ),
    "cancellationDetailsHint": MessageLookupByLibrary.simpleMessage(
      "Describe los términos de cancelación",
    ),
    "cancellationPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de cancelación",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelada"),
    "cannotReviewOwnBusiness": MessageLookupByLibrary.simpleMessage(
      "No puedes reseñar tu propio negocio",
    ),
    "cannotUndone": MessageLookupByLibrary.simpleMessage(
      "\nEsta acción no se puede deshacer.",
    ),
    "categories": MessageLookupByLibrary.simpleMessage("Categorías"),
    "categoryDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Categoría eliminada correctamente",
    ),
    "categoryNameEmpty": MessageLookupByLibrary.simpleMessage(
      "El nombre de la categoría no puede estar vacío",
    ),
    "categoryTitleUpdated": MessageLookupByLibrary.simpleMessage(
      "Título de categoría actualizado correctamente",
    ),
    "catering": MessageLookupByLibrary.simpleMessage("Catering"),
    "cateringAndChefs": MessageLookupByLibrary.simpleMessage(
      "Catering & Chefs",
    ),
    "certificationExample": MessageLookupByLibrary.simpleMessage("Ej: HACCP"),
    "certifications": MessageLookupByLibrary.simpleMessage("Certificaciones"),
    "changeLocation": MessageLookupByLibrary.simpleMessage("Cambiar Ubicación"),
    "changeSearchPoint": MessageLookupByLibrary.simpleMessage(
      "Cambia el punto de búsqueda para recomendaciones",
    ),
    "changeUsername": MessageLookupByLibrary.simpleMessage(
      "Cambiar nombre de usuario",
    ),
    "checkBackLater": MessageLookupByLibrary.simpleMessage("¡Vuelve pronto!"),
    "checkingLocation": MessageLookupByLibrary.simpleMessage(
      "Verificando ubicación...",
    ),
    "city": MessageLookupByLibrary.simpleMessage("Ciudad"),
    "clear": MessageLookupByLibrary.simpleMessage("Limpiar"),
    "close": MessageLookupByLibrary.simpleMessage("Cerrar"),
    "closed": MessageLookupByLibrary.simpleMessage("Cerrado"),
    "cocktail": MessageLookupByLibrary.simpleMessage("Cóctel"),
    "combos": MessageLookupByLibrary.simpleMessage("Combos"),
    "combosLabelCustom": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "combosLabelHint": MessageLookupByLibrary.simpleMessage(
      "Selecciona o crea la etiqueta que mejor se adapte a tu negocio",
    ),
    "combosLabelMenus": MessageLookupByLibrary.simpleMessage("Menus"),
    "combosLabelPlatters": MessageLookupByLibrary.simpleMessage("Bandejas"),
    "combosLabelSetMeals": MessageLookupByLibrary.simpleMessage(
      "Platos Completos",
    ),
    "combosLabelSpecials": MessageLookupByLibrary.simpleMessage("Especiales"),
    "combosLabelTitle": m31,
    "communityGuidelinesNotice": MessageLookupByLibrary.simpleMessage(
      "Al publicar, aceptás nuestras Normas de la Comunidad.",
    ),
    "complete": MessageLookupByLibrary.simpleMessage("Completar"),
    "completeSignUp": MessageLookupByLibrary.simpleMessage(
      "Completar Registro",
    ),
    "completed": MessageLookupByLibrary.simpleMessage("Completada"),
    "composure": MessageLookupByLibrary.simpleMessage("Composure"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
    "confirmApproveQuote": MessageLookupByLibrary.simpleMessage(
      "¿Aprobar esta cotización?",
    ),
    "confirmApproveQuoteMessage": MessageLookupByLibrary.simpleMessage(
      "Al aprobar, confirmas la reserva. El pago se realiza fuera de la plataforma.",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Confirmar contraseña",
    ),
    "confirmPasswordForEmailChange": MessageLookupByLibrary.simpleMessage(
      "Por seguridad, ingresá tu contraseña actual para cambiar tu email.",
    ),
    "confirmPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Confirmá tu contraseña",
    ),
    "confirmPhoneForVerification": MessageLookupByLibrary.simpleMessage(
      "Confirmá el número de teléfono para recibir tu código de verificación.",
    ),
    "confirmRejectQuote": MessageLookupByLibrary.simpleMessage(
      "¿Rechazar esta cotización?",
    ),
    "confirmRejectQuoteMessage": MessageLookupByLibrary.simpleMessage(
      "Al rechazar, cierras esta solicitud y el negocio será notificado. No podrás revertir esta acción.",
    ),
    "confirmed": MessageLookupByLibrary.simpleMessage("Confirmada"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Error de conexión. Verifica tu internet e intenta de nuevo.",
    ),
    "contactAdmin": MessageLookupByLibrary.simpleMessage(
      "Ocurrió un error, por favor contacta al administrador.",
    ),
    "contactAttachImage": MessageLookupByLibrary.simpleMessage(
      "Adjuntar imagen (opcional, máx. 3 MB)",
    ),
    "contactEmail": MessageLookupByLibrary.simpleMessage(
      "Correo electrónico de contacto",
    ),
    "contactFileTooLarge": MessageLookupByLibrary.simpleMessage(
      "La imagen debe ser menor a 3 MB",
    ),
    "contactImageAttached": MessageLookupByLibrary.simpleMessage(
      "Imagen adjunta",
    ),
    "contactMessageHint": MessageLookupByLibrary.simpleMessage(
      "Escribe tu mensaje aquí...",
    ),
    "contactNumber": MessageLookupByLibrary.simpleMessage("Número de contacto"),
    "contactPrivacyNotice": MessageLookupByLibrary.simpleMessage(
      "Visible solo para ti y los comercios donde tengas reservación activa.",
    ),
    "contactRecipientHello": MessageLookupByLibrary.simpleMessage(
      "Consultas generales",
    ),
    "contactRecipientPrivacy": MessageLookupByLibrary.simpleMessage(
      "Privacidad y datos",
    ),
    "contactRemoveImage": MessageLookupByLibrary.simpleMessage("Eliminar"),
    "contactSelectRecipient": MessageLookupByLibrary.simpleMessage(
      "Seleccionar destinatario",
    ),
    "contactSentSuccess": MessageLookupByLibrary.simpleMessage(
      "¡Tu mensaje fue enviado con éxito!",
    ),
    "contactSubjectHint": MessageLookupByLibrary.simpleMessage(
      "Asunto de tu mensaje",
    ),
    "contactUs": MessageLookupByLibrary.simpleMessage("Contáctanos"),
    "conversionFunnel": MessageLookupByLibrary.simpleMessage(
      "Embudo de conversión",
    ),
    "cookingClass": MessageLookupByLibrary.simpleMessage("Clase de cocina"),
    "cookingSchools": MessageLookupByLibrary.simpleMessage(
      "Escuelas de Cocina",
    ),
    "copyrightText": m32,
    "corporate": MessageLookupByLibrary.simpleMessage("Corporativo"),
    "couldNotLoadAnalytics": MessageLookupByLibrary.simpleMessage(
      "No se pudieron cargar las analíticas",
    ),
    "couldNotLoadNewReleases": MessageLookupByLibrary.simpleMessage(
      "No se pudieron cargar los recién abiertos",
    ),
    "couldNotLoadProfile": MessageLookupByLibrary.simpleMessage(
      "No se pudo cargar el perfil",
    ),
    "couldNotLoadPromotions": MessageLookupByLibrary.simpleMessage(
      "No se pudieron cargar las promociones",
    ),
    "couldNotLoadReservationDetails": MessageLookupByLibrary.simpleMessage(
      "No se pudieron cargar los detalles de la reservación.",
    ),
    "country": MessageLookupByLibrary.simpleMessage("País"),
    "countryArgentina": MessageLookupByLibrary.simpleMessage("Argentina"),
    "countryEcuador": MessageLookupByLibrary.simpleMessage("Ecuador"),
    "countryElSalvador": MessageLookupByLibrary.simpleMessage("El Salvador"),
    "countryPortugal": MessageLookupByLibrary.simpleMessage("Portugal"),
    "countrySpain": MessageLookupByLibrary.simpleMessage("España"),
    "countryUsa": MessageLookupByLibrary.simpleMessage("Estados Unidos"),
    "countryVenezuela": MessageLookupByLibrary.simpleMessage("Venezuela"),
    "coverImagesSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
      "¡Imágenes de portada actualizadas con éxito!",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Crear"),
    "createNewPromotion": MessageLookupByLibrary.simpleMessage(
      "Crear nueva promoción",
    ),
    "createPackage": MessageLookupByLibrary.simpleMessage("Crear paquete"),
    "createPostTitle": MessageLookupByLibrary.simpleMessage(
      "Crear publicación",
    ),
    "createUser": MessageLookupByLibrary.simpleMessage("Crear Usuario"),
    "cropImage": MessageLookupByLibrary.simpleMessage("Recortar imagen"),
    "cuisineExample": MessageLookupByLibrary.simpleMessage("Ej: Mediterránea"),
    "cuisines": MessageLookupByLibrary.simpleMessage("Cocinas"),
    "currency": MessageLookupByLibrary.simpleMessage("Moneda"),
    "custom": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "customer": MessageLookupByLibrary.simpleMessage("Cliente"),
    "dailyTrends": MessageLookupByLibrary.simpleMessage("Tendencias diarias"),
    "dangerZone": MessageLookupByLibrary.simpleMessage("Zona de Peligro"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Panel de Negocio"),
    "dashboardAdditionalInformationText1": MessageLookupByLibrary.simpleMessage(
      "Información",
    ),
    "dashboardAdditionalInformationText2": MessageLookupByLibrary.simpleMessage(
      "Adicional",
    ),
    "dashboardContactText1": MessageLookupByLibrary.simpleMessage("Medios de"),
    "dashboardContactText2": MessageLookupByLibrary.simpleMessage("Contacto"),
    "dashboardOpeningHoursText1": MessageLookupByLibrary.simpleMessage(
      "Horarios de",
    ),
    "dashboardOpeningHoursText2": MessageLookupByLibrary.simpleMessage(
      "Apertura",
    ),
    "dashboardReviewsOfOurCustomersText1": MessageLookupByLibrary.simpleMessage(
      "Opiniones de nuestros",
    ),
    "dashboardReviewsOfOurCustomersText2": MessageLookupByLibrary.simpleMessage(
      "Clientes",
    ),
    "dashboardServicesAtText1": MessageLookupByLibrary.simpleMessage(
      "Servicios en el",
    ),
    "dashboardServicesAtText2": MessageLookupByLibrary.simpleMessage(
      "Establecimiento",
    ),
    "date": MessageLookupByLibrary.simpleMessage("Fecha"),
    "dateBlocked": MessageLookupByLibrary.simpleMessage("Fecha bloqueada"),
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Fecha de nacimiento"),
    "datePartiallyBlockedInfo": MessageLookupByLibrary.simpleMessage(
      "Ese día tiene horarios parcialmente reservados. Puede que te pidamos ajustar la hora.",
    ),
    "dateUnavailable": MessageLookupByLibrary.simpleMessage(
      "Esa fecha acaba de bloquearse. Elige otra, por favor.",
    ),
    "december": MessageLookupByLibrary.simpleMessage("Diciembre"),
    "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Eliminar Cuenta"),
    "deleteAccountBusinessWarning": MessageLookupByLibrary.simpleMessage(
      "Tienes un negocio activo que también será eliminado permanentemente y no podrá recuperarse.",
    ),
    "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
      "Sí, eliminar mi cuenta",
    ),
    "deleteAccountTitle": MessageLookupByLibrary.simpleMessage(
      "¿Eliminar tu cuenta?",
    ),
    "deleteAccountWarning": MessageLookupByLibrary.simpleMessage(
      "Esta acción es permanente. Tus datos personales serán eliminados y todos tus negocios serán removidos. Serás desconectado inmediatamente.",
    ),
    "deleteAllCategoryItems": MessageLookupByLibrary.simpleMessage(
      "\n\nEsta acción eliminará permanentemente todos los items de esta categoría.",
    ),
    "deleteBlock": MessageLookupByLibrary.simpleMessage("Eliminar bloqueo"),
    "deleteBlockConfirm": MessageLookupByLibrary.simpleMessage(
      "¿Seguro que quieres eliminar este bloqueo? Esta acción no se puede deshacer.",
    ),
    "deleteBusiness": MessageLookupByLibrary.simpleMessage("Eliminar Negocio"),
    "deleteBusinessConfirm": MessageLookupByLibrary.simpleMessage(
      "Sí, eliminar negocio",
    ),
    "deleteBusinessSuccess": MessageLookupByLibrary.simpleMessage(
      "Negocio eliminado con éxito",
    ),
    "deleteBusinessTitle": MessageLookupByLibrary.simpleMessage(
      "¿Eliminar este negocio?",
    ),
    "deleteBusinessWarning": MessageLookupByLibrary.simpleMessage(
      "Esta acción es permanente. El negocio y todo su contenido (menú, promociones, reservas) será eliminado.",
    ),
    "deleteCategory": MessageLookupByLibrary.simpleMessage(
      "Eliminar categoría",
    ),
    "deletePackage": MessageLookupByLibrary.simpleMessage("Eliminar paquete"),
    "deletePackageConfirmation": MessageLookupByLibrary.simpleMessage(
      "¿Seguro que deseas eliminar este paquete? Esta acción no se puede deshacer.",
    ),
    "deletePostConfirm": MessageLookupByLibrary.simpleMessage(
      "¿Seguro que quieres eliminar esta publicación?",
    ),
    "deletePostTitle": MessageLookupByLibrary.simpleMessage(
      "Eliminar publicación",
    ),
    "delivery": MessageLookupByLibrary.simpleMessage("Delivery"),
    "depositPercentage": MessageLookupByLibrary.simpleMessage(
      "Porcentaje de depósito",
    ),
    "depositRequired": MessageLookupByLibrary.simpleMessage(
      "Requiere depósito",
    ),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("Descripción"),
    "dietaryNotes": MessageLookupByLibrary.simpleMessage("Notas dietéticas"),
    "dinner": MessageLookupByLibrary.simpleMessage("Cena"),
    "doItLater": MessageLookupByLibrary.simpleMessage("Lo haré más tarde"),
    "doYouWantToDeleteThisCoverImage": MessageLookupByLibrary.simpleMessage(
      "¿Deseas eliminar esta imagen de portada?",
    ),
    "downloadApp": MessageLookupByLibrary.simpleMessage("Obtener la app"),
    "downloadQrImage": MessageLookupByLibrary.simpleMessage(
      "Descargar imagen QR",
    ),
    "drinks": MessageLookupByLibrary.simpleMessage("Bebidas"),
    "durationHours": MessageLookupByLibrary.simpleMessage("Duración (horas)"),
    "edit": MessageLookupByLibrary.simpleMessage("Editar"),
    "editCoverImages": MessageLookupByLibrary.simpleMessage(
      "Editar Imágenes de Portada",
    ),
    "editLocation": MessageLookupByLibrary.simpleMessage("Editar Ubicación"),
    "editMenu": MessageLookupByLibrary.simpleMessage("Editar menú"),
    "editPackage": MessageLookupByLibrary.simpleMessage("Editar paquete"),
    "editReview": MessageLookupByLibrary.simpleMessage("Editar reseña"),
    "editTitle": MessageLookupByLibrary.simpleMessage("Editar título"),
    "editYourReviewFor": m33,
    "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
    "emailChangeBlockedForSocialUser": MessageLookupByLibrary.simpleMessage(
      "Primero establecé una contraseña para tu cuenta y luego podrás cambiar tu email.",
    ),
    "emailSectionTitle1": MessageLookupByLibrary.simpleMessage("Tu"),
    "emailSectionTitle2": MessageLookupByLibrary.simpleMessage("Email"),
    "emailUpdated": MessageLookupByLibrary.simpleMessage(
      "Tu correo se actualizó correctamente.",
    ),
    "enableDigitalMenu": MessageLookupByLibrary.simpleMessage(
      "Habilitar menú digital",
    ),
    "enableDigitalMenuHint": MessageLookupByLibrary.simpleMessage(
      "Mostrá una carta además de tus paquetes",
    ),
    "enableLocation": MessageLookupByLibrary.simpleMessage("Activar ubicación"),
    "enableLocationDescription": MessageLookupByLibrary.simpleMessage(
      "Toca para activar el acceso a la ubicación",
    ),
    "end": MessageLookupByLibrary.simpleMessage("Cierre"),
    "endDate": MessageLookupByLibrary.simpleMessage("Fecha de finalización"),
    "endSession": MessageLookupByLibrary.simpleMessage("Terminar Sesión"),
    "endTime": MessageLookupByLibrary.simpleMessage("Hora de fin"),
    "enterAValidEmail": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduce una dirección de correo electrónico válida",
    ),
    "enterAValidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduce un número de teléfono válido",
    ),
    "enterAValidPostalCode": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduce un código postal válido",
    ),
    "enterCategoryName": MessageLookupByLibrary.simpleMessage(
      "Ingresa un nombre para esta categoría",
    ),
    "enterCodeSentTo": m34,
    "enterQuoteAmount": MessageLookupByLibrary.simpleMessage(
      "Ingrese el monto de la cotización",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "errorLoadingVideo": MessageLookupByLibrary.simpleMessage(
      "Error al cargar el video",
    ),
    "errorUpdatingPromotionMedia": MessageLookupByLibrary.simpleMessage(
      "Error al actualizar los medios de la promoción",
    ),
    "errorUploadingPromotionMedia": MessageLookupByLibrary.simpleMessage(
      "Error al subir los medios de la promoción",
    ),
    "eventAddress": MessageLookupByLibrary.simpleMessage(
      "Dirección del evento",
    ),
    "eventCity": MessageLookupByLibrary.simpleMessage("Ciudad del evento"),
    "eventLocation": MessageLookupByLibrary.simpleMessage(
      "Ubicación del evento",
    ),
    "eventType": MessageLookupByLibrary.simpleMessage("Tipo de evento"),
    "eventTypeBirthday": MessageLookupByLibrary.simpleMessage("Cumpleaños"),
    "eventTypeBrunch": MessageLookupByLibrary.simpleMessage("Brunch"),
    "eventTypeCocktail": MessageLookupByLibrary.simpleMessage("Cóctel"),
    "eventTypeCookingClassPrivate": MessageLookupByLibrary.simpleMessage(
      "Clase de cocina privada",
    ),
    "eventTypeCorporate": MessageLookupByLibrary.simpleMessage("Corporativo"),
    "eventTypeCustom": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "eventTypeDinner": MessageLookupByLibrary.simpleMessage("Cena"),
    "eventTypeLunch": MessageLookupByLibrary.simpleMessage("Almuerzo"),
    "eventTypeWedding": MessageLookupByLibrary.simpleMessage("Boda"),
    "exploreAsGuest": MessageLookupByLibrary.simpleMessage("Explorar"),
    "failedDeletePhotos": m35,
    "failedToCancelReservation": MessageLookupByLibrary.simpleMessage(
      "No se pudo cancelar la reservación.",
    ),
    "failedToCompleteReservation": MessageLookupByLibrary.simpleMessage(
      "No se pudo completar la reservación.",
    ),
    "failedToConfirmReservation": MessageLookupByLibrary.simpleMessage(
      "No se pudo confirmar la reservación.",
    ),
    "failedToLoadPromotionDetails": MessageLookupByLibrary.simpleMessage(
      "Error al cargar los detalles de la promoción.",
    ),
    "failedToMarkNoShow": MessageLookupByLibrary.simpleMessage(
      "No se pudo marcar como no asistió.",
    ),
    "failedToRejectReservation": MessageLookupByLibrary.simpleMessage(
      "No se pudo rechazar la reservación.",
    ),
    "fastFood": MessageLookupByLibrary.simpleMessage("Comida Rápida"),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoritos"),
    "featured": MessageLookupByLibrary.simpleMessage("Destacado"),
    "featuredPackageHint": MessageLookupByLibrary.simpleMessage(
      "Los paquetes destacados aparecen primero",
    ),
    "february": MessageLookupByLibrary.simpleMessage("Febrero"),
    "feedFilterFollowing": MessageLookupByLibrary.simpleMessage("Siguiendo"),
    "feedFilterNearby": MessageLookupByLibrary.simpleMessage("Cercanos"),
    "feedFollowingEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Sigue a usuarios desde la pestaña Usuarios para ver sus publicaciones acá.",
    ),
    "feedFollowingEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Aún no sigues a nadie",
    ),
    "female": MessageLookupByLibrary.simpleMessage("Femenino"),
    "fieldRequired": MessageLookupByLibrary.simpleMessage(
      "Este campo es obligatorio",
    ),
    "findAndCompleteAddress": MessageLookupByLibrary.simpleMessage(
      "Encuentra y completa fácilmente tu dirección",
    ),
    "finishEdit": MessageLookupByLibrary.simpleMessage(
      "Finalizar modo edición",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("Nombre"),
    "fixed": MessageLookupByLibrary.simpleMessage("Fijo"),
    "flexible": MessageLookupByLibrary.simpleMessage("Flexible"),
    "follow": MessageLookupByLibrary.simpleMessage("Seguir"),
    "followers": MessageLookupByLibrary.simpleMessage("Seguidores"),
    "following": MessageLookupByLibrary.simpleMessage("Siguiendo"),
    "food": MessageLookupByLibrary.simpleMessage("Platos"),
    "foodTrucks": MessageLookupByLibrary.simpleMessage("Food Trucks y Puestos"),
    "foodlyCoverage": MessageLookupByLibrary.simpleMessage("Cobertura Foodly"),
    "foodlyCoverageDescription": MessageLookupByLibrary.simpleMessage(
      "Foodly está disponible actualmente en los siguientes países:",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "¿Olvidaste la contraseña?",
    ),
    "fromReservation": MessageLookupByLibrary.simpleMessage("Reserva"),
    "fullDay": MessageLookupByLibrary.simpleMessage("Día completo"),
    "fusionCuisine": MessageLookupByLibrary.simpleMessage("Fusión"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galería"),
    "gender": MessageLookupByLibrary.simpleMessage("Género"),
    "generateQR": MessageLookupByLibrary.simpleMessage("Generar código QR"),
    "generateWithAI": MessageLookupByLibrary.simpleMessage("Generar con IA"),
    "generatingQr": MessageLookupByLibrary.simpleMessage("Generando…"),
    "genericErrorRetry": MessageLookupByLibrary.simpleMessage(
      "Algo salió mal. Inténtalo de nuevo.",
    ),
    "goodAfternoon": MessageLookupByLibrary.simpleMessage("Buenas tardes"),
    "goodEvening": MessageLookupByLibrary.simpleMessage("Buenas noches"),
    "goodMorning": MessageLookupByLibrary.simpleMessage("Buenos días"),
    "groupOrderAddFromMenu": MessageLookupByLibrary.simpleMessage(
      "Agrega platos del menú",
    ),
    "groupOrderBackHome": MessageLookupByLibrary.simpleMessage(
      "Volver al inicio",
    ),
    "groupOrderBackToMenu": MessageLookupByLibrary.simpleMessage(
      "Volver al menú",
    ),
    "groupOrderBatchSentBody": m36,
    "groupOrderBatchSentTitle": MessageLookupByLibrary.simpleMessage(
      "¡Pedido enviado a cocina!",
    ),
    "groupOrderCashRequestUndo": MessageLookupByLibrary.simpleMessage(
      "Prefiero pagar en la app",
    ),
    "groupOrderCashRequestedCta": MessageLookupByLibrary.simpleMessage(
      "El negocio ya fue avisado",
    ),
    "groupOrderCashRequestedHint": MessageLookupByLibrary.simpleMessage(
      "Acércate a la caja para pagar. El camarero confirmará el cobro.",
    ),
    "groupOrderChipPreparing": MessageLookupByLibrary.simpleMessage(
      "Preparando tu pedido",
    ),
    "groupOrderChipReady": MessageLookupByLibrary.simpleMessage(
      "¡Tu pedido está listo!",
    ),
    "groupOrderChipSent": MessageLookupByLibrary.simpleMessage(
      "Pedido enviado",
    ),
    "groupOrderChipToPay": m37,
    "groupOrderCoverConfirm": m38,
    "groupOrderCoverShare": MessageLookupByLibrary.simpleMessage(
      "Cubrir su parte",
    ),
    "groupOrderCreating": MessageLookupByLibrary.simpleMessage("Creando…"),
    "groupOrderDeleteConfirm": MessageLookupByLibrary.simpleMessage(
      "¿Eliminar esta orden vacía? Esta acción no se puede deshacer.",
    ),
    "groupOrderDeleteCta": MessageLookupByLibrary.simpleMessage(
      "Eliminar orden",
    ),
    "groupOrderEnterCodeManually": MessageLookupByLibrary.simpleMessage(
      "Ingresar código manualmente",
    ),
    "groupOrderEntryCta": MessageLookupByLibrary.simpleMessage(
      "Ordenar en grupo",
    ),
    "groupOrderGraceNotice": m39,
    "groupOrderHostBadge": MessageLookupByLibrary.simpleMessage("Host"),
    "groupOrderInviteCta": MessageLookupByLibrary.simpleMessage("Invitar"),
    "groupOrderInviteFailed": MessageLookupByLibrary.simpleMessage(
      "No pudimos generar el código de invitación",
    ),
    "groupOrderInviteHint": MessageLookupByLibrary.simpleMessage(
      "Comparte este código — vale por 24 horas",
    ),
    "groupOrderInviteShareCta": MessageLookupByLibrary.simpleMessage(
      "Compartir código",
    ),
    "groupOrderInviteShareMsg": m40,
    "groupOrderInviteTitle": MessageLookupByLibrary.simpleMessage(
      "Invita a tu mesa",
    ),
    "groupOrderItemVoided": MessageLookupByLibrary.simpleMessage(
      "Removido por el negocio · no se cobra",
    ),
    "groupOrderItemsSection": MessageLookupByLibrary.simpleMessage("Ítems"),
    "groupOrderJoinCta": MessageLookupByLibrary.simpleMessage(
      "¿Te invitaron? Únete con un código",
    ),
    "groupOrderJoinFailed": MessageLookupByLibrary.simpleMessage(
      "No pudimos unirte a la orden",
    ),
    "groupOrderJoinHint": MessageLookupByLibrary.simpleMessage(
      "Código de invitación",
    ),
    "groupOrderJoinTitle": MessageLookupByLibrary.simpleMessage(
      "Unirse a una orden",
    ),
    "groupOrderLeaveConfirm": MessageLookupByLibrary.simpleMessage(
      "¿Salir de esta orden? Podrás volver a unirte escaneando el QR.",
    ),
    "groupOrderLeaveCta": MessageLookupByLibrary.simpleMessage(
      "Abandonar la orden",
    ),
    "groupOrderLockConfirmSolo": MessageLookupByLibrary.simpleMessage(
      "¿Finalizar la orden y pasar al pago? Ya no podrás agregar ítems.",
    ),
    "groupOrderLockCta": MessageLookupByLibrary.simpleMessage(
      "Finalizar la orden",
    ),
    "groupOrderNewTab": MessageLookupByLibrary.simpleMessage(
      "Abrir otra cuenta",
    ),
    "groupOrderNextRound": MessageLookupByLibrary.simpleMessage(
      "Pedir otra ronda",
    ),
    "groupOrderNoBalanceDue": MessageLookupByLibrary.simpleMessage(
      "Sin saldo pendiente",
    ),
    "groupOrderNoItems": MessageLookupByLibrary.simpleMessage(
      "Aún no hay ítems",
    ),
    "groupOrderOngoingChannelDesc": MessageLookupByLibrary.simpleMessage(
      "Estado de tu orden grupal en curso",
    ),
    "groupOrderOngoingChannelName": MessageLookupByLibrary.simpleMessage(
      "Orden grupal activa",
    ),
    "groupOrderOrderMore": MessageLookupByLibrary.simpleMessage("Pedir más"),
    "groupOrderPaidBy": m41,
    "groupOrderPaidProgress": m42,
    "groupOrderParticipants": MessageLookupByLibrary.simpleMessage(
      "Participantes",
    ),
    "groupOrderPayAllConfirm": m43,
    "groupOrderPayAllRemaining": m44,
    "groupOrderPayAtRegister": MessageLookupByLibrary.simpleMessage(
      "Pagar en caja",
    ),
    "groupOrderPayAtRegisterConfirm": MessageLookupByLibrary.simpleMessage(
      "¿Avisar que pagáis en caja? No podrás añadir más artículos a este pedido.",
    ),
    "groupOrderPayAtRegisterHint": MessageLookupByLibrary.simpleMessage(
      "Avisas al negocio y pagas en el mostrador. Sin comisión de Foodly.",
    ),
    "groupOrderPayBillCta": m45,
    "groupOrderPayBillHint": MessageLookupByLibrary.simpleMessage(
      "Podés dividirla entre la mesa como quieras",
    ),
    "groupOrderPayBlockedHint": MessageLookupByLibrary.simpleMessage(
      "El pago se habilita cuando te entreguen todo",
    ),
    "groupOrderPayFullOrder": m46,
    "groupOrderPayMyShare": m47,
    "groupOrderPaymentCanceled": MessageLookupByLibrary.simpleMessage(
      "Pago cancelado",
    ),
    "groupOrderPaymentFailed": MessageLookupByLibrary.simpleMessage(
      "No se pudo completar el pago",
    ),
    "groupOrderPaymentSucceeded": MessageLookupByLibrary.simpleMessage(
      "Pago realizado",
    ),
    "groupOrderPaymentSuccessBody": m48,
    "groupOrderPaymentSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "¡Orden confirmada!",
    ),
    "groupOrderRequestBillConfirm": MessageLookupByLibrary.simpleMessage(
      "¿Pedir la cuenta? Ya no vas a poder agregar más ítems a este pedido.",
    ),
    "groupOrderScanHint": MessageLookupByLibrary.simpleMessage(
      "Pídele al anfitrión que muestre el QR de la orden",
    ),
    "groupOrderScanTitle": MessageLookupByLibrary.simpleMessage(
      "Escanea el QR de tu mesa",
    ),
    "groupOrderSeeStatus": MessageLookupByLibrary.simpleMessage(
      "Ver el estado del pedido",
    ),
    "groupOrderSendCta": MessageLookupByLibrary.simpleMessage("Enviar orden"),
    "groupOrderSendHint": MessageLookupByLibrary.simpleMessage(
      "La cocina la recibe al instante · pagás al final",
    ),
    "groupOrderServiceFeeExplain": m49,
    "groupOrderServiceFeeNotice": m50,
    "groupOrderServiceFeeTitle": MessageLookupByLibrary.simpleMessage(
      "Tarifa de procesamiento",
    ),
    "groupOrderShareItemTooltip": MessageLookupByLibrary.simpleMessage(
      "Compartir con la mesa",
    ),
    "groupOrderSharedBadge": MessageLookupByLibrary.simpleMessage("Compartido"),
    "groupOrderSharedBadgeTooltip": MessageLookupByLibrary.simpleMessage(
      "Este ítem se divide entre todos los comensales de la mesa",
    ),
    "groupOrderSplitByItems": MessageLookupByLibrary.simpleMessage("Por ítems"),
    "groupOrderSplitByItemsDesc": MessageLookupByLibrary.simpleMessage(
      "Cada quien paga lo suyo; lo compartido se reparte.",
    ),
    "groupOrderSplitEqual": MessageLookupByLibrary.simpleMessage(
      "En partes iguales",
    ),
    "groupOrderSplitEqualDesc": MessageLookupByLibrary.simpleMessage(
      "El total se divide entre todos por igual.",
    ),
    "groupOrderSplitModeTitle": MessageLookupByLibrary.simpleMessage(
      "¿Cómo dividimos la cuenta?",
    ),
    "groupOrderTabClosedBody": m51,
    "groupOrderTabClosedTitle": MessageLookupByLibrary.simpleMessage(
      "¡Orden finalizada!",
    ),
    "groupOrderTipBaseSummary": m52,
    "groupOrderTipCustom": MessageLookupByLibrary.simpleMessage("Otro monto"),
    "groupOrderTipNone": MessageLookupByLibrary.simpleMessage("Sin propina"),
    "groupOrderTipTitle": MessageLookupByLibrary.simpleMessage(
      "¿Quieres dejar propina?",
    ),
    "groupOrderTitle": MessageLookupByLibrary.simpleMessage("Orden grupal"),
    "groupOrderTotal": MessageLookupByLibrary.simpleMessage(
      "Total de la orden",
    ),
    "groupOrderTrackConfirmed": MessageLookupByLibrary.simpleMessage(
      "El negocio recibió tu pedido",
    ),
    "groupOrderTrackDelivered": MessageLookupByLibrary.simpleMessage(
      "Pedido entregado — ¡buen provecho!",
    ),
    "groupOrderTrackPreparing": MessageLookupByLibrary.simpleMessage(
      "Están preparando tu pedido",
    ),
    "groupOrderTrackReady": MessageLookupByLibrary.simpleMessage(
      "¡Tu pedido está listo!",
    ),
    "groupOrderTrackToPay": MessageLookupByLibrary.simpleMessage(
      "Todo servido — falta pagar la cuenta",
    ),
    "groupOrderTransferHost": MessageLookupByLibrary.simpleMessage(
      "Transferir titularidad",
    ),
    "groupOrderTransferHostConfirm": m53,
    "groupOrderUnlockConfirm": MessageLookupByLibrary.simpleMessage(
      "¿Reabrir la orden? Los precios se descongelan y se podrán editar los ítems.",
    ),
    "groupOrderUnlockCta": MessageLookupByLibrary.simpleMessage(
      "Reabrir la orden",
    ),
    "groupOrderViewOrder": MessageLookupByLibrary.simpleMessage("Ver la orden"),
    "groupOrderYourShare": MessageLookupByLibrary.simpleMessage("Tu parte"),
    "guestCount": MessageLookupByLibrary.simpleMessage("Cantidad de invitados"),
    "guestGateCommunity": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para ver la comunidad.",
    ),
    "guestGateFaved": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para ver tus negocios favoritos.",
    ),
    "guestGateFavorite": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para guardar favoritos.",
    ),
    "guestGateGeneric": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para usar esta función.",
    ),
    "guestGateGroupOrder": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para crear una orden grupal.",
    ),
    "guestGateNotifications": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para ver tus notificaciones.",
    ),
    "guestGatePost": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para publicar en la comunidad.",
    ),
    "guestGateProfile": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para acceder a tu perfil.",
    ),
    "guestGateReserve": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para reservar.",
    ),
    "guestGateReview": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para dejar una reseña.",
    ),
    "guestGateSaved": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión o regístrate para ver tus promociones guardadas.",
    ),
    "guestGateTitle": MessageLookupByLibrary.simpleMessage("Crea tu cuenta"),
    "guestUserName": MessageLookupByLibrary.simpleMessage("Invitado"),
    "guests": MessageLookupByLibrary.simpleMessage("comensales"),
    "happyBirthday": MessageLookupByLibrary.simpleMessage("Feliz Cumpleaños"),
    "happyHours": MessageLookupByLibrary.simpleMessage("Happy Hours"),
    "hasInsurance": MessageLookupByLibrary.simpleMessage("Tiene seguro"),
    "hi": MessageLookupByLibrary.simpleMessage("Hola"),
    "home": MessageLookupByLibrary.simpleMessage("Inicio"),
    "imageSizeLessThan10mb": MessageLookupByLibrary.simpleMessage(
      "El tamaño de la imagen debe ser inferior a 10MB",
    ),
    "includeItemHint": MessageLookupByLibrary.simpleMessage(
      "Ej: Entrada, plato principal, postre",
    ),
    "includes": MessageLookupByLibrary.simpleMessage("Incluye"),
    "incompletePromotionCreateInfo": MessageLookupByLibrary.simpleMessage(
      "Información incompleta para crear la promoción",
    ),
    "incompletePromotionUpdateInfo": MessageLookupByLibrary.simpleMessage(
      "Información incompleta para actualizar la promoción",
    ),
    "informationNotYetProvidedByTheBusiness":
        MessageLookupByLibrary.simpleMessage(
          "Información aún no proporcionada por el comercio.",
        ),
    "insuranceHint": MessageLookupByLibrary.simpleMessage(
      "Cobertura de responsabilidad civil",
    ),
    "interactToReserve": MessageLookupByLibrary.simpleMessage(
      "Interacción → Reserva",
    ),
    "internalErrorEmptyPrompt": MessageLookupByLibrary.simpleMessage(
      "Error interno procesando solicitud. El texto del mensaje está vacío",
    ),
    "internationalCuisine": MessageLookupByLibrary.simpleMessage(
      "Internacional",
    ),
    "introMessage": MessageLookupByLibrary.simpleMessage(
      "Breve presentación para nuevos visitantes.",
    ),
    "introMessageTooltip": MessageLookupByLibrary.simpleMessage(
      "Puedes usar este espacio para dar la bienvenida a los clientes y destacar lo que hace especial a tu negocio.\nLos promocionaremos en la pagina principal durante unos 30 días.",
    ),
    "invalidMenuCategory": MessageLookupByLibrary.simpleMessage(
      "Categoría de menú no válida",
    ),
    "invalidPromoDates": MessageLookupByLibrary.simpleMessage(
      "Fecha de inicio posterior a fecha de expiración",
    ),
    "invalidValue": MessageLookupByLibrary.simpleMessage("Valor inválido"),
    "invalidYoutubeUrl": MessageLookupByLibrary.simpleMessage(
      "URL de YouTube inválida",
    ),
    "iosComingSoonMessage": MessageLookupByLibrary.simpleMessage(
      "¡Muy pronto en iPhone! Foodly llega a la App Store durante junio de 2026.",
    ),
    "italian": MessageLookupByLibrary.simpleMessage("Italiana"),
    "itemAvailable": MessageLookupByLibrary.simpleMessage(
      "Artículo disponible",
    ),
    "itemCreatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Artículo creado correctamente",
    ),
    "itemDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Artículo eliminado correctamente",
    ),
    "itemUnavailable": MessageLookupByLibrary.simpleMessage(
      "Artículo temporalmente no disponible",
    ),
    "itemUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Artículo actualizado correctamente",
    ),
    "items": MessageLookupByLibrary.simpleMessage("Items"),
    "january": MessageLookupByLibrary.simpleMessage("Enero"),
    "july": MessageLookupByLibrary.simpleMessage("Julio"),
    "june": MessageLookupByLibrary.simpleMessage("Junio"),
    "kidChairs": MessageLookupByLibrary.simpleMessage("Sillas para Niños"),
    "kidsMenu": MessageLookupByLibrary.simpleMessage("Menú infantil"),
    "kidsPlayArea": MessageLookupByLibrary.simpleMessage(
      "Área de Juegos Infantiles",
    ),
    "koreanCuisine": MessageLookupByLibrary.simpleMessage("Koreana"),
    "languageExample": MessageLookupByLibrary.simpleMessage("Ej: Español"),
    "languages": MessageLookupByLibrary.simpleMessage("Idiomas"),
    "lastName": MessageLookupByLibrary.simpleMessage("Apellido"),
    "legendAutoReservation": MessageLookupByLibrary.simpleMessage("Reserva"),
    "legendFullDayBlock": MessageLookupByLibrary.simpleMessage("Día completo"),
    "legendPartialBlock": MessageLookupByLibrary.simpleMessage("Parcial"),
    "likes": MessageLookupByLibrary.simpleMessage("Me gusta"),
    "listening": MessageLookupByLibrary.simpleMessage("Escuchando"),
    "liveMusic": MessageLookupByLibrary.simpleMessage("Música en Vivo"),
    "loadLogo": MessageLookupByLibrary.simpleMessage("Cargar Logo"),
    "loadingAvailability": MessageLookupByLibrary.simpleMessage(
      "Cargando disponibilidad…",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Permiso de ubicación denegado. Necesitamos tu ubicación para mostrar restaurantes cercanos.",
    ),
    "locationPermissionPermanentlyDenied": MessageLookupByLibrary.simpleMessage(
      "Ubicación permanentemente denegada. Actívala en los ajustes de la app.",
    ),
    "locationPermissionWebInstructions": MessageLookupByLibrary.simpleMessage(
      "Activa la ubicación desde el ícono del candado en la barra del navegador.",
    ),
    "locationRationaleBody": MessageLookupByLibrary.simpleMessage(
      "Foodly usa tu ubicación para encontrar restaurantes cerca de ti. Tu ubicación nunca se comparte con otros usuarios.",
    ),
    "locationRationaleTitle": MessageLookupByLibrary.simpleMessage(
      "Se necesita acceso a la ubicación",
    ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "Los servicios de ubicación están deshabilitados. Actívalos en ajustes.",
    ),
    "locationSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
      "Ubicación actualizada con éxito.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
    "loginError": MessageLookupByLibrary.simpleMessage(
      "Error durante el inicio de sesión",
    ),
    "loginTo": MessageLookupByLibrary.simpleMessage("Iniciar sesión en"),
    "logout": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
    "logoutDialogTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Terminar sesión requerirá que ingreses nuevamente con tu correo electrónico y contraseña o cualquier red social asociada a tu cuenta.",
    ),
    "logoutDialogTextSpan2": MessageLookupByLibrary.simpleMessage(
      "Si optas por",
    ),
    "logoutDialogTextSpan3": MessageLookupByLibrary.simpleMessage(
      "Guardar y Cerrar",
    ),
    "logoutDialogTextSpan4": MessageLookupByLibrary.simpleMessage(
      "vas a culminar actividad, conservando la opción de acceder manera rápida y segura mediante autenticación biométrica o de patrón.",
    ),
    "logoutDialogTitle": MessageLookupByLibrary.simpleMessage(
      "¿Deseas cerrar sesión?",
    ),
    "longPressToDrag": MessageLookupByLibrary.simpleMessage(
      "Mantén presionado y arrastra para reordenar",
    ),
    "lunch": MessageLookupByLibrary.simpleMessage("Almuerzo"),
    "mainPromos": MessageLookupByLibrary.simpleMessage(
      "Promociones Destacadas",
    ),
    "male": MessageLookupByLibrary.simpleMessage("Masculino"),
    "manage": MessageLookupByLibrary.simpleMessage("Gestionar"),
    "manageReservations": MessageLookupByLibrary.simpleMessage(
      "Gestionar Reservas",
    ),
    "managerActivatePaymentsBody": MessageLookupByLibrary.simpleMessage(
      "Verificá tu negocio con Stripe para recibir los pagos de las órdenes directo en tu cuenta bancaria. Toma ~5 minutos.",
    ),
    "managerActivatePaymentsTitle": MessageLookupByLibrary.simpleMessage(
      "Activá los pagos de tu negocio",
    ),
    "managerActivateWithStripe": MessageLookupByLibrary.simpleMessage(
      "Activar con Stripe →",
    ),
    "managerAssignTable": MessageLookupByLibrary.simpleMessage("Asignar mesa"),
    "managerAwaitingCashBadge": MessageLookupByLibrary.simpleMessage(
      "PAGA EN CAJA",
    ),
    "managerAwaitingCashNotice": MessageLookupByLibrary.simpleMessage(
      "La mesa avisó que paga en el mostrador. Confirma el cobro cuando recibas el dinero.",
    ),
    "managerBadgeConfirmed": MessageLookupByLibrary.simpleMessage("CONFIRMADA"),
    "managerBadgeDelivered": MessageLookupByLibrary.simpleMessage("ENTREGADA"),
    "managerBadgePreparing": MessageLookupByLibrary.simpleMessage("PREPARANDO"),
    "managerBadgeReady": MessageLookupByLibrary.simpleMessage("LISTA"),
    "managerBatchLabel": m54,
    "managerBucketAll": MessageLookupByLibrary.simpleMessage("Todas"),
    "managerBucketDelivered": MessageLookupByLibrary.simpleMessage(
      "Entregadas",
    ),
    "managerBucketPending": MessageLookupByLibrary.simpleMessage("Activas"),
    "managerBucketPreparing": MessageLookupByLibrary.simpleMessage(
      "Preparando",
    ),
    "managerBucketReady": MessageLookupByLibrary.simpleMessage("Listas"),
    "managerChecklistHint": MessageLookupByLibrary.simpleMessage(
      "Tocá cada ítem para marcarlo como entregado",
    ),
    "managerCloseTab": MessageLookupByLibrary.simpleMessage("Cerrar cuenta"),
    "managerCloseTabBody": m55,
    "managerCloseTabPaidOffline": MessageLookupByLibrary.simpleMessage(
      "Cobrada en caja",
    ),
    "managerCloseTabTitle": MessageLookupByLibrary.simpleMessage(
      "Cerrar esta cuenta",
    ),
    "managerCloseTabUnpaid": MessageLookupByLibrary.simpleMessage(
      "Se fueron sin pagar",
    ),
    "managerClosedAbandoned": MessageLookupByLibrary.simpleMessage(
      "Sin cerrar",
    ),
    "managerClosedPaidOffline": MessageLookupByLibrary.simpleMessage(
      "Cobrada en caja",
    ),
    "managerClosedUnpaid": MessageLookupByLibrary.simpleMessage("Impagada"),
    "managerDeliverAll": MessageLookupByLibrary.simpleMessage("Tildar todo"),
    "managerDeliverAllAndClose": MessageLookupByLibrary.simpleMessage(
      "Entregar todo de una",
    ),
    "managerGenericError": MessageLookupByLibrary.simpleMessage(
      "No pudimos completar la acción. Probá de nuevo.",
    ),
    "managerGuestsMeta": m56,
    "managerHistoryDaySummary": m57,
    "managerHistoryEmpty": MessageLookupByLibrary.simpleMessage(
      "Sin órdenes pasadas todavía",
    ),
    "managerHistoryTitle": MessageLookupByLibrary.simpleMessage("Historial"),
    "managerHistoryYesterday": MessageLookupByLibrary.simpleMessage("Ayer"),
    "managerItemsDelivered": m58,
    "managerLiveOrders": MessageLookupByLibrary.simpleMessage(
      "Órdenes en vivo",
    ),
    "managerMarkDelivered": MessageLookupByLibrary.simpleMessage(
      "Marcar como ENTREGADA",
    ),
    "managerMarkPreparing": MessageLookupByLibrary.simpleMessage(
      "Marcar como PREPARANDO",
    ),
    "managerMarkReady": MessageLookupByLibrary.simpleMessage(
      "Marcar como LISTA",
    ),
    "managerMoreItemsTitle": MessageLookupByLibrary.simpleMessage(
      "La mesa pidió más",
    ),
    "managerNewOrderGo": MessageLookupByLibrary.simpleMessage("Ir a atenderla"),
    "managerNewOrderLater": MessageLookupByLibrary.simpleMessage("Ahora no"),
    "managerNewOrderTitle": MessageLookupByLibrary.simpleMessage(
      "¡Nueva orden!",
    ),
    "managerNoOrders": MessageLookupByLibrary.simpleMessage(
      "Sin órdenes por ahora",
    ),
    "managerOrders": MessageLookupByLibrary.simpleMessage("Órdenes"),
    "managerPaidComplete": MessageLookupByLibrary.simpleMessage(
      "Pagada completa",
    ),
    "managerPaidOrderTitle": MessageLookupByLibrary.simpleMessage(
      "¡Nueva orden pagada!",
    ),
    "managerPaymentsActive": MessageLookupByLibrary.simpleMessage(
      "Pagos activos",
    ),
    "managerPaymentsActiveSub": MessageLookupByLibrary.simpleMessage(
      "Verificado con Stripe · payouts habilitados",
    ),
    "managerPaymentsRefresh": MessageLookupByLibrary.simpleMessage(
      "Actualizar estado",
    ),
    "managerRound": m59,
    "managerTabClosedTitle": MessageLookupByLibrary.simpleMessage(
      "Cuenta cerrada",
    ),
    "managerTableHint": MessageLookupByLibrary.simpleMessage(
      "Ej: 7, Barra 2, Terraza",
    ),
    "managerUnpaidBadge": MessageLookupByLibrary.simpleMessage("POR PAGAR"),
    "managerViewOrderGo": MessageLookupByLibrary.simpleMessage(
      "Ver el detalle",
    ),
    "managerVoidItemConfirm": m60,
    "managerVoidItemCta": MessageLookupByLibrary.simpleMessage("No cobrar"),
    "managerVoidedItemTag": MessageLookupByLibrary.simpleMessage(
      "REMOVIDO · no se cobra",
    ),
    "march": MessageLookupByLibrary.simpleMessage("Marzo"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Marcar todo como leído",
    ),
    "markedNoShow": MessageLookupByLibrary.simpleMessage(
      "Marcado como no asistió.",
    ),
    "marketsAndStores": MessageLookupByLibrary.simpleMessage(
      "Mercados y Tiendas",
    ),
    "maxGuests": MessageLookupByLibrary.simpleMessage("Máx. invitados"),
    "maxPartySize": m61,
    "maxSize": m62,
    "maxSizeLabel": MessageLookupByLibrary.simpleMessage("Máx."),
    "maximum": MessageLookupByLibrary.simpleMessage("Máximo"),
    "may": MessageLookupByLibrary.simpleMessage("Mayo"),
    "medium": MessageLookupByLibrary.simpleMessage("Mediano"),
    "menu": MessageLookupByLibrary.simpleMessage("Menú"),
    "menus": MessageLookupByLibrary.simpleMessage("Menús"),
    "message": MessageLookupByLibrary.simpleMessage("Mensaje"),
    "messageThread": MessageLookupByLibrary.simpleMessage("Hilo de mensajes"),
    "mexicanCuisine": MessageLookupByLibrary.simpleMessage("Mexicana"),
    "micPermissionDeniedMessage": MessageLookupByLibrary.simpleMessage(
      "La búsqueda por voz usa el micrófono para encontrar lugares cercanos. Activa el acceso en Ajustes para explorar con tu voz.",
    ),
    "minBookingAmount": MessageLookupByLibrary.simpleMessage("Monto mínimo"),
    "minGuests": MessageLookupByLibrary.simpleMessage("Mín. invitados"),
    "minimum": MessageLookupByLibrary.simpleMessage("Mínimo"),
    "mockTextNewReleasesCard": MessageLookupByLibrary.simpleMessage(
      "La red Ramalha a través de la ciudad de Covilhã sigue creciendo. Después de ampliar el año pasado a la ciudad de Fundão, esta vez la panadería/pastelería abrió su segundo espacio en Covilhã Shopping, en espacio interior en su zona frontal, en planta 0 y con una amplia explanada.",
    ),
    "moderate": MessageLookupByLibrary.simpleMessage("Moderada"),
    "more": MessageLookupByLibrary.simpleMessage("más"),
    "moreInfo": MessageLookupByLibrary.simpleMessage("+ info"),
    "moveDown": MessageLookupByLibrary.simpleMessage("Bajar"),
    "moveUp": MessageLookupByLibrary.simpleMessage("Subir"),
    "multilanguage": MessageLookupByLibrary.simpleMessage("Multilingüe"),
    "mustContainAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
      "Debe contener al menos 3 caracteres",
    ),
    "mustContainAtLeastTwoCharacters": MessageLookupByLibrary.simpleMessage(
      "Debe contener al menos 2 caracteres",
    ),
    "myFavorites": MessageLookupByLibrary.simpleMessage("Mis Favoritos"),
    "myHistory": MessageLookupByLibrary.simpleMessage("Mi Historial"),
    "myReservations": MessageLookupByLibrary.simpleMessage("Mis Reservaciones"),
    "nNewMessages": m63,
    "needBestRecommendations": MessageLookupByLibrary.simpleMessage(
      "¿Necesitas las mejores recomendaciones?",
    ),
    "newBranch": MessageLookupByLibrary.simpleMessage("Nuevos en Foodly"),
    "newPassword": MessageLookupByLibrary.simpleMessage("Nueva Contraseña"),
    "newReleasesEmptyErrorSubtitle": MessageLookupByLibrary.simpleMessage(
      "No pudimos cargar los nuevos negocios. Probá de nuevo.",
    ),
    "newReleasesEmptyErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Conexión interrumpida",
    ),
    "newReleasesEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Los próximos descubrimientos de tu zona aparecerán aquí.",
    ),
    "newReleasesEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Nuevos sabores en camino",
    ),
    "news": MessageLookupByLibrary.simpleMessage("Novedades"),
    "nextMonth": MessageLookupByLibrary.simpleMessage("Mes siguiente"),
    "nickName": MessageLookupByLibrary.simpleMessage("Nombre de usuario"),
    "noAccessSection": MessageLookupByLibrary.simpleMessage(
      "No tenés acceso a esa sección",
    ),
    "noAudioDetected": MessageLookupByLibrary.simpleMessage(
      "No se detectó audio. Por favor, intenta de nuevo.",
    ),
    "noConnection": MessageLookupByLibrary.simpleMessage(
      "Sin conexión a internet. Revisa tu red e inténtalo de nuevo.",
    ),
    "noFavoriteBusinesses": MessageLookupByLibrary.simpleMessage(
      "Aún no tienes negocios en tu lista de favoritos",
    ),
    "noFavoriteItems": MessageLookupByLibrary.simpleMessage(
      "Aún no tienes items en tu lista de favoritos",
    ),
    "noFavoriteMenus": MessageLookupByLibrary.simpleMessage(
      "Aún no tienes menús en tu lista de favoritos",
    ),
    "noItemsYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay items añadidos",
    ),
    "noMessagesYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay mensajes",
    ),
    "noNearbyBusinessesInCategory": m64,
    "noNewBranches": MessageLookupByLibrary.simpleMessage(
      "Aún no hay negocios nuevos en tu zona",
    ),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay notificaciones",
    ),
    "noPackagesYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay paquetes",
    ),
    "noPromotionsInSection": MessageLookupByLibrary.simpleMessage(
      "No hay promociones en esta sección",
    ),
    "noPromotionsNearby": MessageLookupByLibrary.simpleMessage(
      "No hay promociones cerca",
    ),
    "noRecommendationsFound": MessageLookupByLibrary.simpleMessage(
      "No encontramos recomendaciones para tu búsqueda. \nIntenta con otros términos o prueba en una ubicación diferente.",
    ),
    "noReservationsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron reservas.",
    ),
    "noReservationsYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay reservas.",
    ),
    "noSavedAddress": MessageLookupByLibrary.simpleMessage(
      "No tienes dirección guardada, puedes crear una en tu página de perfil.",
    ),
    "noSavedPromotions": MessageLookupByLibrary.simpleMessage(
      "Aún no tienes promociones guardadas",
    ),
    "noSavedPromotionsInSection": MessageLookupByLibrary.simpleMessage(
      "Aún no tienes promociones guardadas en esta sección",
    ),
    "noShow": MessageLookupByLibrary.simpleMessage("No asistió"),
    "nonEspecified": MessageLookupByLibrary.simpleMessage("No especificado"),
    "notFoundPageText": MessageLookupByLibrary.simpleMessage(
      "La ruta solicitada no existe, o no tienes permiso para acceder a ella.",
    ),
    "notInYourCountry": MessageLookupByLibrary.simpleMessage(
      "¿Aún no está en tu país?",
    ),
    "note": MessageLookupByLibrary.simpleMessage("Nota"),
    "notesLabel": m65,
    "notification": MessageLookupByLibrary.simpleMessage("Notificación"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notificaciones"),
    "november": MessageLookupByLibrary.simpleMessage("Noviembre"),
    "october": MessageLookupByLibrary.simpleMessage("Octubre"),
    "okGo": MessageLookupByLibrary.simpleMessage("Ok, Vamos!"),
    "onQuote": MessageLookupByLibrary.simpleMessage("Bajo cotización"),
    "onSite": MessageLookupByLibrary.simpleMessage("En el local"),
    "oneNewMessage": MessageLookupByLibrary.simpleMessage("1 nuevo mensaje"),
    "onlyContainLetters": MessageLookupByLibrary.simpleMessage(
      "Solo puede contener letras y un espacio entre palabras",
    ),
    "onlyYouPrivacyNotice": MessageLookupByLibrary.simpleMessage(
      "Visible solo para ti.",
    ),
    "open": MessageLookupByLibrary.simpleMessage("Abierto"),
    "openMenuAnyDevice": MessageLookupByLibrary.simpleMessage(
      "\npara abrir el menú en cualquier dispositivo",
    ),
    "openSettings": MessageLookupByLibrary.simpleMessage("Abrir Ajustes"),
    "openSoon": MessageLookupByLibrary.simpleMessage("Abre pronto"),
    "optional": MessageLookupByLibrary.simpleMessage("Opcional"),
    "orderingDistance": MessageLookupByLibrary.simpleMessage("Cercanía"),
    "orderingLabel": MessageLookupByLibrary.simpleMessage("Ordenar"),
    "orderingPriceAsc": MessageLookupByLibrary.simpleMessage("Precio"),
    "orderingRatingDesc": MessageLookupByLibrary.simpleMessage("Rating"),
    "other": MessageLookupByLibrary.simpleMessage("Otro"),
    "outdoorSeating": MessageLookupByLibrary.simpleMessage(
      "Asientos al aire libre",
    ),
    "outsideCoverage": MessageLookupByLibrary.simpleMessage(
      "Tu ubicación está fuera de la cobertura actual de Foodly",
    ),
    "owner": MessageLookupByLibrary.simpleMessage("Propietario"),
    "packageDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Describe qué incluye este paquete",
    ),
    "packageTitleHint": MessageLookupByLibrary.simpleMessage(
      "Ej: Cena gourmet para 20 personas",
    ),
    "packages": MessageLookupByLibrary.simpleMessage("Paquetes"),
    "parking": MessageLookupByLibrary.simpleMessage("Estacionamiento"),
    "partySize": MessageLookupByLibrary.simpleMessage("Comensales:"),
    "partySizeCount": m66,
    "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
    "passwordIncorrect": MessageLookupByLibrary.simpleMessage(
      "La contraseña no es correcta. Inténtalo de nuevo.",
    ),
    "passwordInstructions": MessageLookupByLibrary.simpleMessage(
      "La contraseña debe tener al menos 8 caracteres, un número, una letra minúscula y una mayúscula",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Ingresa tu contraseña para continuar.",
    ),
    "passwordSent": MessageLookupByLibrary.simpleMessage(
      "Contraseña temporal enviada",
    ),
    "paymentModeOpenTabBody": MessageLookupByLibrary.simpleMessage(
      "La mesa pide en tandas y paga UNA vez al final. Ideal para restaurantes con servicio de mesa.",
    ),
    "paymentModeOpenTabFlow": MessageLookupByLibrary.simpleMessage(
      "pedir → comer → pagar",
    ),
    "paymentModeOpenTabTitle": MessageLookupByLibrary.simpleMessage(
      "Cuenta abierta",
    ),
    "paymentModePerRoundBody": MessageLookupByLibrary.simpleMessage(
      "Cada pedido se paga antes de prepararse. Ideal para bares, food trucks y mostrador.",
    ),
    "paymentModePerRoundFlow": MessageLookupByLibrary.simpleMessage(
      "pedir → pagar → entregar",
    ),
    "paymentModePerRoundTitle": MessageLookupByLibrary.simpleMessage(
      "Prepago por ronda",
    ),
    "paymentModeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Podés cambiarlo cuando quieras desde tu panel",
    ),
    "paymentModeTitle": MessageLookupByLibrary.simpleMessage(
      "¿Cómo cobra tu negocio?",
    ),
    "paymentModeUpdated": MessageLookupByLibrary.simpleMessage(
      "Modo de cobro actualizado",
    ),
    "paymentOffPlatform": MessageLookupByLibrary.simpleMessage(
      "Pago fuera de la plataforma",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pendiente"),
    "pendingReservationsAlertMany": m67,
    "pendingReservationsAlertOne": MessageLookupByLibrary.simpleMessage(
      "Tienes 1 reservación pendiente",
    ),
    "pendingReservationsContent": MessageLookupByLibrary.simpleMessage(
      "Hay solicitudes de reserva esperando tu respuesta.",
    ),
    "perHour": MessageLookupByLibrary.simpleMessage("Por hora"),
    "perPerson": MessageLookupByLibrary.simpleMessage("Por persona"),
    "peruvian": MessageLookupByLibrary.simpleMessage("Peruana"),
    "petFriendly": MessageLookupByLibrary.simpleMessage("Acepta Mascotas"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Número de teléfono"),
    "phoneSectionTitle1": MessageLookupByLibrary.simpleMessage("Tu"),
    "phoneSectionTitle2": MessageLookupByLibrary.simpleMessage("Teléfono"),
    "photoLimitReached": m68,
    "photoUploadFailed": MessageLookupByLibrary.simpleMessage(
      "No se pudieron subir todas las fotos. Edita el paquete para reintentar.",
    ),
    "photosDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Fotos del artículo eliminadas correctamente",
    ),
    "photosOptionalMax": m69,
    "photosSaveError": m70,
    "pizzerias": MessageLookupByLibrary.simpleMessage("Pizzerías"),
    "platformError": MessageLookupByLibrary.simpleMessage(
      "Error de plataforma",
    ),
    "pleaseAddYourBusinessAddress": MessageLookupByLibrary.simpleMessage(
      "Por favor agrega la dirección de tu negocio",
    ),
    "pleaseAddYourBusinessCountry": MessageLookupByLibrary.simpleMessage(
      "Por favor indica el país de tu negocio",
    ),
    "pleaseAddYourBusinessName": MessageLookupByLibrary.simpleMessage(
      "Por favor agrega el nombre de tu negocio",
    ),
    "pleaseEnterEmail": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduce tu dirección de correo electrónico",
    ),
    "pleaseEnterNickName": MessageLookupByLibrary.simpleMessage(
      "Por favor ingrese un nombre de usuario",
    ),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduce tu contraseña",
    ),
    "pleaseEnterPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduce tu número de teléfono",
    ),
    "pleaseEnterPostalCode": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduce tu código postal",
    ),
    "pleaseEnterYourLastName": MessageLookupByLibrary.simpleMessage(
      "Por favor ingrese su apellido",
    ),
    "pleaseEnterYourName": MessageLookupByLibrary.simpleMessage(
      "Por favor ingrese su nombre",
    ),
    "pleaseSelectAnOption": MessageLookupByLibrary.simpleMessage(
      "Por favor selecciona una opción",
    ),
    "pleaseSelectBusinessCategory": MessageLookupByLibrary.simpleMessage(
      "Por favor selecciona la categoria de tu negocio",
    ),
    "portfolio": MessageLookupByLibrary.simpleMessage("Portafolio"),
    "portfolioVideoUrl": MessageLookupByLibrary.simpleMessage(
      "URL de video/portfolio",
    ),
    "portugueseCuisine": MessageLookupByLibrary.simpleMessage("Portuguesa"),
    "post": MessageLookupByLibrary.simpleMessage("Publicar"),
    "posts": MessageLookupByLibrary.simpleMessage("Publicaciones"),
    "postsFeedBeFirst": MessageLookupByLibrary.simpleMessage(
      "¡Sé el primero en compartir algo!",
    ),
    "postsFeedNoPosts": MessageLookupByLibrary.simpleMessage(
      "Aún no hay publicaciones",
    ),
    "poweredBy": MessageLookupByLibrary.simpleMessage("Con tecnología de"),
    "preferNotToSay": MessageLookupByLibrary.simpleMessage(
      "Prefiero no decirlo",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferencias"),
    "pressToAddPhotosUpToMaxImages": m71,
    "previousMonth": MessageLookupByLibrary.simpleMessage("Mes anterior"),
    "price": MessageLookupByLibrary.simpleMessage("Precio"),
    "priceFromBadge": m72,
    "priceType": MessageLookupByLibrary.simpleMessage("Tipo de precio"),
    "priceValidation": MessageLookupByLibrary.simpleMessage(
      "El precio no puede estar vacío y debe ser mayor a 0.09",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de Privacidad",
    ),
    "professionalProfile": MessageLookupByLibrary.simpleMessage(
      "Perfil profesional",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Perfil"),
    "profileBirthdayText1": MessageLookupByLibrary.simpleMessage("Fecha de"),
    "profileBirthdayText2": MessageLookupByLibrary.simpleMessage("Cumpleaños"),
    "profileUserLocation1": MessageLookupByLibrary.simpleMessage("Ubicación"),
    "profileUserLocation2": MessageLookupByLibrary.simpleMessage("del Usuario"),
    "promoTabActive": MessageLookupByLibrary.simpleMessage("Activas"),
    "promoTabExpired": MessageLookupByLibrary.simpleMessage("Expiradas"),
    "promoTabUpcoming": MessageLookupByLibrary.simpleMessage("Próximas"),
    "promosEmptyErrorSubtitle": MessageLookupByLibrary.simpleMessage(
      "No pudimos cargar las promos. Probá de nuevo.",
    ),
    "promosEmptyErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Conexión interrumpida",
    ),
    "promosEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Estamos preparando las mejores promos para ti.",
    ),
    "promosEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Pronto, sabores cerca tuyo",
    ),
    "promotionDays": MessageLookupByLibrary.simpleMessage("Días de promoción"),
    "promotions": MessageLookupByLibrary.simpleMessage("Promos"),
    "qrSavedToGallery": MessageLookupByLibrary.simpleMessage(
      "Guardado en tus fotos",
    ),
    "quoteApproved": MessageLookupByLibrary.simpleMessage(
      "Cotización aprobada",
    ),
    "quoteNotes": MessageLookupByLibrary.simpleMessage(
      "Notas de la cotización (opcional)",
    ),
    "quoteReceived": MessageLookupByLibrary.simpleMessage(
      "Cotización recibida",
    ),
    "quoteRejected": MessageLookupByLibrary.simpleMessage(
      "Cotización rechazada",
    ),
    "quoteSent": MessageLookupByLibrary.simpleMessage("Cotización enviada"),
    "quoted": MessageLookupByLibrary.simpleMessage("Cotizado"),
    "quotedAmount": MessageLookupByLibrary.simpleMessage("Monto cotizado"),
    "quotedStatus": MessageLookupByLibrary.simpleMessage("Cotización enviada"),
    "radiusDistanceLabel": MessageLookupByLibrary.simpleMessage(
      "Radio de distancia:",
    ),
    "radiusKm": MessageLookupByLibrary.simpleMessage("Radio (km)"),
    "rateYourExperience": MessageLookupByLibrary.simpleMessage(
      "Califica tu experiencia:",
    ),
    "ratingAvg": MessageLookupByLibrary.simpleMessage("Calificación Prom:"),
    "readyToListen": MessageLookupByLibrary.simpleMessage(
      "Listo para escuchar",
    ),
    "reasonHint": MessageLookupByLibrary.simpleMessage(
      "Ej: Vacaciones, mantenimiento",
    ),
    "reasonOptional": MessageLookupByLibrary.simpleMessage("Motivo (opcional)"),
    "recentPosts": MessageLookupByLibrary.simpleMessage(
      "Publicaciones recientes",
    ),
    "recommend": MessageLookupByLibrary.simpleMessage("Recomendar"),
    "reconnecting": MessageLookupByLibrary.simpleMessage("Reconectando…"),
    "recoverPassword": MessageLookupByLibrary.simpleMessage(
      "Recuperar contraseña",
    ),
    "recoverPasswordErrorMsg": MessageLookupByLibrary.simpleMessage(
      "Ups, algo salió mal. Intenta nuevamente, si el error persiste verifica si el correo es correcto o intenta más tarde.",
    ),
    "recoverPasswordTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Enviamos una",
    ),
    "recoverPasswordTextSpan2": MessageLookupByLibrary.simpleMessage(
      "contraseña temporal",
    ),
    "recoverPasswordTextSpan3": MessageLookupByLibrary.simpleMessage(
      "a tu correo, válida por 30 minutos. Inicia sesión con ella y actualízala en tu perfil",
    ),
    "regular": MessageLookupByLibrary.simpleMessage("Regular"),
    "reject": MessageLookupByLibrary.simpleMessage("Rechazar"),
    "rejectQuote": MessageLookupByLibrary.simpleMessage("Rechazar"),
    "rejectReservation": MessageLookupByLibrary.simpleMessage(
      "Rechazar Reserva",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rechazada"),
    "rejectionReasonHint": MessageLookupByLibrary.simpleMessage(
      "Ayuda al negocio a entender por qué no avanzó la reserva",
    ),
    "rejectionReasonOptional": MessageLookupByLibrary.simpleMessage(
      "Motivo (opcional)",
    ),
    "removePhoto": MessageLookupByLibrary.simpleMessage("Quitar foto"),
    "removePhotos": MessageLookupByLibrary.simpleMessage("Eliminar fotos"),
    "removeThisTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Eliminar este periodo de tiempo",
    ),
    "removeVideo": MessageLookupByLibrary.simpleMessage("Remover video"),
    "reorder": MessageLookupByLibrary.simpleMessage("Reordenar"),
    "reportContent": MessageLookupByLibrary.simpleMessage("Reportar"),
    "reportContentSubtitle": MessageLookupByLibrary.simpleMessage(
      "¿Por qué reportás este contenido?",
    ),
    "reportReasonHarassment": MessageLookupByLibrary.simpleMessage(
      "Acoso o intimidación",
    ),
    "reportReasonHateSpeech": MessageLookupByLibrary.simpleMessage(
      "Discurso de odio",
    ),
    "reportReasonMisinformation": MessageLookupByLibrary.simpleMessage(
      "Información falsa",
    ),
    "reportReasonOffensive": MessageLookupByLibrary.simpleMessage(
      "Ofensivo o inapropiado",
    ),
    "reportReasonOther": MessageLookupByLibrary.simpleMessage("Otro"),
    "reportReasonSexual": MessageLookupByLibrary.simpleMessage(
      "Contenido sexual",
    ),
    "reportReasonSpam": MessageLookupByLibrary.simpleMessage("Spam o estafa"),
    "reportReasonViolence": MessageLookupByLibrary.simpleMessage(
      "Violencia o peligro",
    ),
    "reportSentSuccess": MessageLookupByLibrary.simpleMessage(
      "Gracias por tu reporte. Nuestro equipo lo revisará.",
    ),
    "reportSubmit": MessageLookupByLibrary.simpleMessage("Enviar reporte"),
    "request": MessageLookupByLibrary.simpleMessage("Solicitar"),
    "requestQuote": MessageLookupByLibrary.simpleMessage(
      "Solicitar cotización",
    ),
    "requestReservation": MessageLookupByLibrary.simpleMessage(
      "Solicitar Reserva",
    ),
    "requestService": MessageLookupByLibrary.simpleMessage(
      "Solicitar servicio",
    ),
    "requested": MessageLookupByLibrary.simpleMessage("Solicitado"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Reenviar Código"),
    "resendCodeIn": m73,
    "reservation": MessageLookupByLibrary.simpleMessage("Reservación"),
    "reservationCancelled": MessageLookupByLibrary.simpleMessage(
      "Reserva cancelada.",
    ),
    "reservationCompleted": MessageLookupByLibrary.simpleMessage(
      "Reservación completada.",
    ),
    "reservationConfirmed": MessageLookupByLibrary.simpleMessage(
      "Reservación confirmada.",
    ),
    "reservationContactBody": MessageLookupByLibrary.simpleMessage(
      "El comercio necesita estos datos para confirmar tu solicitud.",
    ),
    "reservationContactTitle": MessageLookupByLibrary.simpleMessage(
      "Datos de contacto",
    ),
    "reservationDetails": MessageLookupByLibrary.simpleMessage(
      "Detalles de la reservación",
    ),
    "reservationRejected": MessageLookupByLibrary.simpleMessage(
      "Reservación rechazada.",
    ),
    "reservationRequestFailed": MessageLookupByLibrary.simpleMessage(
      "No se pudo enviar la solicitud de reserva.",
    ),
    "reservationRequestSent": MessageLookupByLibrary.simpleMessage(
      "¡Solicitud de reserva enviada!",
    ),
    "reservations": MessageLookupByLibrary.simpleMessage("Reservaciones"),
    "reservationsForToday": MessageLookupByLibrary.simpleMessage(
      "Reservas para hoy",
    ),
    "reserveTableAt": m74,
    "reserveToComplete": MessageLookupByLibrary.simpleMessage(
      "Reserva → Completada",
    ),
    "resilience": MessageLookupByLibrary.simpleMessage("Resilience"),
    "resultsFor": MessageLookupByLibrary.simpleMessage("Resultados para"),
    "resumeSessionWithSecurity": MessageLookupByLibrary.simpleMessage(
      "Retomar sesión usando tu huella/rostro o patrón",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Reintentar"),
    "retryLocation": MessageLookupByLibrary.simpleMessage(
      "Reintentar ubicación",
    ),
    "retryLocationDescription": MessageLookupByLibrary.simpleMessage(
      "Toca para volver a obtener tu ubicación",
    ),
    "retryRecording": MessageLookupByLibrary.simpleMessage(
      "Reintentar grabación",
    ),
    "review": MessageLookupByLibrary.simpleMessage("Reseña"),
    "reviewDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Reseña eliminada correctamente",
    ),
    "reviewSubmittedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "¡Reseña enviada correctamente!",
    ),
    "reviewUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "¡Reseña actualizada correctamente!",
    ),
    "reviews": MessageLookupByLibrary.simpleMessage("Reseñas"),
    "save": MessageLookupByLibrary.simpleMessage("Guardar"),
    "saveAndClose": MessageLookupByLibrary.simpleMessage("Guardar y Cerrar"),
    "saveMenu": MessageLookupByLibrary.simpleMessage("Guardar este menú"),
    "saveToProfileForReservations": MessageLookupByLibrary.simpleMessage(
      "Guardar en mi perfil para futuras reservas",
    ),
    "savedPromotions": MessageLookupByLibrary.simpleMessage(
      "Promociones guardadas",
    ),
    "savedPromotionsCurrent": MessageLookupByLibrary.simpleMessage(
      "Estas son tus Promociones Vigentes",
    ),
    "savedPromotionsTabCurrent": MessageLookupByLibrary.simpleMessage(
      "Vigentes",
    ),
    "savedPromotionsTabUpcoming": MessageLookupByLibrary.simpleMessage(
      "Próximas",
    ),
    "savedPromotionsUpcoming": MessageLookupByLibrary.simpleMessage(
      "Estas son tus Próximas Promociones",
    ),
    "scanForMenu": MessageLookupByLibrary.simpleMessage(
      "Escanea para ver nuestro menú",
    ),
    "scanQRCode": MessageLookupByLibrary.simpleMessage(
      "Escanea este código QR",
    ),
    "seafood": MessageLookupByLibrary.simpleMessage("Mariscos"),
    "searchBusinessOrAddress": MessageLookupByLibrary.simpleMessage(
      "Buscar negocio o dirección",
    ),
    "searchInCity": m75,
    "searchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Descubre excelentes lugares para comer y beber cerca de ti...",
    ),
    "secureAuthentication": MessageLookupByLibrary.simpleMessage(
      "Permitir que el sistema operativo proporcione autenticación segura.",
    ),
    "selectADate": MessageLookupByLibrary.simpleMessage(
      "Selecciona una fecha:",
    ),
    "selectATime": MessageLookupByLibrary.simpleMessage("Selecciona una hora:"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Selecciona una fecha:"),
    "selectTime": MessageLookupByLibrary.simpleMessage("Selecciona una hora:"),
    "selectUserType": MessageLookupByLibrary.simpleMessage(
      "Selecciona el tipo de usuario",
    ),
    "selectedPlace": MessageLookupByLibrary.simpleMessage(
      "Ubicación seleccionada",
    ),
    "send": MessageLookupByLibrary.simpleMessage("Enviar"),
    "sendMessage": MessageLookupByLibrary.simpleMessage("Enviar mensaje"),
    "sendQuote": MessageLookupByLibrary.simpleMessage("Enviar cotización"),
    "sendVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Enviar Código de Verificación",
    ),
    "september": MessageLookupByLibrary.simpleMessage("Septiembre"),
    "serviceArea": MessageLookupByLibrary.simpleMessage("Área de servicio"),
    "serviceBookingDetail": MessageLookupByLibrary.simpleMessage(
      "Detalle de solicitud",
    ),
    "serviceBookingRequest": MessageLookupByLibrary.simpleMessage(
      "Solicitud de servicio",
    ),
    "servicePackages": MessageLookupByLibrary.simpleMessage(
      "Paquetes de servicio",
    ),
    "serviceRequests": MessageLookupByLibrary.simpleMessage(
      "Solicitudes de servicio",
    ),
    "serviceType": MessageLookupByLibrary.simpleMessage("Tipo de servicio"),
    "serviceTypeAll": MessageLookupByLibrary.simpleMessage("Todos"),
    "sessionExpiredMessage": MessageLookupByLibrary.simpleMessage(
      "Tu sesión ha expirado. Por favor, inicia sesión de nuevo.",
    ),
    "setDate": MessageLookupByLibrary.simpleMessage("Establecer fecha"),
    "setPassword": MessageLookupByLibrary.simpleMessage(
      "Establecer contraseña",
    ),
    "setPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
      "Habilita el inicio de sesión con email y contraseña además de tu cuenta social.",
    ),
    "setupProfessionalProfile": MessageLookupByLibrary.simpleMessage(
      "Configura tu perfil profesional",
    ),
    "shareAppMessage": MessageLookupByLibrary.simpleMessage(
      "Descubre los mejores locales cerca de ti con Foodly — explora menus, aprovecha promociones y reserva mesa, todo en una sola app!",
    ),
    "shareMenu": MessageLookupByLibrary.simpleMessage("Compartir este menú"),
    "shareMenuError": MessageLookupByLibrary.simpleMessage(
      "Ups... ¡Algo salió mal! \n\nNo se pudo compartir el menú.",
    ),
    "shareMenuMessage": m76,
    "shareMenuSubject": MessageLookupByLibrary.simpleMessage(
      "¡Te comparto un menú!",
    ),
    "shareOnAndroid": MessageLookupByLibrary.simpleMessage(
      "Compartir para Android",
    ),
    "shareOnIOS": MessageLookupByLibrary.simpleMessage("Compartir para iOS"),
    "sharePromotion": MessageLookupByLibrary.simpleMessage(
      "Compartir Promoción",
    ),
    "signInWithApple": MessageLookupByLibrary.simpleMessage(
      "Iniciar sesión con Apple",
    ),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Iniciar sesión con Google",
    ),
    "signUpBusinessTooltipTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Te recomendamos localizar tu negocio o dirección de tu lugar de actividad comercial en Google, y así brindarnos datos, incluyendo coordenadas, que nos permitan darte",
    ),
    "signUpBusinessTooltipTextSpan2": MessageLookupByLibrary.simpleMessage(
      "mayor relevancia",
    ),
    "signUpBusinessTooltipTextSpan3": MessageLookupByLibrary.simpleMessage(
      "en nuestros motores de",
    ),
    "signUpBusinessTooltipTextSpan4": MessageLookupByLibrary.simpleMessage(
      "busqueda y mapas",
    ),
    "signUpBusinessTooltipTextSpan5": MessageLookupByLibrary.simpleMessage(
      "para",
    ),
    "signUpBusinessTooltipTextSpan6": MessageLookupByLibrary.simpleMessage(
      "usuarios",
    ),
    "signUpBusinessTooltipTextSpan7": MessageLookupByLibrary.simpleMessage(
      "consumidores y visitantes, al igual que si decides incorporar servicios como delivery y take away. Así daremos una",
    ),
    "signUpBusinessTooltipTextSpan8": MessageLookupByLibrary.simpleMessage(
      "mejor experiencia de usuario",
    ),
    "signUpBusinessTooltipTextSpan9": MessageLookupByLibrary.simpleMessage(
      "a tus clientes.",
    ),
    "signup": MessageLookupByLibrary.simpleMessage("Registrarse"),
    "smokingArea": MessageLookupByLibrary.simpleMessage("Área de Fumadores"),
    "socialConsentTitle": MessageLookupByLibrary.simpleMessage(
      "Un último paso",
    ),
    "socialEmailMissing": MessageLookupByLibrary.simpleMessage(
      "No pudimos obtener tu correo de Apple. Probá de nuevo o usá otro método de inicio de sesión.",
    ),
    "socials": MessageLookupByLibrary.simpleMessage("Sociales"),
    "solo": MessageLookupByLibrary.simpleMessage("Solo"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Ocurrió un error",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("Ordenar por"),
    "specialRequests": MessageLookupByLibrary.simpleMessage(
      "Solicitudes especiales",
    ),
    "specialRequestsLabel": m77,
    "specialRequestsOptional": MessageLookupByLibrary.simpleMessage(
      "Solicitudes especiales (opcional)",
    ),
    "specialties": MessageLookupByLibrary.simpleMessage("Especialidades"),
    "specialtyExample": MessageLookupByLibrary.simpleMessage(
      "Ej: Cocina molecular",
    ),
    "speechRecognitionError": MessageLookupByLibrary.simpleMessage(
      "Error al iniciar el reconocimiento de voz.",
    ),
    "speechRecognitionUnavailable": MessageLookupByLibrary.simpleMessage(
      "El reconocimiento de voz no está disponible en este dispositivo.",
    ),
    "start": MessageLookupByLibrary.simpleMessage("Inicio"),
    "startDate": MessageLookupByLibrary.simpleMessage("Fecha de inicio"),
    "startTime": MessageLookupByLibrary.simpleMessage("Hora de inicio"),
    "startups": MessageLookupByLibrary.simpleMessage("startups"),
    "state": MessageLookupByLibrary.simpleMessage("Estado"),
    "steakhouse": MessageLookupByLibrary.simpleMessage("Carnes y Parrillas"),
    "stop": MessageLookupByLibrary.simpleMessage("Detener"),
    "stress": MessageLookupByLibrary.simpleMessage("Stress"),
    "strict": MessageLookupByLibrary.simpleMessage("Estricta"),
    "stripeBridgeRefreshBody": MessageLookupByLibrary.simpleMessage(
      "Retomá la activación desde la app: Órdenes → Activar pagos con Stripe.",
    ),
    "stripeBridgeRefreshTitle": MessageLookupByLibrary.simpleMessage(
      "Activación incompleta",
    ),
    "stripeBridgeReturnBody": MessageLookupByLibrary.simpleMessage(
      "Ya podés cerrar esta pestaña y volver a la app Foodly.",
    ),
    "stripeBridgeReturnTitle": MessageLookupByLibrary.simpleMessage(
      "Cuenta de pagos configurada",
    ),
    "subject": MessageLookupByLibrary.simpleMessage("Asunto"),
    "submit": MessageLookupByLibrary.simpleMessage("Enviar"),
    "submitReview": MessageLookupByLibrary.simpleMessage("Enviar reseña"),
    "success": MessageLookupByLibrary.simpleMessage("Éxito"),
    "successRate": MessageLookupByLibrary.simpleMessage("Tasa de éxito"),
    "successfullyDeleted": MessageLookupByLibrary.simpleMessage(
      "¡Eliminado con éxito!",
    ),
    "suggestFoodlyInYourCountry": MessageLookupByLibrary.simpleMessage(
      "Sugerir Foodly en tu país",
    ),
    "suggestFoodlySubject": MessageLookupByLibrary.simpleMessage(
      "Traigan Foodly a mi país",
    ),
    "sushi": MessageLookupByLibrary.simpleMessage("Sushi"),
    "switchToManagerRole": MessageLookupByLibrary.simpleMessage(
      "Cambiar a Cuenta Empresarial",
    ),
    "switchUserCategoryTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Si deseas recategorizarte como",
    ),
    "switchUserCategoryTextSpan2": MessageLookupByLibrary.simpleMessage(
      ", haz click",
    ),
    "switchUserCategoryTextSpan3": MessageLookupByLibrary.simpleMessage(
      " aquí",
    ),
    "tableReservations": MessageLookupByLibrary.simpleMessage(
      "Reservas de mesa",
    ),
    "takeAway": MessageLookupByLibrary.simpleMessage("Take Away"),
    "tapPlusToCreate": MessageLookupByLibrary.simpleMessage(
      "Toca + para crear tu primer paquete",
    ),
    "tapToAddPrompt": MessageLookupByLibrary.simpleMessage(
      "Toca aquí para añadir un nuevo prompt",
    ),
    "tapToSelectTime": MessageLookupByLibrary.simpleMessage(
      "Toca para seleccionar hora",
    ),
    "teamSize": MessageLookupByLibrary.simpleMessage("Tamaño del equipo"),
    "temporarilyUnavailable": MessageLookupByLibrary.simpleMessage(
      "Temporalmente no disponible",
    ),
    "tendencies": MessageLookupByLibrary.simpleMessage("Tendencias"),
    "termsConditions": MessageLookupByLibrary.simpleMessage(
      "Términos y Condiciones",
    ),
    "termsConditionsShort": MessageLookupByLibrary.simpleMessage("T&C"),
    "termsPrivacyTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Al crear una cuenta, afirmas que has leído y aceptas nuestros",
    ),
    "termsPrivacyTextSpan1forBusiness": MessageLookupByLibrary.simpleMessage(
      "Al crear una cuenta de negocio, confirmas que has leído y aceptas nuestros",
    ),
    "termsPrivacyTextSpan2": MessageLookupByLibrary.simpleMessage(
      "Términos y Condiciones",
    ),
    "termsPrivacyTextSpan3": MessageLookupByLibrary.simpleMessage(" y la"),
    "termsPrivacyTextSpan4": MessageLookupByLibrary.simpleMessage(
      "Política de Privacidad",
    ),
    "thereAreNoCustomerReviewsYet": MessageLookupByLibrary.simpleMessage(
      "Aun no hay valoraciones de clientes",
    ),
    "thisBusiness": MessageLookupByLibrary.simpleMessage("este negocio"),
    "thisUser": MessageLookupByLibrary.simpleMessage("este usuario"),
    "time": MessageLookupByLibrary.simpleMessage("Hora"),
    "timeAgoDays": m78,
    "timeAgoHours": m79,
    "timeAgoJustNow": MessageLookupByLibrary.simpleMessage("Ahora mismo"),
    "timeAgoMinutes": m80,
    "title": MessageLookupByLibrary.simpleMessage("Título"),
    "today": MessageLookupByLibrary.simpleMessage("Hoy"),
    "tooManyAttempts": MessageLookupByLibrary.simpleMessage(
      "Demasiados intentos seguidos. Probá de nuevo en un momento.",
    ),
    "tooManyAttemptsIn": m81,
    "topEvents": MessageLookupByLibrary.simpleMessage("Eventos principales"),
    "totalEvents": MessageLookupByLibrary.simpleMessage("Total de eventos"),
    "travelFeeKm": MessageLookupByLibrary.simpleMessage("Tarifa viaje/km"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Intentar de nuevo"),
    "typeMessage": MessageLookupByLibrary.simpleMessage(
      "Escribe un mensaje...",
    ),
    "unauthorizedAccess": MessageLookupByLibrary.simpleMessage(
      "Acceso no autorizado.",
    ),
    "unavailableDaysHint": MessageLookupByLibrary.simpleMessage(
      "Los días en gris no están disponibles.",
    ),
    "unblock": MessageLookupByLibrary.simpleMessage("Desbloquear"),
    "uniqueUsers": MessageLookupByLibrary.simpleMessage("Usuarios únicos"),
    "updateReview": MessageLookupByLibrary.simpleMessage("Actualizar reseña"),
    "uploadImage": MessageLookupByLibrary.simpleMessage("Subir imagen"),
    "uploadPromotionalMediaContent": MessageLookupByLibrary.simpleMessage(
      "Subir imagen promocional o video",
    ),
    "uploadVideo": MessageLookupByLibrary.simpleMessage("Subir video"),
    "us": MessageLookupByLibrary.simpleMessage("Nosotros"),
    "useDeviceLocation": MessageLookupByLibrary.simpleMessage(
      "Usar ubicación del dispositivo",
    ),
    "useSavedLocation": MessageLookupByLibrary.simpleMessage(
      "Usar ubicación guardada",
    ),
    "userGender1": MessageLookupByLibrary.simpleMessage("Género"),
    "userGender2": MessageLookupByLibrary.simpleMessage("del Usuario"),
    "userPassword1": MessageLookupByLibrary.simpleMessage("Cambiar"),
    "userPassword2": MessageLookupByLibrary.simpleMessage("Contraseña"),
    "userPasswordUpdated": MessageLookupByLibrary.simpleMessage(
      "Contraseña actualizada exitosamente",
    ),
    "userProfileUpdated": MessageLookupByLibrary.simpleMessage(
      "Datos de usuario actualizados exitosamente",
    ),
    "userReviews1": MessageLookupByLibrary.simpleMessage("Mis"),
    "userReviews2": MessageLookupByLibrary.simpleMessage("Reseñas"),
    "userReviewsPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Aún no has dejado reseñas, recuerda calificar tu experiencia al visitar un comercio para mejorar la experiencia de todos los usuarios, y destacar en nuestra comunidad.",
    ),
    "userSortMostActive": MessageLookupByLibrary.simpleMessage("Más activos"),
    "userSortMostFollowed": MessageLookupByLibrary.simpleMessage(
      "Más seguidos",
    ),
    "userSortNearest": MessageLookupByLibrary.simpleMessage("Más cercanos"),
    "userSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
      "Usuario creado exitosamente",
    ),
    "userTypeSnackbarTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Por favor selecciona el",
    ),
    "userTypeSnackbarTextSpan2": MessageLookupByLibrary.simpleMessage(
      "tipo de usuario",
    ),
    "userTypeSnackbarTextSpan3": MessageLookupByLibrary.simpleMessage(
      "para activar y poder completar el formulario",
    ),
    "usernameAvailable": MessageLookupByLibrary.simpleMessage(
      "Nombre de usuario disponible",
    ),
    "usernameNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Nombre de usuario no disponible",
    ),
    "users": MessageLookupByLibrary.simpleMessage("Usuarios"),
    "usersHaveTheAbilityToCreateAndManage":
        MessageLookupByLibrary.simpleMessage(
          "son usuarios que tienen la capacidad de crear y manejar",
        ),
    "valid": MessageLookupByLibrary.simpleMessage("Válido"),
    "validCategoryRequired": MessageLookupByLibrary.simpleMessage(
      "Se requiere una categoría válida",
    ),
    "vegetarianCuisine": MessageLookupByLibrary.simpleMessage("Vegetariana"),
    "venezuelan": MessageLookupByLibrary.simpleMessage("Venezolana"),
    "verify": MessageLookupByLibrary.simpleMessage("Verificar"),
    "verifyPhone": MessageLookupByLibrary.simpleMessage("Verificar Teléfono"),
    "verifyingAvailability": MessageLookupByLibrary.simpleMessage(
      "Verificando disponibilidad",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Versión"),
    "videoIsTooLong": MessageLookupByLibrary.simpleMessage(
      "El video es demasiado largo. La duración máxima es de 20 segundos.",
    ),
    "view": MessageLookupByLibrary.simpleMessage("Ver"),
    "viewEdit": MessageLookupByLibrary.simpleMessage("Ver/Editar"),
    "viewMenuOf": MessageLookupByLibrary.simpleMessage("Ver el menú de"),
    "viewPromotion": MessageLookupByLibrary.simpleMessage("Ver promoción"),
    "viewToInteract": MessageLookupByLibrary.simpleMessage(
      "Vista → Interacción",
    ),
    "visitBusinessPage": MessageLookupByLibrary.simpleMessage(
      "Ver página del negocio",
    ),
    "visitedOn": m82,
    "visitor": MessageLookupByLibrary.simpleMessage("Visitante"),
    "vitality": MessageLookupByLibrary.simpleMessage("Vitality"),
    "weWillCheckAvailability": MessageLookupByLibrary.simpleMessage(
      "Verificaremos disponibilidad",
    ),
    "wedding": MessageLookupByLibrary.simpleMessage("Boda"),
    "weekday1": MessageLookupByLibrary.simpleMessage("Domingo"),
    "weekday2": MessageLookupByLibrary.simpleMessage("Lunes"),
    "weekday3": MessageLookupByLibrary.simpleMessage("Martes"),
    "weekday4": MessageLookupByLibrary.simpleMessage("Miércoles"),
    "weekday5": MessageLookupByLibrary.simpleMessage("Jueves"),
    "weekday6": MessageLookupByLibrary.simpleMessage("Viernes"),
    "weekday7": MessageLookupByLibrary.simpleMessage("Sábado"),
    "weekdayShort1": MessageLookupByLibrary.simpleMessage("Dom"),
    "weekdayShort2": MessageLookupByLibrary.simpleMessage("Lun"),
    "weekdayShort3": MessageLookupByLibrary.simpleMessage("Mar"),
    "weekdayShort4": MessageLookupByLibrary.simpleMessage("Mié"),
    "weekdayShort5": MessageLookupByLibrary.simpleMessage("Jue"),
    "weekdayShort6": MessageLookupByLibrary.simpleMessage("Vie"),
    "weekdayShort7": MessageLookupByLibrary.simpleMessage("Sáb"),
    "welcomeDialogSocialBusiness": MessageLookupByLibrary.simpleMessage(
      "¿Querés publicar tu negocio en Foodly? Andá a tu perfil y activá la opción de cuenta empresarial para darlo de alta.",
    ),
    "welcomeDialogTextSpan1": MessageLookupByLibrary.simpleMessage("En"),
    "welcomeDialogTextSpan2": MessageLookupByLibrary.simpleMessage(
      "te damos una cordial bienvenida",
    ),
    "welcomeDialogTextSpan3": MessageLookupByLibrary.simpleMessage(
      "te has registrado como",
    ),
    "welcomeDialogTextSpanClient1": MessageLookupByLibrary.simpleMessage(
      "Ahora somos tu guía gastronómica digital en tu ciudad y en nuestras zonas de cobertura. Te invitamos a participar activamente en nuestra comunidad, calificar y comentar sobre los comercios y productos, siempre desde la línea del respeto, criticar constructivamente, apoyar los esfuerzos de los pequeños, medianos y grandes comerciantes y principalmente, disfrutar de las",
    ),
    "welcomeDialogTextSpanClient2": MessageLookupByLibrary.simpleMessage(
      "promociones, contenidos, servicios y ventajas",
    ),
    "welcomeDialogTextSpanClient3": MessageLookupByLibrary.simpleMessage(
      "que te brinda ser nuestro usuario",
    ),
    "welcomeDialogTextSpanOwner": MessageLookupByLibrary.simpleMessage(
      "El siguiente paso es completar el alta de tu negocio, te pediremos por ahora datos básicos y luego podrás agregar desde el tablero de tu empresa, mas información relevante y por supuesto, comenzar a crear contenido, menús, promociones, y todo lo que desees a través de tu nueva herramienta digital",
    ),
    "welcomeTo": MessageLookupByLibrary.simpleMessage("Bienvenidos"),
    "whatAreYouCravingToday": MessageLookupByLibrary.simpleMessage(
      "¿Qué te apetece hoy?",
    ),
    "whatsOnYourMind": MessageLookupByLibrary.simpleMessage(
      "¿En qué estás pensando?",
    ),
    "whenDidYouVisit": MessageLookupByLibrary.simpleMessage(
      "¿Cuándo nos visitaste?",
    ),
    "wifi": MessageLookupByLibrary.simpleMessage("Wifi"),
    "writeReviewFor": m83,
    "writeYourReviewHint": MessageLookupByLibrary.simpleMessage(
      "Escribe tu reseña aquí...",
    ),
    "yearsExperience": MessageLookupByLibrary.simpleMessage(
      "Años de experiencia",
    ),
    "yesCancel": MessageLookupByLibrary.simpleMessage("Sí, cancelar"),
    "zipCode": MessageLookupByLibrary.simpleMessage("Código postal"),
    "zipCodeNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Este codigo esta fuera de nuestra area actual de cobertura",
    ),
  };
}
