// ignore_for_file: lines_longer_than_80_chars

class TermsSection {
  const TermsSection({required this.heading, required this.body});
  final String heading;
  final String body;
}

List<TermsSection> buildTermsContent(String langCode) {
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
  TermsSection(
    heading: 'Acceptance of Terms',
    body: 'Welcome to Foodly. By downloading, installing, or using the Foodly mobile application ("App"), you agree to be bound by these Terms and Conditions ("Terms"). If you do not agree to these Terms, do not use the App.\n\n'
        'These Terms constitute a legally binding agreement between you and Hector Waldman ("Foodly", "we", "us", "our"), an independent commercial operator based in Portugal.\n\n'
        'Last updated: May 21, 2026',
  ),
  TermsSection(
    heading: 'Description of the Service',
    body: 'Foodly is a platform that connects users with local food businesses, restaurants, and gastronomy-related services. The App allows you to:\n\n'
        '• Discover nearby food businesses using GPS-based search.\n'
        '• Search for businesses using text or voice queries in multiple languages.\n'
        '• View business profiles, menus, promotions, and opening hours.\n'
        '• Make and manage table reservations at participating businesses.\n'
        '• Leave reviews and ratings for businesses you have visited.\n'
        '• Follow businesses and receive updates about their activity.\n'
        '• Participate in a community feed by creating and sharing posts.\n'
        '• Request catering and private-chef services, receive quotes, and exchange messages with the provider.\n'
        '• Register and manage your own food business (Manager accounts).\n\n'
        'Foodly is a technology platform and does not prepare, sell, or deliver food. We are not responsible for the quality, safety, accuracy of descriptions, pricing, or availability of any product or service offered by businesses listed on the App.',
  ),
  TermsSection(
    heading: 'User Accounts',
    body: 'REGISTRATION\n\n'
        'To use most features of the App, you must create an account by providing your full name, username, email address, and password. You may also register using Google Sign-In.\n\n'
        'You must be at least 13 years old (or 16 in the EU/EEA) to create an account. By registering, you confirm that the information you provide is accurate and complete.\n\n'
        'ACCOUNT SECURITY\n\n'
        'You are responsible for maintaining the confidentiality of your account credentials and for all activity that occurs under your account. Notify us immediately at privacy@foodly.solutions if you suspect unauthorised use.\n\n'
        'ACCOUNT TYPES\n\n'
        '• Customer: the default role. Allows discovery, reviews, reservations, and community participation.\n'
        '• Manager: granted automatically when a Customer creates a business listing. Allows full business management.',
  ),
  TermsSection(
    heading: 'Business Listings (Manager Accounts)',
    body: 'If you register a business on Foodly, you represent and warrant that:\n\n'
        '• You are the legal owner, operator, or an authorised representative of the business with documented authority to act on its behalf.\n'
        '• All information you provide (name, address, category, hours, menus, prices, photos) is accurate and up to date.\n'
        '• You will keep your business profile current and promptly update any changes.\n'
        '• Your business complies with all applicable local laws and regulations.\n'
        '• The business identity you claim is genuine and has not been fabricated, impersonated, or usurped from another entity.\n\n'
        'IDENTITY VERIFICATION & ANTI-FRAUD\n\n'
        'Foodly may, at any time, request documentary proof of your authority to represent a business (e.g., business registration certificate, tax identification, lease agreement, or power of attorney). Failure to provide adequate documentation within the requested timeframe may result in immediate suspension of the business listing.\n\n'
        'The following activities are strictly prohibited and may result in immediate and permanent account termination:\n\n'
        '• Registering a business you do not own or operate (identity usurpation).\n'
        '• Impersonating another business, brand, or establishment.\n'
        '• Uploading false documentation to claim business ownership.\n'
        '• Creating duplicate listings of an existing business to mislead users.\n\n'
        'If you believe your business has been fraudulently listed by an unauthorised third party, contact us immediately at privacy@foodly.solutions with supporting documentation.\n\n'
        'Foodly reserves the right to remove or suspend any business listing that contains false or misleading information.\n\n'
        'REGARDING RESERVATIONS\n\n'
        'By enabling reservations, you agree to honour confirmed bookings in good faith. Foodly is not liable for disputes between customers and businesses regarding reservations or no-shows.\n\n'
        'ANALYTICS & BUSINESS INSIGHTS\n\n'
        'As a Manager, you will have access to anonymised engagement metrics about your business listing — such as profile views, feature interactions, and reservation conversion rates. These metrics are derived from aggregated, anonymised interactions of Foodly users with your listing and do not identify individual users. Metrics are indicative only; Foodly does not guarantee any specific level of visibility, traffic, or business performance.',
  ),
  TermsSection(
    heading: 'Reservation System',
    body: 'FOR CUSTOMERS\n\n'
        '• Reservations are subject to business confirmation — a pending reservation is not a guaranteed booking.\n'
        '• You may cancel a pending or confirmed reservation through the App.\n'
        '• Repeated no-shows may result in account restrictions.\n\n'
        'FOR MANAGERS\n\n'
        '• You may confirm, reject, or cancel reservations through the App.\n'
        '• Notify customers of any changes with reasonable advance notice.\n\n'
        'Foodly acts solely as a communication intermediary and accepts no liability for disputes, losses, or damages arising from reservations or their cancellation.',
  ),
  TermsSection(
    heading: 'Community Content & Reviews',
    body: 'The App allows you to submit reviews, ratings, posts, comments, and photos ("User Content").\n\n'
        'BY SUBMITTING USER CONTENT, YOU:\n'
        '• Grant Foodly a non-exclusive, worldwide, royalty-free licence to display, distribute, and promote your content within the App.\n'
        '• Confirm that you own or have the right to share the content.\n'
        '• Accept full responsibility for the content you publish.\n\n'
        'YOU MUST NOT POST CONTENT THAT:\n'
        '• Is false, defamatory, abusive, threatening, or discriminatory.\n'
        '• Infringes any third-party intellectual property rights.\n'
        '• Contains personal data of third parties without their consent.\n'
        '• Promotes illegal activity or is spam.\n\n'
        'Foodly reserves the right to remove any User Content that violates these Terms without prior notice.',
  ),
  TermsSection(
    heading: 'AI-Powered Features',
    body: 'Foodly offers AI-assisted tools exclusively for Manager accounts:\n\n'
        '• AI Text Generation: promotional descriptions generated via the OpenAI API. Your prompts are processed by OpenAI under their terms (openai.com/terms).\n'
        '• AI Image Generation: promotional images generated via the Replicate API. Your prompts are processed by Replicate under their terms (replicate.com/terms).\n'
        '• AI Menu Digitization: menu photos you upload are processed by Google\'s Gemini AI to automatically extract dishes and prices, under Google\'s terms of service (policies.google.com/terms).\n\n'
        'You are solely responsible for reviewing and approving all AI-generated content before publishing. Foodly does not guarantee the accuracy, appropriateness, or originality of AI-generated output. Do not submit sensitive personal data as part of AI prompts.',
  ),
  TermsSection(
    heading: 'Prohibited Conduct',
    body: 'You agree not to:\n\n'
        '• Use the App for any unlawful purpose or in violation of applicable law.\n'
        '• Impersonate any person or entity or misrepresent your affiliation.\n'
        '• Upload malware, viruses, or any harmful code.\n'
        '• Attempt to gain unauthorised access to any part of the App or its infrastructure.\n'
        '• Scrape or systematically extract data without written permission.\n'
        '• Interfere with or disrupt the integrity or performance of the App.\n'
        '• Send unsolicited commercial communications (spam).\n'
        '• Create multiple accounts to circumvent a suspension or ban.\n'
        '• Manipulate ratings or reviews (fake reviews, review bombing).',
  ),
  TermsSection(
    heading: 'Intellectual Property',
    body: 'All intellectual property rights in the App — including the Foodly name, logo, design, software, and original content — are owned by or licensed to Foodly. Nothing in these Terms grants you any right to use Foodly\'s intellectual property beyond normal use of the App.\n\n'
        'Business names, logos, menu images, and other content uploaded by managers remain the property of their respective owners. By uploading such content, managers grant Foodly a licence to display it within the App.\n\n'
        'If you believe content on the App infringes your intellectual property rights, contact us at privacy@foodly.solutions.',
  ),
  TermsSection(
    heading: 'Payments (Future Feature)',
    body: 'Foodly does not currently process payments for food orders or reservations. When payment functionality becomes available:\n\n'
        '• Payments will be processed by Mercado Pago and/or Stripe.\n'
        '• Foodly does not store payment card numbers, bank account details, or tax identification numbers.\n'
        '• All transactions will be subject to the payment processor\'s own terms.\n'
        '• Refund and dispute policies will be detailed at launch.\n\n'
        'Any pricing displayed within the App is provided by business managers. Foodly is not responsible for pricing errors.',
  ),
  TermsSection(
    heading: 'Disclaimer of Warranties',
    body: 'THE APP IS PROVIDED "AS IS" AND "AS AVAILABLE" WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED.\n\n'
        'Foodly does not warrant that:\n'
        '• The App will be uninterrupted or error-free.\n'
        '• Business information (menus, prices, hours, availability) is accurate or current.\n'
        '• Search results will be complete or relevant to your needs.\n\n'
        'Your use of the App and reliance on any content is at your own risk.',
  ),
  TermsSection(
    heading: 'Limitation of Liability',
    body: 'To the maximum extent permitted by applicable law, Foodly shall not be liable for:\n\n'
        '• Any indirect, incidental, special, or consequential damages.\n'
        '• Loss of profits, revenue, data, or business opportunities.\n'
        '• Damages arising from reliance on information provided by third-party businesses.\n'
        '• Disputes between customers and businesses regarding reservations or service.\n'
        '• Any interruption or unavailability of the App.\n\n'
        'Where liability cannot be excluded by law (including Portuguese consumer law, Argentine Ley 24.240, or equivalent), our liability is limited to the maximum extent permitted.\n\n'
        'Nothing in these Terms limits liability for death or personal injury caused by negligence, or for fraud.',
  ),
  TermsSection(
    heading: 'Termination',
    body: 'YOU MAY TERMINATE YOUR ACCOUNT AT ANY TIME by deleting it in the App (Profile → Delete Account). Your personal data will be anonymised as described in our Privacy Policy.\n\n'
        'FOODLY MAY SUSPEND OR TERMINATE your access at any time, with or without notice, if you:\n'
        '• Violate these Terms.\n'
        '• Engage in fraudulent, abusive, or illegal behaviour.\n'
        '• Create risk or legal exposure for Foodly or other users.\n\n'
        'Upon termination, your right to use the App ceases immediately.',
  ),
  TermsSection(
    heading: 'Governing Law & Dispute Resolution',
    body: 'These Terms are governed by the laws of Portugal and, where applicable, EU law.\n\n'
        'Users in the EU/EEA may also benefit from mandatory consumer protection provisions of their country of residence (Spain\'s LGDCU, Argentina\'s Ley 24.240, Venezuela\'s consumer protection law).\n\n'
        'We encourage informal dispute resolution first at privacy@foodly.solutions. If unresolved, the competent courts of Portugal shall have jurisdiction, without prejudice to your consumer rights under applicable local law.',
  ),
  TermsSection(
    heading: 'Changes to These Terms',
    body: 'We may update these Terms from time to time. When we make material changes, we will notify you through the App or by email at least 15 days before the changes take effect.\n\n'
        'Continued use of the App after the effective date constitutes acceptance of the revised Terms. If you do not agree, you must stop using the App and delete your account.',
  ),
  TermsSection(
    heading: 'Contact',
    body: 'For questions, legal notices, or intellectual property claims:\n\n'
        'Foodly — Legal & Privacy\n'
        'Email: privacy@foodly.solutions\n\n'
        'For EU / Portuguese residents — supervisory authority:\n'
        'Comissão Nacional de Proteção de Dados (CNPD) — www.cnpd.pt\n\n'
        'For Argentine residents — consumer protection:\n'
        'Secretaría de Comercio Interior — www.argentina.gob.ar/produccion/defensadeconsumidor\n\n'
        'For Venezuelan residents — consumer protection:\n'
        'SUNDDE — www.sundde.gob.ve\n\n'
        'For users in other countries: please contact your local data protection or consumer protection authority.',
  ),
];

