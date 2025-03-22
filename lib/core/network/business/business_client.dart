import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/business/business_item_photo_dm.dart';
import 'package:foodly_world/data_models/business/business_search_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_businesses_response_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_drinks_items_response_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_food_items_response_dm.dart';
import 'package:foodly_world/data_models/favorites/favorite_menus_response_dm.dart';
import 'package:foodly_world/data_models/favorites/saved_promotions_response_dm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';
import 'package:foodly_world/data_transfer_objects/business_search/business_search_body_dto.dart';
import 'package:foodly_world/data_transfer_objects/favorites/set_favorite_body_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/category_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/item_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/menu_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/promotion/promotion_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'business_client.g.dart';

@RestApi()
abstract class BusinessClient {
  factory BusinessClient(Dio dio) = _BusinessClient;

  @GET('/business/{uuid}')
  Future<BusinessDM> fetchBusinessById(@Path('uuid') String uuid);

  @PUT('/business-update/{uuid}')
  Future<BusinessDM> updateBusiness(@Path('uuid') String uuid, @Body() BusinessUpdateDTO businessUpdateDTO);

  @POST('/business-update-logo/{uuid}')
  @MultiPart()
  Future<BusinessDM> updateLogo({
    @Path('uuid') required String uuid,
    @Part(name: 'business_logo') required List<MultipartFile> logo,
  });

  @DELETE('/business-cover-images-delete/{uuid}')
  Future<void> deleteCoverImageById(@Path('uuid') String uuid);

  @POST('/business-cover-images-update/{uuid}')
  Future<BusinessCoverImageDM> updateCoverImageById({
    @Path('uuid') required String uuid,
    @Part(name: 'business_image_path') required List<MultipartFile> image,
  });

  @POST('/business-cover-images-store')
  @MultiPart()
  Future<List<BusinessCoverImageDM>> storeCoverImages({
    @Part(name: 'business_image_path[]') required List<MultipartFile> images,
    @Part(name: 'business_id') required int businessId,
  });

  @POST('/business-store')
  @MultiPart()
  Future<BusinessDM> register({
    @Part(name: 'business_name') required String businessName,
    @Part(name: 'business_email') required String businessEmail,
    @Part(name: 'business_phone') required String businessPhone,
    @Part(name: 'business_address') required String businessAddress,
    @Part(name: 'business_zipcode') required String businessZipcode,
    @Part(name: 'business_city') required String businessCity,
    @Part(name: 'business_country') required String businessCountry,
    @Part(name: 'business_website') required String? businessWebsite,
    @Part(name: 'business_latitude') required double? businessLatitude,
    @Part(name: 'business_longitude') required double? businessLongitude,
    @Part(name: 'category_id') required int categoryId,
    @Part(name: 'business_logo') required List<MultipartFile> photo,
  });

  @POST('/business-menu/store')
  Future<MenuDM> createMenu(@Body() MenuRegisterDTO body);

  @GET('/business-menu/{uuid}')
  Future<MenuDM> getMenu(@Path('uuid') String uuid);

  @POST('/business-food-categories/store')
  Future<CategoryDM> createFoodCategory(@Body() CategoryDTO body);

  @PATCH('/business-food-categories/update/{uuid}')
  Future<CategoryDM> updateFoodCategory({@Path('uuid') required String uuid, @Body() required CategoryDTO body});

  @DELETE('/business-food-categories/delete/{uuid}')
  Future<void> deleteFoodCategory(@Path('uuid') String uuid);

  @POST('/business-food-item/store')
  Future<ItemDM> createFoodItem(@Body() FoodItemRegisterDTO body);

  @PATCH('/business-food-item/update/{uuid}')
  Future<ItemDM> upadteFoodItem({@Path('uuid') required String uuid, @Body() required FoodItemRegisterDTO body});

  @DELETE('/business-food-item/delete/{uuid}')
  Future<void> deleteFoodItem(@Path('uuid') String uuid);

  @POST('/business-food-item-photos/store')
  @MultiPart()
  Future<MenuItemPhotoResponse> storeFoodItemPhotos({
    @Part(name: 'business_food_photo_url[]') required List<MultipartFile> images,
    @Part(name: 'business_food_item_id') required int itemId,
  });

  @POST('/business-food-item-photos/update/{uuid}')
  @MultiPart()
  Future<MenuItemPhotoResponse> updateFoodItemPhotos({
    @Path('uuid') required String uuid,
    @Part(name: 'business_food_photo_url') required List<MultipartFile> images,
  });

  @DELETE('/business-food-item-photos/delete/{uuid}')
  Future<void> deleteFoodItemPhoto(@Path('uuid') String uuid);

  @POST('/business-drink-categories/store')
  Future<CategoryDM> createDrinkCategory(@Body() CategoryDTO body);

  @PATCH('/business-drink-categories/update/{uuid}')
  Future<CategoryDM> updateDrinkCategory({@Path('uuid') required String uuid, @Body() required CategoryDTO body});

  @DELETE('/business-drink-categories/delete/{uuid}')
  Future<void> deleteDrinkCategory(@Path('uuid') String uuid);

  @POST('/business-drink-item/store')
  Future<ItemDM> createDrinkItem(@Body() DrinkItemRegisterDTO body);

