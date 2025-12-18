import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/category_repositores/category_repository_local.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/category_repositores/category_repository_remote.dart';

import '../data/repositores/auth_repostoriy.dart';
import '../data/repositores/category_repositores/category_repository.dart';
import '../data/repositores/onboarding_repositores/onboarding_repository.dart';
import '../data/repositores/recipes_repository.dart';
import '../data/repositores/reviews_repository.dart';
import '../data/repositores/user_repositores/user_repository.dart';
import '../data/repositores/onboarding_repositores/onboarding_repository_local.dart';
import '../data/repositores/user_repositores/user_repository_local.dart';
import '../data/repositores/onboarding_repositores/onboarding_repository_remote.dart';
import '../data/repositores/user_repositores/user_repository_remote.dart';
import '../features/common/manegers/app_theme_view_model.dart';
import 'auth_interceptor.dart';
import 'client.dart';

final dependencies = [
  ChangeNotifierProvider(create: (context) => AppThemeViewModel()),
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  Provider(
    create: (context) =>
        Dio(BaseOptions(baseUrl: "http://192.168.9.120:8888/api/v1", validateStatus: (status) => true))
          ..interceptors.add(context.read<AuthInterceptor>()),
  ),
  Provider(create: (context) => ApiClient(dio: context.read())),
  Provider(create: (context) => AuthRepository(client: context.read(), secureStorage: context.read())),
  Provider(create: (context) => UserRepositoryRemote(client: context.read())),
  Provider(create: (context) => UserRepositoryLocal()),
  Provider(create: (context) => UsersRepository(client: context.read(), localRepo: context.read(), remoteRepo: context.read())),
  Provider(create: (context) => ReviewsRepository(client: context.read())),

  Provider(create: (context) => RecipesRepository(client: context.read())),
  Provider(create: (context) => OnboardingRepositoryRemote(client: context.read())),
  Provider(create: (context) => OnboardingRepositoryLocal()),
  Provider(create: (context) => OnboardingRepository(localRepo: context.read(), remoteRepo: context.read())),
  Provider(create: (context) => CategoryRepositoryRemote(client: context.read())),
  Provider(create: (context) => CategoryRepositoryLocal()),
  Provider(create: (context) => CategoryRepository(remoteRepo: context.read(),localRepo: context.read())),
];