// ──────────────────────────────────────────────────────────────────────────────
// SPANISH
// ──────────────────────────────────────────────────────────────────────────────
const _es = [
  TermsSection(
    heading: 'Aceptación de los Términos',
    body: 'Bienvenido/a a Foodly. Al descargar, instalar o usar la aplicación móvil Foodly ("App"), aceptas estar sujeto/a a estos Términos y Condiciones ("Términos"). Si no estás de acuerdo, no uses la App.\n\n'
        'Estos Términos constituyen un acuerdo legalmente vinculante entre tú y Hector Waldman ("Foodly"), operador comercial independiente con actividad registrada en Portugal.\n\n'
        'Última actualización: 21 de mayo de 2026',
  ),
  TermsSection(
    heading: 'Descripción del Servicio',
    body: 'Foodly es una plataforma que conecta a usuarios con negocios gastronómicos locales, restaurantes y servicios relacionados. La App te permite:\n\n'
        '• Descubrir negocios gastronómicos cercanos mediante búsqueda por GPS.\n'
        '• Buscar negocios usando texto o voz en múltiples idiomas.\n'
        '• Ver perfiles de negocios, menús, promociones y horarios.\n'
        '• Realizar y gestionar reservaciones en negocios participantes.\n'
        '• Dejar reseñas y calificaciones a negocios que hayas visitado.\n'
        '• Seguir negocios y recibir actualizaciones de su actividad.\n'
        '• Participar en un feed comunitario creando y compartiendo publicaciones.\n'
        '• Solicitar servicios de catering y chefs privados, recibir presupuestos e intercambiar mensajes con el proveedor.\n'
        '• Registrar y administrar tu propio negocio gastronómico (cuentas Manager).\n\n'
        'Foodly es una plataforma tecnológica y no prepara, vende ni entrega alimentos. No nos hacemos responsables de la calidad, seguridad, precios o disponibilidad de los productos o servicios ofrecidos por los negocios listados en la App.',
  ),
  TermsSection(
    heading: 'Cuentas de Usuario',
    body: 'REGISTRO\n\n'
        'Para usar la mayoría de las funciones, debes crear una cuenta con tu nombre completo, nombre de usuario, correo electrónico y contraseña. También puedes registrarte con Google Sign-In.\n\n'
        'Debes tener al menos 13 años (o 16 en la UE/EEE) para crear una cuenta.\n\n'
        'SEGURIDAD DE LA CUENTA\n\n'
        'Eres responsable de mantener la confidencialidad de tus credenciales y de toda la actividad en tu cuenta. Notifícanos de inmediato a privacy@foodly.solutions si sospechas un uso no autorizado.\n\n'
        'TIPOS DE CUENTA\n\n'
        '• Cliente (Customer): rol predeterminado. Permite descubrir negocios, dejar reseñas, hacer reservaciones y participar en la comunidad.\n'
        '• Gestor (Manager): se otorga automáticamente al crear un negocio. Permite gestión completa del negocio.',
  ),
  TermsSection(
    heading: 'Listados de Negocios (Cuentas Manager)',
    body: 'Si registras un negocio en Foodly, declaras y garantizas que:\n\n'
        '• Eres el propietario legal, operador o representante autorizado del negocio con documentación que acredite tu autoridad.\n'
        '• Toda la información que proporcionas (nombre, dirección, categoría, horarios, menús, precios, fotos) es precisa y está actualizada.\n'
        '• Tu negocio cumple con todas las leyes y regulaciones locales aplicables.\n'
        '• La identidad comercial que declaras es genuina y no ha sido fabricada, suplantada ni usurpada de otra entidad.\n\n'
        'VERIFICACIÓN DE IDENTIDAD Y ANTIFRAUDE\n\n'
        'Foodly puede, en cualquier momento, solicitar prueba documental de tu autoridad para representar un negocio (por ejemplo, certificado de registro mercantil, identificación fiscal, contrato de arrendamiento o poder notarial). La falta de documentación adecuada puede resultar en la suspensión inmediata del listado.\n\n'
        'Las siguientes actividades están estrictamente prohibidas y pueden resultar en la terminación inmediata y permanente de la cuenta:\n\n'
        '• Registrar un negocio que no posees ni operas (usurpación de identidad).\n'
        '• Suplantar la identidad de otro negocio, marca o establecimiento.\n'
        '• Cargar documentación falsa para reclamar la titularidad de un negocio.\n'
        '• Crear listados duplicados de un negocio existente para engañar a los usuarios.\n\n'
        'Si crees que tu negocio ha sido listado fraudulentamente por un tercero no autorizado, contáctanos de inmediato en privacy@foodly.solutions con documentación de respaldo.\n\n'
        'Foodly se reserva el derecho de eliminar o suspender listados que contengan información falsa o engañosa.\n\n'
        'SOBRE LAS RESERVACIONES\n\n'
        'Al habilitar la función de reservaciones, te comprometes a honrar las reservaciones confirmadas de buena fe. Foodly no se hace responsable de disputas entre clientes y negocios.\n\n'
        'ANALÍTICA E INFORMES DE NEGOCIO\n\n'
        'Como Manager, tendrás acceso a métricas de interacción anonimizadas sobre tu listado de negocio — como vistas de perfil, uso de funciones y tasa de conversión de reservaciones. Estas métricas se derivan de interacciones agregadas y anonimizadas de los usuarios de Foodly con tu listado y no identifican a usuarios individuales. Las métricas son orientativas; Foodly no garantiza ningún nivel específico de visibilidad, tráfico o rendimiento comercial.',
  ),
  TermsSection(
    heading: 'Sistema de Reservaciones',
    body: 'PARA CLIENTES\n\n'
        '• Las reservaciones están sujetas a confirmación del negocio — una reservación pendiente no es una reserva garantizada.\n'
        '• Puedes cancelar una reservación pendiente o confirmada a través de la App.\n'
        '• Las ausencias reiteradas pueden resultar en restricciones de la cuenta.\n\n'
        'PARA GESTORES\n\n'
        '• Puedes confirmar, rechazar o cancelar reservaciones a través de la App.\n'
        '• Debes notificar a los clientes de cualquier cambio con aviso previo razonable.\n\n'
        'Foodly actúa únicamente como intermediario de comunicación y no acepta responsabilidad por disputas derivadas de reservaciones o su cancelación.',
  ),
  TermsSection(
    heading: 'Contenido Comunitario y Reseñas',
    body: 'La App te permite enviar reseñas, calificaciones, publicaciones, comentarios y fotos ("Contenido de Usuario").\n\n'
        'AL ENVIAR CONTENIDO DE USUARIO:\n'
        '• Otorgas a Foodly una licencia no exclusiva y mundial para mostrar y promover tu contenido dentro de la App.\n'
        '• Confirmas que eres propietario/a del contenido o tienes derecho a compartirlo.\n'
        '• Asumes plena responsabilidad por el contenido que publicas.\n\n'
        'NO DEBES PUBLICAR CONTENIDO QUE:\n'
        '• Sea falso, difamatorio, abusivo, amenazante o discriminatorio.\n'
        '• Infrinja derechos de propiedad intelectual de terceros.\n'
        '• Contenga datos personales de terceros sin su consentimiento.\n'
        '• Promueva actividades ilegales o sea spam.',
  ),
  TermsSection(
    heading: 'Funciones de Inteligencia Artificial',
    body: 'Foodly ofrece herramientas asistidas por IA exclusivamente para cuentas Manager:\n\n'
        '• Generación de texto con IA: descripciones promocionales generadas mediante la API de OpenAI (openai.com/terms).\n'
        '• Generación de imágenes con IA: imágenes promocionales generadas mediante la API de Replicate (replicate.com/terms).\n'
        '• Digitalización de menús con IA: las fotos de menú que cargues son procesadas por la IA Gemini de Google para extraer automáticamente platos y precios, bajo los términos de servicio de Google (policies.google.com/terms).\n\n'
        'Eres el único/a responsable de revisar y aprobar todo el contenido generado por IA antes de publicarlo. No envíes datos personales sensibles como parte de los prompts de IA.',
  ),
  TermsSection(
    heading: 'Conducta Prohibida',
    body: 'Aceptas no:\n\n'
        '• Usar la App para ningún propósito ilegal o en violación de la ley aplicable.\n'
        '• Hacerte pasar por otra persona o entidad.\n'
        '• Cargar malware, virus o cualquier código dañino.\n'
        '• Intentar obtener acceso no autorizado a la App o su infraestructura.\n'
        '• Extraer datos de la App de forma sistemática (scraping) sin permiso escrito.\n'
        '• Interferir con la integridad o el rendimiento de la App.\n'
        '• Usar la App para enviar spam.\n'
        '• Crear múltiples cuentas para eludir una suspensión.\n'
        '• Manipular calificaciones o reseñas.',
  ),
  TermsSection(
    heading: 'Propiedad Intelectual',
    body: 'Todos los derechos de propiedad intelectual de la App — incluyendo el nombre Foodly, logotipo, diseño, software y contenido original — son propiedad de Foodly o están licenciados a Foodly.\n\n'
        'Los nombres de negocios, logotipos e imágenes cargados por los gestores siguen siendo propiedad de sus respectivos dueños. Al cargarlos, los gestores otorgan a Foodly una licencia para mostrarlos en la App.\n\n'
        'Si crees que algún contenido infringe tus derechos de propiedad intelectual, contáctanos en privacy@foodly.solutions.',
  ),
  TermsSection(
    heading: 'Pagos (Función Futura)',
    body: 'Foodly no procesa actualmente pagos por pedidos o reservaciones. Cuando la funcionalidad de pago esté disponible:\n\n'
        '• Los pagos serán procesados por Mercado Pago y/o Stripe.\n'
        '• Foodly no almacena números de tarjetas, datos bancarios ni identificación fiscal.\n'
        '• Todas las transacciones estarán sujetas a los términos del procesador de pagos.\n\n'
        'Los precios mostrados en la App son proporcionados por los gestores. Foodly no es responsable de errores de precios.',
  ),
  TermsSection(
    heading: 'Exclusión de Garantías',
    body: 'LA APP SE PROPORCIONA "TAL CUAL" Y "SEGÚN DISPONIBILIDAD" SIN GARANTÍAS DE NINGÚN TIPO.\n\n'
        'Foodly no garantiza que:\n'
        '• La App sea ininterrumpida o libre de errores.\n'
        '• La información de los negocios (menús, precios, horarios) sea precisa o actualizada.\n'
        '• Los resultados de búsqueda sean completos o relevantes.\n\n'
        'El uso de la App y la confianza en cualquier contenido es bajo tu propio riesgo.',
  ),
  TermsSection(
    heading: 'Limitación de Responsabilidad',
    body: 'En la máxima medida permitida por la ley, Foodly no será responsable de:\n\n'
        '• Daños indirectos, incidentales, especiales o consecuentes.\n'
        '• Pérdida de ganancias, ingresos o datos.\n'
        '• Daños derivados de la información proporcionada por negocios de terceros.\n'
        '• Disputas entre clientes y negocios sobre reservaciones o servicio.\n'
        '• Interrupciones o falta de disponibilidad de la App.\n\n'
        'Donde la responsabilidad no pueda excluirse por ley (Ley 24.240 Argentina, Ley de Protección al Consumidor Venezuela, u otras equivalentes), se limita al máximo permitido.',
  ),
  TermsSection(
    heading: 'Terminación',
    body: 'PUEDES TERMINAR TU CUENTA EN CUALQUIER MOMENTO desde la App (Perfil → Eliminar cuenta). Tus datos personales serán anonimizados según nuestra Política de Privacidad.\n\n'
        'FOODLY PUEDE SUSPENDER O TERMINAR tu acceso si:\n'
        '• Infringes estos Términos.\n'
        '• Incurres en conducta fraudulenta, abusiva o ilegal.\n'
        '• Generas riesgo o exposición legal para Foodly u otros usuarios.',
  ),
  TermsSection(
    heading: 'Ley Aplicable y Resolución de Disputas',
    body: 'Estos Términos se rigen por las leyes de Portugal y, donde corresponda, por la legislación de la Unión Europea.\n\n'
        'Los usuarios en la UE/EEE también pueden beneficiarse de las disposiciones obligatorias de protección al consumidor de su país (LGDCU España, Ley 24.240 Argentina, Ley de Protección al Consumidor Venezuela).\n\n'
        'Te animamos a resolver disputas de forma informal primero en privacy@foodly.solutions. Si no es posible, los tribunales competentes de Portugal tendrán jurisdicción.',
  ),
  TermsSection(
    heading: 'Cambios en los Términos',
    body: 'Podemos actualizar estos Términos periódicamente. Te notificaremos con al menos 15 días de anticipación ante cambios sustanciales, a través de la App o por correo electrónico.\n\n'
        'El uso continuado de la App tras la fecha de vigencia de los Términos revisados constituye tu aceptación de los cambios.',
  ),
  TermsSection(
    heading: 'Contacto',
    body: 'Para consultas, avisos legales o reclamaciones de propiedad intelectual:\n\n'
        'Foodly — Legal y Privacidad\n'
        'Correo: privacy@foodly.solutions\n\n'
        'Residentes en Portugal / UE — autoridad supervisora:\n'
        'Comissão Nacional de Proteção de Dados (CNPD) — www.cnpd.pt\n\n'
        'Residentes en Argentina — defensa del consumidor:\n'
        'Secretaría de Comercio Interior — www.argentina.gob.ar/produccion/defensadeconsumidor\n\n'
        'Residentes en Venezuela — defensa del consumidor:\n'
        'SUNDDE — www.sundde.gob.ve\n\n'
        'Residentes en otros países: contacta con tu autoridad local de protección al consumidor o de datos personales.',
  ),
];

