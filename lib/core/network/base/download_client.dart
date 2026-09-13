import 'package:dio/dio.dart';

/// `Dio` para descargar de URLs arbitrarias —avatares del login social, la foto
/// de un post o de una promo para compartirla—. Lo de la API va por
/// `FoodlyApiProvider`, que tiene su propia política.
///
/// `connectTimeout` sólo se puede fijar en `BaseOptions`: no es un campo de
/// `Options`, así que no vale pasarlo por petición.
Dio dioDeDescarga() => Dio(BaseOptions(
      connectTimeout: connectTimeoutDeDescarga,
      receiveTimeout: receiveTimeoutDeDescarga,
    ));

const connectTimeoutDeDescarga = Duration(seconds: 10);

/// Generoso: puede ser la foto a pantalla completa de una promo.
const receiveTimeoutDeDescarga = Duration(seconds: 30);
