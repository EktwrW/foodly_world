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

  static String m0(count) =>
      "Gera título (máx. 36 caracteres), subtítulo (máx. 99) e descrição (máx. 369) para a sua promoção. Tem ${count} utilizações restantes este mês.";

  static String m1(businessName) => "Nova atividade em ${businessName}";

  static String m2(businessName) =>
      "O menu de ${businessName} está a chamar a atenção!";

  static String m3(businessName) =>
      "Um prato de ${businessName} está em destaque!";

  static String m4(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} está em destaque!";

  static String m5(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} está a chamar a atenção!";

  static String m6(businessName) =>
      "Uma promoção de ${businessName} é popular!";

  static String m7(entityName, businessName) =>
      "\"${entityName}\" de ${businessName} é popular!";

  static String m8(businessName) => "${businessName} tem um novo seguidor!";

  static String m9(businessName) =>
      "${businessName} publicou uma nova promoção!";

  static String m10(businessName) => "Nova avaliação em ${businessName}!";

  static String m11(businessName) => "${businessName} atualizou uma promoção";

  static String m12(year) =>
      "Direitos de Autor © ${year} - Todos os direitos reservados";

  static String m13(businessName) => "Edite sua avaliação para ${businessName}";

  static String m14(phone) => "Insere o código enviado para ${phone}";

  static String m15(errorMsg) =>
      "Falha ao eliminar as fotos do item:\n\n${errorMsg}";

  static String m16(size) => "máx. ${size}";

  static String m17(maxSize) => "Máx.";

  static String m18(radius) =>
      "Não há comércios próximos nesta categoria dentro de ${radius} km.";

  static String m19(count) => "Tem ${count} reservas pendentes";

  static String m20(action, errorMsg) =>
      "Ocorreu um erro ao ${action} a(s) foto(s) do item: ${errorMsg}";

  static String m21(maxImages) =>
      "Pressione para adicionar fotos, até um máximo de ${maxImages} imagens";

  static String m22(seconds) => "Reenviar em ${seconds}s";

  static String m23(businessName) => "Reservar mesa em ${businessName}";

  static String m24(city) => "Procurar em ${city}...";

  static String m25(businessName, appName, menuUrl) =>
      "🍽️ Vê o menu de ${businessName} em 🌟 ${appName}: \n${menuUrl}";

  static String m26(businessName) =>
      "Escreva uma avaliação para ${businessName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Sobre"),
    "accessiblePMR": MessageLookupByLibrary.simpleMessage("Acessível PMR"),
    "account": MessageLookupByLibrary.simpleMessage("Conta"),
    "addADescription": MessageLookupByLibrary.simpleMessage(
      "Adicionar uma descrição",
    ),
    "addANewTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Adicionar um novo período de tempo",
    ),
    "addAdditionalInformation": MessageLookupByLibrary.simpleMessage(
      "Adiciona informação adicional",
    ),
    "addContact": MessageLookupByLibrary.simpleMessage(
      "Adicionar canais de contacto",
    ),
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
    "addTagline": MessageLookupByLibrary.simpleMessage(
      "Adicione uma frase chamativa",
    ),
    "addTitle": MessageLookupByLibrary.simpleMessage("Adicione um título"),
    "addToFavorites": MessageLookupByLibrary.simpleMessage(
      "Adicionar aos favoritos",
    ),
    "addYoutubeUrl": MessageLookupByLibrary.simpleMessage(
      "Adicionar URL do YouTube",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Morada"),
    "admin": MessageLookupByLibrary.simpleMessage("Administrador"),
    "aiPromoContent": m0,
    "aiPromoGenerate": MessageLookupByLibrary.simpleMessage("Gerar"),
    "aiPromoImageLabel": MessageLookupByLibrary.simpleMessage(
      "Incluir imagem promocional (16:9)",
    ),
    "aiPromoImageNatural": MessageLookupByLibrary.simpleMessage("Natural"),
    "aiPromoImageVivid": MessageLookupByLibrary.simpleMessage("Vibrante"),
    "aiPromoTitle": MessageLookupByLibrary.simpleMessage(
      "Gerador de Promoções IA",
    ),
    "all": MessageLookupByLibrary.simpleMessage("Todos"),
    "allowReservations": MessageLookupByLibrary.simpleMessage(
      "Permitir Reservas",
    ),
    "alphabetical": MessageLookupByLibrary.simpleMessage("A-Z"),
    "alreadyReviewedPrompt": MessageLookupByLibrary.simpleMessage(
      "Você já avaliou este estabelecimento.\nDeseja editar sua avaliação?",
    ),
    "analytics": MessageLookupByLibrary.simpleMessage("Análises"),
    "and": MessageLookupByLibrary.simpleMessage("e"),
    "andCreateContentToThese": MessageLookupByLibrary.simpleMessage(
      "e gerir conteúdo, promoções e mais",
    ),
    "arabic": MessageLookupByLibrary.simpleMessage("Árabe"),
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
    "babyChangingStation": MessageLookupByLibrary.simpleMessage(
      "Trocador de Bebês",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Voltar"),
    "bakeryAndDesserts": MessageLookupByLibrary.simpleMessage(
      "Pastelaria e Sobremesas",
    ),
    "big": MessageLookupByLibrary.simpleMessage("Grande"),
    "biometricSnackbarTextSpanA": MessageLookupByLibrary.simpleMessage(
      "O sistema operativo deste dispositivo não suporta ou não tem configurados, os acessos de tipo padrão ou biométricos.",
    ),
    "biometricSnackbarTextSpanB": MessageLookupByLibrary.simpleMessage(
      "A sessão expirou, deve entrar com o seu usuário e senha, ou aceder com a rede social da sua preferência.",
    ),
    "brands": MessageLookupByLibrary.simpleMessage("marcas"),
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
    "businessRegister": MessageLookupByLibrary.simpleMessage(
      "Registar Negócio",
    ),
    "businesses": MessageLookupByLibrary.simpleMessage("negócios"),
    "buzz": MessageLookupByLibrary.simpleMessage("Novidades"),
    "buzzDefaultActivity": m1,
    "buzzEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "A atividade da comunidade aparecerá aqui",
    ),
    "buzzEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Ainda não há novidades por perto",
    ),
    "buzzNewFavoriteMenu": m2,
    "buzzNewFavoriteMenuItem": m3,
    "buzzNewFavoriteMenuItemNamed": m4,
    "buzzNewFavoriteMenuNamed": m5,
    "buzzNewFavoritePromotion": m6,
    "buzzNewFavoritePromotionNamed": m7,
    "buzzNewFollower": m8,
    "buzzNewPromotion": m9,
    "buzzNewReview": m10,
    "buzzPromotionUpdate": m11,
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
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelada"),
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
    "changeLocation": MessageLookupByLibrary.simpleMessage("Mudar Localização"),
    "changeSearchPoint": MessageLookupByLibrary.simpleMessage(
      "Mude o ponto de pesquisa para recomendações",
    ),
    "changeUsername": MessageLookupByLibrary.simpleMessage(
      "Alterar nome de utilizador",
    ),
    "checkBackLater": MessageLookupByLibrary.simpleMessage("Volte em breve!"),
    "city": MessageLookupByLibrary.simpleMessage("Cidade"),
    "clear": MessageLookupByLibrary.simpleMessage("Limpar"),
    "close": MessageLookupByLibrary.simpleMessage("Fechar"),
    "closed": MessageLookupByLibrary.simpleMessage("Fechado"),
    "combos": MessageLookupByLibrary.simpleMessage("Combos"),
    "complete": MessageLookupByLibrary.simpleMessage("Completar"),
    "completeSignUp": MessageLookupByLibrary.simpleMessage("Completar Registo"),
    "completed": MessageLookupByLibrary.simpleMessage("Concluída"),
    "composure": MessageLookupByLibrary.simpleMessage("Compostura"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirmar senha"),
    "confirmPhoneForVerification": MessageLookupByLibrary.simpleMessage(
      "Confirma o número de telefone para receber o teu código de verificação.",
    ),
    "confirmed": MessageLookupByLibrary.simpleMessage("Confirmada"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Erro de conexão. Verifique sua internet e tente novamente.",
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
    "cookingSchools": MessageLookupByLibrary.simpleMessage(
      "Escolas de Cozinha",
    ),
    "copyrightText": m12,
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
    "createPostTitle": MessageLookupByLibrary.simpleMessage("Criar publicação"),
    "createUser": MessageLookupByLibrary.simpleMessage("Criar Utilizador"),
    "cropImage": MessageLookupByLibrary.simpleMessage("Recortar imagem"),
    "customer": MessageLookupByLibrary.simpleMessage("Cliente"),
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
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Data de nascimento"),
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
    "deletePostConfirm": MessageLookupByLibrary.simpleMessage(
      "Tem a certeza de que pretende eliminar esta publicação?",
    ),
    "deletePostTitle": MessageLookupByLibrary.simpleMessage(
      "Eliminar publicação",
    ),
    "delivery": MessageLookupByLibrary.simpleMessage("Entrega ao Domicílio"),
    "doItLater": MessageLookupByLibrary.simpleMessage(
      "Vou fazer isto mais tarde",
    ),
    "doYouWantToDeleteThisCoverImage": MessageLookupByLibrary.simpleMessage(
      "Deseja eliminar esta imagem de capa?",
    ),
    "downloadApp": MessageLookupByLibrary.simpleMessage("Obter a app"),
    "drinks": MessageLookupByLibrary.simpleMessage("Bebidas"),
    "edit": MessageLookupByLibrary.simpleMessage("Editar"),
    "editCoverImages": MessageLookupByLibrary.simpleMessage(
      "Editar Imagens de Capa",
    ),
    "editLocation": MessageLookupByLibrary.simpleMessage("Editar Localização"),
    "editMenu": MessageLookupByLibrary.simpleMessage("Editar menu"),
    "editReview": MessageLookupByLibrary.simpleMessage("Editar avaliação"),
    "editTitle": MessageLookupByLibrary.simpleMessage("Editar título"),
    "editYourReviewFor": m13,
    "email": MessageLookupByLibrary.simpleMessage("Correio eletrónico"),
    "enableLocation": MessageLookupByLibrary.simpleMessage(
      "Ativar localização",
    ),
    "enableLocationDescription": MessageLookupByLibrary.simpleMessage(
      "Toque para ativar o acesso à localização",
    ),
    "end": MessageLookupByLibrary.simpleMessage("Fecho"),
    "endDate": MessageLookupByLibrary.simpleMessage("Data de fim"),
    "endSession": MessageLookupByLibrary.simpleMessage("Terminar Sessão"),
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
    "enterCodeSentTo": m14,
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
    "failedDeletePhotos": m15,
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
    "female": MessageLookupByLibrary.simpleMessage("Feminino"),
    "findAndCompleteAddress": MessageLookupByLibrary.simpleMessage(
      "Encontre e complete facilmente o seu endereço",
    ),
    "finishEdit": MessageLookupByLibrary.simpleMessage(
      "Terminar modo de edição",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("Nome próprio"),
    "follow": MessageLookupByLibrary.simpleMessage("Seguir"),
    "followers": MessageLookupByLibrary.simpleMessage("Seguidores"),
    "following": MessageLookupByLibrary.simpleMessage("Seguindo"),
    "food": MessageLookupByLibrary.simpleMessage("Pratos"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Esqueceu-se da senha?",
    ),
    "fusionCuisine": MessageLookupByLibrary.simpleMessage("Culinária de Fusão"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galeria"),
    "gender": MessageLookupByLibrary.simpleMessage("Género"),
    "generateQR": MessageLookupByLibrary.simpleMessage("Gerar código QR"),
    "generateWithAI": MessageLookupByLibrary.simpleMessage("Gerar com IA"),
    "goodAfternoon": MessageLookupByLibrary.simpleMessage("Boa tarde"),
    "goodEvening": MessageLookupByLibrary.simpleMessage("Boa noite"),
    "goodMorning": MessageLookupByLibrary.simpleMessage("Bom dia"),
    "guests": MessageLookupByLibrary.simpleMessage("comensais"),
    "happyBirthday": MessageLookupByLibrary.simpleMessage("Feliz Aniversário"),
    "happyHours": MessageLookupByLibrary.simpleMessage("Horas Felizes"),
    "hi": MessageLookupByLibrary.simpleMessage("Olá"),
    "home": MessageLookupByLibrary.simpleMessage("Início"),
    "imageSizeLessThan10mb": MessageLookupByLibrary.simpleMessage(
      "O tamanho da imagem deve ser inferior a 10MB",
    ),
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
    "invalidYoutubeUrl": MessageLookupByLibrary.simpleMessage(
      "URL do YouTube inválido",
    ),
    "italian": MessageLookupByLibrary.simpleMessage("Italiana"),
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
    "kidChairs": MessageLookupByLibrary.simpleMessage("Cadeiras para Crianças"),
    "kidsMenu": MessageLookupByLibrary.simpleMessage("Menu infantil"),
    "kidsPlayArea": MessageLookupByLibrary.simpleMessage(
      "Área de Brincadeiras para Crianças",
    ),
    "koreanCuisine": MessageLookupByLibrary.simpleMessage("Coreana"),
    "lastName": MessageLookupByLibrary.simpleMessage("Apelido"),
    "likes": MessageLookupByLibrary.simpleMessage("Gostos"),
    "listening": MessageLookupByLibrary.simpleMessage("A ouvir"),
    "liveMusic": MessageLookupByLibrary.simpleMessage("Música ao Vivo"),
    "loadLogo": MessageLookupByLibrary.simpleMessage("Carregar Logo"),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Permissão de localização negada. Precisamos da sua localização para mostrar restaurantes próximos.",
    ),
    "locationPermissionPermanentlyDenied": MessageLookupByLibrary.simpleMessage(
      "Localização permanentemente negada. Ative nas definições da app.",
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
    "mainPromos": MessageLookupByLibrary.simpleMessage("Promoções Destacadas"),
    "male": MessageLookupByLibrary.simpleMessage("Masculino"),
    "manageReservations": MessageLookupByLibrary.simpleMessage(
      "Gerir Reservas",
    ),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Marcar todo como lido",
    ),
    "markedNoShow": MessageLookupByLibrary.simpleMessage(
      "Marcado como não compareceu.",
    ),
    "marketsAndStores": MessageLookupByLibrary.simpleMessage(
      "Mercados e Lojas",
    ),
    "maxPartySize": m16,
    "maxSize": m17,
    "maxSizeLabel": MessageLookupByLibrary.simpleMessage("Máx."),
    "medium": MessageLookupByLibrary.simpleMessage("Médio"),
    "menu": MessageLookupByLibrary.simpleMessage("Menu"),
    "menus": MessageLookupByLibrary.simpleMessage("Menus"),
    "message": MessageLookupByLibrary.simpleMessage("Mensagem"),
    "mexicanCuisine": MessageLookupByLibrary.simpleMessage("Mexicana"),
    "micPermissionDeniedMessage": MessageLookupByLibrary.simpleMessage(
      "A pesquisa por voz usa o microfone para encontrar lugares próximos. Ativa o acesso em Definições para explorar com a tua voz.",
    ),
    "mockTextNewReleasesCard": MessageLookupByLibrary.simpleMessage(
      "A rede Ramalha através da cidade de Covilhã continua a crescer. Após expandir no último ano para a cidade de Fundão, desta vez a pastelaria abriu o seu segundo espaço no Covilhã Shopping, numa área interior na sua zona frontal, no piso 0 com uma ampla esplanada.",
    ),
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
    "needBestRecommendations": MessageLookupByLibrary.simpleMessage(
      "Precisa das melhores recomendações?",
    ),
    "newBranch": MessageLookupByLibrary.simpleMessage("Novos no Foodly"),
    "newPassword": MessageLookupByLibrary.simpleMessage("Nova Palavra-passe"),
    "news": MessageLookupByLibrary.simpleMessage("Novidades"),
    "nickName": MessageLookupByLibrary.simpleMessage("Nome de utilizador"),
    "noAudioDetected": MessageLookupByLibrary.simpleMessage(
      "Nenhum áudio detetado. Por favor, tente novamente.",
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
    "noNearbyBusinessesInCategory": m18,
    "noNewBranches": MessageLookupByLibrary.simpleMessage(
      "Ainda não há negócios novos na sua zona",
    ),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "Ainda não há notificações",
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
    "notification": MessageLookupByLibrary.simpleMessage("Notificação"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notificações"),
    "okGo": MessageLookupByLibrary.simpleMessage("Ok, Vamos!"),
    "onSite": MessageLookupByLibrary.simpleMessage("No local"),
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
    "other": MessageLookupByLibrary.simpleMessage("Outro"),
    "outdoorSeating": MessageLookupByLibrary.simpleMessage(
      "Assentos ao ar livre",
    ),
    "owner": MessageLookupByLibrary.simpleMessage("Proprietário"),
    "parking": MessageLookupByLibrary.simpleMessage("Estacionamento"),
    "partySize": MessageLookupByLibrary.simpleMessage("Comensais:"),
    "password": MessageLookupByLibrary.simpleMessage("Senha"),
    "passwordInstructions": MessageLookupByLibrary.simpleMessage(
      "A senha deve ter pelo menos 8 caracteres, um número, uma letra minúscula e uma maiúscula",
    ),
    "passwordSent": MessageLookupByLibrary.simpleMessage(
      "Senha temporária enviada",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pendente"),
    "pendingReservationsAlertMany": m19,
    "pendingReservationsAlertOne": MessageLookupByLibrary.simpleMessage(
      "Tem 1 reserva pendente",
    ),
    "pendingReservationsContent": MessageLookupByLibrary.simpleMessage(
      "Existem pedidos de reserva aguardando a sua resposta.",
    ),
    "peruvian": MessageLookupByLibrary.simpleMessage("Peruana"),
    "petFriendly": MessageLookupByLibrary.simpleMessage("Aceita Animais"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Número de telefone"),
    "photosDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Fotos do item eliminadas com sucesso",
    ),
    "photosSaveError": m20,
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
    "portugueseCuisine": MessageLookupByLibrary.simpleMessage("Portuguesa"),
    "post": MessageLookupByLibrary.simpleMessage("Publicar"),
    "posts": MessageLookupByLibrary.simpleMessage("Publicações"),
    "postsFeedBeFirst": MessageLookupByLibrary.simpleMessage(
      "Seja o primeiro a partilhar algo!",
    ),
    "postsFeedNoPosts": MessageLookupByLibrary.simpleMessage(
      "Ainda não há publicações",
    ),
    "preferNotToSay": MessageLookupByLibrary.simpleMessage(
      "Prefiro não responder",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferências"),
    "pressToAddPhotosUpToMaxImages": m21,
    "price": MessageLookupByLibrary.simpleMessage("Preço"),
    "priceValidation": MessageLookupByLibrary.simpleMessage(
      "O preço não pode estar vazio e deve ser superior a 0.09",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de Privacidade",
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
    "promotionDays": MessageLookupByLibrary.simpleMessage("Dias de promoção"),
    "promotions": MessageLookupByLibrary.simpleMessage("Promoções"),
    "pubsAndWineBars": MessageLookupByLibrary.simpleMessage("Pubs e Vinharias"),
    "radiusDistanceLabel": MessageLookupByLibrary.simpleMessage(
      "Radio de distância:",
    ),
    "rateYourExperience": MessageLookupByLibrary.simpleMessage(
      "Avalie sua experiência:",
    ),
    "readyToListen": MessageLookupByLibrary.simpleMessage("Pronto para ouvir"),
    "recentPosts": MessageLookupByLibrary.simpleMessage("Publicações recentes"),
    "recommend": MessageLookupByLibrary.simpleMessage("Recomendar"),
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
    "rejectReservation": MessageLookupByLibrary.simpleMessage(
      "Rejeitar Reserva",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejeitada"),
    "removePhotos": MessageLookupByLibrary.simpleMessage("Remover fotos"),
    "removeThisTimePeriod": MessageLookupByLibrary.simpleMessage(
      "Remover este período de tempo",
    ),
    "removeVideo": MessageLookupByLibrary.simpleMessage("Remover vídeo"),
    "request": MessageLookupByLibrary.simpleMessage("Solicitar"),
    "requestReservation": MessageLookupByLibrary.simpleMessage("Pedir Reserva"),
    "requested": MessageLookupByLibrary.simpleMessage("Solicitado"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Reenviar Código"),
    "resendCodeIn": m22,
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
    "reserveTableAt": m23,
    "resilience": MessageLookupByLibrary.simpleMessage("Resiliência"),
    "resultsFor": MessageLookupByLibrary.simpleMessage("Resultados para"),
    "resumeSessionWithSecurity": MessageLookupByLibrary.simpleMessage(
      "Retomar sessão com impressão digital/rosto ou padrão",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Tentar novamente"),
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
    "scanQRCode": MessageLookupByLibrary.simpleMessage("Leia este código QR"),
    "seafood": MessageLookupByLibrary.simpleMessage("Marisco"),
    "searchBusinessOrAddress": MessageLookupByLibrary.simpleMessage(
      "Procurar negócio ou endereço",
    ),
    "searchInCity": m24,
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
    "sendVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Enviar Código de Verificação",
    ),
    "sessionExpiredMessage": MessageLookupByLibrary.simpleMessage(
      "A sua sessão expirou. Por favor, faça login novamente.",
    ),
    "setDate": MessageLookupByLibrary.simpleMessage("Definir data"),
    "shareMenu": MessageLookupByLibrary.simpleMessage("Partilhar este menu"),
    "shareMenuError": MessageLookupByLibrary.simpleMessage(
      "Ups... Algo correu mal! \n\nNão foi possível partilhar o menu.",
    ),
    "shareMenuMessage": m25,
    "shareMenuSubject": MessageLookupByLibrary.simpleMessage(
      "Partilho contigo um menu!",
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
    "socials": MessageLookupByLibrary.simpleMessage("Comunidade"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Ocorreu um erro",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("Ordenar por"),
    "specialRequestsOptional": MessageLookupByLibrary.simpleMessage(
      "Pedidos especiais (opcional)",
    ),
    "speechRecognitionError": MessageLookupByLibrary.simpleMessage(
      "Erro ao iniciar o reconhecimento de voz.",
    ),
    "speechRecognitionUnavailable": MessageLookupByLibrary.simpleMessage(
      "O reconhecimento de voz não está disponível neste dispositivo.",
    ),
    "start": MessageLookupByLibrary.simpleMessage("Início"),
    "startDate": MessageLookupByLibrary.simpleMessage("Data de início"),
    "startups": MessageLookupByLibrary.simpleMessage("Startups"),
    "state": MessageLookupByLibrary.simpleMessage("Estado"),
    "steakhouse": MessageLookupByLibrary.simpleMessage("Carnes e Grelhados"),
    "stop": MessageLookupByLibrary.simpleMessage("Parar"),
    "stress": MessageLookupByLibrary.simpleMessage("Stresse"),
    "subject": MessageLookupByLibrary.simpleMessage("Assunto"),
    "submit": MessageLookupByLibrary.simpleMessage("Submeter"),
    "submitReview": MessageLookupByLibrary.simpleMessage("Enviar avaliação"),
    "success": MessageLookupByLibrary.simpleMessage("Sucesso"),
    "successfullyDeleted": MessageLookupByLibrary.simpleMessage(
      "Eliminado com sucesso!",
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
    "takeAway": MessageLookupByLibrary.simpleMessage("Para Levar"),
    "tapToAddPrompt": MessageLookupByLibrary.simpleMessage(
      "Toque aqui para adicionar um novo prompt",
    ),
    "tapToSelectTime": MessageLookupByLibrary.simpleMessage(
      "Toque para selecionar hora",
    ),
    "temporarilyUnavailable": MessageLookupByLibrary.simpleMessage(
      "Temporariamente indisponível",
    ),
    "tendencies": MessageLookupByLibrary.simpleMessage("Tendências"),
    "termsConditions": MessageLookupByLibrary.simpleMessage(
      "Termos e Condições",
    ),
    "termsConditionsShort": MessageLookupByLibrary.simpleMessage("T&C"),
    "termsPrivacyTextSpan1": MessageLookupByLibrary.simpleMessage(
      "Ao criar uma conta, você leu e aceita os nossos",
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
    "tryAgain": MessageLookupByLibrary.simpleMessage("Tentar novamente"),
    "unauthorizedAccess": MessageLookupByLibrary.simpleMessage(
      "Acesso não autorizado.",
    ),
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
    "visitBusinessPage": MessageLookupByLibrary.simpleMessage(
      "Ver página do estabelecimento",
    ),
    "visitor": MessageLookupByLibrary.simpleMessage("Visitante"),
    "vitality": MessageLookupByLibrary.simpleMessage("Vitalidade"),
    "weWillCheckAvailability": MessageLookupByLibrary.simpleMessage(
      "Verificaremos disponibilidade",
    ),
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
    "whenDidYouVisit": MessageLookupByLibrary.simpleMessage(
      "Quando você visitou?",
    ),
    "wifi": MessageLookupByLibrary.simpleMessage("Wifi"),
    "writeReviewFor": m26,
    "writeYourReviewHint": MessageLookupByLibrary.simpleMessage(
      "Escreva sua avaliação aqui...",
    ),
    "zipCode": MessageLookupByLibrary.simpleMessage("Código Postal"),
    "zipCodeNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Este código está fora da nossa área atual de cobertura",
    ),
  };
}
