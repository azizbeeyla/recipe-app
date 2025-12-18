import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_app_ui_kit_food/core/router/router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.secureStorage,
  });

  final FlutterSecureStorage secureStorage;
  final dio = Dio(
    BaseOptions(baseUrl: "http://192.168.9.120:8888/api/v1", validateStatus: (status) => true),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await secureStorage.read(key: "token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
      print("token : $token");
    }
    print("request $options $handler");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("error $err");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print("response $response");
    if (response.statusCode == 401) {
      var login = await secureStorage.read(key: "login");
      var password = await secureStorage.read(key: "password");

      if (login == null || password == null) await logout();

      var result = await dio.post("/auth/login", data: {"login": login, "pasword": password});
      var token = result.data["accessToken"];

      if (result.statusCode != 200 || token == null) await logout();

      await secureStorage.write(key: "token", value: token);
      final headers = response.requestOptions.headers;
      headers["Authorization"] = "Bearer $token";

      var retry = await dio.fetch(
        RequestOptions(
          baseUrl: response.requestOptions.baseUrl,
          path: response.requestOptions.path,
          method: response.requestOptions.method,
          data: response.requestOptions.data,
          headers: headers,
        ),
      );
      if (retry.statusCode != 200) await logout();
      super.onResponse(retry, handler);
    }
    super.onResponse(response, handler);
  }

  Future<void> logout() async {
    await secureStorage.delete(key: "token");
    await secureStorage.delete(key: "login");
    await secureStorage.delete(key: "password");
    router.go(Routers.login);
    return;
  }
}
