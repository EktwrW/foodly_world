import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/business/business_client.dart';
import 'package:foodly_world/core/utils/file_handler/file_handler_selector.dart';
import 'package:foodly_world/data_models/business/business_item_photo_dm.dart';
import 'package:foodly_world/data_models/business/business_search_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_businesses_response_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_combo_items_response_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_drinks_items_response_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_food_items_response_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_menus_response_dm.dart';
import 'package:foodly_world/data_models/favorites/saved_promotions_response_dm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/ai_promo_quota_dm.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart' hide CategoryDM;
import 'package:foodly_world/data_transfer_objects/business/business_body_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';
import 'package:foodly_world/data_transfer_objects/business_search/business_search_body_dto.dart';
import 'package:foodly_world/data_transfer_objects/favorites/set_favorite_body_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/category_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/category_reorder_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/item_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/item_reorder_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/menu_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/promotion/promotion_dto.dart';
import 'package:universal_io/io.dart';

class BusinessRepo {
  final BusinessClient _businessClient;

  const BusinessRepo({required BusinessClient businessClient}) : _businessClient = businessClient;

  Future<ApiResult<BusinessDM>> fetchBusinessById(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.fetchBusinessById(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessDM>> updateBusiness(String uuid, BusinessUpdateDTO businessUpdateDTO) async {
    try {
      return ApiResult.success(await _businessClient.updateBusiness(uuid, businessUpdateDTO));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessDM>> register({
    required BusinessBodyRegisterDTO registerDTO,
    String? filePath,
  }) async {
    final fileHandler = getFileHandler();
    final photoMultipartFile = await fileHandler.getMultipartFile(filePath);

    try {
      return ApiResult.success(await _businessClient.register(
        businessName: registerDTO.businessName,
        businessEmail: registerDTO.businessEmail,
        businessPhone: registerDTO.businessPhone,
        businessCountry: registerDTO.businessCountry.value,
        businessCity: registerDTO.businessCity,
        businessAddress: registerDTO.businessAddress,
        businessZipcode: registerDTO.businessZipcode,
        businessLatitude: registerDTO.businessLatitude,
        businessLongitude: registerDTO.businessLongitude,
        businessWebsite: registerDTO.businessWebsite,
        categoryId: registerDTO.categoryId.value,
        photo: photoMultipartFile != null ? [photoMultipartFile] : [],
        introMessage: registerDTO.introMessage,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessDM>> updateLogo({
    required String filePath,
    required String uuid,
  }) async {
    final fileHandler = getFileHandler();
    final logoMultipartFile = await fileHandler.getMultipartFile(filePath);

    log('File path: $filePath');
    log('File exists: ${await File(filePath).exists()}');
    log('File size: ${await File(filePath).length()}');
    log('Multipart file: ${logoMultipartFile?.filename}');
    log('Content type: ${logoMultipartFile?.contentType}');

    try {
      return ApiResult.success(await _businessClient.updateLogo(
        uuid: uuid,
        logo: logoMultipartFile != null ? [logoMultipartFile] : [],
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteCoverImageById(String imageId) async {
    try {
      return ApiResult.success(await _businessClient.deleteCoverImageById(imageId));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessCoverImageDM>> updateCoverImageById(String imageId, String filePath) async {
    final fileHandler = getFileHandler();
    final imageFile = await fileHandler.getMultipartFile(filePath);

    try {
      return ApiResult.success(await _businessClient.updateCoverImageById(
        uuid: imageId,
        image: imageFile != null ? [imageFile] : [],
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<List<BusinessCoverImageDM>>> storeCoverImages({
    required List<String> filePaths,
    required int businessId,
  }) async {
    final fileHandler = getFileHandler();
    final imagesMultipartFile = <MultipartFile>[];

    for (final path in filePaths) {
      final imageMultipartFile = await fileHandler.getMultipartFile(path);

      if (imageMultipartFile != null) imagesMultipartFile.add(imageMultipartFile);
    }

    try {
      return ApiResult.success(
        await _businessClient.storeCoverImages(images: imagesMultipartFile, businessId: businessId),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<MenuDM>> createMenu(MenuRegisterDTO body) async {
    try {
      return ApiResult.success(await _businessClient.createMenu(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<MenuDM>> getMenu(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.getMenu(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<CategoryDM>> createFoodCategory(CategoryDTO body) async {
    try {
      return ApiResult.success(await _businessClient.createFoodCategory(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<CategoryDM>> updateFoodCategory(String uuid, CategoryDTO body) async {
    try {
      return ApiResult.success(await _businessClient.updateFoodCategory(uuid: uuid, body: body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteFoodCategory(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.deleteFoodCategory(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<CategoryDM>> createDrinkCategory(CategoryDTO body) async {
    try {
      return ApiResult.success(await _businessClient.createDrinkCategory(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<CategoryDM>> updateDrinkCategory(String uuid, CategoryDTO body) async {
    try {
      return ApiResult.success(await _businessClient.updateDrinkCategory(uuid: uuid, body: body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteDrinkCategory(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.deleteDrinkCategory(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> reorderCategories(MenuCategory menuCategory, List<CategoryDM> orderedCategories) async {
    try {
      final body = ReorderCategoriesDTO(
        categories: orderedCategories
            .asMap()
            .entries
            .map((e) => CategoryReorderDTO(uuid: e.value.uuid, sortOrder: e.key))
            .toList(),
      );

      switch (menuCategory) {
        case MenuCategory.food:
          await _businessClient.reorderFoodCategories(body);
        case MenuCategory.drinks:
          await _businessClient.reorderDrinkCategories(body);
        case MenuCategory.combos:
          break; // Combos don't have subcategories
      }
      return const ApiResult.success(null);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ItemDM>> createItem(
    ItemDM item,
    MenuCategory menuCategory, {
    int? comboCategoryId,
  }) async {
    try {
      switch (menuCategory) {
        case MenuCategory.food:
          final body = item.toRegisterDTO(menuCategory: MenuCategory.food);

          return ApiResult.success(await _businessClient.createFoodItem(body as FoodItemRegisterDTO));

        case MenuCategory.drinks:
          final body = item.toRegisterDTO(menuCategory: MenuCategory.drinks);

          return ApiResult.success(await _businessClient.createDrinkItem(body as DrinkItemRegisterDTO));

        case MenuCategory.combos:
          final body = (item.copyWith(comboCategoryId: comboCategoryId ?? 0).toRegisterDTO(
                menuCategory: MenuCategory.combos,
              ));

          return ApiResult.success(await _businessClient.createComboItem(body as ComboItemRegisterDTO));
      }
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ItemDM>> updateItem(
    ItemDM item,
    MenuCategory menuCategory, {
    int? comboCategoryId,
  }) async {
    try {
      switch (menuCategory) {
        case MenuCategory.food:
          final body = item.toRegisterDTO(menuCategory: MenuCategory.food);

          return ApiResult.success(
              await _businessClient.upadteFoodItem(uuid: item.uuid, body: body as FoodItemRegisterDTO));

        case MenuCategory.drinks:
          final body = item.toRegisterDTO(menuCategory: MenuCategory.drinks);

          return ApiResult.success(
              await _businessClient.updateDrinkItem(uuid: item.uuid, body: body as DrinkItemRegisterDTO));

        case MenuCategory.combos:
          final body = (item.copyWith(comboCategoryId: comboCategoryId ?? 0).toRegisterDTO(
                menuCategory: MenuCategory.combos,
              ));

          return ApiResult.success(
              await _businessClient.updateComboItem(uuid: item.uuid, body: body as ComboItemRegisterDTO));
      }
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<MenuItemPhotoResponse>> storeItemPhotos({
    required List<String> filePaths,
    required int itemId,
    required MenuCategory menuCategory,
  }) async {
    final fileHandler = getFileHandler();
    final imagesMultipartFile = <MultipartFile>[];

    for (final path in filePaths) {
      final imageMultipartFile = await fileHandler.getMultipartFile(path);

      if (imageMultipartFile != null) imagesMultipartFile.add(imageMultipartFile);
    }

    try {
      switch (menuCategory) {
        case MenuCategory.food:
          return ApiResult.success(
            await _businessClient.storeFoodItemPhotos(images: imagesMultipartFile, itemId: itemId),
          );
        case MenuCategory.drinks:
          return ApiResult.success(
            await _businessClient.storeDrinkItemPhotos(images: imagesMultipartFile, itemId: itemId),
          );
        case MenuCategory.combos:
          return ApiResult.success(
            await _businessClient.storeComboItemPhotos(images: imagesMultipartFile, itemId: itemId),
          );
      }
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<MenuItemPhotoResponse>> updateItemPhotos({
    required List<String> filePaths,
    required String uuid,
    required MenuCategory menuCategory,
  }) async {
    final fileHandler = getFileHandler();
    final imagesMultipartFile = <MultipartFile>[];

    for (final path in filePaths) {
      final imageMultipartFile = await fileHandler.getMultipartFile(path);

      if (imageMultipartFile != null) imagesMultipartFile.add(imageMultipartFile);
    }

    try {
      switch (menuCategory) {
        case MenuCategory.food:
          return ApiResult.success(
            await _businessClient.updateFoodItemPhotos(images: imagesMultipartFile, uuid: uuid),
          );
        case MenuCategory.drinks:
          return ApiResult.success(
            await _businessClient.updateDrinkItemPhotos(images: imagesMultipartFile, uuid: uuid),
          );
        case MenuCategory.combos:
          return ApiResult.success(
            await _businessClient.updateComboItemPhotos(images: imagesMultipartFile, uuid: uuid),
          );
      }
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteItemPhotos({
    required String uuid,
    required MenuCategory menuCategory,
  }) async {
    try {
      switch (menuCategory) {
        case MenuCategory.food:
          return ApiResult.success(
            await _businessClient.deleteFoodItemPhoto(uuid),
          );
        case MenuCategory.drinks:
          return ApiResult.success(
            await _businessClient.deleteDrinkItemPhoto(uuid),
          );
        case MenuCategory.combos:
          return ApiResult.success(
            await _businessClient.deleteComboItemPhoto(uuid),
          );
      }
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteFoodItem(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.deleteFoodItem(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteDrinkItem(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.deleteDrinkItem(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteComboItem(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.deleteComboItem(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> reorderItems(MenuCategory menuCategory, List<ItemDM> orderedItems) async {
    try {
      final body = ReorderItemsDTO(
        items: orderedItems.asMap().entries.map((e) => ItemReorderDTO(uuid: e.value.uuid, sortOrder: e.key)).toList(),
      );

      switch (menuCategory) {
        case MenuCategory.food:
          await _businessClient.reorderFoodItems(body);
        case MenuCategory.drinks:
          await _businessClient.reorderDrinkItems(body);
        case MenuCategory.combos:
          await _businessClient.reorderCombos(body);
      }
      return const ApiResult.success(null);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<List<PromotionDM>>> getBusinessPromotions() async {
    try {
      final response = await _businessClient.getBusinessPromotions();
      return ApiResult.success(response.promotions);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PromotionDM>> createPromotion(PromotionDTO body) async {
    try {
      return ApiResult.success(await _businessClient.createPromotion(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PromotionDM>> getPromotionByUuid(String uuid) async {
    try {
      final response = await _businessClient.getPromotionByUuid(uuid);
      return ApiResult.success(response);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PromotionDM>> updatePromotion({
    required String uuid,
    required PromotionDTO body,
  }) async {
    try {
      return ApiResult.success(await _businessClient.updatePromotion(uuid: uuid, body: body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deletePromotion(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.deletePromotion(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<AiPromoQuotaResponse>> useAiPromoQuota(String businessUuid) async {
    try {
      final response = await _businessClient.useAiPromoQuota({'business_uuid': businessUuid});
      return ApiResult.success(response);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PromoMediaResponse>> storePromotionMedia({
    required List<String> filePaths,
    required String promotionUuid,
    Uint8List? imageBytes,
  }) async {
    final fileHandler = getFileHandler();
    final imagesMultipartFile = <MultipartFile>[];

    if (imageBytes != null) {
      final imageBytesMultipartFile = await fileHandler.getMultipartFileFromBytes(
        imageBytes,
        'image.png',
      );
      if (imageBytesMultipartFile != null) imagesMultipartFile.add(imageBytesMultipartFile);
    } else {
      for (final path in filePaths) {
        final imageMultipartFile = await fileHandler.getMultipartFile(path);
        if (imageMultipartFile != null) imagesMultipartFile.add(imageMultipartFile);
      }
    }

    try {
      return ApiResult.success(await _businessClient.storePromotionMedia(
        images: imagesMultipartFile,
        promotionUuid: promotionUuid,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PromoMediaDM>> getPromotionMediaByUuid(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.getPromotionMediaByUuid(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PromoMediaDM>> updatePromotionMedia({
    required String uuid,
    required List<String> filePaths,
    Uint8List? imageBytes,
  }) async {
    final fileHandler = getFileHandler();
    final imagesMultipartFile = <MultipartFile>[];

    if (imageBytes != null) {
      final imageBytesMultipartFile = await fileHandler.getMultipartFileFromBytes(
        imageBytes,
        'image.png',
      );
      if (imageBytesMultipartFile != null) imagesMultipartFile.add(imageBytesMultipartFile);
    } else {
      for (final path in filePaths) {
        final imageMultipartFile = await fileHandler.getMultipartFile(path);
        if (imageMultipartFile != null) imagesMultipartFile.add(imageMultipartFile);
      }
    }

    try {
      return ApiResult.success(await _businessClient.updatePromotionMedia(
        uuid: uuid,
        images: imagesMultipartFile,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deletePromotionMedia(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.deletePromotionMedia(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessSearchDM>> businessSearch(BusinessSearchBodyDTO body) async {
    try {
      return ApiResult.success(await _businessClient.businessSearch(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<FavoriteBusinessesResponseDM>> getMyFavoriteBusinesses() async {
    try {
      return ApiResult.success(await _businessClient.getMyFavoriteBusinesses());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> setFavoriteBusiness(String businessUuid, SetFavoriteBodyDTO body) async {
    try {
      return ApiResult.success(await _businessClient.setFavoriteBusiness(businessUuid, body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<FavoriteMenusResponseDM>> getMyFavoriteMenus() async {
    try {
      return ApiResult.success(await _businessClient.getMyFavoriteMenus());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> setFavoriteMenu(String uuid, SetFavoriteBodyDTO body) async {
    try {
      return ApiResult.success(await _businessClient.setFavoriteMenu(uuid, body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<FavoriteFoodItemsResponseDM>> getMyFavoriteFoodItems() async {
    try {
      return ApiResult.success(await _businessClient.getMyFavoriteFoodItems());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> setFavoriteFoodItem(String uuid, SetFavoriteBodyDTO body) async {
    try {
      return ApiResult.success(await _businessClient.setFavoriteFoodItem(uuid, body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<FavoriteDrinkItemsResponseDM>> getMyFavoriteDrinkItems() async {
    try {
      return ApiResult.success(await _businessClient.getMyFavoriteDrinkItems());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> setFavoriteDrinkItem(String uuid, SetFavoriteBodyDTO body) async {
    try {
      return ApiResult.success(await _businessClient.setFavoriteDrinkItem(uuid, body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<FavoriteComboItemsResponseDM>> getMyFavoriteComboItems() async {
    try {
      return ApiResult.success(await _businessClient.getMyFavoriteComboItems());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> setFavoriteComboItem(String uuid, SetFavoriteBodyDTO body) async {
    try {
      return ApiResult.success(await _businessClient.setFavoriteComboItem(uuid, body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<SavedPromotionsResponseDM>> getMyFavoritePromotions() async {
    try {
      return ApiResult.success(await _businessClient.getMyFavoritePromotions());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> setFavoritePromotion(String uuid, SetFavoriteBodyDTO body) async {
    try {
      return ApiResult.success(await _businessClient.setFavoritePromotion(uuid, body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<NearbyPromotionsResponseDM>> fetchNearbyPromotions({
    required double latitude,
    required double longitude,
    double? radius,
    int? page,
    int? perPage,
  }) async {
    try {
      return ApiResult.success(await _businessClient.fetchNearbyPromotions(
        latitude: latitude,
        longitude: longitude,
        radius: radius,
        page: page,
        perPage: perPage,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessSearchDM>> fetchNearbyBusinesses({
    required double latitude,
    required double longitude,
    double? radius,
    int? categoryId,
    int? limit,
  }) async {
    try {
      return ApiResult.success(await _businessClient.fetchNearbyBusinesses(
        latitude: latitude,
        longitude: longitude,
        radius: radius,
        categoryId: categoryId,
        limit: limit,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<BusinessSearchDM>> fetchNewReleases({
    required double latitude,
    required double longitude,
    double? radius,
    int? limit,
    int? days,
  }) async {
    try {
      return ApiResult.success(await _businessClient.fetchNewReleases(
        latitude: latitude,
        longitude: longitude,
        radius: radius,
        limit: limit,
        days: days,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteBusiness(String uuid) async {
    try {
      return ApiResult.success(await _businessClient.deleteBusiness(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