// ──────────────────────────────────────────────────────────────────────────────
// PORTUGUESE
// ──────────────────────────────────────────────────────────────────────────────
const _pt = [
  TermsSection(
    heading: 'Aceitação dos Termos',
    body: 'Bem-vindo/a à Foodly. Ao descarregar, instalar ou utilizar a aplicação móvel Foodly ("App"), aceita ficar vinculado/a a estes Termos e Condições ("Termos"). Se não concordar, não utilize a App.\n\n'
        'Estes Termos constituem um acordo legalmente vinculativo entre si e Hector Waldman ("Foodly"), operador comercial independente com atividade registada em Portugal.\n\n'
        'Última atualização: 21 de maio de 2026',
  ),
  TermsSection(
    heading: 'Descrição do Serviço',
    body: 'A Foodly é uma plataforma que liga utilizadores a negócios gastronómicos locais, restaurantes e serviços relacionados. A App permite-lhe:\n\n'
        '• Descobrir negócios gastronómicos próximos através de pesquisa por GPS.\n'
        '• Pesquisar negócios por texto ou voz em vários idiomas.\n'
        '• Ver perfis de negócios, menus, promoções e horários.\n'
        '• Fazer e gerir reservas em negócios participantes.\n'
        '• Deixar avaliações e classificações a negócios que visitou.\n'
        '• Seguir negócios e receber atualizações sobre a sua atividade.\n'
        '• Participar num feed comunitário criando e partilhando publicações.\n'
        '• Solicitar serviços de catering e chefs privados, receber orçamentos e trocar mensagens com o prestador.\n'
        '• Registar e gerir o seu próprio negócio gastronómico (contas Manager).\n\n'
        'A Foodly é uma plataforma tecnológica e não prepara, vende nem entrega alimentos. Não nos responsabilizamos pela qualidade, segurança, preços ou disponibilidade dos produtos ou serviços oferecidos pelos negócios listados na App.',
  ),
  TermsSection(
    heading: 'Contas de Utilizador',
    body: 'REGISTO\n\n'
        'Para utilizar a maioria das funcionalidades, deve criar uma conta com o seu nome completo, nome de utilizador, e-mail e palavra-passe. Pode também registar-se com o Google Sign-In.\n\n'
        'Deve ter pelo menos 13 anos (ou 16 na UE/EEE) para criar uma conta.\n\n'
        'SEGURANÇA DA CONTA\n\n'
        'É responsável por manter a confidencialidade das suas credenciais e por toda a atividade na sua conta. Notifique-nos imediatamente em privacy@foodly.solutions se suspeitar de utilização não autorizada.\n\n'
        'TIPOS DE CONTA\n\n'
        '• Cliente (Customer): perfil padrão. Permite descobrir negócios, deixar avaliações, fazer reservas e participar na comunidade.\n'
        '• Gestor (Manager): atribuído automaticamente ao criar um negócio. Permite gestão completa do negócio.',
  ),
  TermsSection(
    heading: 'Listagens de Negócios (Contas Manager)',
    body: 'Se registar um negócio na Foodly, declara e garante que:\n\n'
        '• É o proprietário legal, operador ou representante autorizado do negócio, com documentação que comprove a sua autoridade.\n'
        '• Toda a informação que fornece (nome, morada, categoria, horários, menus, preços, fotos) é precisa e está atualizada.\n'
        '• O seu negócio cumpre todas as leis e regulamentos locais aplicáveis.\n'
        '• A identidade comercial que declara é genuína e não foi fabricada, usurpada ou falsificada de outra entidade.\n\n'
        'VERIFICAÇÃO DE IDENTIDADE E ANTIFRAUDE\n\n'
        'A Foodly pode, a qualquer momento, solicitar prova documental da sua autoridade para representar um negócio (por exemplo, certidão de registo comercial, identificação fiscal, contrato de arrendamento ou procuração). A falta de documentação adequada pode resultar na suspensão imediata da listagem.\n\n'
        'As seguintes atividades são estritamente proibidas e podem resultar na cessação imediata e permanente da conta:\n\n'
        '• Registar um negócio que não possui nem opera (usurpação de identidade).\n'
        '• Fazer-se passar por outro negócio, marca ou estabelecimento.\n'
        '• Carregar documentação falsa para reclamar a titularidade de um negócio.\n'
        '• Criar listagens duplicadas de um negócio existente para enganar utilizadores.\n\n'
        'Se acredita que o seu negócio foi listado fraudulentamente por um terceiro não autorizado, contacte-nos imediatamente em privacy@foodly.solutions com documentação de suporte.\n\n'
        'A Foodly reserva-se o direito de remover ou suspender listagens que contenham informação falsa ou enganosa.\n\n'
        'SOBRE AS RESERVAS\n\n'
        'Ao ativar as reservas, compromete-se a honrá-las de boa-fé. A Foodly não se responsabiliza por disputas entre clientes e negócios.\n\n'
        'ANÁLISE E RELATÓRIOS DE NEGÓCIO\n\n'
        'Enquanto Manager, terá acesso a métricas de interação anonimizadas sobre a sua listagem de negócio — como visualizações de perfil, utilização de funcionalidades e taxa de conversão de reservas. Estas métricas são derivadas de interações agregadas e anonimizadas dos utilizadores da Foodly com a sua listagem e não identificam utilizadores individuais. As métricas são meramente indicativas; a Foodly não garante qualquer nível específico de visibilidade, tráfego ou desempenho comercial.',
  ),
  TermsSection(
    heading: 'Sistema de Reservas',
    body: 'PARA CLIENTES\n\n'
        '• As reservas estão sujeitas a confirmação pelo negócio — uma reserva pendente não é uma reserva garantida.\n'
        '• Pode cancelar uma reserva pendente ou confirmada através da App.\n'
        '• Faltas repetidas podem resultar em restrições à conta.\n\n'
        'PARA GESTORES\n\n'
        '• Pode confirmar, rejeitar ou cancelar reservas através da App.\n'
        '• Deve notificar os clientes de quaisquer alterações com antecedência razoável.\n\n'
        'A Foodly atua exclusivamente como intermediário de comunicação e não aceita responsabilidade por disputas decorrentes de reservas ou do seu cancelamento.',
  ),
  TermsSection(
    heading: 'Conteúdo Comunitário e Avaliações',
    body: 'A App permite-lhe submeter avaliações, classificações, publicações, comentários e fotos ("Conteúdo do Utilizador").\n\n'
        'AO SUBMETER CONTEÚDO DO UTILIZADOR:\n'
        '• Concede à Foodly uma licença não exclusiva e mundial para exibir e promover o seu conteúdo dentro da App.\n'
        '• Confirma que é proprietário/a do conteúdo ou tem o direito de o partilhar.\n'
        '• Assume plena responsabilidade pelo conteúdo que publica.\n\n'
        'NÃO DEVE PUBLICAR CONTEÚDO QUE:\n'
        '• Seja falso, difamatório, abusivo, ameaçador ou discriminatório.\n'
        '• Infrinja direitos de propriedade intelectual de terceiros.\n'
        '• Contenha dados pessoais de terceiros sem o seu consentimento.\n'
        '• Promova atividades ilegais ou seja spam.',
  ),
  TermsSection(
    heading: 'Funcionalidades de Inteligência Artificial',
    body: 'A Foodly oferece ferramentas assistidas por IA exclusivamente para contas Manager:\n\n'
        '• Geração de texto com IA: descrições promocionais geradas via API da OpenAI (openai.com/terms).\n'
        '• Geração de imagens com IA: imagens promocionais geradas via API da Replicate (replicate.com/terms).\n'
        '• Digitalização de menus com IA: as fotografias de menu que carrega são processadas pela IA Gemini da Google para extrair automaticamente pratos e preços, ao abrigo dos termos de serviço da Google (policies.google.com/terms).\n\n'
        'É o único/a responsável por rever e aprovar todo o conteúdo gerado por IA antes de o publicar. Não submeta dados pessoais sensíveis como parte dos prompts de IA.',
  ),
  TermsSection(
    heading: 'Conduta Proibida',
    body: 'Concorda em não:\n\n'
        '• Utilizar a App para qualquer fim ilegal ou em violação da lei aplicável.\n'
        '• Fazer-se passar por outra pessoa ou entidade.\n'
        '• Carregar malware, vírus ou qualquer código prejudicial.\n'
        '• Tentar obter acesso não autorizado à App ou à sua infraestrutura.\n'
        '• Extrair dados da App de forma sistemática (scraping) sem autorização escrita.\n'
        '• Interferir com a integridade ou o desempenho da App.\n'
        '• Enviar spam.\n'
        '• Criar múltiplas contas para contornar uma suspensão.\n'
        '• Manipular classificações ou avaliações.',
  ),
  TermsSection(
    heading: 'Propriedade Intelectual',
    body: 'Todos os direitos de propriedade intelectual da App — incluindo o nome Foodly, logótipo, design, software e conteúdo original — são propriedade da Foodly ou estão licenciados à Foodly.\n\n'
        'Os nomes de negócios, logótipos e imagens carregados pelos gestores continuam a ser propriedade dos respetivos proprietários. Ao carregá-los, os gestores concedem à Foodly uma licença para os exibir na App.\n\n'
        'Se acredita que algum conteúdo infringe os seus direitos de propriedade intelectual, contacte-nos em privacy@foodly.solutions.',
  ),
  TermsSection(
    heading: 'Pagamentos (Funcionalidade Futura)',
    body: 'A Foodly não processa atualmente pagamentos por encomendas ou reservas. Quando a funcionalidade de pagamento estiver disponível:\n\n'
        '• Os pagamentos serão processados pelo Mercado Pago e/ou Stripe.\n'
        '• A Foodly não armazena números de cartões, dados bancários nem identificação fiscal.\n'
        '• Todas as transações estarão sujeitas aos termos do processador de pagamentos.\n\n'
        'Os preços apresentados na App são fornecidos pelos gestores. A Foodly não se responsabiliza por erros de preços.',
  ),
  TermsSection(
    heading: 'Exclusão de Garantias',
    body: 'A APP É FORNECIDA "TAL COMO ESTÁ" E "CONFORME DISPONÍVEL" SEM GARANTIAS DE QUALQUER TIPO.\n\n'
        'A Foodly não garante que:\n'
        '• A App seja ininterrupta ou isenta de erros.\n'
        '• As informações dos negócios (menus, preços, horários) sejam precisas ou atuais.\n'
        '• Os resultados de pesquisa sejam completos ou relevantes.\n\n'
        'A utilização da App e a confiança em qualquer conteúdo é da sua própria responsabilidade.',
  ),
  TermsSection(
    heading: 'Limitação de Responsabilidade',
    body: 'Na máxima medida permitida pela lei, a Foodly não será responsável por:\n\n'
        '• Quaisquer danos indiretos, incidentais, especiais ou consequentes.\n'
        '• Perda de lucros, receitas ou dados.\n'
        '• Danos decorrentes de informações fornecidas por negócios de terceiros.\n'
        '• Disputas entre clientes e negócios sobre reservas ou serviço.\n'
        '• Interrupções ou indisponibilidade da App.\n\n'
        'Onde a responsabilidade não possa ser excluída por lei (legislação portuguesa de defesa do consumidor, Lei 24.240 Argentina, ou equivalente), limita-se ao máximo permitido.',
  ),
  TermsSection(
    heading: 'Rescisão',
    body: 'PODE ENCERRAR A SUA CONTA A QUALQUER MOMENTO na App (Perfil → Eliminar conta). Os seus dados pessoais serão anonimizados conforme a nossa Política de Privacidade.\n\n'
        'A FOODLY PODE SUSPENDER OU ENCERRAR o seu acesso se:\n'
        '• Violar estes Termos.\n'
        '• Adotar comportamento fraudulento, abusivo ou ilegal.\n'
        '• Criar risco ou exposição legal para a Foodly ou outros utilizadores.',
  ),
  TermsSection(
    heading: 'Lei Aplicável e Resolução de Disputas',
    body: 'Estes Termos são regidos pelas leis de Portugal e, onde aplicável, pela legislação da União Europeia.\n\n'
        'Os utilizadores na UE/EEE podem também beneficiar das disposições obrigatórias de proteção ao consumidor do seu país (LGDCU Espanha, Lei 24.240 Argentina, Lei de Proteção ao Consumidor Venezuela).\n\n'
        'Encorajamos a resolução informal de disputas em privacy@foodly.solutions. Se não for possível, os tribunais competentes de Portugal terão jurisdição.',
  ),
  TermsSection(
    heading: 'Alterações aos Termos',
    body: 'Podemos atualizar estes Termos periodicamente. Notificá-lo-emos com pelo menos 15 dias de antecedência sobre alterações substanciais, através da App ou por e-mail.\n\n'
        'A utilização continuada da App após a data de entrada em vigor dos Termos revistos constitui a sua aceitação das alterações.',
  ),
  TermsSection(
    heading: 'Contacto',
    body: 'Para questões, avisos legais ou reclamações de propriedade intelectual:\n\n'
        'Foodly — Legal e Privacidade\n'
        'E-mail: privacy@foodly.solutions\n\n'
        'Residentes em Portugal / UE — autoridade supervisora:\n'
        'Comissão Nacional de Proteção de Dados (CNPD) — www.cnpd.pt\n\n'
        'Residentes na Argentina — defesa do consumidor:\n'
        'Secretaría de Comercio Interior — www.argentina.gob.ar/produccion/defensadeconsumidor\n\n'
        'Residentes na Venezuela — defesa do consumidor:\n'
        'SUNDDE — www.sundde.gob.ve\n\n'
        'Utilizadores noutros países: contacte a sua autoridade local de proteção de dados ou defesa do consumidor.',
  ),
];