  @PATCH('/business-drink-item/update/{uuid}')
  Future<ItemDM> updateDrinkItem({@Path('uuid') required String uuid, @Body() required DrinkItemRegisterDTO body});

  @DELETE('/business-drink-item/delete/{uuid}')
  Future<void> deleteDrinkItem(@Path('uuid') String uuid);

  @POST('/business-drink-item-photos/store')
  @MultiPart()
  Future<MenuItemPhotoResponse> storeDrinkItemPhotos({
    @Part(name: 'business_drink_photo_url[]') required List<MultipartFile> images,
    @Part(name: 'business_drink_item_id') required int itemId,
  });

  @POST('/business-drink-item-photos/update/{uuid}')
  @MultiPart()
  Future<MenuItemPhotoResponse> updateDrinkItemPhotos({
    @Path('uuid') required String uuid,
    @Part(name: 'business_drink_photo_url') required List<MultipartFile> images,
  });

  @DELETE('/business-drink-item/delete/{uuid}')
  Future<void> deleteDrinkItemPhoto(@Path('uuid') String uuid);

  @POST('/business-combos/store')
  Future<ItemDM> createComboItem(@Body() ComboItemRegisterDTO body);

  @PATCH('/business-combos/update/{uuid}')
  Future<ItemDM> updateComboItem({@Path('uuid') required String uuid, @Body() required ComboItemRegisterDTO body});

  @DELETE('/business-combos/delete/{uuid}')
  Future<void> deleteComboItem(@Path('uuid') String uuid);

  @POST('/business-combos-photos/store')
  @MultiPart()
  Future<MenuItemPhotoResponse> storeComboItemPhotos({
    @Part(name: 'business_combos_photo_url[]') required List<MultipartFile> images,
    @Part(name: 'business_combos_id') required int itemId,
  });

  @POST('/business-combos-photos/update/{uuid}')
  @MultiPart()
  Future<MenuItemPhotoResponse> updateComboItemPhotos({
    @Path('uuid') required String uuid,
    @Part(name: 'business_combos_photo_url') required List<MultipartFile> images,
  });

  @DELETE('/business-combos-photos/delete/{uuid}')
  Future<void> deleteComboItemPhoto(@Path('uuid') String uuid);

  @GET('/promotions')
  Future<PromotionsResponse> getBusinessPromotions();

  @POST('/promotions/store')
  Future<PromotionDM> createPromotion(@Body() PromotionDTO body);

  @GET('/promotions/{uuid}')
  Future<List<PromotionDM>> getPromotionByUuid(@Path('uuid') String uuid);

  @PATCH('/promotions/update/{uuid}')
  Future<PromotionDM> updatePromotion({@Path('uuid') required String uuid, @Body() required PromotionDTO body});

  @DELETE('/promotions/delete/{uuid}')
  Future<void> deletePromotion(@Path('uuid') String uuid);

  @POST('/promotions-media/store')
  @MultiPart()
  Future<PromoMediaResponse> storePromotionMedia({
    @Part(name: 'business_promo_media_url[]') required List<MultipartFile> images,
    @Part(name: 'promotion_uuid') required String promotionUuid,
  });

  @GET('/promotions-media/{uuid}')
  Future<PromoMediaDM> getPromotionMediaByUuid(@Path('uuid') String uuid);

  @POST('/promotions-media/update/{uuid}')
  @MultiPart()
  Future<PromoMediaDM> updatePromotionMedia({
    @Path('uuid') required String uuid,
    @Part(name: 'business_promo_media_url') required List<MultipartFile> images,
  });

  @DELETE('/promotions-media/delete/{uuid}')
  Future<void> deletePromotionMedia(@Path('uuid') String uuid);

  @POST('/business/search')
  Future<BusinessSearchDM> businessSearch(@Body() BusinessSearchBodyDTO body);

  @GET('/business-favorites')
  Future<FavoriteBusinessesResponseDM> getMyFavoriteBusinesses();

  @POST('/business-favorites/{businessUuid}')
  Future<void> setFavoriteBusiness(@Path('businessUuid') String businessUuid, @Body() SetFavoriteBodyDTO body);

  @GET('/business-menu-favorites')
  Future<FavoriteMenusResponseDM> getMyFavoriteMenus();

  @POST('/business-menu-favorites/{uuid}')
  Future<void> setFavoriteMenu(@Path('uuid') String uuid, @Body() SetFavoriteBodyDTO body);

  @GET('/business-food-item-favorites')
  Future<FavoriteFoodItemsResponseDM> getMyFavoriteFoodItems();

  @POST('/business-food-item-favorites/{uuid}')
  Future<void> setFavoriteFoodItem(@Path('uuid') String uuid, @Body() SetFavoriteBodyDTO body);

  @GET('/business-drink-item-favorites')
  Future<FavoriteDrinksItemsResponseDM> getMyFavoriteDrinkItems();

  @POST('/business-drink-item-favorites/{uuid}')
  Future<void> setFavoriteDrinkItem(@Path('uuid') String uuid, @Body() SetFavoriteBodyDTO body);

  @GET('/save-promotions')
  Future<SavedPromotionsResponseDM> getMyFavoritePromotions();

  @POST('/save-promotions/{uuid}')
  Future<void> setFavoritePromotion(@Path('uuid') String uuid, @Body() SetFavoriteBodyDTO body);
}
