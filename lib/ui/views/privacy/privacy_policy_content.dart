// ignore_for_file: lines_longer_than_80_chars

class PolicySection {
  const PolicySection({required this.heading, required this.body});
  final String heading;
  final String body;
}

List<PolicySection> buildPolicyContent(String langCode) {
  switch (langCode) {
    case 'es':
      return _es;
    case 'pt':
      return _pt;
    default:
      return _en;
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// ENGLISH
// ──────────────────────────────────────────────────────────────────────────────
const _en = [
  PolicySection(
    heading: 'Introduction',
    body:
        'Foodly is a platform that connects users with local food businesses, restaurants, and related gastronomy services. This Privacy Policy explains how we collect, use, store, and protect your personal information when you use the Foodly mobile application ("App").\n\n'
        'By using Foodly you agree to this Privacy Policy. If you do not agree, please stop using the App and delete your account.\n\n'
        'Last updated: April 13, 2026',
  ),
  PolicySection(
    heading: 'Who We Are (Data Controller)',
    body:
        'Foodly is operated by Hector Waldman, an independent commercial operator based in Portugal (NIF available upon request). Our backend infrastructure is hosted in the European Union (Google Cloud, region: europe-west1 — Belgium).\n\n'
        'Privacy contact: privacy@foodly.solutions\n\n'
        'As a Portuguese-based operator, we comply with the General Data Protection Regulation (GDPR) and applicable data protection laws across all markets where the App is available.',
  ),
  PolicySection(
    heading: 'What Data We Collect',
    body: 'DATA YOU PROVIDE DIRECTLY\n\n'
        '• Account data: full name, username, email address, phone number, date of birth, gender.\n'
        '• Security credentials: your password is stored as a cryptographic hash and is never readable by us or anyone else. Biometric data (fingerprint, Face ID) is stored locally on your device only and is never transmitted to our servers.\n'
        '• Profile photo: uploaded to our secure cloud storage.\n'
        '• Address data: country, city, postal code, and optionally precise GPS coordinates for saved addresses.\n'
        '• Business data (managers only): business name, description, category, address, opening hours, contact channels, services, logo, cover images, menus, and promotional content.\n'
        '• Reviews: text, rating, and visit date you submit for businesses.\n'
        '• Reservations: date, time, party size, and any special requests or notes.\n'
        '• Community content: posts, comments, and media you share in the community feed.\n\n'
        'DATA COLLECTED AUTOMATICALLY\n\n'
        '• Precise location (GPS): with your explicit permission, to find nearby businesses and personalise results. Coordinates are transmitted during location-based requests and may be stored if you save an address. Location is only accessed while the app is in use; you can revoke this permission at any time in your device settings.\n'
        '• Voice and audio: with your permission, for voice search. Audio is transcribed and the resulting text query is sent to our search service. Raw audio is not stored on our servers.\n'
        '• Device information: app version, operating system, and device model — sent with search requests to improve result relevance.\n'
        '• Crash and diagnostic data: technical error reports via Firebase Crashlytics to identify and fix bugs. This data does not personally identify you.\n'
        '• Usage analytics: anonymous app interactions via Firebase Analytics to understand usage patterns and improve the App. You can opt out via your device settings.\n'
        '• First-party behavioural analytics: anonymised interaction events (screen views, feature usage, session duration) are sent to Foodly\'s own servers to power performance and engagement insights shown to business owners. These events do not contain personally identifiable information.\n\n'
        'DATA FROM THIRD-PARTY AUTHENTICATION\n\n'
        '• Google Sign-In: if you sign in with Google we receive your Google email, display name, and profile photo. We do not receive your Google password.',
  ),
  PolicySection(
    heading: 'How We Use Your Data',
    body: '• Provide and maintain your account and profile.\n'
        '• Show you nearby businesses, promotions, and personalised search results.\n'
        '• Enable table reservations between customers and businesses.\n'
        '• Send in-app notifications about reservations and community activity.\n'
        '• Allow business managers to manage listings, menus, and promotions.\n'
        '• Generate AI-assisted promotional text (managers only — your prompts are sent to OpenAI).\n'
        '• Generate AI promotional images (managers only — your prompts are sent to Replicate).\n'
        '• Improve app stability via crash reports and anonymised analytics.\n'
        '• Provide business owners with anonymised engagement insights (profile views, feature interactions, reservation conversion rates) derived from aggregated user interactions with their listing, to help them evaluate and improve their business performance.\n'
        '• Comply with applicable legal obligations.\n'
        '• Respond to your support requests.\n\n'
        'We do NOT use your data for advertising profiling, do NOT sell your data to third parties, and do NOT apply automated decision-making that has legal effects on you.',
  ),
  PolicySection(
    heading: 'Business Data & Manager Accounts',
    body: 'When you register a business on Foodly and become a Manager, we collect and process additional data specific to business operations.\n\n'
        'BUSINESS DATA COLLECTED\n\n'
        '• Business identity information: legal business name, trade name, address, category, contact channels, and opening hours.\n'
        '• Business media: logo, cover images, menu photos, and promotional content.\n'
        '• Operational data: menus, prices, reservation settings, and service descriptions.\n'
        '• Engagement metrics: aggregated, anonymised interaction data (profile views, feature usage, reservation conversion rates) derived from user interactions with your listing.\n\n'
        'IDENTITY VERIFICATION DOCUMENTS\n\n'
        'Foodly may request documentary proof of your authority to represent a business. Documents you may be asked to provide include: business registration certificates, tax identification numbers, lease agreements, or powers of attorney. These documents are used solely to verify your relationship to the business and are stored securely. Verification documents are retained only for the duration necessary to complete verification and are deleted within 90 days of successful verification, unless retention is required by law.\n\n'
        'BUSINESS DATA RETENTION\n\n'
        'Business profile data (name, description, menus, media) is retained while the business listing is active. When a business is deactivated or deleted:\n\n'
        '• Business media (logo, images) is deleted from cloud storage.\n'
        '• Business profile data is anonymised.\n'
        '• Historical reservation records are retained in anonymised form for data integrity purposes.\n'
        '• Engagement metrics, which are already anonymised, may be retained for analytical purposes.\n\n'
        'MANAGER-SPECIFIC DATA HANDLING\n\n'
        'As a Manager, your personal account data (name, email, phone) is linked to your business listing(s). If you delete your personal account, your businesses are also deactivated and the anonymisation process described above applies to both your personal and business data.',
  ),
  PolicySection(
    heading: 'Legal Bases for Processing (GDPR)',
    body:
        '• Performance of a contract: processing required to deliver the App\'s core services (account creation, search, reservations, business management).\n'
        '• Legitimate interests: improving app stability, preventing fraud, and maintaining security — always balanced against your privacy interests.\n'
        '• Consent: precise location, microphone, camera, and voice recognition access. You may withdraw any consent at any time via device settings or by contacting us.\n'
        '• Legal obligation: where required by applicable law in any jurisdiction where we operate.',
  ),
  PolicySection(
    heading: 'Third-Party Services',
    body:
        'We use the following third-party services. Each acts as a data processor under our instructions and is bound by data protection agreements:\n\n'
        '• Google LLC (Firebase, Google Cloud, Maps, Places): authentication, cloud storage, analytics, crash reporting, map display, and address autocomplete. Data stored in the EU. Google Privacy Policy: policies.google.com/privacy\n\n'
        '• OpenAI (ChatGPT API): business managers may use AI tools to generate promotional text. Text prompts you enter are sent to OpenAI. OpenAI Privacy Policy: openai.com/privacy\n\n'
        '• Replicate: AI image generation for promotional content. Image prompts are sent to Replicate for processing. Replicate Privacy Policy: replicate.com/privacy\n\n'
        '• Smart Search Service: a search microservice operated by a trusted technical collaborator that processes your search query, approximate location, and an anonymous session identifier to return relevant business results. This service does not retain personal data beyond the duration of the search request.\n\n'
        '• Payment processors (future feature): when payment features become available, transactions will be processed by Mercado Pago and/or Stripe. Foodly does NOT store payment card data, bank account numbers, or tax identification numbers. All payment information flows directly to the payment processor under their own privacy terms.\n\n'
        'We do not share your personal data with advertisers, data brokers, or other users beyond what you choose to make publicly visible.',
  ),
  PolicySection(
    heading: 'Data Storage, Retention & Security',
    body: '• Storage location: European Union — Google Cloud, Belgium (europe-west1).\n'
        '• Retention period: we retain your data while your account is active. When you delete your account your PII (name, email, phone, photo) is anonymised immediately and your session tokens are revoked. Anonymised records may be retained for legal integrity purposes (e.g., historical reservation records) but cannot be attributed to you.\n'
        '• Security measures: all data in transit is encrypted with TLS/HTTPS; passwords are cryptographically hashed (bcrypt); API sessions use short-lived Sanctum tokens; media files are stored in access-controlled Google Cloud Storage buckets.\n'
        '• Biometric data (fingerprint / Face ID) is processed entirely on your device and is never transmitted.\n'
        '• In the event of a personal data breach we will notify affected users and the relevant supervisory authority within 72 hours as required by GDPR.',
  ),
  PolicySection(
    heading: 'Your Rights',
    body: 'Depending on your location you have the right to:\n\n'
        '• Access: request a copy of your personal data.\n'
        '• Rectification: correct inaccurate or incomplete data (via Profile settings in the App).\n'
        '• Erasure ("right to be forgotten"): delete your account directly in the App (Profile → Delete Account) or by emailing us.\n'
        '• Restriction: limit how we process your data in certain circumstances.\n'
        '• Data portability: receive your data in a structured, machine-readable format.\n'
        '• Object: object to processing based on legitimate interest.\n'
        '• Withdraw consent: revoke location, microphone, camera, or analytics consent at any time via device settings.\n'
        '• Non-automated decision-making: not be subject to decisions based solely on automated processing that produce legal or significant effects.\n'
        '• Lodge a complaint: with the data protection authority in your country (see Contact section).\n\n'
        'These rights apply under GDPR (EU/EEA — Portugal, Spain), CCPA (California, USA), Ley 25.326 (Argentina), LOPDP (Venezuela), LPDP (El Salvador, Decreto 534), and equivalent laws in other jurisdictions.\n\n'
        'To exercise any of these rights, contact: privacy@foodly.solutions. We will respond within 30 days.',
  ),
  PolicySection(
    heading: 'Account & Data Deletion',
    body: 'You can delete your account at any time directly in the App:\n\n'
        '1. Open the App → go to your Profile.\n'
        '2. Scroll to the bottom → tap "Delete Account".\n'
        '3. Confirm the action.\n\n'
        'What happens when you delete your account:\n\n'
        '• Your name, email address, phone number, and profile photo are anonymised immediately.\n'
        '• All your active businesses are deactivated.\n'
        '• Your authentication tokens are revoked immediately — you are logged out on all devices.\n'
        '• Your anonymised record may be retained to preserve the integrity of historical data (e.g., past reservation records for businesses) but cannot be attributed to you.\n\n'
        'You may also request deletion by email: privacy@foodly.solutions. We will process your request within 30 days.',
  ),
  PolicySection(
    heading: 'Children\'s Privacy',
    body:
        'Foodly is not directed at children under 13 years of age (or under 16 in the EU/EEA under GDPR). We do not knowingly collect personal data from children. If we learn that we have collected personal data from a child without verified parental consent, we will delete it promptly.\n\n'
        'If you are a parent or guardian and believe your child has provided personal data to Foodly, please contact us at privacy@foodly.solutions.',
  ),
  PolicySection(
    heading: 'International Data Transfers',
    body:
        'Your data is stored in the European Union (Belgium). If you access Foodly from outside the EU — including Argentina, Venezuela, the United States, or El Salvador — your data is transferred to and processed within the EU.\n\n'
        'Such transfers comply with applicable data protection law. The EU is recognised as providing an adequate level of data protection under GDPR.\n\n'
        'For users in California (USA): Foodly does not sell personal information as defined under the California Consumer Privacy Act (CCPA). California residents have the right to know, delete, and opt-out of the sale of personal information (sale does not apply here).',
  ),
  PolicySection(
    heading: 'Changes to This Policy',
    body:
        'We may update this Privacy Policy from time to time. When we make significant changes, we will notify you through the App or by email. The "Last updated" date at the top reflects the most recent revision.\n\n'
        'Continued use of the App after changes are posted constitutes acceptance of the revised Policy.',
  ),
  PolicySection(
    heading: 'Contact',
    body: 'For questions, concerns, or data-related requests:\n\n'
        'Foodly — Privacy Team\n'
        'Email: privacy@foodly.solutions\n\n'
        'For EU / Portuguese residents: if you are not satisfied with our response, you have the right to lodge a complaint with the Portuguese data protection authority:\n'
        'Comissão Nacional de Proteção de Dados (CNPD)\n'
        'www.cnpd.pt\n\n'
        'For Spanish residents: Agencia Española de Protección de Datos (AEPD) — www.aepd.es\n\n'
        'For Argentine residents: Agencia de Acceso a la Información Pública (AAIP) — www.argentina.gob.ar/aaip',
  ),
];

// ──────────────────────────────────────────────────────────────────────────────
// SPANISH
// ──────────────────────────────────────────────────────────────────────────────
const _es = [
  PolicySection(
    heading: 'Introducción',
    body:
        'Foodly es una plataforma que conecta a usuarios con negocios gastronómicos locales, restaurantes y servicios relacionados. Esta Política de Privacidad explica cómo recopilamos, usamos, almacenamos y protegemos tu información personal cuando usas la aplicación móvil Foodly ("App").\n\n'
        'Al usar Foodly aceptas esta Política de Privacidad. Si no estás de acuerdo, deja de usar la App y elimina tu cuenta.\n\n'
        'Última actualización: 13 de abril de 2026',
  ),
  PolicySection(
    heading: 'Quiénes Somos (Responsable del Tratamiento)',
    body:
        'Foodly es operada por Hector Waldman, operador comercial independiente con actividad registrada en Portugal (NIF disponible bajo solicitud). Nuestra infraestructura se aloja en la Unión Europea (Google Cloud, región: europe-west1 — Bélgica).\n\n'
        'Contacto de privacidad: privacy@foodly.solutions\n\n'
        'Como operador establecido en Portugal, cumplimos con el Reglamento General de Protección de Datos (RGPD/GDPR) y con las leyes de protección de datos aplicables en todos los mercados donde la App está disponible, incluyendo Argentina (Ley 25.326), Venezuela (LOPDP), España (LOPDGDD), y El Salvador (Decreto 534).',
  ),
  PolicySection(
    heading: 'Qué Datos Recopilamos',
    body: 'DATOS QUE PROPORCIONAS DIRECTAMENTE\n\n'
        '• Datos de cuenta: nombre completo, nombre de usuario, dirección de correo electrónico, número de teléfono, fecha de nacimiento, género.\n'
        '• Credenciales de seguridad: tu contraseña se almacena como hash criptográfico y nunca es legible por nosotros ni por nadie más. Los datos biométricos (huella dactilar, Face ID) se procesan únicamente en tu dispositivo y jamás se transmiten a nuestros servidores.\n'
        '• Foto de perfil: almacenada en nuestra nube segura.\n'
        '• Datos de dirección: país, ciudad, código postal y, opcionalmente, coordenadas GPS de las direcciones guardadas.\n'
        '• Datos de negocio (solo gestores): nombre, descripción, categoría, dirección, horarios, canales de contacto, servicios, logo, imágenes de portada, menús y contenido promocional.\n'
        '• Reseñas: texto, calificación y fecha de visita que envías sobre los negocios.\n'
        '• Reservaciones: fecha, hora, tamaño del grupo y solicitudes especiales o notas.\n'
        '• Contenido de la comunidad: publicaciones, comentarios y medios que compartes en el feed comunitario.\n\n'
        'DATOS RECOPILADOS AUTOMÁTICAMENTE\n\n'
        '• Ubicación precisa (GPS): con tu permiso explícito, para mostrarte negocios cercanos y personalizar resultados. Las coordenadas se transmiten en solicitudes basadas en ubicación y pueden almacenarse si guardas una dirección. La ubicación solo se accede mientras la app está en uso; puedes revocar este permiso en cualquier momento en la configuración del dispositivo.\n'
        '• Voz y audio: con tu permiso, para la búsqueda por voz. El audio se transcribe y la consulta de texto resultante se envía a nuestro servicio de búsqueda. No se almacenan grabaciones de audio en nuestros servidores.\n'
        '• Información del dispositivo: versión de la app, sistema operativo y modelo del dispositivo — enviados con solicitudes de búsqueda para mejorar la relevancia de los resultados.\n'
        '• Datos de fallos y diagnóstico: informes técnicos de errores mediante Firebase Crashlytics para identificar y corregir problemas. Estos datos no te identifican personalmente.\n'
        '• Analítica de uso: interacciones anónimas con la app mediante Firebase Analytics para entender patrones de uso y mejorar la App. Puedes desactivarlo en la configuración de tu dispositivo.\n'
        '• Analítica de comportamiento propia: eventos de interacción anonimizados (vistas de pantalla, uso de funciones, duración de sesión) se envían a los servidores de Foodly para generar informes de rendimiento e impacto mostrados a los gestores de negocios. Estos eventos no contienen información de identificación personal.\n\n'
        'DATOS DE AUTENTICACIÓN CON TERCEROS\n\n'
        '• Inicio de sesión con Google: si usas Google para iniciar sesión, recibimos tu correo electrónico de Google, nombre para mostrar y foto de perfil. No recibimos tu contraseña de Google.',
  ),
  PolicySection(
    heading: 'Cómo Usamos Tus Datos',
    body: '• Crear y mantener tu cuenta y perfil.\n'
        '• Mostrarte negocios cercanos, promociones y resultados de búsqueda personalizados.\n'
        '• Gestionar reservaciones entre clientes y negocios.\n'
        '• Enviarte notificaciones en la app sobre reservaciones y actividad comunitaria.\n'
        '• Permitir que los gestores de negocios administren sus listados, menús y promociones.\n'
        '• Generar texto promocional asistido por IA (solo gestores — tus prompts se envían a OpenAI).\n'
        '• Generar imágenes promocionales con IA (solo gestores — tus prompts se envían a Replicate).\n'
        '• Mejorar la estabilidad de la app mediante informes de fallos y analítica anónima.\n'
        '• Proporcionar a los gestores de negocios informes de interacción anonimizados (vistas de perfil, uso de funciones, tasa de conversión de reservaciones) derivados de interacciones agregadas de usuarios con su listado, para ayudarles a evaluar y mejorar el rendimiento de su negocio.\n'
        '• Cumplir con las obligaciones legales aplicables.\n'
        '• Atender tus solicitudes de soporte.\n\n'
        'NO usamos tus datos para perfilado publicitario, NO vendemos tus datos a terceros, y NO aplicamos toma de decisiones automatizada que tenga efectos jurídicos sobre ti.',
  ),
  PolicySection(
    heading: 'Datos de Negocio y Cuentas Manager',
    body: 'Cuando registras un negocio en Foodly y te conviertes en Manager, recopilamos y procesamos datos adicionales específicos de las operaciones del negocio.\n\n'
        'DATOS DE NEGOCIO RECOPILADOS\n\n'
        '• Información de identidad del negocio: razón social, nombre comercial, dirección, categoría, canales de contacto y horarios.\n'
        '• Medios del negocio: logotipo, imágenes de portada, fotos de menú y contenido promocional.\n'
        '• Datos operativos: menús, precios, configuración de reservaciones y descripciones de servicios.\n'
        '• Métricas de interacción: datos de interacción agregados y anonimizados (vistas de perfil, uso de funciones, tasa de conversión de reservaciones) derivados de las interacciones de los usuarios con tu listado.\n\n'
        'DOCUMENTOS DE VERIFICACIÓN DE IDENTIDAD\n\n'
        'Foodly puede solicitar prueba documental de tu autoridad para representar un negocio. Los documentos que se pueden solicitar incluyen: certificados de registro mercantil, números de identificación fiscal, contratos de arrendamiento o poderes notariales. Estos documentos se utilizan únicamente para verificar tu relación con el negocio y se almacenan de forma segura. Los documentos de verificación se conservan solo durante el tiempo necesario para completar la verificación y se eliminan dentro de los 90 días posteriores a la verificación exitosa, salvo que la ley requiera su retención.\n\n'
        'RETENCIÓN DE DATOS DE NEGOCIO\n\n'
        'Los datos del perfil del negocio (nombre, descripción, menús, medios) se conservan mientras el listado del negocio esté activo. Cuando un negocio se desactiva o elimina:\n\n'
        '• Los medios del negocio (logotipo, imágenes) se eliminan del almacenamiento en la nube.\n'
        '• Los datos del perfil del negocio se anonimizan.\n'
        '• Los registros históricos de reservaciones se conservan en forma anonimizada por integridad de datos.\n'
        '• Las métricas de interacción, que ya son anónimas, pueden conservarse con fines analíticos.\n\n'
        'MANEJO DE DATOS ESPECÍFICO PARA MANAGERS\n\n'
        'Como Manager, tus datos personales (nombre, correo, teléfono) están vinculados a tu(s) listado(s) de negocio. Si eliminas tu cuenta personal, tus negocios también se desactivan y el proceso de anonimización descrito anteriormente se aplica tanto a tus datos personales como a los del negocio.',
  ),
  PolicySection(
    heading: 'Bases Legales del Tratamiento (RGPD)',
    body:
        '• Ejecución de un contrato: tratamiento necesario para prestar los servicios principales de la App (creación de cuenta, búsqueda, reservaciones, gestión de negocios).\n'
        '• Interés legítimo: mejorar la estabilidad de la app, prevenir fraudes y mantener la seguridad — siempre equilibrado con tus intereses de privacidad.\n'
        '• Consentimiento: acceso a ubicación precisa, micrófono, cámara y reconocimiento de voz. Puedes retirar cualquier consentimiento en cualquier momento desde la configuración del dispositivo o contactándonos.\n'
        '• Obligación legal: cuando lo exija la legislación aplicable en los países donde operamos.',
  ),
  PolicySection(
    heading: 'Servicios de Terceros',
    body:
        'Utilizamos los siguientes servicios de terceros. Cada uno actúa como encargado del tratamiento bajo nuestras instrucciones y está sujeto a acuerdos de protección de datos:\n\n'
        '• Google LLC (Firebase, Google Cloud, Maps, Places): autenticación, almacenamiento en la nube, analítica, informes de fallos, visualización de mapas y autocompletado de direcciones. Datos almacenados en la UE. Política de privacidad de Google: policies.google.com/privacy\n\n'
        '• OpenAI (API de ChatGPT): los gestores de negocios pueden usar herramientas de IA para generar texto promocional. Los prompts de texto que introduces se envían a OpenAI. Política de privacidad de OpenAI: openai.com/privacy\n\n'
        '• Replicate: generación de imágenes con IA para contenido promocional. Los prompts de imagen se envían a Replicate para su procesamiento. Política de privacidad de Replicate: replicate.com/privacy\n\n'
        '• Servicio de búsqueda inteligente: un microservicio de búsqueda operado por un colaborador técnico de confianza que procesa tu consulta de búsqueda, ubicación aproximada e identificador de sesión anónimo para devolver resultados relevantes. Este servicio no conserva datos personales más allá de la duración de la solicitud de búsqueda.\n\n'
        '• Procesadores de pago (función futura): cuando las funciones de pago estén disponibles, las transacciones serán procesadas por Mercado Pago y/o Stripe. Foodly NO almacena datos de tarjetas de pago, números de cuenta bancaria ni número de identificación fiscal. Toda la información de pago fluye directamente al procesador de pagos bajo sus propios términos de privacidad.\n\n'
        'No compartimos tus datos personales con anunciantes, intermediarios de datos ni con otros usuarios, más allá de lo que tú elijas hacer visible públicamente.',
  ),
  PolicySection(
    heading: 'Almacenamiento, Retención y Seguridad',
    body: '• Ubicación de almacenamiento: Unión Europea — Google Cloud, Bélgica (europe-west1).\n'
        '• Período de retención: conservamos tus datos mientras tu cuenta esté activa. Cuando eliminas tu cuenta, tu información personal identificable (nombre, correo, teléfono, foto) se anonimiza de inmediato y tus tokens de sesión se revocan. Los registros anonimizados pueden conservarse por razones de integridad legal (ej., historial de reservaciones) pero no pueden atribuirse a ti.\n'
        '• Medidas de seguridad: todos los datos en tránsito están cifrados con TLS/HTTPS; las contraseñas se almacenan con hash criptográfico (bcrypt); las sesiones de API utilizan tokens de corta duración; los archivos multimedia se almacenan en buckets de Google Cloud Storage con controles de acceso.\n'
        '• Los datos biométricos (huella dactilar / Face ID) se procesan únicamente en tu dispositivo y nunca se transmiten.\n'
        '• En caso de brecha de datos personales, notificaremos a los usuarios afectados y a la autoridad supervisora competente en un plazo de 72 horas, conforme al RGPD.',
  ),
  PolicySection(
    heading: 'Tus Derechos',
    body: 'Según tu ubicación, tienes derecho a:\n\n'
        '• Acceso: solicitar una copia de tus datos personales.\n'
        '• Rectificación: corregir datos inexactos o incompletos (a través de la configuración de Perfil en la App).\n'
        '• Supresión ("derecho al olvido"): eliminar tu cuenta directamente en la App (Perfil → Eliminar cuenta) o escribiéndonos.\n'
        '• Limitación del tratamiento: solicitar que limitemos el uso de tus datos en ciertas circunstancias.\n'
        '• Portabilidad: recibir tus datos en un formato estructurado y legible por máquina.\n'
        '• Oposición: oponerte al tratamiento basado en interés legítimo.\n'
        '• Retirar el consentimiento: revocar el acceso a ubicación, micrófono, cámara o analítica en cualquier momento desde la configuración del dispositivo.\n'
        '• No ser objeto de decisiones automatizadas: no ser sujeto de decisiones basadas únicamente en tratamiento automatizado que produzcan efectos jurídicos o significativos.\n'
        '• Presentar una reclamación: ante la autoridad de protección de datos de tu país (ver sección de Contacto).\n\n'
        'Estos derechos aplican según el RGPD (UE/EEE — Portugal, España), CCPA (California, EE.UU.), Ley 25.326 (Argentina), LOPDP (Venezuela), LPDP (El Salvador, Decreto 534) y leyes equivalentes en otras jurisdicciones.\n\n'
        'Para ejercer cualquiera de estos derechos, contáctanos en: privacy@foodly.solutions. Responderemos en un plazo de 30 días.',
  ),
  PolicySection(
    heading: 'Eliminación de Cuenta y Datos',
    body: 'Puedes eliminar tu cuenta en cualquier momento directamente desde la App:\n\n'
        '1. Abre la App → ve a tu Perfil.\n'
        '2. Desplázate hacia abajo → toca "Eliminar cuenta".\n'
        '3. Confirma la acción.\n\n'
        'Qué ocurre cuando eliminas tu cuenta:\n\n'
        '• Tu nombre, correo electrónico, número de teléfono y foto de perfil se anonimizan de inmediato.\n'
        '• Todos tus negocios activos se desactivan.\n'
        '• Tus tokens de autenticación se revocan de inmediato — tu sesión se cierra en todos los dispositivos.\n'
        '• El registro anonimizado puede conservarse para preservar la integridad de los datos históricos (ej., historial de reservaciones de negocios) pero no puede atribuirse a ti.\n\n'
        'También puedes solicitar la eliminación por correo electrónico: privacy@foodly.solutions. Procesaremos tu solicitud en un plazo de 30 días.',
  ),
  PolicySection(
    heading: 'Privacidad de los Menores',
    body:
        'Foodly no está dirigida a menores de 13 años (ni menores de 16 en la UE/EEE según el RGPD). No recopilamos conscientemente datos personales de menores. Si descubrimos que hemos recopilado datos de un menor sin consentimiento parental verificado, los eliminaremos de inmediato.\n\n'
        'Si eres padre, madre o tutor y crees que tu hijo ha proporcionado datos personales a Foodly, contáctanos en privacy@foodly.solutions.',
  ),
  PolicySection(
    heading: 'Transferencias Internacionales de Datos',
    body:
        'Tus datos se almacenan en la Unión Europea (Bélgica). Si accedes a Foodly desde fuera de la UE — incluyendo Argentina, Venezuela, Estados Unidos o El Salvador — tus datos se transfieren a y se procesan dentro de la UE.\n\n'
        'Dichas transferencias cumplen con la normativa aplicable de protección de datos. La UE es reconocida como garante de un nivel adecuado de protección de datos bajo el RGPD.\n\n'
        'Para usuarios en California (EE.UU.): Foodly no vende información personal según lo definido por la Ley de Privacidad del Consumidor de California (CCPA). Los residentes de California tienen derecho a conocer, eliminar y optar por no participar en la venta de información personal (lo cual no aplica aquí ya que no vendemos datos).',
  ),
  PolicySection(
    heading: 'Cambios en Esta Política',
    body:
        'Podemos actualizar esta Política de Privacidad periódicamente. Cuando realicemos cambios significativos, te notificaremos a través de la App o por correo electrónico. La fecha de "Última actualización" en la parte superior refleja la revisión más reciente.\n\n'
        'El uso continuado de la App después de publicados los cambios constituye la aceptación de la Política revisada.',
  ),
  PolicySection(
    heading: 'Contacto',
    body: 'Para consultas, reclamaciones o solicitudes relacionadas con tus datos:\n\n'
        'Foodly — Equipo de Privacidad\n'
        'Correo electrónico: privacy@foodly.solutions\n\n'
        'Para residentes en Portugal / UE: si no estás satisfecho/a con nuestra respuesta, tienes derecho a presentar una reclamación ante la autoridad portuguesa de protección de datos:\n'
        'Comissão Nacional de Proteção de Dados (CNPD) — www.cnpd.pt\n\n'
        'Para residentes en España: Agencia Española de Protección de Datos (AEPD) — www.aepd.es\n\n'
        'Para residentes en Argentina: Agencia de Acceso a la Información Pública (AAIP) — www.argentina.gob.ar/aaip\n\n'
        'Para residentes en Venezuela: Comisión Nacional de Telecomunicaciones (CONATEL) — www.conatel.gob.ve\n\n',
  ),
];

// ──────────────────────────────────────────────────────────────────────────────
// PORTUGUESE
// ──────────────────────────────────────────────────────────────────────────────
const _pt = [
  PolicySection(
    heading: 'Introdução',
    body:
        'A Foodly é uma plataforma que liga utilizadores a negócios gastronómicos locais, restaurantes e serviços relacionados. Esta Política de Privacidade explica como recolhemos, utilizamos, armazenamos e protegemos as suas informações pessoais quando utiliza a aplicação móvel Foodly ("App").\n\n'
        'Ao utilizar a Foodly, aceita esta Política de Privacidade. Se não concordar, por favor deixe de utilizar a App e elimine a sua conta.\n\n'
        'Última atualização: 13 de abril de 2026',
  ),
  PolicySection(
    heading: 'Quem Somos (Responsável pelo Tratamento)',
    body:
        'A Foodly é operada por Hector Waldman, operador comercial independente com atividade registada em Portugal (NIF disponível mediante pedido). A nossa infraestrutura está alojada na União Europeia (Google Cloud, região: europe-west1 — Bélgica).\n\n'
        'Contacto de privacidade: privacy@foodly.solutions\n\n'
        'Enquanto operador sediado em Portugal, cumprimos o Regulamento Geral sobre a Proteção de Dados (RGPD) e as leis de proteção de dados aplicáveis em todos os mercados onde a App está disponível.',
  ),
  PolicySection(
    heading: 'Que Dados Recolhemos',
    body: 'DADOS QUE FORNECE DIRETAMENTE\n\n'
        '• Dados de conta: nome completo, nome de utilizador, endereço de e-mail, número de telefone, data de nascimento, género.\n'
        '• Credenciais de segurança: a sua palavra-passe é armazenada como hash criptográfico e nunca é legível por nós ou por terceiros. Os dados biométricos (impressão digital, Face ID) são processados exclusivamente no seu dispositivo e nunca são transmitidos para os nossos servidores.\n'
        '• Fotografia de perfil: armazenada na nossa cloud segura.\n'
        '• Dados de morada: país, cidade, código postal e, opcionalmente, coordenadas GPS das moradas guardadas.\n'
        '• Dados de negócio (apenas gestores): nome, descrição, categoria, morada, horários, canais de contacto, serviços, logótipo, imagens de capa, menus e conteúdo promocional.\n'
        '• Avaliações: texto, classificação e data de visita que submete sobre os negócios.\n'
        '• Reservas: data, hora, número de pessoas e quaisquer pedidos especiais ou notas.\n'
        '• Conteúdo da comunidade: publicações, comentários e multimédia que partilha no feed comunitário.\n\n'
        'DADOS RECOLHIDOS AUTOMATICAMENTE\n\n'
        '• Localização precisa (GPS): com a sua permissão explícita, para mostrar negócios próximos e personalizar resultados. As coordenadas são transmitidas em pedidos baseados em localização e podem ser guardadas se guardar uma morada. A localização só é acedida enquanto a app está em uso; pode revogar esta permissão a qualquer momento nas definições do dispositivo.\n'
        '• Voz e áudio: com a sua permissão, para pesquisa por voz. O áudio é transcrito e a consulta de texto resultante é enviada para o nosso serviço de pesquisa. Não são armazenadas gravações de áudio nos nossos servidores.\n'
        '• Informações do dispositivo: versão da app, sistema operativo e modelo do dispositivo — enviados com pedidos de pesquisa para melhorar a relevância dos resultados.\n'
        '• Dados de falhas e diagnóstico: relatórios técnicos de erros via Firebase Crashlytics para identificar e corrigir problemas. Estes dados não o identificam pessoalmente.\n'
        '• Análise de utilização: interações anónimas com a app via Firebase Analytics para compreender padrões de utilização e melhorar a App. Pode desativar via definições do dispositivo.\n'
        '• Análise comportamental própria: eventos de interação anonimizados (visualizações de ecrã, utilização de funcionalidades, duração da sessão) são enviados para os servidores da Foodly para gerar relatórios de desempenho e engagement apresentados aos gestores de negócios. Estes eventos não contêm informação de identificação pessoal.\n\n'
        'DADOS DE AUTENTICAÇÃO COM TERCEIROS\n\n'
        '• Início de sessão com Google: se iniciar sessão com o Google, recebemos o seu e-mail Google, nome de apresentação e fotografia de perfil. Não recebemos a sua palavra-passe Google.',
  ),
  PolicySection(
    heading: 'Como Utilizamos os Seus Dados',
    body: '• Criar e manter a sua conta e perfil.\n'
        '• Mostrar-lhe negócios próximos, promoções e resultados de pesquisa personalizados.\n'
        '• Gerir reservas entre clientes e negócios.\n'
        '• Enviar notificações in-app sobre reservas e atividade comunitária.\n'
        '• Permitir que os gestores de negócios administrem os seus espaços, menus e promoções.\n'
        '• Gerar texto promocional assistido por IA (apenas gestores — os seus prompts são enviados para a OpenAI).\n'
        '• Gerar imagens promocionais com IA (apenas gestores — os seus prompts são enviados para a Replicate).\n'
        '• Melhorar a estabilidade da app através de relatórios de falhas e análise anónima.\n'
        '• Fornecer aos gestores de negócios relatórios de interação anonimizados (visualizações de perfil, utilização de funcionalidades, taxa de conversão de reservas) derivados de interações agregadas de utilizadores com a sua listagem, para os ajudar a avaliar e melhorar o desempenho do seu negócio.\n'
        '• Cumprir as obrigações legais aplicáveis.\n'
        '• Responder aos seus pedidos de suporte.\n\n'
        'NÃO utilizamos os seus dados para criação de perfis publicitários, NÃO vendemos os seus dados a terceiros e NÃO aplicamos tomada de decisão automatizada com efeitos jurídicos sobre si.',
  ),
  PolicySection(
    heading: 'Dados de Negócio e Contas Manager',
    body: 'Quando regista um negócio na Foodly e se torna Manager, recolhemos e processamos dados adicionais específicos das operações do negócio.\n\n'
        'DADOS DE NEGÓCIO RECOLHIDOS\n\n'
        '• Informação de identidade do negócio: denominação social, nome comercial, morada, categoria, canais de contacto e horários.\n'
        '• Multimédia do negócio: logótipo, imagens de capa, fotografias de menus e conteúdo promocional.\n'
        '• Dados operacionais: menus, preços, configurações de reservas e descrições de serviços.\n'
        '• Métricas de interação: dados de interação agregados e anonimizados (visualizações de perfil, utilização de funcionalidades, taxa de conversão de reservas) derivados das interações dos utilizadores com a sua listagem.\n\n'
        'DOCUMENTOS DE VERIFICAÇÃO DE IDENTIDADE\n\n'
        'A Foodly pode solicitar prova documental da sua autoridade para representar um negócio. Os documentos que podem ser solicitados incluem: certidões de registo comercial, números de identificação fiscal, contratos de arrendamento ou procurações. Estes documentos são utilizados exclusivamente para verificar a sua relação com o negócio e são armazenados de forma segura. Os documentos de verificação são conservados apenas durante o tempo necessário para concluir a verificação e são eliminados no prazo de 90 dias após a verificação bem-sucedida, salvo se a lei exigir a sua retenção.\n\n'
        'RETENÇÃO DE DADOS DE NEGÓCIO\n\n'
        'Os dados do perfil do negócio (nome, descrição, menus, multimédia) são conservados enquanto a listagem do negócio estiver ativa. Quando um negócio é desativado ou eliminado:\n\n'
        '• A multimédia do negócio (logótipo, imagens) é eliminada do armazenamento cloud.\n'
        '• Os dados do perfil do negócio são anonimizados.\n'
        '• Os registos históricos de reservas são conservados em formato anonimizado por integridade dos dados.\n'
        '• As métricas de interação, que já são anónimas, podem ser conservadas para fins analíticos.\n\n'
        'TRATAMENTO DE DADOS ESPECÍFICO PARA MANAGERS\n\n'
        'Enquanto Manager, os seus dados pessoais (nome, e-mail, telefone) estão associados à(s) sua(s) listagem(ns) de negócio. Se eliminar a sua conta pessoal, os seus negócios são também desativados e o processo de anonimização descrito acima aplica-se tanto aos seus dados pessoais como aos do negócio.',
  ),
  PolicySection(
    heading: 'Bases Legais do Tratamento (RGPD)',
    body:
        '• Execução de um contrato: tratamento necessário para prestar os serviços principais da App (criação de conta, pesquisa, reservas, gestão de negócios).\n'
        '• Interesses legítimos: melhorar a estabilidade da app, prevenir fraudes e manter a segurança — sempre ponderados com os seus interesses de privacidade.\n'
        '• Consentimento: acesso a localização precisa, microfone, câmara e reconhecimento de voz. Pode retirar qualquer consentimento a qualquer momento nas definições do dispositivo ou contactando-nos.\n'
        '• Obrigação legal: quando exigido pela legislação aplicável nos países onde operamos.',
  ),
  PolicySection(
    heading: 'Serviços de Terceiros',
    body:
        'Utilizamos os seguintes serviços de terceiros. Cada um atua como subcontratante sob as nossas instruções e está vinculado por acordos de proteção de dados:\n\n'
        '• Google LLC (Firebase, Google Cloud, Maps, Places): autenticação, armazenamento na cloud, análise, relatórios de falhas, mapas e autocompletar moradas. Dados armazenados na UE. Política de privacidade da Google: policies.google.com/privacy\n\n'
        '• OpenAI (API ChatGPT): os gestores de negócios podem usar ferramentas de IA para gerar texto promocional. Os prompts de texto que introduz são enviados para a OpenAI. Política de privacidade da OpenAI: openai.com/privacy\n\n'
        '• Replicate: geração de imagens com IA para conteúdo promocional. Os prompts de imagem são enviados para a Replicate. Política de privacidade da Replicate: replicate.com/privacy\n\n'
        '• Serviço de pesquisa inteligente: um microserviço de pesquisa operado por um colaborador técnico de confiança que processa a sua consulta de pesquisa, localização aproximada e identificador de sessão anónimo para devolver resultados relevantes. Este serviço não retém dados pessoais para além da duração do pedido de pesquisa.\n\n'
        '• Processadores de pagamento (funcionalidade futura): quando as funcionalidades de pagamento estiverem disponíveis, as transações serão processadas pelo Mercado Pago e/ou Stripe. A Foodly NÃO armazena dados de cartões de pagamento, números de conta bancária nem números de identificação fiscal. Toda a informação de pagamento flui diretamente para o processador de pagamentos ao abrigo dos seus próprios termos de privacidade.\n\n'
        'Não partilhamos os seus dados pessoais com anunciantes, intermediários de dados ou outros utilizadores, para além do que escolher tornar publicamente visível.',
  ),
  PolicySection(
    heading: 'Armazenamento, Retenção e Segurança',
    body: '• Localização de armazenamento: União Europeia — Google Cloud, Bélgica (europe-west1).\n'
        '• Período de retenção: conservamos os seus dados enquanto a sua conta estiver ativa. Quando elimina a sua conta, as suas informações pessoais identificáveis (nome, e-mail, telefone, foto) são anonimizadas imediatamente e os seus tokens de sessão são revogados. Os registos anonimizados podem ser conservados por razões de integridade legal (ex.: histórico de reservas) mas não podem ser atribuídos a si.\n'
        '• Medidas de segurança: todos os dados em trânsito são cifrados com TLS/HTTPS; as palavras-passe são armazenadas com hash criptográfico (bcrypt); as sessões de API usam tokens de curta duração; os ficheiros multimédia são armazenados em buckets do Google Cloud Storage com controlos de acesso.\n'
        '• Os dados biométricos (impressão digital / Face ID) são processados exclusivamente no seu dispositivo e nunca são transmitidos.\n'
        '• Em caso de violação de dados pessoais, notificaremos os utilizadores afetados e a autoridade supervisora competente no prazo de 72 horas, conforme exigido pelo RGPD.',
  ),
  PolicySection(
    heading: 'Os Seus Direitos',
    body: 'Dependendo da sua localização, tem direito a:\n\n'
        '• Acesso: solicitar uma cópia dos seus dados pessoais.\n'
        '• Retificação: corrigir dados inexatos ou incompletos (nas definições de Perfil na App).\n'
        '• Apagamento ("direito a ser esquecido"): eliminar a sua conta diretamente na App (Perfil → Eliminar conta) ou contactando-nos.\n'
        '• Limitação do tratamento: solicitar que limitemos a utilização dos seus dados em determinadas circunstâncias.\n'
        '• Portabilidade: receber os seus dados num formato estruturado e legível por máquina.\n'
        '• Oposição: opor-se ao tratamento baseado em interesses legítimos.\n'
        '• Retirar o consentimento: revogar o acesso a localização, microfone, câmara ou análise a qualquer momento nas definições do dispositivo.\n'
        '• Não ser sujeito a decisões automatizadas com efeitos jurídicos ou significativos.\n'
        '• Apresentar reclamação: junto da autoridade de proteção de dados do seu país (ver secção de Contacto).\n\n'
        'Estes direitos aplicam-se ao abrigo do RGPD (UE/EEE — Portugal, Espanha), CCPA (Califórnia, EUA), Lei 25.326 (Argentina), LOPDP (Venezuela), LPDP (El Salvador, Decreto 534) e leis equivalentes noutras jurisdições.\n\n'
        'Para exercer qualquer um destes direitos, contacte: privacy@foodly.solutions. Responderemos no prazo de 30 dias.',
  ),
  PolicySection(
    heading: 'Eliminação de Conta e Dados',
    body: 'Pode eliminar a sua conta a qualquer momento diretamente na App:\n\n'
        '1. Abra a App → vá ao seu Perfil.\n'
        '2. Deslize para baixo → toque em "Eliminar conta".\n'
        '3. Confirme a ação.\n\n'
        'O que acontece quando elimina a sua conta:\n\n'
        '• O seu nome, endereço de e-mail, número de telefone e fotografia de perfil são anonimizados imediatamente.\n'
        '• Todos os seus negócios ativos são desativados.\n'
        '• Os seus tokens de autenticação são revogados imediatamente — a sessão é encerrada em todos os dispositivos.\n'
        '• O registo anonimizado pode ser conservado para preservar a integridade dos dados históricos (ex.: histórico de reservas de negócios) mas não pode ser atribuído a si.\n\n'
        'Pode também solicitar a eliminação por e-mail: privacy@foodly.solutions. Processaremos o seu pedido no prazo de 30 dias.',
  ),
  PolicySection(
    heading: 'Privacidade de Menores',
    body:
        'A Foodly não é dirigida a menores de 13 anos (nem a menores de 16 na UE/EEE ao abrigo do RGPD). Não recolhemos conscientemente dados pessoais de menores. Se descobrirmos que recolhemos dados de um menor sem consentimento parental verificado, eliminaremos esses dados prontamente.\n\n'
        'Se for pai, mãe ou tutor/a e acreditar que o seu filho forneceu dados pessoais à Foodly, contacte-nos em privacy@foodly.solutions.',
  ),
  PolicySection(
    heading: 'Transferências Internacionais de Dados',
    body:
        'Os seus dados são armazenados na União Europeia (Bélgica). Se aceder à Foodly fora da UE — incluindo Argentina, Venezuela, Estados Unidos ou El Salvador — os seus dados são transferidos e processados dentro da UE.\n\n'
        'Tais transferências cumprem a legislação aplicável de proteção de dados. A UE é reconhecida como garante de um nível adequado de proteção de dados ao abrigo do RGPD.\n\n'
        'Para utilizadores na Califórnia (EUA): a Foodly não vende informações pessoais conforme definido pela Lei de Privacidade do Consumidor da Califórnia (CCPA). Os residentes da Califórnia têm o direito de conhecer, eliminar e recusar a venda de informações pessoais (o que não se aplica aqui, pois não vendemos dados).',
  ),
  PolicySection(
    heading: 'Alterações a Esta Política',
    body:
        'Podemos atualizar esta Política de Privacidade periodicamente. Quando fizermos alterações significativas, notificá-lo-emos através da App ou por e-mail. A data de "Última atualização" no topo desta página reflete a revisão mais recente.\n\n'
        'A utilização continuada da App após a publicação de alterações constitui aceitação da Política revista.',
  ),
  PolicySection(
    heading: 'Contacto',
    body: 'Para questões, preocupações ou pedidos relacionados com os seus dados:\n\n'
        'Foodly — Equipa de Privacidade\n'
        'E-mail: privacy@foodly.solutions\n\n'
        'Para residentes em Portugal / UE: se não estiver satisfeito/a com a nossa resposta, tem o direito de apresentar uma reclamação junto da autoridade portuguesa de proteção de dados:\n'
        'Comissão Nacional de Proteção de Dados (CNPD) — www.cnpd.pt\n\n'
        'Para residentes em Espanha: Agencia Española de Protección de Datos (AEPD) — www.aepd.es\n\n'
        'Para residentes na Argentina: Agencia de Acceso a la Información Pública (AAIP) — www.argentina.gob.ar/aaip\n\n'
        'Para residentes na Venezuela: Comisión Nacional de Telecomunicaciones (CONATEL) — www.conatel.gob.ve\n\n',
  ),
];
