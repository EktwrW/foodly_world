// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_PT locale. All the
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
  String get localeName => 'pt_PT';

  static String m0(current, total) => "A analisar ${current} de ${total}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'Sem itens para importar', one: 'Será adicionado 1 item ao teu menu', other: 'Serão adicionados ${count} itens ao teu menu')}";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Detectámos 1 item', other: 'Detectámos ${count} itens')}";

  static String m3(count) =>
      "${Intl.plural(count, one: '1 foto selecionada', other: '${count} fotos selecionadas')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '1 combo', other: '${count} combos')}";

  static String m5(count) =>
      "${Intl.plural(count, one: '1 bebida', other: '${count} bebidas')}";

  static String m6(count) =>
      "${Intl.plural(count, one: '1 prato', other: '${count} pratos')}";

  static String m7(items, categories) =>
      "Importámos ${items} itens em ${categories} categorias.";

  static String m8(current, total) => "A carregar ${current} de ${total}";

  static String m9(count) =>
      "Gera título (máx. 36 caracteres), subtítulo (máx. 99) e descrição (máx. 369) para a sua promoção. Tem ${count} utilizações restantes este mês.";

  static String m10(limit) =>
      "Utilizou todas as ${limit} promoções geradas por IA disponíveis este mês. A sua quota será renovada no dia 1 do próximo mês.";

  static String m11(name) =>
      "Bloquear ${name}? Deixarás de ver o conteúdo dele e ele o teu.";

  static String m12(businessName) => "Nova atividade em ${businessName}";

  static String m13(actor, businessName) =>
      "${actor} interagiu com ${businessName}";

  static String m14(businessName) =>
      "O menu de ${businessName} está a chamar a atenção!";

  static String m15(businessName) =>
      "Um prato de ${businessName} está em destaque!";

  static String m16(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} está em destaque!";

  static String m17(actor, businessName) =>
      "${actor} gostou de um prato em ${businessName}";

  static String m18(actor, entityName, businessName) =>
      "${actor} gostou de \"${entityName}\" em ${businessName}";

  static String m19(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} está a chamar a atenção!";

  static String m20(actor, businessName) =>
      "${actor} guardou um menu de ${businessName}";

  static String m21(actor, entityName, businessName) =>
      "${actor} guardou o menu \"${entityName}\" de ${businessName}";

  static String m22(businessName) =>
      "Uma promoção de ${businessName} é popular!";

  static String m23(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} é popular!";

  static String m24(actor, businessName) =>
      "${actor} guardou uma promoção de ${businessName}";

  static String m25(actor, entityName, businessName) =>
      "${actor} guardou a promoção \"${entityName}\" de ${businessName}";

  static String m26(businessName) => "${businessName} tem um novo seguidor!";

  static String m27(businessName) =>
      "${businessName} publicou uma nova promoção!";

  static String m28(businessName) => "Nova avaliação em ${businessName}!";

  static String m29(actor, businessName) =>
      "${actor} deixou uma avaliação em ${businessName}";

  static String m30(businessName) => "${businessName} atualizou uma promoção";

  static String m31(currentLabel) => "Renomear secao \"${currentLabel}\"";

  static String m32(year) =>
      "Direitos de Autor © ${year} - Todos os direitos reservados";

  static String m33(businessName) => "Edite sua avaliação para ${businessName}";

  static String m34(phone) => "Insere o código enviado para ${phone}";

  static String m35(errorMsg) =>
      "Falha ao eliminar as fotos do item:\n\n${errorMsg}";

  static String m36(business) =>
      "${business} já está preparando. Continue pedindo — você paga tudo no final.";

  static String m37(amount) => "Pagar a conta · ${amount}";

  static String m38(name, amount) => "Pagar a parte de ${name} (${amount})?";

  static String m39(amount) => "Tempo extra: faltam ${amount}";

  static String m40(business, code) =>
      "Junta-te ao nosso pedido em ${business}! Abre a Foodly, entra no menu do restaurante e usa o código ${code}";

  static String m41(name) => "Pago por ${name}";

  static String m42(paid, total) => "${paid} de ${total} pago";

  static String m43(amount) => "Pagar tudo o que falta (${amount})?";

  static String m44(amount) => "Pagar tudo o que falta · ${amount}";

  static String m45(amount) => "Pagar a conta · ${amount}";

  static String m46(amount) => "Pagar o pedido · ${amount}";

  static String m47(amount) => "Pagar a minha parte · ${amount}";

  static String m48(total) =>
      "Pagamentos completos · ${total}. O recibo chegou ao seu email.";

  static String m49(amount) =>
      "Esta taxa fixa de ${amount} por transação corresponde à plataforma que processa o teu pagamento com cartão de forma segura. Não é uma cobrança da Foodly nem do restaurante.";

  static String m50(amount) =>
      "Inclui ${amount} de taxa da plataforma de pagamentos";

  static String m51(total) =>
      "Conta fechada · ${total}. O recibo chegou ao seu email.";

  static String m52(base, fee) =>
      "O teu pagamento: ${base} + ${fee} de taxa de processamento";

  static String m53(name) => "Transferir a titularidade para ${name}?";

  static String m54(n) => "RODADA ${n}";

  static String m55(paid, remaining) =>
      "Já foram cobrados ${paid} pela app. Faltam ${remaining} que cobras no local.";

  static String m56(total) =>
      "A mesa consumiu ${total}. A Foodly não processou este pagamento, por isso não cobra comissão.";

  static String m57(guests, items) => "${guests} comensais · ${items} itens";

  static String m58(count, total) => "${count} pedidos · ${total}";

  static String m59(delivered, total) =>
      "${delivered}/${total} itens entregues";

  static String m60(shown, total) =>
      "A mostrar ${shown} de ${total}. Trata destes e os restantes vão subindo.";

  static String m61(n) => "RONDA ${n}";

  static String m62(item) =>
      "Remover \"${item}\" da conta? Continuará visível para o cliente, marcado como removido pelo negócio.";

  static String m63(size) => "máx. ${size}";

  static String m64(maxSize) => "Máx. ${maxSize}";

  static String m65(count) => "${count} mensagens novas";

  static String m66(radius) =>
      "Não há comércios próximos nesta categoria dentro de ${radius} km.";

  static String m67(text) => "Notas: ${text}";

  static String m68(count) => "Pessoas: ${count}";

  static String m69(count) => "Tem ${count} reservas pendentes";

  static String m70(max) => "Máximo ${max} fotos";

  static String m71(max) => "Fotos (opcional, até ${max})";

  static String m72(action, errorMsg) =>
      "Ocorreu um erro ao ${action} a(s) foto(s) do item: ${errorMsg}";

  static String m73(maxImages) =>
      "Pressione para adicionar fotos, até um máximo de ${maxImages} imagens";

  static String m74(currency, price) => "desde ${currency}${price}";

  static String m75(seconds) => "Reenviar em ${seconds}s";

  static String m76(businessName) => "Reservar mesa em ${businessName}";

  static String m77(city) => "Procurar em ${city}...";

  static String m78(businessName, appName, menuUrl) =>
      "🍽️ Vê o menu de ${businessName} em 🌟 ${appName}: \n${menuUrl}";

  static String m79(text) => "Pedidos especiais: ${text}";

  static String m80(count) => "há ${count}d";

  static String m81(count) => "há ${count}h";

  static String m82(count) => "há ${count}m";

  static String m83(seconds) =>
      "Demasiadas tentativas seguidas. Tente novamente em ${seconds}s.";

  static String m84(date) => "Visitado em ${date}";

  static String m85(businessName) =>
      "Escreva uma avaliação para ${businessName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Sobre"),
    "aboutEvolving": MessageLookupByLibrary.simpleMessage(
      "Estamos apenas a comecar. O Foodly foi concebido para evoluir ao lado dos negocios e comunidades que serve. A sua opiniao define o que vem a seguir.",
    ),
    "aboutEvolvingTitle": MessageLookupByLibrary.simpleMessage(
      "Feito para Evoluir",
    ),
    "aboutForBusiness": MessageLookupByLibrary.simpleMessage(
      "Apresente o seu menu, lance promocoes, gerencie reservas, fidelize os seus clientes e deixe que o descubram de forma natural — tudo a partir de um unico lugar, sem custo.\n\nO Foodly cresce consigo. Metricas, estatisticas e encomendas na app estao a caminho.",
    ),
    "aboutForBusinessTitle": MessageLookupByLibrary.simpleMessage(
      "Para Negocios",
    ),
    "aboutForCustomers": MessageLookupByLibrary.simpleMessage(
      "Explore o que ha por perto, descubra novos favoritos, guarde as melhores promocoes, reserve mesa em segundos e apoie os negocios que tornam a sua cidade unica.",
    ),
    "aboutForCustomersTitle": MessageLookupByLibrary.simpleMessage(
      "Para Clientes",
    ),
    "aboutFree": MessageLookupByLibrary.simpleMessage(
      "O Foodly e gratuito — para negocios e clientes. Uma comissao de 3% aplica-se apenas aos pedidos que os clientes pagam atraves do Foodly, e ja cobre o processamento do pagamento. O que for pago ao balcao ou em dinheiro nao tem custo. Sem subscricoes, sem taxas ocultas, sem surpresas.",
    ),
    "aboutFreeTitle": MessageLookupByLibrary.simpleMessage("Gratis para Todos"),
    "aboutMission": MessageLookupByLibrary.simpleMessage(
      "O Foodly nasceu de uma convicao simples: cada negocio — seja uma cozinha familiar, uma franquia em crescimento ou uma padaria de bairro — merece ferramentas poderosas para se conectar com a sua comunidade.\n\nEstamos a construir a ponte entre os negocios e as pessoas que amam o que oferecem.",
    ),
    "aboutMissionTitle": MessageLookupByLibrary.simpleMessage("Porque Foodly?"),
    "aboutTagline": MessageLookupByLibrary.simpleMessage(
      "Onde cada sabor encontra o seu publico.",
    ),
    "aboutVideoPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Manifesto Foodly",
    ),
    "acceptAndContinue": MessageLookupByLibrary.simpleMessage(
      "Aceitar e continuar",
    ),
    "acceptServiceRequests": MessageLookupByLibrary.simpleMessage(
      "Aceitar pedidos",
    ),
    "accessiblePMR": MessageLookupByLibrary.simpleMessage("Acessível PMR"),
    "account": MessageLookupByLibrary.simpleMessage("Conta"),
    "active": MessageLookupByLibrary.simpleMessage("Ativo"),
    "activePackageHint": MessageLookupByLibrary.simpleMessage(
      "Pacotes ativos são visíveis para os clientes",
    ),
    "addADescription": MessageLookupByLibrary.simpleMessage(
      "Adicionar uma descrição",
    ),
    "addANewTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Adicionar um novo período de tempo",
    ),
    "addAdditionalInformation": MessageLookupByLibrary.simpleMessage(
      "Adiciona informação adicional",
    ),
    "addAnotherBlock": MessageLookupByLibrary.simpleMessage(
      "Adicionar outro bloqueio",
    ),
    "addCertification": MessageLookupByLibrary.simpleMessage(
      "Adicionar certificação",
    ),
    "addContact": MessageLookupByLibrary.simpleMessage(
      "Adicionar canais de contacto",
    ),
    "addCuisine": MessageLookupByLibrary.simpleMessage("Adicionar cozinha"),
    "addItem": MessageLookupByLibrary.simpleMessage("Adicionar item"),
    "addLanguage": MessageLookupByLibrary.simpleMessage("Adicionar idioma"),
    "addName": MessageLookupByLibrary.simpleMessage("Adicionar nome"),
    "addNewCategory": MessageLookupByLibrary.simpleMessage(
      "Adicionar nova categoria",
    ),
    "addNewItem": MessageLookupByLibrary.simpleMessage("Adicionar novo item"),
    "addNoteOptional": MessageLookupByLibrary.simpleMessage(
      "Adicionar uma nota (opcional)",
    ),
    "addOpeningHours": MessageLookupByLibrary.simpleMessage(
      "Adicionar Horários de Abertura",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Adicionar foto"),
    "addServices": MessageLookupByLibrary.simpleMessage("Adicionar Serviços"),
    "addSpecialtiesAndDetails": MessageLookupByLibrary.simpleMessage(
      "Adicione as suas especialidades e detalhes",
    ),
    "addSpecialty": MessageLookupByLibrary.simpleMessage(
      "Adicionar especialidade",
    ),
    "addTagline": MessageLookupByLibrary.simpleMessage(
      "Adicione uma frase chamativa",
    ),
    "addTitle": MessageLookupByLibrary.simpleMessage("Adicione um título"),
    "addToCalendar": MessageLookupByLibrary.simpleMessage(
      "Adicionar ao calendário",
    ),
    "addToFavorites": MessageLookupByLibrary.simpleMessage(
      "Adicionar aos favoritos",
    ),
    "addYoutubeUrl": MessageLookupByLibrary.simpleMessage(
      "Adicionar URL do YouTube",
    ),
    "addedToFavorites": MessageLookupByLibrary.simpleMessage(
      "adicionado aos favoritos",
    ),
    "addedToFavoritesFem": MessageLookupByLibrary.simpleMessage(
      "adicionada aos favoritos",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Morada"),
    "admin": MessageLookupByLibrary.simpleMessage("Administrador"),
    "aiMenuImportAnalyzeCta": MessageLookupByLibrary.simpleMessage(
      "Analisar com IA",
    ),
    "aiMenuImportCamera": MessageLookupByLibrary.simpleMessage("Câmara"),
    "aiMenuImportDisclaimer": MessageLookupByLibrary.simpleMessage(
      "Esta funcionalidade usa IA para extrair itens do menu a partir das tuas fotos. A IA pode cometer erros — verifica nomes, preços e descrições antes de confirmar.",
    ),
    "aiMenuImportEmptyStateCta": MessageLookupByLibrary.simpleMessage(
      "Importar com IA",
    ),
    "aiMenuImportEmptyStateManualHint": MessageLookupByLibrary.simpleMessage(
      "Para adicioná-los à mão, abre o menu flutuante e toca em Editar",
    ),
    "aiMenuImportEmptyStateSubtitle": MessageLookupByLibrary.simpleMessage(
      "Carrega fotos das secções do teu menu e a IA extrai os itens, categorias e preços automaticamente.",
    ),
    "aiMenuImportEmptyStateTitle": MessageLookupByLibrary.simpleMessage(
      "Digitaliza o teu menu",
    ),
    "aiMenuImportGallery": MessageLookupByLibrary.simpleMessage("Galeria"),
    "aiMenuImportHeroSubtitle": MessageLookupByLibrary.simpleMessage(
      "Carrega fotos do teu menu e a IA extrai itens, categorias e preços automaticamente.",
    ),
    "aiMenuImportHeroTitle": MessageLookupByLibrary.simpleMessage(
      "Digitaliza o teu menu com IA",
    ),
    "aiMenuImportParsing": m0,
    "aiMenuImportParsingHint": MessageLookupByLibrary.simpleMessage(
      "A IA pode demorar alguns segundos por foto",
    ),
    "aiMenuImportReviewConfidenceCheck": MessageLookupByLibrary.simpleMessage(
      "Verificar",
    ),
    "aiMenuImportReviewConfidenceOk": MessageLookupByLibrary.simpleMessage(
      "OK",
    ),
    "aiMenuImportReviewConfidenceVerify": MessageLookupByLibrary.simpleMessage(
      "Confirmar",
    ),
    "aiMenuImportReviewConfirmCta": MessageLookupByLibrary.simpleMessage(
      "Adicionar ao menu",
    ),
    "aiMenuImportReviewConfirming": MessageLookupByLibrary.simpleMessage(
      "A guardar…",
    ),
    "aiMenuImportReviewDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Adicionar descrição (opcional)",
    ),
    "aiMenuImportReviewFooterCount": m1,
    "aiMenuImportReviewHeaderHint": MessageLookupByLibrary.simpleMessage(
      "Verifica nomes e preços. Toca no X para remover itens que não queiras.",
    ),
    "aiMenuImportReviewHeaderTitle": m2,
    "aiMenuImportReviewPending": MessageLookupByLibrary.simpleMessage(
      "Ecrã de revisão em construção — em breve podes editar antes de confirmar",
    ),
    "aiMenuImportReviewTitle": MessageLookupByLibrary.simpleMessage(
      "Revê o teu menu",
    ),
    "aiMenuImportReviewVersionBig": MessageLookupByLibrary.simpleMessage(
      "Grande",
    ),
    "aiMenuImportReviewVersionMedium": MessageLookupByLibrary.simpleMessage(
      "Médio",
    ),
    "aiMenuImportReviewVersionRegular": MessageLookupByLibrary.simpleMessage(
      "Regular",
    ),
    "aiMenuImportSelectedPhotosLabel": m3,
    "aiMenuImportSuccessCta": MessageLookupByLibrary.simpleMessage(
      "Ver o meu menu",
    ),
    "aiMenuImportSuccessHint": MessageLookupByLibrary.simpleMessage(
      "Agora podes adicionar fotos a cada item, ajustar preços ou reordená-los quando quiseres.",
    ),
    "aiMenuImportSuccessStatCombos": m4,
    "aiMenuImportSuccessStatDrinks": m5,
    "aiMenuImportSuccessStatFood": m6,
    "aiMenuImportSuccessSubtitle": m7,
    "aiMenuImportSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "O teu menu está pronto!",
    ),
    "aiMenuImportTips": MessageLookupByLibrary.simpleMessage(
      "Para melhor resultado: uma foto por secção, boa iluminação, sem reflexos, sem colunas paralelas.",
    ),
    "aiMenuImportTitle": MessageLookupByLibrary.simpleMessage(
      "Importar menu com IA",
    ),
    "aiMenuImportUploading": m8,
    "aiMenuImportUploadingHint": MessageLookupByLibrary.simpleMessage(
      "A carregar as tuas fotos para o Foodly de forma segura",
    ),
    "aiPromoContent": m9,
    "aiPromoGenerate": MessageLookupByLibrary.simpleMessage("Gerar"),
    "aiPromoImageLabel": MessageLookupByLibrary.simpleMessage(
      "Incluir imagem promocional (16:9)",
    ),
    "aiPromoImageNatural": MessageLookupByLibrary.simpleMessage("Natural"),
    "aiPromoImageVivid": MessageLookupByLibrary.simpleMessage("Vibrante"),
    "aiPromoQuotaExhaustedContent": m10,
    "aiPromoQuotaExhaustedTitle": MessageLookupByLibrary.simpleMessage(
      "Quota Mensal Atingida",
    ),
    "aiPromoTitle": MessageLookupByLibrary.simpleMessage(
      "Gerador de Promoções IA",
    ),
    "all": MessageLookupByLibrary.simpleMessage("Todos"),
    "allBookings": MessageLookupByLibrary.simpleMessage("Todos"),
    "allowLocationInSettings": MessageLookupByLibrary.simpleMessage(
      "Permitir nas Definições",
    ),
    "allowLocationInSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Toca para abrir as definições da app e ativar a localização",
    ),
    "allowReservations": MessageLookupByLibrary.simpleMessage(
      "Permitir Reservas",
    ),
    "alphabetical": MessageLookupByLibrary.simpleMessage("A-Z"),
    "alreadyReviewedPrompt": MessageLookupByLibrary.simpleMessage(
      "Já avaliou este estabelecimento.\nDeseja editar a sua avaliação?",
    ),
    "analytics": MessageLookupByLibrary.simpleMessage("Análises"),
    "analyticsAvailabilityChecks": MessageLookupByLibrary.simpleMessage(
      "Disponibilidade consultada",
    ),
    "analyticsAvgResponseHours": MessageLookupByLibrary.simpleMessage(
      "Tempo de resposta",
    ),
    "analyticsBookingSuccessRate": MessageLookupByLibrary.simpleMessage(
      "Taxa de sucesso",
    ),
    "analyticsBookings": MessageLookupByLibrary.simpleMessage("Bookings"),
    "analyticsBookingsTotal": MessageLookupByLibrary.simpleMessage(
      "Reservas de serviço",
    ),
    "analyticsComingSoon": MessageLookupByLibrary.simpleMessage(
      "Painel de Análises — Em Breve\nDescubra o desempenho real do seu negócio: visitas, pratos mais pedidos, tendências de clientes e receita. Tudo num só lugar.",
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
      "Visitas ao negócio",
    ),
    "analyticsLabelCtaClicked": MessageLookupByLibrary.simpleMessage(
      "Toques de contacto",
    ),
    "analyticsLabelCtaDirections": MessageLookupByLibrary.simpleMessage(
      "Como chegar",
    ),
    "analyticsLabelCtaInstagram": MessageLookupByLibrary.simpleMessage(
      "Instagram",
    ),
    "analyticsLabelCtaPhone": MessageLookupByLibrary.simpleMessage("Chamadas"),
    "analyticsLabelCtaWebsite": MessageLookupByLibrary.simpleMessage(
      "Visitas ao site",
    ),
    "analyticsLabelCtaWhatsapp": MessageLookupByLibrary.simpleMessage(
      "WhatsApp",
    ),
    "analyticsLabelFavoriteAdded": MessageLookupByLibrary.simpleMessage(
      "Adicionado aos favoritos",
    ),
    "analyticsLabelFavoriteRemoved": MessageLookupByLibrary.simpleMessage(
      "Removido dos favoritos",
    ),
    "analyticsLabelMenuViewed": MessageLookupByLibrary.simpleMessage(
      "Visualizações do menu",
    ),
    "analyticsLabelPackageInquiry": MessageLookupByLibrary.simpleMessage(
      "Consultas",
    ),
    "analyticsLabelPackageView": MessageLookupByLibrary.simpleMessage(
      "Visualizações de pacotes",
    ),
    "analyticsLabelProfileView": MessageLookupByLibrary.simpleMessage(
      "Visitas ao perfil",
    ),
    "analyticsLabelReservationStarted": MessageLookupByLibrary.simpleMessage(
      "Reservas iniciadas",
    ),
    "analyticsLabelReservationSubmitted": MessageLookupByLibrary.simpleMessage(
      "Reservas enviadas",
    ),
    "analyticsLabelReservationSucceeded": MessageLookupByLibrary.simpleMessage(
      "Reservas concluídas",
    ),
    "analyticsLabelReviewCreated": MessageLookupByLibrary.simpleMessage(
      "Avaliações recebidas",
    ),
    "analyticsLabelSearchResult": MessageLookupByLibrary.simpleMessage(
      "Aparições em pesquisa",
    ),
    "analyticsLabelShare": MessageLookupByLibrary.simpleMessage("Partilhas"),
    "analyticsStatusCancelled": MessageLookupByLibrary.simpleMessage(
      "Cancelada",
    ),
    "analyticsStatusCompleted": MessageLookupByLibrary.simpleMessage(
      "Concluída",
    ),
    "analyticsStatusConfirmed": MessageLookupByLibrary.simpleMessage(
      "Confirmada",
    ),
    "analyticsStatusNoShow": MessageLookupByLibrary.simpleMessage(
      "Não compareceu",
    ),
    "analyticsStatusPending": MessageLookupByLibrary.simpleMessage("Pendente"),
    "analyticsStatusRejected": MessageLookupByLibrary.simpleMessage(
      "Rejeitada",
    ),
    "analyticsTitle": MessageLookupByLibrary.simpleMessage("Análises"),
    "analyticsTopPackagesTitle": MessageLookupByLibrary.simpleMessage(
      "Top pacotes",
    ),
    "analyticsViewToBooking": MessageLookupByLibrary.simpleMessage(
      "Visão → Booking",
    ),
    "analyticsViewToInquiry": MessageLookupByLibrary.simpleMessage(
      "Visão → Consulta",
    ),
    "and": MessageLookupByLibrary.simpleMessage("e"),
    "andCreateContentToThese": MessageLookupByLibrary.simpleMessage(
      "e gerir conteúdo, promoções e mais",
    ),
    "approveQuote": MessageLookupByLibrary.simpleMessage("Aprovar orçamento"),
    "april": MessageLookupByLibrary.simpleMessage("Abril"),
    "arabic": MessageLookupByLibrary.simpleMessage("Árabe"),
    "areYouSureCancelReservation": MessageLookupByLibrary.simpleMessage(
      "Tem a certeza de que deseja cancelar esta reserva?",
    ),
    "argentinian": MessageLookupByLibrary.simpleMessage("Argentina"),
    "asian": MessageLookupByLibrary.simpleMessage("Asiática"),
    "askRecommendationsByTextSmart": MessageLookupByLibrary.simpleMessage(
      "Pedir recomendações por texto inteligente",
    ),
    "askRecommendationsByYourVoice": MessageLookupByLibrary.simpleMessage(
      "Pedir recomendações por voz",
    ),
    "at": MessageLookupByLibrary.simpleMessage("às"),
    "attachVideo": MessageLookupByLibrary.simpleMessage("Anexar vídeo"),
    "audioNotUnderstood": MessageLookupByLibrary.simpleMessage(
      "Não foi possível entender o áudio. Por favor, tente novamente.",
    ),
    "audioProcessingError": MessageLookupByLibrary.simpleMessage(
      "Erro ao processar o áudio. Por favor, tente novamente.",
    ),
    "august": MessageLookupByLibrary.simpleMessage("Agosto"),
    "availability": MessageLookupByLibrary.simpleMessage("Disponibilidade"),
    "availabilityCalendar": MessageLookupByLibrary.simpleMessage(
      "Calendário de disponibilidade",
    ),
    "avgRating": MessageLookupByLibrary.simpleMessage("Avaliação média"),
    "awaitingQuote": MessageLookupByLibrary.simpleMessage(
      "A aguardar orçamento",
    ),
    "babyChangingStation": MessageLookupByLibrary.simpleMessage(
      "Trocador de Bebês",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Voltar"),
    "bakeryAndDesserts": MessageLookupByLibrary.simpleMessage(
      "Pastelaria e Sobremesas",
    ),
    "barsAndPubs": MessageLookupByLibrary.simpleMessage("Bares e Pubs"),
    "big": MessageLookupByLibrary.simpleMessage("Grande"),
    "biometricSnackbarTextSpanA": MessageLookupByLibrary.simpleMessage(
      "O sistema operativo deste dispositivo não suporta ou não tem configurados, os acessos de tipo padrão ou biométricos.",
    ),
    "biometricSnackbarTextSpanB": MessageLookupByLibrary.simpleMessage(
      "A sessão expirou, deve entrar com o seu usuário e senha, ou aceder com Google Sign-In.",
    ),
    "birthday": MessageLookupByLibrary.simpleMessage("Aniversário"),
    "blockAction": MessageLookupByLibrary.simpleMessage("Bloquear"),
    "blockDate": MessageLookupByLibrary.simpleMessage("Bloquear data"),
    "blockUser": MessageLookupByLibrary.simpleMessage("Bloquear utilizador"),
    "blockUserConfirm": m11,
    "blockedSuccess": MessageLookupByLibrary.simpleMessage(
      "Utilizador bloqueado",
    ),
    "blockedUsers": MessageLookupByLibrary.simpleMessage(
      "Utilizadores bloqueados",
    ),
    "blockedUsersEmpty": MessageLookupByLibrary.simpleMessage(
      "Ainda não bloqueaste ninguém.",
    ),
    "blocksOn": MessageLookupByLibrary.simpleMessage("Bloqueios do"),
    "bookingDetail": MessageLookupByLibrary.simpleMessage("Detalhe da reserva"),
    "bookingMessages": MessageLookupByLibrary.simpleMessage("Mensagens"),
    "bookingPricing": MessageLookupByLibrary.simpleMessage("Reservas e preços"),
    "brands": MessageLookupByLibrary.simpleMessage("marcas"),
    "brazilian": MessageLookupByLibrary.simpleMessage("Brasileira"),
    "brunch": MessageLookupByLibrary.simpleMessage("Brunch"),
    "budgetEstimate": MessageLookupByLibrary.simpleMessage(
      "Orçamento estimado",
    ),
    "business": MessageLookupByLibrary.simpleMessage("Negócio"),
    "businessAccountUpgradeInfo": MessageLookupByLibrary.simpleMessage(
      "Iremos redirecioná-lo para o formulário de registo empresarial. A sua submissão será analisada para verificação na plataforma. Tenha em atenção que a criação de negócios falsos, apropriação indevida ou usurpação de marcas e estabelecimentos pode resultar em consequências legais.",
    ),
    "businessCategory": MessageLookupByLibrary.simpleMessage(
      "Categoria de Negócio",
    ),
    "businessDisclaimer": MessageLookupByLibrary.simpleMessage(
      "atua apenas como plataforma de visualização. Os preços, disponibilidade, conteúdo e qualidade dos produtos, bem como a informação nutricional e alergénica neste menu, são da responsabilidade exclusiva do estabelecimento comercial. A Foodly não se responsabiliza por discrepâncias, imprecisões ou alterações na informação fornecida pelo estabelecimento.",
    ),
    "businessInfoNote": MessageLookupByLibrary.simpleMessage(
      "Nota sobre a informação do estabelecimento:",
    ),
    "businessInformationNotFound": MessageLookupByLibrary.simpleMessage(
      "Informação comercial não encontrada",
    ),
    "businessName": MessageLookupByLibrary.simpleMessage("Nome comercial"),
    "businessNotAcceptingRequestsNow": MessageLookupByLibrary.simpleMessage(
      "Este estabelecimento não está a aceitar pedidos agora",
    ),
    "businessRegister": MessageLookupByLibrary.simpleMessage(
      "Registar Negócio",
    ),
    "businesses": MessageLookupByLibrary.simpleMessage("negócios"),
    "buzz": MessageLookupByLibrary.simpleMessage("Novidades"),
    "buzzDefaultActivity": m12,
    "buzzDefaultActivitySocial": m13,
    "buzzEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "A atividade da comunidade aparecerá aqui",
    ),
    "buzzEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Ainda não há novidades por perto",
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
      "Cafés e Pequenos-almoços",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Câmara"),
    "canNotContainSpecialCharactersBut_": MessageLookupByLibrary.simpleMessage(
      "Não pode conter espaços nem caracteres especiais exceto \'_\'",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cancelEdit": MessageLookupByLibrary.simpleMessage("Cancelar edição"),
    "cancelReservation": MessageLookupByLibrary.simpleMessage(
      "Cancelar Reserva",
    ),
    "cancelReservationConfirm": MessageLookupByLibrary.simpleMessage(
      "Tem a certeza de que deseja cancelar esta reserva?",
    ),
    "cancellationDetails": MessageLookupByLibrary.simpleMessage(
      "Detalhes de cancelamento",
    ),
    "cancellationDetailsHint": MessageLookupByLibrary.simpleMessage(
      "Descreva os termos de cancelamento",
    ),
    "cancellationPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de cancelamento",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelada"),
    "cannotReviewOwnBusiness": MessageLookupByLibrary.simpleMessage(
      "Não pode avaliar o seu próprio negócio",
    ),
    "cannotUndone": MessageLookupByLibrary.simpleMessage(
      "\nEsta ação não pode ser desfeita.",
    ),
    "categories": MessageLookupByLibrary.simpleMessage("Categorias"),
    "categoryDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Categoria eliminada com sucesso",
    ),
    "categoryNameEmpty": MessageLookupByLibrary.simpleMessage(
      "O nome da categoria não pode estar vazio",
    ),
    "categoryTitleUpdated": MessageLookupByLibrary.simpleMessage(
      "Título da categoria atualizado com sucesso",
    ),
    "catering": MessageLookupByLibrary.simpleMessage("Catering"),
    "cateringAndChefs": MessageLookupByLibrary.simpleMessage(
      "Catering & Chefs",
    ),
    "certificationExample": MessageLookupByLibrary.simpleMessage("Ex: HACCP"),
    "certifications": MessageLookupByLibrary.simpleMessage("Certificações"),
    "changeLocation": MessageLookupByLibrary.simpleMessage("Mudar Localização"),
    "changeSearchPoint": MessageLookupByLibrary.simpleMessage(
      "Mude o ponto de pesquisa para recomendações",
    ),
    "changeUsername": MessageLookupByLibrary.simpleMessage(
      "Alterar nome de utilizador",
    ),
    "checkBackLater": MessageLookupByLibrary.simpleMessage("Volte em breve!"),
    "checkingLocation": MessageLookupByLibrary.simpleMessage(
      "A verificar localização...",
    ),
    "city": MessageLookupByLibrary.simpleMessage("Cidade"),
    "clear": MessageLookupByLibrary.simpleMessage("Limpar"),
    "close": MessageLookupByLibrary.simpleMessage("Fechar"),
    "closed": MessageLookupByLibrary.simpleMessage("Fechado"),
    "cocktail": MessageLookupByLibrary.simpleMessage("Cocktail"),
    "combos": MessageLookupByLibrary.simpleMessage("Combos"),
    "combosLabelCustom": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "combosLabelHint": MessageLookupByLibrary.simpleMessage(
      "Escolha ou crie a etiqueta que melhor se adapte ao seu negocio",
    ),
    "combosLabelMenus": MessageLookupByLibrary.simpleMessage("Menus"),
    "combosLabelPlatters": MessageLookupByLibrary.simpleMessage("Travessas"),
    "combosLabelSetMeals": MessageLookupByLibrary.simpleMessage(
      "Pratos Completos",
    ),
    "combosLabelSpecials": MessageLookupByLibrary.simpleMessage("Especiais"),
    "combosLabelTitle": m31,
    "communityGuidelinesNotice": MessageLookupByLibrary.simpleMessage(
      "Ao publicar, aceitas as nossas Normas da Comunidade.",
    ),
    "complete": MessageLookupByLibrary.simpleMessage("Completar"),
    "completeSignUp": MessageLookupByLibrary.simpleMessage("Completar Registo"),
    "completed": MessageLookupByLibrary.simpleMessage("Concluída"),
    "composure": MessageLookupByLibrary.simpleMessage("Compostura"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
    "confirmApproveQuote": MessageLookupByLibrary.simpleMessage(
      "Aprovar este orçamento?",
    ),
    "confirmApproveQuoteMessage": MessageLookupByLibrary.simpleMessage(
      "Ao aprovar, confirma a reserva. O pagamento é feito fora da plataforma.",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirmar senha"),
    "confirmPasswordForEmailChange": MessageLookupByLibrary.simpleMessage(
      "Por segurança, introduz a tua palavra-passe atual para alterar o teu email.",
    ),
    "confirmPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Confirma a tua palavra-passe",
    ),
    "confirmPhoneForVerification": MessageLookupByLibrary.simpleMessage(
      "Confirma o número de telefone para receber o teu código de verificação.",
    ),
    "confirmRejectQuote": MessageLookupByLibrary.simpleMessage(
      "Rejeitar este orçamento?",
    ),
    "confirmRejectQuoteMessage": MessageLookupByLibrary.simpleMessage(
      "Ao rejeitar, esta solicitação é encerrada e o estabelecimento será notificado. Esta ação não pode ser desfeita.",
    ),
    "confirmed": MessageLookupByLibrary.simpleMessage("Confirmada"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Erro de conexão. Verifique sua internet e tente novamente.",
    ),
    "contactAdmin": MessageLookupByLibrary.simpleMessage(
      "Ocorreu um erro, por favor contacte o administrador.",
    ),
    "contactAttachImage": MessageLookupByLibrary.simpleMessage(
      "Anexar imagem (opcional, máx. 3 MB)",
    ),
    "contactEmail": MessageLookupByLibrary.simpleMessage("Email de contacto"),
    "contactFileTooLarge": MessageLookupByLibrary.simpleMessage(
      "A imagem deve ter menos de 3 MB",
    ),
    "contactImageAttached": MessageLookupByLibrary.simpleMessage(
      "Imagem anexada",
    ),
    "contactMessageHint": MessageLookupByLibrary.simpleMessage(
      "Escreva a sua mensagem aqui...",
    ),
    "contactNumber": MessageLookupByLibrary.simpleMessage("Número de contacto"),
    "contactPrivacyNotice": MessageLookupByLibrary.simpleMessage(
      "Visível apenas para si e para os estabelecimentos onde tem uma reserva ativa.",
    ),
    "contactRecipientHello": MessageLookupByLibrary.simpleMessage(
      "Consultas gerais",
    ),
    "contactRecipientPrivacy": MessageLookupByLibrary.simpleMessage(
      "Privacidade e dados",
    ),
    "contactRemoveImage": MessageLookupByLibrary.simpleMessage("Remover"),
    "contactSelectRecipient": MessageLookupByLibrary.simpleMessage(
      "Selecionar destinatário",
    ),
    "contactSentSuccess": MessageLookupByLibrary.simpleMessage(
      "A sua mensagem foi enviada com sucesso!",
    ),
    "contactSubjectHint": MessageLookupByLibrary.simpleMessage(
      "Assunto da sua mensagem",
    ),
    "contactUs": MessageLookupByLibrary.simpleMessage("Contacte-nos"),
    "conversionFunnel": MessageLookupByLibrary.simpleMessage(
      "Funil de conversão",
    ),
    "cookingClass": MessageLookupByLibrary.simpleMessage("Aula de culinária"),
    "cookingSchools": MessageLookupByLibrary.simpleMessage(
      "Escolas de Cozinha",
    ),
    "copyrightText": m32,
    "corporate": MessageLookupByLibrary.simpleMessage("Corporativo"),
    "couldNotLoadAnalytics": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar as análises",
    ),
    "couldNotLoadNewReleases": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar os recém abertos",
    ),
    "couldNotLoadProfile": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar o perfil",
    ),
    "couldNotLoadPromotions": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar as promoções",
    ),
    "couldNotLoadReservationDetails": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar os detalhes da reserva.",
    ),
    "country": MessageLookupByLibrary.simpleMessage("País"),
    "countryArgentina": MessageLookupByLibrary.simpleMessage("Argentina"),
    "countryEcuador": MessageLookupByLibrary.simpleMessage("Equador"),
    "countryElSalvador": MessageLookupByLibrary.simpleMessage("El Salvador"),
    "countryPortugal": MessageLookupByLibrary.simpleMessage("Portugal"),
    "countrySpain": MessageLookupByLibrary.simpleMessage("Espanha"),
    "countryUsa": MessageLookupByLibrary.simpleMessage("EUA"),
    "countryVenezuela": MessageLookupByLibrary.simpleMessage("Venezuela"),
    "coverImagesSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
      "Imagens de capa atualizadas com sucesso!",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Criar"),
    "createNewPromotion": MessageLookupByLibrary.simpleMessage(
      "Criar nova promoção",
    ),
    "createPackage": MessageLookupByLibrary.simpleMessage("Criar pacote"),
    "createPostTitle": MessageLookupByLibrary.simpleMessage("Criar publicação"),
    "createUser": MessageLookupByLibrary.simpleMessage("Criar Utilizador"),
    "cropImage": MessageLookupByLibrary.simpleMessage("Recortar imagem"),
    "cuisineExample": MessageLookupByLibrary.simpleMessage("Ex: Mediterrânica"),
    "cuisines": MessageLookupByLibrary.simpleMessage("Cozinhas"),
    "currency": MessageLookupByLibrary.simpleMessage("Moeda"),
    "custom": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "customer": MessageLookupByLibrary.simpleMessage("Cliente"),
    "dailyTrends": MessageLookupByLibrary.simpleMessage("Tendências diárias"),
    "dangerZone": MessageLookupByLibrary.simpleMessage("Zona de Perigo"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "dashboardAdditionalInformationText1": MessageLookupByLibrary.simpleMessage(
      "Informações",
    ),
    "dashboardAdditionalInformationText2": MessageLookupByLibrary.simpleMessage(
      "Adicionais",
    ),
    "dashboardContactText1": MessageLookupByLibrary.simpleMessage("Meios de"),
    "dashboardContactText2": MessageLookupByLibrary.simpleMessage("Contacto"),
    "dashboardOpeningHoursText1": MessageLookupByLibrary.simpleMessage(
      "Horários de",
    ),
    "dashboardOpeningHoursText2": MessageLookupByLibrary.simpleMessage(
      "Abertura",
    ),
    "dashboardReviewsOfOurCustomersText1": MessageLookupByLibrary.simpleMessage(
      "Opiniões dos nossos",
    ),
    "dashboardReviewsOfOurCustomersText2": MessageLookupByLibrary.simpleMessage(
      "Clientes",
    ),
    "dashboardServicesAtText1": MessageLookupByLibrary.simpleMessage(
      "Serviços no",
    ),
    "dashboardServicesAtText2": MessageLookupByLibrary.simpleMessage(
      "Estabelecimento",
    ),
    "date": MessageLookupByLibrary.simpleMessage("Data"),
    "dateBlocked": MessageLookupByLibrary.simpleMessage("Data bloqueada"),
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Data de nascimento"),
    "datePartiallyBlockedInfo": MessageLookupByLibrary.simpleMessage(
      "Esse dia tem horários parcialmente reservados. Podemos pedir-te para ajustar a hora.",
    ),
    "dateUnavailable": MessageLookupByLibrary.simpleMessage(
      "Essa data acabou de ser bloqueada. Escolhe outra, por favor.",
    ),
    "december": MessageLookupByLibrary.simpleMessage("Dezembro"),
    "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Eliminar Conta"),
    "deleteAccountBusinessWarning": MessageLookupByLibrary.simpleMessage(
      "Tem um negócio ativo que também será eliminado permanentemente e não poderá ser recuperado.",
    ),
    "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
      "Sim, eliminar a minha conta",
    ),
    "deleteAccountTitle": MessageLookupByLibrary.simpleMessage(
      "Eliminar a sua conta?",
    ),
    "deleteAccountWarning": MessageLookupByLibrary.simpleMessage(
      "Esta ação é permanente. Os seus dados pessoais serão apagados e todos os seus negócios serão removidos. Será desligado imediatamente.",
    ),
    "deleteAllCategoryItems": MessageLookupByLibrary.simpleMessage(
      "\n\nEsta ação eliminará permanentemente todos os itens desta categoria.",
    ),
    "deleteBlock": MessageLookupByLibrary.simpleMessage("Excluir bloqueio"),
    "deleteBlockConfirm": MessageLookupByLibrary.simpleMessage(
      "Tem certeza que deseja excluir este bloqueio? Esta ação não pode ser desfeita.",
    ),
    "deleteBusiness": MessageLookupByLibrary.simpleMessage("Eliminar Negócio"),
    "deleteBusinessConfirm": MessageLookupByLibrary.simpleMessage(
      "Sim, eliminar negócio",
    ),
    "deleteBusinessSuccess": MessageLookupByLibrary.simpleMessage(
      "Negócio eliminado com sucesso",
    ),
    "deleteBusinessTitle": MessageLookupByLibrary.simpleMessage(
      "Eliminar este negócio?",
    ),
    "deleteBusinessWarning": MessageLookupByLibrary.simpleMessage(
      "Esta ação é permanente. O negócio e todo o seu conteúdo (menu, promoções, reservas) será removido.",
    ),
    "deleteCategory": MessageLookupByLibrary.simpleMessage(
      "Eliminar categoria",
    ),
    "deletePackage": MessageLookupByLibrary.simpleMessage("Eliminar pacote"),
    "deletePackageConfirmation": MessageLookupByLibrary.simpleMessage(
      "Tem a certeza que deseja eliminar este pacote? Esta ação não pode ser revertida.",
    ),
    "deletePostConfirm": MessageLookupByLibrary.simpleMessage(
      "Tem a certeza de que pretende eliminar esta publicação?",
    ),
    "deletePostTitle": MessageLookupByLibrary.simpleMessage(
      "Eliminar publicação",
    ),
    "delivery": MessageLookupByLibrary.simpleMessage("Entrega ao Domicílio"),
    "depositPercentage": MessageLookupByLibrary.simpleMessage(
      "Percentagem de depósito",
    ),
    "depositRequired": MessageLookupByLibrary.simpleMessage(
      "Depósito obrigatório",
    ),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("Descrição"),
    "dietaryNotes": MessageLookupByLibrary.simpleMessage("Notas dietéticas"),
    "dinner": MessageLookupByLibrary.simpleMessage("Jantar"),
    "doItLater": MessageLookupByLibrary.simpleMessage(
      "Vou fazer isto mais tarde",
    ),
    "doYouWantToDeleteThisCoverImage": MessageLookupByLibrary.simpleMessage(
      "Deseja eliminar esta imagem de capa?",
    ),
    "downloadApp": MessageLookupByLibrary.simpleMessage("Obter a app"),
    "downloadQrImage": MessageLookupByLibrary.simpleMessage(
      "Transferir imagem QR",
    ),
    "drinks": MessageLookupByLibrary.simpleMessage("Bebidas"),
    "durationHours": MessageLookupByLibrary.simpleMessage("Duração (horas)"),
    "edit": MessageLookupByLibrary.simpleMessage("Editar"),
    "editCoverImages": MessageLookupByLibrary.simpleMessage(
      "Editar Imagens de Capa",
    ),
    "editLocation": MessageLookupByLibrary.simpleMessage("Editar Localização"),
    "editMenu": MessageLookupByLibrary.simpleMessage("Editar menu"),
    "editPackage": MessageLookupByLibrary.simpleMessage("Editar pacote"),
    "editReview": MessageLookupByLibrary.simpleMessage("Editar avaliação"),
    "editTitle": MessageLookupByLibrary.simpleMessage("Editar título"),
    "editYourReviewFor": m33,
    "email": MessageLookupByLibrary.simpleMessage("Correio eletrónico"),
    "emailChangeBlockedForSocialUser": MessageLookupByLibrary.simpleMessage(
      "Primeiro define uma palavra-passe para a tua conta, depois poderás alterar o teu email.",
    ),
    "emailSectionTitle1": MessageLookupByLibrary.simpleMessage("O teu"),
    "emailSectionTitle2": MessageLookupByLibrary.simpleMessage("Email"),
    "emailUpdated": MessageLookupByLibrary.simpleMessage(
      "O teu email foi atualizado com sucesso.",
    ),
    "enableDigitalMenu": MessageLookupByLibrary.simpleMessage(
      "Ativar menu digital",
    ),
    "enableDigitalMenuHint": MessageLookupByLibrary.simpleMessage(
      "Mostra um menu além dos teus pacotes",
    ),
    "enableLocation": MessageLookupByLibrary.simpleMessage(
      "Ativar localização",
    ),
    "enableLocationDescription": MessageLookupByLibrary.simpleMessage(
      "Toque para ativar o acesso à localização",
    ),
    "end": MessageLookupByLibrary.simpleMessage("Fecho"),
    "endDate": MessageLookupByLibrary.simpleMessage("Data de fim"),
    "endSession": MessageLookupByLibrary.simpleMessage("Terminar Sessão"),
    "endTime": MessageLookupByLibrary.simpleMessage("Hora de fim"),
    "enterAValidEmail": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza um endereço de correio eletrónico válido",
    ),
    "enterAValidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza um número de telefone válido",
    ),
    "enterAValidPostalCode": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza um código postal válido",
    ),
    "enterCategoryName": MessageLookupByLibrary.simpleMessage(
      "Introduza um nome para esta categoria",
    ),
    "enterCodeSentTo": m34,
    "enterQuoteAmount": MessageLookupByLibrary.simpleMessage(
      "Introduza o valor do orçamento",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Erro"),
    "errorLoadingVideo": MessageLookupByLibrary.simpleMessage(
      "Erro ao carregar o vídeo",
    ),
    "errorUpdatingPromotionMedia": MessageLookupByLibrary.simpleMessage(
      "Erro ao atualizar média da promoção",
    ),
    "errorUploadingPromotionMedia": MessageLookupByLibrary.simpleMessage(
      "Erro ao carregar média da promoção",
    ),
    "eventAddress": MessageLookupByLibrary.simpleMessage("Morada do evento"),
    "eventCity": MessageLookupByLibrary.simpleMessage("Cidade do evento"),
    "eventLocation": MessageLookupByLibrary.simpleMessage(
      "Localização do evento",
    ),
    "eventType": MessageLookupByLibrary.simpleMessage("Tipo de evento"),
    "eventTypeBirthday": MessageLookupByLibrary.simpleMessage("Aniversário"),
    "eventTypeBrunch": MessageLookupByLibrary.simpleMessage("Brunch"),
    "eventTypeCocktail": MessageLookupByLibrary.simpleMessage("Cocktail"),
    "eventTypeCookingClassPrivate": MessageLookupByLibrary.simpleMessage(
      "Aula de culinária privada",
    ),
    "eventTypeCorporate": MessageLookupByLibrary.simpleMessage("Corporativo"),
    "eventTypeCustom": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "eventTypeDinner": MessageLookupByLibrary.simpleMessage("Jantar"),
    "eventTypeLunch": MessageLookupByLibrary.simpleMessage("Almoço"),
    "eventTypeWedding": MessageLookupByLibrary.simpleMessage("Casamento"),
    "exploreAsGuest": MessageLookupByLibrary.simpleMessage("Explorar"),
    "failedDeletePhotos": m35,
    "failedToCancelReservation": MessageLookupByLibrary.simpleMessage(
      "Falha ao cancelar a reserva.",
    ),
    "failedToCompleteReservation": MessageLookupByLibrary.simpleMessage(
      "Falha ao concluir a reserva.",
    ),
    "failedToConfirmReservation": MessageLookupByLibrary.simpleMessage(
      "Falha ao confirmar a reserva.",
    ),
    "failedToLoadPromotionDetails": MessageLookupByLibrary.simpleMessage(
      "Falha ao carregar os detalhes da promoção.",
    ),
    "failedToMarkNoShow": MessageLookupByLibrary.simpleMessage(
      "Falha ao marcar como não compareceu.",
    ),
    "failedToRejectReservation": MessageLookupByLibrary.simpleMessage(
      "Falha ao rejeitar a reserva.",
    ),
    "fastFood": MessageLookupByLibrary.simpleMessage("Comida Rápida"),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoritos"),
    "featured": MessageLookupByLibrary.simpleMessage("Destaque"),
    "featuredPackageHint": MessageLookupByLibrary.simpleMessage(
      "Pacotes em destaque aparecem primeiro",
    ),
    "february": MessageLookupByLibrary.simpleMessage("Fevereiro"),
    "feedFilterFollowing": MessageLookupByLibrary.simpleMessage("A seguir"),
    "feedFilterNearby": MessageLookupByLibrary.simpleMessage("Próximos"),
    "feedFollowingEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Segue utilizadores no separador Utilizadores para veres as publicações deles aqui.",
    ),
    "feedFollowingEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Ainda não segues ninguém",
    ),
    "female": MessageLookupByLibrary.simpleMessage("Feminino"),
    "fieldRequired": MessageLookupByLibrary.simpleMessage(
      "Este campo é obrigatório",
    ),
    "findAndCompleteAddress": MessageLookupByLibrary.simpleMessage(
      "Encontre e complete facilmente o seu endereço",
    ),
    "finishEdit": MessageLookupByLibrary.simpleMessage(
      "Terminar modo de edição",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("Nome próprio"),
    "fixed": MessageLookupByLibrary.simpleMessage("Fixo"),
    "flexible": MessageLookupByLibrary.simpleMessage("Flexível"),
    "follow": MessageLookupByLibrary.simpleMessage("Seguir"),
    "followers": MessageLookupByLibrary.simpleMessage("Seguidores"),
    "following": MessageLookupByLibrary.simpleMessage("Seguindo"),
    "food": MessageLookupByLibrary.simpleMessage("Pratos"),
    "foodTrucks": MessageLookupByLibrary.simpleMessage("Food Trucks e Stands"),
    "foodlyCoverage": MessageLookupByLibrary.simpleMessage("Cobertura Foodly"),
    "foodlyCoverageDescription": MessageLookupByLibrary.simpleMessage(
      "Foodly está disponível atualmente nos seguintes países:",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Esqueceu-se da senha?",
    ),
    "fromReservation": MessageLookupByLibrary.simpleMessage("Reserva"),
    "fullDay": MessageLookupByLibrary.simpleMessage("Dia inteiro"),
    "fusionCuisine": MessageLookupByLibrary.simpleMessage("Culinária de Fusão"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galeria"),
    "gender": MessageLookupByLibrary.simpleMessage("Género"),
    "generateQR": MessageLookupByLibrary.simpleMessage("Gerar código QR"),
    "generateWithAI": MessageLookupByLibrary.simpleMessage("Gerar com IA"),
    "generatingQr": MessageLookupByLibrary.simpleMessage("A gerar…"),
    "genericErrorRetry": MessageLookupByLibrary.simpleMessage(
      "Algo correu mal. Tenta de novo.",
    ),
    "goodAfternoon": MessageLookupByLibrary.simpleMessage("Boa tarde"),
    "goodEvening": MessageLookupByLibrary.simpleMessage("Boa noite"),
    "goodMorning": MessageLookupByLibrary.simpleMessage("Bom dia"),
    "groupOrderAddFromMenu": MessageLookupByLibrary.simpleMessage(
      "Adiciona pratos do menu",
    ),
    "groupOrderBackHome": MessageLookupByLibrary.simpleMessage(
      "Voltar ao início",
    ),
    "groupOrderBackToMenu": MessageLookupByLibrary.simpleMessage(
      "Voltar ao menu",
    ),
    "groupOrderBatchSentBody": m36,
    "groupOrderBatchSentTitle": MessageLookupByLibrary.simpleMessage(
      "Pedido enviado à cozinha!",
    ),
    "groupOrderCancelledNotice": MessageLookupByLibrary.simpleMessage(
      "Este pedido foi cancelado. Não foi cobrado nada.",
    ),
    "groupOrderCashRequestUndo": MessageLookupByLibrary.simpleMessage(
      "Prefiro pagar na app",
    ),
    "groupOrderCashRequestedCta": MessageLookupByLibrary.simpleMessage(
      "O negócio já foi avisado",
    ),
    "groupOrderCashRequestedHint": MessageLookupByLibrary.simpleMessage(
      "Dirige-te ao balcão para pagar. O empregado confirmará o pagamento.",
    ),
    "groupOrderChipPreparing": MessageLookupByLibrary.simpleMessage(
      "Preparando seu pedido",
    ),
    "groupOrderChipReady": MessageLookupByLibrary.simpleMessage(
      "Seu pedido está pronto!",
    ),
    "groupOrderChipSent": MessageLookupByLibrary.simpleMessage(
      "Pedido enviado",
    ),
    "groupOrderChipToPay": m37,
    "groupOrderCompletedNotice": MessageLookupByLibrary.simpleMessage(
      "Este pedido já está fechado.",
    ),
    "groupOrderConfirmingPayment": MessageLookupByLibrary.simpleMessage(
      "Estamos a confirmar o teu pagamento. Pode demorar alguns segundos.",
    ),
    "groupOrderCoverConfirm": m38,
    "groupOrderCoverShare": MessageLookupByLibrary.simpleMessage(
      "Cobrir esta parte",
    ),
    "groupOrderCreating": MessageLookupByLibrary.simpleMessage("A criar…"),
    "groupOrderDeleteConfirm": MessageLookupByLibrary.simpleMessage(
      "Eliminar este pedido vazio? Esta ação não pode ser anulada.",
    ),
    "groupOrderDeleteCta": MessageLookupByLibrary.simpleMessage(
      "Eliminar pedido",
    ),
    "groupOrderEnterCodeManually": MessageLookupByLibrary.simpleMessage(
      "Introduzir código manualmente",
    ),
    "groupOrderEntryCta": MessageLookupByLibrary.simpleMessage(
      "Pedir em grupo",
    ),
    "groupOrderExpiredNotice": MessageLookupByLibrary.simpleMessage(
      "Este pedido expirou: esgotou-se o prazo de pagamento e não foi cobrado nada. Podes pedir de novo a partir do menu.",
    ),
    "groupOrderGraceNotice": m39,
    "groupOrderHostBadge": MessageLookupByLibrary.simpleMessage("Anfitrião"),
    "groupOrderInviteCta": MessageLookupByLibrary.simpleMessage("Convidar"),
    "groupOrderInviteFailed": MessageLookupByLibrary.simpleMessage(
      "Não conseguimos gerar o código de convite",
    ),
    "groupOrderInviteHint": MessageLookupByLibrary.simpleMessage(
      "Partilha este código — válido por 24 horas",
    ),
    "groupOrderInviteShareCta": MessageLookupByLibrary.simpleMessage(
      "Partilhar código",
    ),
    "groupOrderInviteShareMsg": m40,
    "groupOrderInviteTitle": MessageLookupByLibrary.simpleMessage(
      "Convida a tua mesa",
    ),
    "groupOrderItemVoided": MessageLookupByLibrary.simpleMessage(
      "Removido pelo negócio · não é cobrado",
    ),
    "groupOrderItemsSection": MessageLookupByLibrary.simpleMessage("Itens"),
    "groupOrderJoinCta": MessageLookupByLibrary.simpleMessage(
      "Foste convidado? Junta-te com um código",
    ),
    "groupOrderJoinFailed": MessageLookupByLibrary.simpleMessage(
      "Não foi possível juntar-se ao pedido",
    ),
    "groupOrderJoinHint": MessageLookupByLibrary.simpleMessage(
      "Código de convite",
    ),
    "groupOrderJoinTitle": MessageLookupByLibrary.simpleMessage(
      "Juntar-se a um pedido",
    ),
    "groupOrderLeaveConfirm": MessageLookupByLibrary.simpleMessage(
      "Sair deste pedido? Pode voltar a juntar-se lendo o QR.",
    ),
    "groupOrderLeaveCta": MessageLookupByLibrary.simpleMessage(
      "Sair do pedido",
    ),
    "groupOrderLockConfirmSolo": MessageLookupByLibrary.simpleMessage(
      "Finalizar o pedido e passar ao pagamento? Já não poderá adicionar itens.",
    ),
    "groupOrderLockCta": MessageLookupByLibrary.simpleMessage(
      "Finalizar o pedido",
    ),
    "groupOrderNewTab": MessageLookupByLibrary.simpleMessage(
      "Abrir outra conta",
    ),
    "groupOrderNextRound": MessageLookupByLibrary.simpleMessage(
      "Pedir outra rodada",
    ),
    "groupOrderNoBalanceDue": MessageLookupByLibrary.simpleMessage(
      "Sem saldo pendente",
    ),
    "groupOrderNoItems": MessageLookupByLibrary.simpleMessage(
      "Ainda não há itens",
    ),
    "groupOrderOngoingChannelDesc": MessageLookupByLibrary.simpleMessage(
      "Estado do teu pedido em grupo em curso",
    ),
    "groupOrderOngoingChannelName": MessageLookupByLibrary.simpleMessage(
      "Pedido em grupo ativo",
    ),
    "groupOrderOrderMore": MessageLookupByLibrary.simpleMessage("Pedir mais"),
    "groupOrderPaidBy": m41,
    "groupOrderPaidProgress": m42,
    "groupOrderParticipants": MessageLookupByLibrary.simpleMessage(
      "Participantes",
    ),
    "groupOrderPayAllConfirm": m43,
    "groupOrderPayAllRemaining": m44,
    "groupOrderPayAtRegister": MessageLookupByLibrary.simpleMessage(
      "Pagar ao balcão",
    ),
    "groupOrderPayAtRegisterConfirm": MessageLookupByLibrary.simpleMessage(
      "Avisar que pagam ao balcão? Não poderás adicionar mais artigos a este pedido.",
    ),
    "groupOrderPayAtRegisterHint": MessageLookupByLibrary.simpleMessage(
      "Avisas o negócio e pagas ao balcão. Sem comissão da Foodly.",
    ),
    "groupOrderPayBillCta": m45,
    "groupOrderPayBillHint": MessageLookupByLibrary.simpleMessage(
      "Você pode dividi-la com a mesa como quiser",
    ),
    "groupOrderPayBlockedHint": MessageLookupByLibrary.simpleMessage(
      "O pagamento libera quando tudo for entregue",
    ),
    "groupOrderPayFullOrder": m46,
    "groupOrderPayMyShare": m47,
    "groupOrderPayWithBizum": MessageLookupByLibrary.simpleMessage(
      "Pagar com Bizum",
    ),
    "groupOrderPayWithMbWay": MessageLookupByLibrary.simpleMessage(
      "Pagar com MB WAY",
    ),
    "groupOrderPaymentCanceled": MessageLookupByLibrary.simpleMessage(
      "Pagamento cancelado",
    ),
    "groupOrderPaymentFailed": MessageLookupByLibrary.simpleMessage(
      "Não foi possível concluir o pagamento",
    ),
    "groupOrderPaymentInBrowser": MessageLookupByLibrary.simpleMessage(
      "Abrimos o navegador para concluíres o pagamento",
    ),
    "groupOrderPaymentSucceeded": MessageLookupByLibrary.simpleMessage(
      "Pagamento efetuado",
    ),
    "groupOrderPaymentSuccessBody": m48,
    "groupOrderPaymentSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Pedido confirmado!",
    ),
    "groupOrderPoweredByStripe": MessageLookupByLibrary.simpleMessage(
      "Pagamentos processados pela Stripe Inc.",
    ),
    "groupOrderRequestBillConfirm": MessageLookupByLibrary.simpleMessage(
      "Pedir a conta? Você não poderá adicionar mais itens a este pedido.",
    ),
    "groupOrderScanHint": MessageLookupByLibrary.simpleMessage(
      "Pede ao anfitrião para mostrar o QR do pedido",
    ),
    "groupOrderScanTitle": MessageLookupByLibrary.simpleMessage(
      "Digitaliza o QR da tua mesa",
    ),
    "groupOrderSeeStatus": MessageLookupByLibrary.simpleMessage(
      "Ver o estado do pedido",
    ),
    "groupOrderSendCta": MessageLookupByLibrary.simpleMessage("Enviar pedido"),
    "groupOrderSendHint": MessageLookupByLibrary.simpleMessage(
      "A cozinha recebe na hora · você paga no final",
    ),
    "groupOrderServiceFeeExplain": m49,
    "groupOrderServiceFeeNotice": m50,
    "groupOrderServiceFeeTitle": MessageLookupByLibrary.simpleMessage(
      "Taxa de processamento",
    ),
    "groupOrderShareItemTooltip": MessageLookupByLibrary.simpleMessage(
      "Partilhar com a mesa",
    ),
    "groupOrderSharedBadge": MessageLookupByLibrary.simpleMessage("Partilhado"),
    "groupOrderSharedBadgeTooltip": MessageLookupByLibrary.simpleMessage(
      "Este item é dividido por todos na mesa",
    ),
    "groupOrderSplitByItems": MessageLookupByLibrary.simpleMessage("Por itens"),
    "groupOrderSplitByItemsDesc": MessageLookupByLibrary.simpleMessage(
      "Cada um paga o seu; o partilhado divide-se.",
    ),
    "groupOrderSplitEqual": MessageLookupByLibrary.simpleMessage(
      "Em partes iguais",
    ),
    "groupOrderSplitEqualDesc": MessageLookupByLibrary.simpleMessage(
      "O total divide-se igualmente entre todos.",
    ),
    "groupOrderSplitModeTitle": MessageLookupByLibrary.simpleMessage(
      "Como dividimos a conta?",
    ),
    "groupOrderTabClosedBody": m51,
    "groupOrderTabClosedTitle": MessageLookupByLibrary.simpleMessage(
      "Pedido finalizado!",
    ),
    "groupOrderTipBaseSummary": m52,
    "groupOrderTipCustom": MessageLookupByLibrary.simpleMessage("Outro valor"),
    "groupOrderTipNone": MessageLookupByLibrary.simpleMessage("Sem gorjeta"),
    "groupOrderTipTitle": MessageLookupByLibrary.simpleMessage(
      "Queres deixar gorjeta?",
    ),
    "groupOrderTitle": MessageLookupByLibrary.simpleMessage("Pedido em grupo"),
    "groupOrderTotal": MessageLookupByLibrary.simpleMessage("Total do pedido"),
    "groupOrderTrackConfirmed": MessageLookupByLibrary.simpleMessage(
      "O negócio recebeu seu pedido",
    ),
    "groupOrderTrackDelivered": MessageLookupByLibrary.simpleMessage(
      "Pedido entregue — bom apetite!",
    ),
    "groupOrderTrackPreparing": MessageLookupByLibrary.simpleMessage(
      "Seu pedido está sendo preparado",
    ),
    "groupOrderTrackReady": MessageLookupByLibrary.simpleMessage(
      "Seu pedido está pronto!",
    ),
    "groupOrderTrackToPay": MessageLookupByLibrary.simpleMessage(
      "Tudo servido — falta pagar a conta",
    ),
    "groupOrderTransferHost": MessageLookupByLibrary.simpleMessage(
      "Transferir titularidade",
    ),
    "groupOrderTransferHostConfirm": m53,
    "groupOrderUnlockConfirm": MessageLookupByLibrary.simpleMessage(
      "Reabrir o pedido? Os preços são descongelados e os itens poderão ser editados.",
    ),
    "groupOrderUnlockCta": MessageLookupByLibrary.simpleMessage(
      "Reabrir o pedido",
    ),
    "groupOrderViewOrder": MessageLookupByLibrary.simpleMessage("Ver o pedido"),
    "groupOrderYourShare": MessageLookupByLibrary.simpleMessage("A tua parte"),
    "guestCount": MessageLookupByLibrary.simpleMessage("Número de convidados"),
    "guestGateCommunity": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para ver a comunidade.",
    ),
    "guestGateFaved": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para ver os teus negócios favoritos.",
    ),
    "guestGateFavorite": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para guardar favoritos.",
    ),
    "guestGateGeneric": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para usar esta funcionalidade.",
    ),
    "guestGateGroupOrder": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para criar um pedido em grupo.",
    ),
    "guestGateNotifications": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para ver as tuas notificações.",
    ),
    "guestGatePost": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para publicar na comunidade.",
    ),
    "guestGateProfile": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para acederes ao teu perfil.",
    ),
    "guestGateReserve": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para reservar.",
    ),
    "guestGateReview": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para deixar uma avaliação.",
    ),
    "guestGateSaved": MessageLookupByLibrary.simpleMessage(
      "Inicia sessão ou regista-te para ver as tuas promoções guardadas.",
    ),
    "guestGateTitle": MessageLookupByLibrary.simpleMessage("Cria a tua conta"),
    "guestUserName": MessageLookupByLibrary.simpleMessage("Visitante"),
    "guests": MessageLookupByLibrary.simpleMessage("comensais"),
    "happyBirthday": MessageLookupByLibrary.simpleMessage("Feliz Aniversário"),
    "happyHours": MessageLookupByLibrary.simpleMessage("Horas Felizes"),
    "hasInsurance": MessageLookupByLibrary.simpleMessage("Tem seguro"),
    "hi": MessageLookupByLibrary.simpleMessage("Olá"),
    "home": MessageLookupByLibrary.simpleMessage("Início"),
    "imageSizeLessThan10mb": MessageLookupByLibrary.simpleMessage(
      "O tamanho da imagem deve ser inferior a 10MB",
    ),
    "includeItemHint": MessageLookupByLibrary.simpleMessage(
      "Ex: Entrada, prato principal, sobremesa",
    ),
    "includes": MessageLookupByLibrary.simpleMessage("Inclui"),
    "incompletePromotionCreateInfo": MessageLookupByLibrary.simpleMessage(
      "Informação incompleta para criar a promoção",
    ),
    "incompletePromotionUpdateInfo": MessageLookupByLibrary.simpleMessage(
      "Informação incompleta para atualizar a promoção",
    ),
    "informationNotYetProvidedByTheBusiness":
        MessageLookupByLibrary.simpleMessage(
          "Informação ainda não fornecida pelo estabelecimento comercial.",
        ),
    "insuranceHint": MessageLookupByLibrary.simpleMessage(
      "Cobertura de seguro de responsabilidade",
    ),
    "interactToReserve": MessageLookupByLibrary.simpleMessage(
      "Interação → Reserva",
    ),
    "internalErrorEmptyPrompt": MessageLookupByLibrary.simpleMessage(
      "Erro interno ao processar pedido. O texto da mensagem está vazio",
    ),
    "internationalCuisine": MessageLookupByLibrary.simpleMessage(
      "Internacional",
    ),
    "introMessage": MessageLookupByLibrary.simpleMessage(
      "Breve apresentação para novos visitantes",
    ),
    "introMessageTooltip": MessageLookupByLibrary.simpleMessage(
      "Pode usar este espaço para dar as boas-vindas aos clientes e destacar o que torna seu negócio especial.\nNós o promoveremos na página principal por cerca de 30 dias.",
    ),
    "invalidMenuCategory": MessageLookupByLibrary.simpleMessage(
      "Categoria de menu inválida",
    ),
    "invalidPromoDates": MessageLookupByLibrary.simpleMessage(
      "Data de início posterior à data de fim",
    ),
    "invalidValue": MessageLookupByLibrary.simpleMessage("Valor inválido"),
    "invalidYoutubeUrl": MessageLookupByLibrary.simpleMessage(
      "URL do YouTube inválido",
    ),
    "iosComingSoonMessage": MessageLookupByLibrary.simpleMessage(
      "Muito em breve no iPhone! O Foodly chega à App Store durante junho de 2026.",
    ),
    "italian": MessageLookupByLibrary.simpleMessage("Italiana"),
    "item": MessageLookupByLibrary.simpleMessage("Item"),
    "itemAvailable": MessageLookupByLibrary.simpleMessage("Item disponível"),
    "itemCreatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Item criado com sucesso",
    ),
    "itemDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Item eliminado com sucesso",
    ),
    "itemUnavailable": MessageLookupByLibrary.simpleMessage(
      "Item temporariamente indisponível",
    ),
    "itemUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Item atualizado com sucesso",
    ),
    "items": MessageLookupByLibrary.simpleMessage("Itens"),
    "january": MessageLookupByLibrary.simpleMessage("Janeiro"),
    "july": MessageLookupByLibrary.simpleMessage("Julho"),
    "june": MessageLookupByLibrary.simpleMessage("Junho"),
    "kidChairs": MessageLookupByLibrary.simpleMessage("Cadeiras para Crianças"),
    "kidsMenu": MessageLookupByLibrary.simpleMessage("Menu infantil"),
    "kidsPlayArea": MessageLookupByLibrary.simpleMessage(
      "Área de Brincadeiras para Crianças",
    ),
    "koreanCuisine": MessageLookupByLibrary.simpleMessage("Coreana"),
    "languageExample": MessageLookupByLibrary.simpleMessage("Ex: Português"),
    "languages": MessageLookupByLibrary.simpleMessage("Idiomas"),
    "lastName": MessageLookupByLibrary.simpleMessage("Apelido"),
    "legendAutoReservation": MessageLookupByLibrary.simpleMessage("Reserva"),
    "legendFullDayBlock": MessageLookupByLibrary.simpleMessage("Dia inteiro"),
    "legendPartialBlock": MessageLookupByLibrary.simpleMessage("Parcial"),
    "likes": MessageLookupByLibrary.simpleMessage("Gostos"),
    "listening": MessageLookupByLibrary.simpleMessage("A ouvir"),
    "liveMusic": MessageLookupByLibrary.simpleMessage("Música ao Vivo"),
    "loadFailedMessage": MessageLookupByLibrary.simpleMessage(
      "Não conseguimos carregar. Verifica a tua ligação e tenta de novo.",
    ),
    "loadFailedRetry": MessageLookupByLibrary.simpleMessage("Tentar de novo"),
    "loadLogo": MessageLookupByLibrary.simpleMessage("Carregar Logo"),
    "loadingAvailability": MessageLookupByLibrary.simpleMessage(
      "A carregar disponibilidade…",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Permissão de localização negada. Precisamos da sua localização para mostrar restaurantes próximos.",
    ),
    "locationPermissionPermanentlyDenied": MessageLookupByLibrary.simpleMessage(
      "Localização permanentemente negada. Ative nas definições da app.",
    ),
    "locationPermissionWebInstructions": MessageLookupByLibrary.simpleMessage(
      "Ativa a localização através do ícone do cadeado na barra do navegador.",
    ),
    "locationRationaleBody": MessageLookupByLibrary.simpleMessage(
      "O Foodly usa a sua localização para encontrar restaurantes perto de si. A sua localização nunca é partilhada com outros utilizadores.",
    ),
    "locationRationaleTitle": MessageLookupByLibrary.simpleMessage(
      "Acesso à localização necessário",
    ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "Os serviços de localização estão desativados. Ative-os nas definições.",
    ),
    "locationSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
      "Localização atualizada com sucesso.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Iniciar sessão"),
    "loginError": MessageLookupByLibrary.simpleMessage(
      "Erro durante o início de sessão",
    ),
    "loginTo": MessageLookupByLibrary.simpleMessage("Iniciar sessão em"),
    "logout": MessageLookupByLibrary.simpleMessage("Terminar sessão"),
    "logoutDialogTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Terminar sessão exigirá que entre novamente com o seu e-mail e senha ou qualquer rede social associada à sua conta.",
    ),
    "logoutDialogTextSpan2": MessageLookupByLibrary.simpleMessage(
      "Se optar por",
    ),
    "logoutDialogTextSpan3": MessageLookupByLibrary.simpleMessage(
      "Guardar e Fechar",
    ),
    "logoutDialogTextSpan4": MessageLookupByLibrary.simpleMessage(
      ", vai concluir a atividade, mantendo a opção de acesso rápido e seguro através de autenticação biométrica ou por padrão.",
    ),
    "logoutDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Deseja terminar a sessão?",
    ),
    "longPressToDrag": MessageLookupByLibrary.simpleMessage(
      "Mantenha pressionado e arraste para reordenar",
    ),
    "lunch": MessageLookupByLibrary.simpleMessage("Almoço"),
    "mainPromos": MessageLookupByLibrary.simpleMessage("Promoções Destacadas"),
    "male": MessageLookupByLibrary.simpleMessage("Masculino"),
    "manage": MessageLookupByLibrary.simpleMessage("Gerir"),
    "manageReservations": MessageLookupByLibrary.simpleMessage(
      "Gerir Reservas",
    ),
    "managerActivatePaymentsBody": MessageLookupByLibrary.simpleMessage(
      "Verifique o seu negócio com a Stripe para receber os pagamentos dos pedidos diretamente na sua conta bancária. Demora ~5 minutos.",
    ),
    "managerActivatePaymentsTitle": MessageLookupByLibrary.simpleMessage(
      "Ative os pagamentos do seu negócio",
    ),
    "managerActivateWithStripe": MessageLookupByLibrary.simpleMessage(
      "Ativar com a Stripe →",
    ),
    "managerAmendDone": MessageLookupByLibrary.simpleMessage("Fecho corrigido"),
    "managerAmendHint": MessageLookupByLibrary.simpleMessage(
      "A Foodly não processou este dinheiro: corrigir só muda o teu registo.",
    ),
    "managerAmendTitle": MessageLookupByLibrary.simpleMessage(
      "Corrigir o fecho",
    ),
    "managerAmendToPaidOffline": MessageLookupByLibrary.simpleMessage(
      "Foi pago, no balcão",
    ),
    "managerAmendToUnpaid": MessageLookupByLibrary.simpleMessage(
      "Nunca foi pago",
    ),
    "managerAssignTable": MessageLookupByLibrary.simpleMessage("Atribuir mesa"),
    "managerAwaitingCashBadge": MessageLookupByLibrary.simpleMessage(
      "PAGA AO BALCÃO",
    ),
    "managerAwaitingCashNotice": MessageLookupByLibrary.simpleMessage(
      "A mesa avisou que paga ao balcão. Confirma o pagamento quando receberes o dinheiro.",
    ),
    "managerBadgeConfirmed": MessageLookupByLibrary.simpleMessage("CONFIRMADO"),
    "managerBadgeDelivered": MessageLookupByLibrary.simpleMessage("ENTREGUE"),
    "managerBadgePreparing": MessageLookupByLibrary.simpleMessage("A PREPARAR"),
    "managerBadgeReady": MessageLookupByLibrary.simpleMessage("PRONTO"),
    "managerBatchLabel": m54,
    "managerBucketAll": MessageLookupByLibrary.simpleMessage("Todos"),
    "managerBucketDelivered": MessageLookupByLibrary.simpleMessage("Entregues"),
    "managerBucketPending": MessageLookupByLibrary.simpleMessage("Ativos"),
    "managerBucketPreparing": MessageLookupByLibrary.simpleMessage(
      "A preparar",
    ),
    "managerBucketReady": MessageLookupByLibrary.simpleMessage("Prontos"),
    "managerChecklistHint": MessageLookupByLibrary.simpleMessage(
      "Toque em cada item para marcá-lo como entregue",
    ),
    "managerCloseTab": MessageLookupByLibrary.simpleMessage("Fechar conta"),
    "managerCloseTabAlreadyPaid": m55,
    "managerCloseTabBody": m56,
    "managerCloseTabPaidOffline": MessageLookupByLibrary.simpleMessage(
      "Paga ao balcão",
    ),
    "managerCloseTabPartiallyPaid": MessageLookupByLibrary.simpleMessage(
      "Cobrei o resto no local",
    ),
    "managerCloseTabTitle": MessageLookupByLibrary.simpleMessage(
      "Fechar esta conta",
    ),
    "managerCloseTabUnpaid": MessageLookupByLibrary.simpleMessage(
      "Saíram sem pagar",
    ),
    "managerClosedAbandoned": MessageLookupByLibrary.simpleMessage(
      "Por fechar",
    ),
    "managerClosedPaidOffline": MessageLookupByLibrary.simpleMessage(
      "Paga ao balcão",
    ),
    "managerClosedPartiallyPaid": MessageLookupByLibrary.simpleMessage(
      "PARTE AO BALCÃO",
    ),
    "managerClosedUnpaid": MessageLookupByLibrary.simpleMessage("Não paga"),
    "managerDeliverAll": MessageLookupByLibrary.simpleMessage("Marcar todos"),
    "managerDeliverAllAndClose": MessageLookupByLibrary.simpleMessage(
      "Entregar tudo de uma vez",
    ),
    "managerGenericError": MessageLookupByLibrary.simpleMessage(
      "Não foi possível concluir a ação. Tente novamente.",
    ),
    "managerGuestsMeta": m57,
    "managerHistoryDaySummary": m58,
    "managerHistoryEmpty": MessageLookupByLibrary.simpleMessage(
      "Sem pedidos passados ainda",
    ),
    "managerHistoryReadOnly": MessageLookupByLibrary.simpleMessage(
      "Pedido fechado — apenas leitura",
    ),
    "managerHistoryTitle": MessageLookupByLibrary.simpleMessage("Histórico"),
    "managerHistoryYesterday": MessageLookupByLibrary.simpleMessage("Ontem"),
    "managerItemsDelivered": m59,
    "managerLiveOrders": MessageLookupByLibrary.simpleMessage(
      "Pedidos ao vivo",
    ),
    "managerMarkDelivered": MessageLookupByLibrary.simpleMessage(
      "Marcar como ENTREGUE",
    ),
    "managerMarkPreparing": MessageLookupByLibrary.simpleMessage(
      "Marcar como A PREPARAR",
    ),
    "managerMarkReady": MessageLookupByLibrary.simpleMessage(
      "Marcar como PRONTO",
    ),
    "managerMoreItemsTitle": MessageLookupByLibrary.simpleMessage(
      "A mesa pediu mais",
    ),
    "managerNewOrderGo": MessageLookupByLibrary.simpleMessage("Ir atendê-lo"),
    "managerNewOrderLater": MessageLookupByLibrary.simpleMessage("Agora não"),
    "managerNewOrderTitle": MessageLookupByLibrary.simpleMessage(
      "Novo pedido!",
    ),
    "managerNoOrders": MessageLookupByLibrary.simpleMessage(
      "Sem pedidos por agora",
    ),
    "managerOrders": MessageLookupByLibrary.simpleMessage("Pedidos"),
    "managerOrdersTruncated": m60,
    "managerPaidComplete": MessageLookupByLibrary.simpleMessage(
      "Pago por completo",
    ),
    "managerPaidOrderTitle": MessageLookupByLibrary.simpleMessage(
      "Novo pedido pago!",
    ),
    "managerPaymentsActive": MessageLookupByLibrary.simpleMessage(
      "Pagamentos ativos",
    ),
    "managerPaymentsActiveSub": MessageLookupByLibrary.simpleMessage(
      "Verificado com a Stripe · payouts ativados",
    ),
    "managerPaymentsRefresh": MessageLookupByLibrary.simpleMessage(
      "Atualizar estado",
    ),
    "managerRound": m61,
    "managerTabClosedTitle": MessageLookupByLibrary.simpleMessage(
      "Conta fechada",
    ),
    "managerTableHint": MessageLookupByLibrary.simpleMessage(
      "Ex.: 7, Balcão 2, Esplanada",
    ),
    "managerUnpaidBadge": MessageLookupByLibrary.simpleMessage("A PAGAR"),
    "managerViewOrderGo": MessageLookupByLibrary.simpleMessage("Ver o detalhe"),
    "managerVoidItemConfirm": m62,
    "managerVoidItemCta": MessageLookupByLibrary.simpleMessage("Não cobrar"),
    "managerVoidedItemTag": MessageLookupByLibrary.simpleMessage(
      "REMOVIDO · não é cobrado",
    ),
    "march": MessageLookupByLibrary.simpleMessage("Março"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Marcar todo como lido",
    ),
    "markedNoShow": MessageLookupByLibrary.simpleMessage(
      "Marcado como não compareceu.",
    ),
    "marketsAndStores": MessageLookupByLibrary.simpleMessage(
      "Mercados e Lojas",
    ),
    "maxGuests": MessageLookupByLibrary.simpleMessage("Máx. convidados"),
    "maxPartySize": m63,
    "maxSize": m64,
    "maxSizeLabel": MessageLookupByLibrary.simpleMessage("Máx."),
    "maximum": MessageLookupByLibrary.simpleMessage("Máximo"),
    "may": MessageLookupByLibrary.simpleMessage("Maio"),
    "medium": MessageLookupByLibrary.simpleMessage("Médio"),
    "menu": MessageLookupByLibrary.simpleMessage("Menu"),
    "menus": MessageLookupByLibrary.simpleMessage("Menus"),
    "message": MessageLookupByLibrary.simpleMessage("Mensagem"),
    "messageThread": MessageLookupByLibrary.simpleMessage("Fio de mensagens"),
    "mexicanCuisine": MessageLookupByLibrary.simpleMessage("Mexicana"),
    "micPermissionDeniedMessage": MessageLookupByLibrary.simpleMessage(
      "A pesquisa por voz usa o microfone para encontrar lugares próximos. Ativa o acesso em Definições para explorar com a tua voz.",
    ),
    "minBookingAmount": MessageLookupByLibrary.simpleMessage("Valor mínimo"),
    "minGuests": MessageLookupByLibrary.simpleMessage("Mín. convidados"),
    "minimum": MessageLookupByLibrary.simpleMessage("Mínimo"),
    "mockTextNewReleasesCard": MessageLookupByLibrary.simpleMessage(
      "A rede Ramalha através da cidade de Covilhã continua a crescer. Após expandir no último ano para a cidade de Fundão, desta vez a pastelaria abriu o seu segundo espaço no Covilhã Shopping, numa área interior na sua zona frontal, no piso 0 com uma ampla esplanada.",
    ),
    "moderate": MessageLookupByLibrary.simpleMessage("Moderada"),
    "more": MessageLookupByLibrary.simpleMessage("mais"),
    "moreInfo": MessageLookupByLibrary.simpleMessage("+ info"),
    "moveDown": MessageLookupByLibrary.simpleMessage("Descer"),
    "moveUp": MessageLookupByLibrary.simpleMessage("Subir"),
    "multilanguage": MessageLookupByLibrary.simpleMessage("Multilíngue"),
    "mustContainAtLeast3Characters": MessageLookupByLibrary.simpleMessage(
      "Deve conter pelo menos 3 caracteres",
    ),
    "mustContainAtLeastTwoCharacters": MessageLookupByLibrary.simpleMessage(
      "Deve conter pelo menos 2 caracteres",
    ),
    "myFavorites": MessageLookupByLibrary.simpleMessage("Os Meus Favoritos"),
    "myHistory": MessageLookupByLibrary.simpleMessage("O Meu Histórico"),
    "myReservations": MessageLookupByLibrary.simpleMessage(
      "As Minhas Reservas",
    ),
    "nNewMessages": m65,
    "needBestRecommendations": MessageLookupByLibrary.simpleMessage(
      "Precisa das melhores recomendações?",
    ),
    "newBranch": MessageLookupByLibrary.simpleMessage("Novos no Foodly"),
    "newPassword": MessageLookupByLibrary.simpleMessage("Nova Palavra-passe"),
    "newReleasesEmptyErrorSubtitle": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar os novos negócios. Tenta novamente.",
    ),
    "newReleasesEmptyErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Ligação interrompida",
    ),
    "newReleasesEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "As próximas descobertas na tua zona vão aparecer aqui.",
    ),
    "newReleasesEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Novos sabores a caminho",
    ),
    "news": MessageLookupByLibrary.simpleMessage("Novidades"),
    "nextMonth": MessageLookupByLibrary.simpleMessage("Próximo mês"),
    "nickName": MessageLookupByLibrary.simpleMessage("Nome de utilizador"),
    "noAccessSection": MessageLookupByLibrary.simpleMessage(
      "Você não tem acesso a essa seção",
    ),
    "noAudioDetected": MessageLookupByLibrary.simpleMessage(
      "Nenhum áudio detetado. Por favor, tente novamente.",
    ),
    "noConnection": MessageLookupByLibrary.simpleMessage(
      "Sem ligação à internet. Verifica a tua rede e tenta de novo.",
    ),
    "noFavoriteBusinesses": MessageLookupByLibrary.simpleMessage(
      "Ainda não tem negócios na sua lista de favoritos",
    ),
    "noFavoriteItems": MessageLookupByLibrary.simpleMessage(
      "Ainda não tem itens na sua lista de favoritos",
    ),
    "noFavoriteMenus": MessageLookupByLibrary.simpleMessage(
      "Ainda não tem menus na sua lista de favoritos",
    ),
    "noItemsYet": MessageLookupByLibrary.simpleMessage(
      "Ainda não existem itens adicionados",
    ),
    "noMessagesYet": MessageLookupByLibrary.simpleMessage(
      "Ainda sem mensagens",
    ),
    "noNearbyBusinessesInCategory": m66,
    "noNewBranches": MessageLookupByLibrary.simpleMessage(
      "Ainda não há negócios novos na sua zona",
    ),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "Ainda não há notificações",
    ),
    "noPackagesYet": MessageLookupByLibrary.simpleMessage(
      "Ainda não há pacotes",
    ),
    "noPromotionsInSection": MessageLookupByLibrary.simpleMessage(
      "Não há promoções nesta secção",
    ),
    "noPromotionsNearby": MessageLookupByLibrary.simpleMessage(
      "Não há promoções por perto",
    ),
    "noRecommendationsFound": MessageLookupByLibrary.simpleMessage(
      "Não encontramos recomendações para a sua pesquisa. \nTente outros termos ou tente um local diferente.",
    ),
    "noReservationsFound": MessageLookupByLibrary.simpleMessage(
      "Nenhuma reserva encontrada.",
    ),
    "noReservationsYet": MessageLookupByLibrary.simpleMessage(
      "Ainda não há reservas.",
    ),
    "noSavedAddress": MessageLookupByLibrary.simpleMessage(
      "Não tens uma morada guardada, podes criar uma na tua página de perfil.",
    ),
    "noSavedPromotions": MessageLookupByLibrary.simpleMessage(
      "Ainda não tem promoções guardadas",
    ),
    "noSavedPromotionsInSection": MessageLookupByLibrary.simpleMessage(
      "Ainda não tem promoções guardadas nesta seção",
    ),
    "noShow": MessageLookupByLibrary.simpleMessage("Não compareceu"),
    "nonEspecified": MessageLookupByLibrary.simpleMessage("Não especificado"),
    "notFoundPageText": MessageLookupByLibrary.simpleMessage(
      "A rota solicitada não existe, ou não tem permissão para aceder a ela.",
    ),
    "notInYourCountry": MessageLookupByLibrary.simpleMessage(
      "Ainda não está no seu país?",
    ),
    "note": MessageLookupByLibrary.simpleMessage("Nota"),
    "notesLabel": m67,
    "notification": MessageLookupByLibrary.simpleMessage("Notificação"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notificações"),
    "november": MessageLookupByLibrary.simpleMessage("Novembro"),
    "october": MessageLookupByLibrary.simpleMessage("Outubro"),
    "okGo": MessageLookupByLibrary.simpleMessage("Ok, Vamos!"),
    "onQuote": MessageLookupByLibrary.simpleMessage("Sob orçamento"),
    "onSite": MessageLookupByLibrary.simpleMessage("No local"),
    "oneNewMessage": MessageLookupByLibrary.simpleMessage("1 nova mensagem"),
    "onlyContainLetters": MessageLookupByLibrary.simpleMessage(
      "Pode conter apenas letras e um espaço entre palavras",
    ),
    "onlyYouPrivacyNotice": MessageLookupByLibrary.simpleMessage(
      "Visível apenas para si.",
    ),
    "open": MessageLookupByLibrary.simpleMessage("Aberto"),
    "openMenuAnyDevice": MessageLookupByLibrary.simpleMessage(
      "\npara abrir o menu em qualquer dispositivo",
    ),
    "openSettings": MessageLookupByLibrary.simpleMessage("Abrir Definições"),
    "openSoon": MessageLookupByLibrary.simpleMessage("Abre em breve"),
    "optional": MessageLookupByLibrary.simpleMessage("Opcional"),
    "orderingDistance": MessageLookupByLibrary.simpleMessage("Distância"),
    "orderingLabel": MessageLookupByLibrary.simpleMessage("Ordenar"),
    "orderingPriceAsc": MessageLookupByLibrary.simpleMessage("Preço"),
    "orderingRatingDesc": MessageLookupByLibrary.simpleMessage("Avaliação"),
    "other": MessageLookupByLibrary.simpleMessage("Outro"),
    "outdoorSeating": MessageLookupByLibrary.simpleMessage(
      "Assentos ao ar livre",
    ),
    "outsideCoverage": MessageLookupByLibrary.simpleMessage(
      "A sua localização está fora da cobertura atual do Foodly",
    ),
    "owner": MessageLookupByLibrary.simpleMessage("Proprietário"),
    "packageDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Descreva o que este pacote inclui",
    ),
    "packageTitleHint": MessageLookupByLibrary.simpleMessage(
      "Ex: Jantar gourmet para 20 convidados",
    ),
    "packages": MessageLookupByLibrary.simpleMessage("Pacotes"),
    "parking": MessageLookupByLibrary.simpleMessage("Estacionamento"),
    "partySize": MessageLookupByLibrary.simpleMessage("Comensais:"),
    "partySizeCount": m68,
    "password": MessageLookupByLibrary.simpleMessage("Senha"),
    "passwordIncorrect": MessageLookupByLibrary.simpleMessage(
      "Palavra-passe incorreta. Tenta de novo.",
    ),
    "passwordInstructions": MessageLookupByLibrary.simpleMessage(
      "A senha deve ter pelo menos 8 caracteres, um número, uma letra minúscula e uma maiúscula",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Introduz a tua palavra-passe para continuar.",
    ),
    "passwordSent": MessageLookupByLibrary.simpleMessage(
      "Senha temporária enviada",
    ),
    "paymentModeOpenTabBody": MessageLookupByLibrary.simpleMessage(
      "A mesa pede em rodadas e paga UMA vez no final. Ideal para restaurantes com serviço de mesa.",
    ),
    "paymentModeOpenTabFlow": MessageLookupByLibrary.simpleMessage(
      "pedir → comer → pagar",
    ),
    "paymentModeOpenTabTitle": MessageLookupByLibrary.simpleMessage(
      "Conta aberta",
    ),
    "paymentModePerRoundBody": MessageLookupByLibrary.simpleMessage(
      "Cada pedido é pago antes de ser preparado. Ideal para bares, food trucks e balcão.",
    ),
    "paymentModePerRoundFlow": MessageLookupByLibrary.simpleMessage(
      "pedir → pagar → entregar",
    ),
    "paymentModePerRoundTitle": MessageLookupByLibrary.simpleMessage(
      "Pré-pago por rodada",
    ),
    "paymentModeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Pode alterar quando quiser no seu painel",
    ),
    "paymentModeTitle": MessageLookupByLibrary.simpleMessage(
      "Como o seu negócio cobra?",
    ),
    "paymentModeUpdated": MessageLookupByLibrary.simpleMessage(
      "Modo de cobrança atualizado",
    ),
    "paymentOffPlatform": MessageLookupByLibrary.simpleMessage(
      "Pagamento fora da plataforma",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pendente"),
    "pendingReservationsAlertMany": m69,
    "pendingReservationsAlertOne": MessageLookupByLibrary.simpleMessage(
      "Tem 1 reserva pendente",
    ),
    "pendingReservationsContent": MessageLookupByLibrary.simpleMessage(
      "Existem pedidos de reserva aguardando a sua resposta.",
    ),
    "perHour": MessageLookupByLibrary.simpleMessage("Por hora"),
    "perPerson": MessageLookupByLibrary.simpleMessage("Por pessoa"),
    "peruvian": MessageLookupByLibrary.simpleMessage("Peruana"),
    "petFriendly": MessageLookupByLibrary.simpleMessage("Aceita Animais"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Número de telefone"),
    "phoneSectionTitle1": MessageLookupByLibrary.simpleMessage("O teu"),
    "phoneSectionTitle2": MessageLookupByLibrary.simpleMessage("Telefone"),
    "photoLimitReached": m70,
    "photoUploadFailed": MessageLookupByLibrary.simpleMessage(
      "Não foi possível enviar todas as fotos. Edita o pacote para tentar novamente.",
    ),
    "photosDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Fotos do item eliminadas com sucesso",
    ),
    "photosOptionalMax": m71,
    "photosSaveError": m72,
    "pizzerias": MessageLookupByLibrary.simpleMessage("Pizzarias"),
    "platformError": MessageLookupByLibrary.simpleMessage("Erro de plataforma"),
    "pleaseAddYourBusinessAddress": MessageLookupByLibrary.simpleMessage(
      "Por favor, adicione o endereço do seu negócio",
    ),
    "pleaseAddYourBusinessCountry": MessageLookupByLibrary.simpleMessage(
      "Por favor, indique o país do seu negócio",
    ),
    "pleaseAddYourBusinessName": MessageLookupByLibrary.simpleMessage(
      "Por favor, adicione o nome do seu negócio",
    ),
    "pleaseEnterEmail": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza o seu endereço de e-mail",
    ),
    "pleaseEnterNickName": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza um nome de utilizador",
    ),
    "pleaseEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza a sua senha",
    ),
    "pleaseEnterPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza o seu número de telefone",
    ),
    "pleaseEnterPostalCode": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza o seu código postal",
    ),
    "pleaseEnterYourLastName": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza o seu apelido",
    ),
    "pleaseEnterYourName": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduza o seu nome",
    ),
    "pleaseSelectAnOption": MessageLookupByLibrary.simpleMessage(
      "Por favor, selecione uma opção",
    ),
    "pleaseSelectBusinessCategory": MessageLookupByLibrary.simpleMessage(
      "Por favor, selecione a categoria do seu negócio",
    ),
    "portfolio": MessageLookupByLibrary.simpleMessage("Portfólio"),
    "portfolioVideoUrl": MessageLookupByLibrary.simpleMessage(
      "URL de vídeo/portfólio",
    ),
    "portugueseCuisine": MessageLookupByLibrary.simpleMessage("Portuguesa"),
    "post": MessageLookupByLibrary.simpleMessage("Publicar"),
    "posts": MessageLookupByLibrary.simpleMessage("Publicações"),
    "postsFeedBeFirst": MessageLookupByLibrary.simpleMessage(
      "Seja o primeiro a partilhar algo!",
    ),
    "postsFeedNoPosts": MessageLookupByLibrary.simpleMessage(
      "Ainda não há publicações",
    ),
    "poweredBy": MessageLookupByLibrary.simpleMessage("Com tecnologia de"),
    "preferNotToSay": MessageLookupByLibrary.simpleMessage(
      "Prefiro não responder",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferências"),
    "pressToAddPhotosUpToMaxImages": m73,
    "previousMonth": MessageLookupByLibrary.simpleMessage("Mês anterior"),
    "price": MessageLookupByLibrary.simpleMessage("Preço"),
    "priceFromBadge": m74,
    "priceType": MessageLookupByLibrary.simpleMessage("Tipo de preço"),
    "priceValidation": MessageLookupByLibrary.simpleMessage(
      "O preço não pode estar vazio e deve ser superior a 0.09",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de Privacidade",
    ),
    "professionalProfile": MessageLookupByLibrary.simpleMessage(
      "Perfil profissional",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Perfil"),
    "profileBirthdayText1": MessageLookupByLibrary.simpleMessage("Data de"),
    "profileBirthdayText2": MessageLookupByLibrary.simpleMessage("Aniversário"),
    "profileUserLocation1": MessageLookupByLibrary.simpleMessage("Localização"),
    "profileUserLocation2": MessageLookupByLibrary.simpleMessage(
      "do Utilizador",
    ),
    "promoTabActive": MessageLookupByLibrary.simpleMessage("Ativas"),
    "promoTabExpired": MessageLookupByLibrary.simpleMessage("Expiradas"),
    "promoTabUpcoming": MessageLookupByLibrary.simpleMessage("Próximas"),
    "promosEmptyErrorSubtitle": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar as promoções. Tenta novamente.",
    ),
    "promosEmptyErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Ligação interrompida",
    ),
    "promosEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Estamos a preparar as melhores promoções para ti.",
    ),
    "promosEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Sabores perto de ti, em breve",
    ),
    "promotion": MessageLookupByLibrary.simpleMessage("Promoção"),
    "promotionDays": MessageLookupByLibrary.simpleMessage("Dias de promoção"),
    "promotions": MessageLookupByLibrary.simpleMessage("Promoções"),
    "qrSavedToGallery": MessageLookupByLibrary.simpleMessage(
      "Guardado nas tuas fotos",
    ),
    "quoteApproved": MessageLookupByLibrary.simpleMessage("Orçamento aprovado"),
    "quoteNotes": MessageLookupByLibrary.simpleMessage(
      "Notas do orçamento (opcional)",
    ),
    "quoteReceived": MessageLookupByLibrary.simpleMessage("Orçamento recebido"),
    "quoteRejected": MessageLookupByLibrary.simpleMessage(
      "Orçamento rejeitado",
    ),
    "quoteSent": MessageLookupByLibrary.simpleMessage("Cotação enviada"),
    "quoted": MessageLookupByLibrary.simpleMessage("Orçamentado"),
    "quotedAmount": MessageLookupByLibrary.simpleMessage("Valor orçamentado"),
    "quotedStatus": MessageLookupByLibrary.simpleMessage("Orçamento enviado"),
    "radiusDistanceLabel": MessageLookupByLibrary.simpleMessage(
      "Radio de distância:",
    ),
    "radiusKm": MessageLookupByLibrary.simpleMessage("Raio (km)"),
    "rateYourExperience": MessageLookupByLibrary.simpleMessage(
      "Avalie sua experiência:",
    ),
    "ratingAvg": MessageLookupByLibrary.simpleMessage("Avaliação Média:"),
    "readyToListen": MessageLookupByLibrary.simpleMessage("Pronto para ouvir"),
    "reasonHint": MessageLookupByLibrary.simpleMessage(
      "Ex: Férias, manutenção",
    ),
    "reasonOptional": MessageLookupByLibrary.simpleMessage("Motivo (opcional)"),
    "recentPosts": MessageLookupByLibrary.simpleMessage("Publicações recentes"),
    "recommend": MessageLookupByLibrary.simpleMessage("Recomendar"),
    "reconnecting": MessageLookupByLibrary.simpleMessage("A reconectar…"),
    "recoverPassword": MessageLookupByLibrary.simpleMessage("Recuperar senha"),
    "recoverPasswordErrorMsg": MessageLookupByLibrary.simpleMessage(
      "Ups, algo correu mal. Tente novamente, se o erro persistir verifique se o email está correto ou tente mais tarde.",
    ),
    "recoverPasswordTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Enviámos uma",
    ),
    "recoverPasswordTextSpan2": MessageLookupByLibrary.simpleMessage(
      "senha temporária",
    ),
    "recoverPasswordTextSpan3": MessageLookupByLibrary.simpleMessage(
      "para o seu email, válida por 30 minutos. Inicie sessão com ela e atualize-a no seu perfil",
    ),
    "regular": MessageLookupByLibrary.simpleMessage("Normal"),
    "reject": MessageLookupByLibrary.simpleMessage("Rejeitar"),
    "rejectQuote": MessageLookupByLibrary.simpleMessage("Rejeitar"),
    "rejectReservation": MessageLookupByLibrary.simpleMessage(
      "Rejeitar Reserva",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejeitada"),
    "rejectionReasonHint": MessageLookupByLibrary.simpleMessage(
      "Ajude o estabelecimento a entender por que a reserva não avançou",
    ),
    "rejectionReasonOptional": MessageLookupByLibrary.simpleMessage(
      "Motivo (opcional)",
    ),
    "removePhoto": MessageLookupByLibrary.simpleMessage("Remover foto"),
    "removePhotos": MessageLookupByLibrary.simpleMessage("Remover fotos"),
    "removeThisTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Remover este período de tempo",
    ),
    "removeVideo": MessageLookupByLibrary.simpleMessage("Remover vídeo"),
    "removedFromFavorites": MessageLookupByLibrary.simpleMessage(
      "removido dos favoritos",
    ),
    "removedFromFavoritesFem": MessageLookupByLibrary.simpleMessage(
      "removida dos favoritos",
    ),
    "reorder": MessageLookupByLibrary.simpleMessage("Reordenar"),
    "reportContent": MessageLookupByLibrary.simpleMessage("Denunciar"),
    "reportContentSubtitle": MessageLookupByLibrary.simpleMessage(
      "Porque está a denunciar este conteúdo?",
    ),
    "reportReasonHarassment": MessageLookupByLibrary.simpleMessage(
      "Assédio ou intimidação",
    ),
    "reportReasonHateSpeech": MessageLookupByLibrary.simpleMessage(
      "Discurso de ódio",
    ),
    "reportReasonMisinformation": MessageLookupByLibrary.simpleMessage(
      "Informação falsa",
    ),
    "reportReasonOffensive": MessageLookupByLibrary.simpleMessage(
      "Ofensivo ou inapropriado",
    ),
    "reportReasonOther": MessageLookupByLibrary.simpleMessage("Outro"),
    "reportReasonSexual": MessageLookupByLibrary.simpleMessage(
      "Conteúdo sexual",
    ),
    "reportReasonSpam": MessageLookupByLibrary.simpleMessage("Spam ou burla"),
    "reportReasonViolence": MessageLookupByLibrary.simpleMessage(
      "Violência ou perigo",
    ),
    "reportSentSuccess": MessageLookupByLibrary.simpleMessage(
      "Obrigado pela tua denúncia. A nossa equipa irá analisá-la.",
    ),
    "reportSubmit": MessageLookupByLibrary.simpleMessage("Enviar denúncia"),
    "request": MessageLookupByLibrary.simpleMessage("Solicitar"),
    "requestQuote": MessageLookupByLibrary.simpleMessage("Pedir orçamento"),
    "requestReservation": MessageLookupByLibrary.simpleMessage("Pedir Reserva"),
    "requestService": MessageLookupByLibrary.simpleMessage("Pedir serviço"),
    "requested": MessageLookupByLibrary.simpleMessage("Solicitado"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Reenviar Código"),
    "resendCodeIn": m75,
    "reservation": MessageLookupByLibrary.simpleMessage("Reserva"),
    "reservationCancelled": MessageLookupByLibrary.simpleMessage(
      "Reserva cancelada.",
    ),
    "reservationCompleted": MessageLookupByLibrary.simpleMessage(
      "Reserva concluída.",
    ),
    "reservationConfirmed": MessageLookupByLibrary.simpleMessage(
      "Reserva confirmada.",
    ),
    "reservationContactBody": MessageLookupByLibrary.simpleMessage(
      "O negócio precisa destes dados para confirmar o seu pedido.",
    ),
    "reservationContactTitle": MessageLookupByLibrary.simpleMessage(
      "Dados de contacto",
    ),
    "reservationDetails": MessageLookupByLibrary.simpleMessage(
      "Detalhes da reserva",
    ),
    "reservationRejected": MessageLookupByLibrary.simpleMessage(
      "Reserva rejeitada.",
    ),
    "reservationRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Falha ao enviar pedido de reserva.",
    ),
    "reservationRequestSent": MessageLookupByLibrary.simpleMessage(
      "Pedido de reserva enviado!",
    ),
    "reservations": MessageLookupByLibrary.simpleMessage("Reservas"),
    "reservationsForToday": MessageLookupByLibrary.simpleMessage(
      "Reservas para hoje",
    ),
    "reserveTableAt": m76,
    "reserveToComplete": MessageLookupByLibrary.simpleMessage(
      "Reserva → Concluída",
    ),
    "resilience": MessageLookupByLibrary.simpleMessage("Resiliência"),
    "resultsFor": MessageLookupByLibrary.simpleMessage("Resultados para"),
    "resumeSessionWithSecurity": MessageLookupByLibrary.simpleMessage(
      "Retomar sessão com impressão digital/rosto ou padrão",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Tentar novamente"),
    "retryLocation": MessageLookupByLibrary.simpleMessage("Tentar novamente"),
    "retryLocationDescription": MessageLookupByLibrary.simpleMessage(
      "Toca para obter a tua localização novamente",
    ),
    "retryRecording": MessageLookupByLibrary.simpleMessage(
      "Tentar novamente gravar",
    ),
    "review": MessageLookupByLibrary.simpleMessage("Avaliação"),
    "reviewDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Avaliação excluída com sucesso!",
    ),
    "reviewSubmittedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Avaliação enviada com sucesso!",
    ),
    "reviewUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Avaliação atualizada com sucesso!",
    ),
    "reviews": MessageLookupByLibrary.simpleMessage("Avaliações"),
    "save": MessageLookupByLibrary.simpleMessage("Guardar"),
    "saveAndClose": MessageLookupByLibrary.simpleMessage("Guardar e Fechar"),
    "saveMenu": MessageLookupByLibrary.simpleMessage("Guardar este menu"),
    "saveToProfileForReservations": MessageLookupByLibrary.simpleMessage(
      "Guardar no meu perfil para futuras reservas",
    ),
    "savedPromotions": MessageLookupByLibrary.simpleMessage(
      "Promoções guardadas",
    ),
    "savedPromotionsCurrent": MessageLookupByLibrary.simpleMessage(
      "Estas são as suas promoções atuais",
    ),
    "savedPromotionsTabCurrent": MessageLookupByLibrary.simpleMessage("Atuais"),
    "savedPromotionsTabUpcoming": MessageLookupByLibrary.simpleMessage(
      "Próximas",
    ),
    "savedPromotionsUpcoming": MessageLookupByLibrary.simpleMessage(
      "Estas são as suas próximas promoções",
    ),
    "scanForMenu": MessageLookupByLibrary.simpleMessage(
      "Lê para ver o nosso menu",
    ),
    "scanQRCode": MessageLookupByLibrary.simpleMessage("Leia este código QR"),
    "seafood": MessageLookupByLibrary.simpleMessage("Marisco"),
    "searchBusinessOrAddress": MessageLookupByLibrary.simpleMessage(
      "Procurar negócio ou endereço",
    ),
    "searchInCity": m77,
    "searchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Descubra excelentes lugares para comer e beber perto de si...",
    ),
    "secureAuthentication": MessageLookupByLibrary.simpleMessage(
      "Permitir que o sistema operativo forneça autenticação segura.",
    ),
    "selectADate": MessageLookupByLibrary.simpleMessage("Selecione uma data:"),
    "selectATime": MessageLookupByLibrary.simpleMessage("Selecione uma hora:"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Selecione uma data:"),
    "selectTime": MessageLookupByLibrary.simpleMessage("Selecione uma hora:"),
    "selectUserType": MessageLookupByLibrary.simpleMessage(
      "Selecionar o tipo de utilizador",
    ),
    "selectedPlace": MessageLookupByLibrary.simpleMessage("Local selecionado"),
    "send": MessageLookupByLibrary.simpleMessage("Enviar"),
    "sendMessage": MessageLookupByLibrary.simpleMessage("Enviar mensagem"),
    "sendQuote": MessageLookupByLibrary.simpleMessage("Enviar orçamento"),
    "sendVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Enviar Código de Verificação",
    ),
    "september": MessageLookupByLibrary.simpleMessage("Setembro"),
    "serviceArea": MessageLookupByLibrary.simpleMessage("Área de serviço"),
    "serviceBookingDetail": MessageLookupByLibrary.simpleMessage(
      "Detalhe do pedido",
    ),
    "serviceBookingRequest": MessageLookupByLibrary.simpleMessage(
      "Pedido de serviço",
    ),
    "servicePackages": MessageLookupByLibrary.simpleMessage(
      "Pacotes de serviço",
    ),
    "serviceRequests": MessageLookupByLibrary.simpleMessage(
      "Pedidos de serviço",
    ),
    "serviceType": MessageLookupByLibrary.simpleMessage("Tipo de serviço"),
    "serviceTypeAll": MessageLookupByLibrary.simpleMessage("Todos"),
    "sessionExpiredMessage": MessageLookupByLibrary.simpleMessage(
      "A sua sessão expirou. Por favor, faça login novamente.",
    ),
    "setDate": MessageLookupByLibrary.simpleMessage("Definir data"),
    "setPassword": MessageLookupByLibrary.simpleMessage(
      "Definir palavra-passe",
    ),
    "setPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
      "Ativa o início de sessão com email e palavra-passe além da tua conta social.",
    ),
    "setupProfessionalProfile": MessageLookupByLibrary.simpleMessage(
      "Configure o seu perfil profissional",
    ),
    "shareAppMessage": MessageLookupByLibrary.simpleMessage(
      "Descubra os melhores locais perto de si com o Foodly — explore menus, aproveite promocoes e reserve mesa, tudo numa unica app!",
    ),
    "shareMenu": MessageLookupByLibrary.simpleMessage("Partilhar este menu"),
    "shareMenuError": MessageLookupByLibrary.simpleMessage(
      "Ups... Algo correu mal! \n\nNão foi possível partilhar o menu.",
    ),
    "shareMenuMessage": m78,
    "shareMenuSubject": MessageLookupByLibrary.simpleMessage(
      "Partilho contigo um menu!",
    ),
    "shareOnAndroid": MessageLookupByLibrary.simpleMessage(
      "Partilhar para Android",
    ),
    "shareOnIOS": MessageLookupByLibrary.simpleMessage("Partilhar para iOS"),
    "sharePromotion": MessageLookupByLibrary.simpleMessage(
      "Partilhar Promoção",
    ),
    "signInWithApple": MessageLookupByLibrary.simpleMessage(
      "Iniciar sessão com a Apple",
    ),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Iniciar sessão com o Google",
    ),
    "signUpBusinessTooltipTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Recomendamos localizar o seu negócio ou endereço de atividade comercial no Google, para nos fornecer dados, incluindo coordenadas, que nos permitam dar-lhe",
    ),
    "signUpBusinessTooltipTextSpan2": MessageLookupByLibrary.simpleMessage(
      "maior relevância",
    ),
    "signUpBusinessTooltipTextSpan3": MessageLookupByLibrary.simpleMessage(
      "nos nossos motores de",
    ),
    "signUpBusinessTooltipTextSpan4": MessageLookupByLibrary.simpleMessage(
      "busca e mapas",
    ),
    "signUpBusinessTooltipTextSpan5": MessageLookupByLibrary.simpleMessage(
      "para",
    ),
    "signUpBusinessTooltipTextSpan6": MessageLookupByLibrary.simpleMessage(
      "utilizadores",
    ),
    "signUpBusinessTooltipTextSpan7": MessageLookupByLibrary.simpleMessage(
      "consumidores e visitantes, tal como se decidir incorporar serviços como entrega e \'take away\'. Assim, proporcionaremos uma",
    ),
    "signUpBusinessTooltipTextSpan8": MessageLookupByLibrary.simpleMessage(
      "melhor experiência de utilizador",
    ),
    "signUpBusinessTooltipTextSpan9": MessageLookupByLibrary.simpleMessage(
      "aos seus clientes.",
    ),
    "signup": MessageLookupByLibrary.simpleMessage("Registar-se"),
    "smokingArea": MessageLookupByLibrary.simpleMessage("Área para Fumadores"),
    "socialConsentTitle": MessageLookupByLibrary.simpleMessage(
      "Um último passo",
    ),
    "socialEmailMissing": MessageLookupByLibrary.simpleMessage(
      "Não conseguimos obter o seu email da Apple. Tente novamente ou use outro método de início de sessão.",
    ),
    "socials": MessageLookupByLibrary.simpleMessage("Comunidade"),
    "solo": MessageLookupByLibrary.simpleMessage("Solo"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Ocorreu um erro",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("Ordenar por"),
    "specialRequests": MessageLookupByLibrary.simpleMessage(
      "Pedidos especiais",
    ),
    "specialRequestsLabel": m79,
    "specialRequestsOptional": MessageLookupByLibrary.simpleMessage(
      "Pedidos especiais (opcional)",
    ),
    "specialties": MessageLookupByLibrary.simpleMessage("Especialidades"),
    "specialtyExample": MessageLookupByLibrary.simpleMessage(
      "Ex: Gastronomia molecular",
    ),
    "speechRecognitionError": MessageLookupByLibrary.simpleMessage(
      "Erro ao iniciar o reconhecimento de voz.",
    ),
    "speechRecognitionUnavailable": MessageLookupByLibrary.simpleMessage(
      "O reconhecimento de voz não está disponível neste dispositivo.",
    ),
    "start": MessageLookupByLibrary.simpleMessage("Início"),
    "startDate": MessageLookupByLibrary.simpleMessage("Data de início"),
    "startTime": MessageLookupByLibrary.simpleMessage("Hora de início"),
    "startups": MessageLookupByLibrary.simpleMessage("Startups"),
    "state": MessageLookupByLibrary.simpleMessage("Estado"),
    "steakhouse": MessageLookupByLibrary.simpleMessage("Carnes e Grelhados"),
    "stop": MessageLookupByLibrary.simpleMessage("Parar"),
    "stress": MessageLookupByLibrary.simpleMessage("Stresse"),
    "strict": MessageLookupByLibrary.simpleMessage("Rigorosa"),
    "stripeBridgeRefreshBody": MessageLookupByLibrary.simpleMessage(
      "Retome a ativação no app: Pedidos → Ativar pagamentos com Stripe.",
    ),
    "stripeBridgeRefreshTitle": MessageLookupByLibrary.simpleMessage(
      "Ativação incompleta",
    ),
    "stripeBridgeReturnBody": MessageLookupByLibrary.simpleMessage(
      "Você já pode fechar esta aba e voltar ao app Foodly.",
    ),
    "stripeBridgeReturnTitle": MessageLookupByLibrary.simpleMessage(
      "Conta de pagamentos configurada",
    ),
    "subject": MessageLookupByLibrary.simpleMessage("Assunto"),
    "submit": MessageLookupByLibrary.simpleMessage("Submeter"),
    "submitReview": MessageLookupByLibrary.simpleMessage("Enviar avaliação"),
    "success": MessageLookupByLibrary.simpleMessage("Sucesso"),
    "successRate": MessageLookupByLibrary.simpleMessage("Taxa de sucesso"),
    "successfullyDeleted": MessageLookupByLibrary.simpleMessage(
      "Eliminado com sucesso!",
    ),
    "suggestFoodlyInYourCountry": MessageLookupByLibrary.simpleMessage(
      "Sugerir Foodly no seu país",
    ),
    "suggestFoodlySubject": MessageLookupByLibrary.simpleMessage(
      "Tragam Foodly para o meu país",
    ),
    "sushi": MessageLookupByLibrary.simpleMessage("Sushi"),
    "switchToManagerRole": MessageLookupByLibrary.simpleMessage(
      "Mudar para Conta Empresarial",
    ),
    "switchUserCategoryTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Se deseja recategorizar-se como",
    ),
    "switchUserCategoryTextSpan2": MessageLookupByLibrary.simpleMessage(
      ", clique",
    ),
    "switchUserCategoryTextSpan3": MessageLookupByLibrary.simpleMessage("aqui"),
    "tableReservations": MessageLookupByLibrary.simpleMessage(
      "Reservas de mesa",
    ),
    "takeAway": MessageLookupByLibrary.simpleMessage("Para Levar"),
    "tapPlusToCreate": MessageLookupByLibrary.simpleMessage(
      "Toque + para criar o seu primeiro pacote",
    ),
    "tapToAddPrompt": MessageLookupByLibrary.simpleMessage(
      "Toque aqui para adicionar um novo prompt",
    ),
    "tapToSelectTime": MessageLookupByLibrary.simpleMessage(
      "Toque para selecionar hora",
    ),
    "teamSize": MessageLookupByLibrary.simpleMessage("Tamanho da equipa"),
    "temporarilyUnavailable": MessageLookupByLibrary.simpleMessage(
      "Temporariamente indisponível",
    ),
    "tendencies": MessageLookupByLibrary.simpleMessage("Tendências"),
    "termsConditions": MessageLookupByLibrary.simpleMessage(
      "Termos e Condições",
    ),
    "termsConditionsShort": MessageLookupByLibrary.simpleMessage("T&C"),
    "termsPrivacyTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Ao criar uma conta, declara que leu e aceita os nossos",
    ),
    "termsPrivacyTextSpan1forBusiness": MessageLookupByLibrary.simpleMessage(
      "Ao criar uma conta empresarial, declara que leu e aceita os nossos",
    ),
    "termsPrivacyTextSpan2": MessageLookupByLibrary.simpleMessage(
      "Termos e Condições",
    ),
    "termsPrivacyTextSpan3": MessageLookupByLibrary.simpleMessage("e a"),
    "termsPrivacyTextSpan4": MessageLookupByLibrary.simpleMessage(
      "Política de Privacidade",
    ),
    "thereAreNoCustomerReviewsYet": MessageLookupByLibrary.simpleMessage(
      "Ainda não há avaliações de clientes",
    ),
    "thisBusiness": MessageLookupByLibrary.simpleMessage(
      "este estabelecimento",
    ),
    "thisUser": MessageLookupByLibrary.simpleMessage("este utilizador"),
    "time": MessageLookupByLibrary.simpleMessage("Hora"),
    "timeAgoDays": m80,
    "timeAgoHours": m81,
    "timeAgoJustNow": MessageLookupByLibrary.simpleMessage("Agora mesmo"),
    "timeAgoMinutes": m82,
    "title": MessageLookupByLibrary.simpleMessage("Título"),
    "today": MessageLookupByLibrary.simpleMessage("Hoje"),
    "tooManyAttempts": MessageLookupByLibrary.simpleMessage(
      "Demasiadas tentativas seguidas. Tente novamente daqui a pouco.",
    ),
    "tooManyAttemptsIn": m83,
    "topEvents": MessageLookupByLibrary.simpleMessage("Principais eventos"),
    "totalEvents": MessageLookupByLibrary.simpleMessage("Total de eventos"),
    "travelFeeKm": MessageLookupByLibrary.simpleMessage("Taxa deslocação/km"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Tentar novamente"),
    "typeMessage": MessageLookupByLibrary.simpleMessage(
      "Escreva uma mensagem...",
    ),
    "unauthorizedAccess": MessageLookupByLibrary.simpleMessage(
      "Acesso não autorizado.",
    ),
    "unavailableDaysHint": MessageLookupByLibrary.simpleMessage(
      "Os dias a cinzento não estão disponíveis.",
    ),
    "unblock": MessageLookupByLibrary.simpleMessage("Desbloquear"),
    "uniqueUsers": MessageLookupByLibrary.simpleMessage("Utilizadores únicos"),
    "updateReview": MessageLookupByLibrary.simpleMessage("Atualizar avaliação"),
    "uploadImage": MessageLookupByLibrary.simpleMessage("Carregar Imagem"),
    "uploadPromotionalMediaContent": MessageLookupByLibrary.simpleMessage(
      "Carregar imagem ou vídeo promocional",
    ),
    "uploadVideo": MessageLookupByLibrary.simpleMessage("Carregar Vídeo"),
    "us": MessageLookupByLibrary.simpleMessage("Nós"),
    "useDeviceLocation": MessageLookupByLibrary.simpleMessage(
      "Usar localização do dispositivo",
    ),
    "useSavedLocation": MessageLookupByLibrary.simpleMessage(
      "Usar localização guardada",
    ),
    "userGender1": MessageLookupByLibrary.simpleMessage("Género"),
    "userGender2": MessageLookupByLibrary.simpleMessage("do Utilizador"),
    "userPassword1": MessageLookupByLibrary.simpleMessage("Alterar"),
    "userPassword2": MessageLookupByLibrary.simpleMessage("Palavra-passe"),
    "userPasswordUpdated": MessageLookupByLibrary.simpleMessage(
      "Palavra-passe atualizada com sucesso",
    ),
    "userProfileUpdated": MessageLookupByLibrary.simpleMessage(
      "Dados do utilizador atualizados com sucesso",
    ),
    "userReviews1": MessageLookupByLibrary.simpleMessage("As minhas"),
    "userReviews2": MessageLookupByLibrary.simpleMessage("Avaliações"),
    "userReviewsPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ainda não deixou avaliações. Lembre-se de classificar a sua experiência ao visitar um estabelecimento para melhorar a experiência de todos os utilizadores e destacar-se na nossa comunidade.",
    ),
    "userSortMostActive": MessageLookupByLibrary.simpleMessage("Mais ativos"),
    "userSortMostFollowed": MessageLookupByLibrary.simpleMessage(
      "Mais seguidos",
    ),
    "userSortNearest": MessageLookupByLibrary.simpleMessage("Mais próximos"),
    "userSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
      "Utilizador Criado com Sucesso",
    ),
    "userTypeSnackbarTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Por favor selecione o",
    ),
    "userTypeSnackbarTextSpan2": MessageLookupByLibrary.simpleMessage(
      "tipo de utilizador",
    ),
    "userTypeSnackbarTextSpan3": MessageLookupByLibrary.simpleMessage(
      "para ativar e poder completar o formulário",
    ),
    "usernameAvailable": MessageLookupByLibrary.simpleMessage(
      "Nome de utilizador disponível",
    ),
    "usernameNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Nome de utilizador não disponível",
    ),
    "users": MessageLookupByLibrary.simpleMessage("Utilizadores"),
    "usersHaveTheAbilityToCreateAndManage":
        MessageLookupByLibrary.simpleMessage(
          "são utilizadores que têm a capacidade de criar e gerir",
        ),
    "valid": MessageLookupByLibrary.simpleMessage("Válido"),
    "validCategoryRequired": MessageLookupByLibrary.simpleMessage(
      "É necessária uma categoria válida",
    ),
    "vegetarianCuisine": MessageLookupByLibrary.simpleMessage("Vegetariana"),
    "venezuelan": MessageLookupByLibrary.simpleMessage("Venezuelana"),
    "verify": MessageLookupByLibrary.simpleMessage("Verificar"),
    "verifyPhone": MessageLookupByLibrary.simpleMessage("Verificar Telefone"),
    "verifyingAvailability": MessageLookupByLibrary.simpleMessage(
      "A verificar disponibilidade",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Versão"),
    "videoIsTooLong": MessageLookupByLibrary.simpleMessage(
      "O vídeo é demasiado longo. A duração máxima é de 20 segundos.",
    ),
    "view": MessageLookupByLibrary.simpleMessage("Ver"),
    "viewEdit": MessageLookupByLibrary.simpleMessage("Editar"),
    "viewMenuOf": MessageLookupByLibrary.simpleMessage("Ver o menu de"),
    "viewPromotion": MessageLookupByLibrary.simpleMessage("Ver promoção"),
    "viewToInteract": MessageLookupByLibrary.simpleMessage("Vista → Interação"),
    "visitBusinessPage": MessageLookupByLibrary.simpleMessage(
      "Ver página do estabelecimento",
    ),
    "visitedOn": m84,
    "visitor": MessageLookupByLibrary.simpleMessage("Visitante"),
    "vitality": MessageLookupByLibrary.simpleMessage("Vitalidade"),
    "weWillCheckAvailability": MessageLookupByLibrary.simpleMessage(
      "Verificaremos disponibilidade",
    ),
    "wedding": MessageLookupByLibrary.simpleMessage("Casamento"),
    "weekday1": MessageLookupByLibrary.simpleMessage("Domingo"),
    "weekday2": MessageLookupByLibrary.simpleMessage("Segunda-feira"),
    "weekday3": MessageLookupByLibrary.simpleMessage("Terça-feira"),
    "weekday4": MessageLookupByLibrary.simpleMessage("Quarta-feira"),
    "weekday5": MessageLookupByLibrary.simpleMessage("Quinta-feira"),
    "weekday6": MessageLookupByLibrary.simpleMessage("Sexta-feira"),
    "weekday7": MessageLookupByLibrary.simpleMessage("Sábado"),
    "weekdayShort1": MessageLookupByLibrary.simpleMessage("Dom"),
    "weekdayShort2": MessageLookupByLibrary.simpleMessage("Seg"),
    "weekdayShort3": MessageLookupByLibrary.simpleMessage("Ter"),
    "weekdayShort4": MessageLookupByLibrary.simpleMessage("Qua"),
    "weekdayShort5": MessageLookupByLibrary.simpleMessage("Qui"),
    "weekdayShort6": MessageLookupByLibrary.simpleMessage("Sex"),
    "weekdayShort7": MessageLookupByLibrary.simpleMessage("Sáb"),
    "welcomeDialogSocialBusiness": MessageLookupByLibrary.simpleMessage(
      "Quer publicar o seu negócio na Foodly? Vá ao seu perfil e ative a opção de conta empresarial para o registar.",
    ),
    "welcomeDialogTextSpan1": MessageLookupByLibrary.simpleMessage("Em"),
    "welcomeDialogTextSpan2": MessageLookupByLibrary.simpleMessage(
      "damos-lhe uma cordial bem-vinda",
    ),
    "welcomeDialogTextSpan3": MessageLookupByLibrary.simpleMessage(
      "registou-se como",
    ),
    "welcomeDialogTextSpanClient1": MessageLookupByLibrary.simpleMessage(
      "Agora somos o seu guia gastronómico digital na sua cidade e nas nossas zonas de cobertura. Convidamo-lo a participar ativamente na nossa comunidade, a avaliar e comentar sobre os comércios e produtos, sempre com respeito, a criticar construtivamente, a apoiar os esforços dos pequenos, médios e grandes comerciantes e, principalmente, a desfrutar das",
    ),
    "welcomeDialogTextSpanClient2": MessageLookupByLibrary.simpleMessage(
      "promoções, conteúdos, serviços e vantagens",
    ),
    "welcomeDialogTextSpanClient3": MessageLookupByLibrary.simpleMessage(
      "que lhe proporcionamos por ser nosso utilizador",
    ),
    "welcomeDialogTextSpanOwner": MessageLookupByLibrary.simpleMessage(
      "O próximo passo é completar o registo do seu negócio, inicialmente pediremos dados básicos e depois poderá adicionar mais informações relevantes a partir do painel da sua empresa e, claro, começar a criar conteúdo, menus, promoções e tudo o que desejar através da sua nova ferramenta digital",
    ),
    "welcomeTo": MessageLookupByLibrary.simpleMessage("Bem-vindos"),
    "whatAreYouCravingToday": MessageLookupByLibrary.simpleMessage(
      "O que te apetece hoje?",
    ),
    "whatsOnYourMind": MessageLookupByLibrary.simpleMessage(
      "Em que estás a pensar?",
    ),
    "whenDidYouVisit": MessageLookupByLibrary.simpleMessage("Quando visitou?"),
    "wifi": MessageLookupByLibrary.simpleMessage("Wifi"),
    "writeReviewFor": m85,
    "writeYourReviewHint": MessageLookupByLibrary.simpleMessage(
      "Escreva sua avaliação aqui...",
    ),
    "yearsExperience": MessageLookupByLibrary.simpleMessage(
      "Anos de experiência",
    ),
    "yesCancel": MessageLookupByLibrary.simpleMessage("Sim, cancelar"),
    "zipCode": MessageLookupByLibrary.simpleMessage("Código Postal"),
    "zipCodeNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Este código está fora da nossa área atual de cobertura",
    ),
  };
}
