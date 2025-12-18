import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/features/Community/pages/community_page.dart';
import 'package:recipe_app_ui_kit_food/features/common/pages/notifications_page.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/pages/c_a_n_password.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/pages/forgot_email.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/pages/o_t_p_screen.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/pages/login_page.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/pages/sign_up_page.dart';
import 'package:recipe_app_ui_kit_food/features/my_recipes/pages/my_recipes_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/cooking_level_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/cuisines_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/on_boarding.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/welcome_page.dart';
import 'package:recipe_app_ui_kit_food/features/profile/pages/profile_following_followers_page.dart';
import 'package:recipe_app_ui_kit_food/features/profile/pages/profile_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/categoty_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_detail_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_list_page.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/pages/reviews_page.dart';
import 'package:recipe_app_ui_kit_food/features/settings/pages/language_page.dart';
import 'package:recipe_app_ui_kit_food/features/settings/pages/setting_notification_page.dart';
import 'package:recipe_app_ui_kit_food/features/settings/pages/settings_page.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/pages/top_chef_detail_page.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/pages/top_chef_page.dart';
import 'package:recipe_app_ui_kit_food/features/trending_recipes/pages/trending_recipes_page.dart';

import '../../features/add_recipe/pages/create_recipe_page.dart';
import '../../features/add_recipe/pages/edit_recipe_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/splash_page.dart';
import '../../features/logi_sign_up/pages/complete_your_profile_page.dart';
import '../../features/on_boarding/pages/allergic_page.dart';
import '../../features/profile/pages/edit_profile_page.dart';
import '../../features/profile/pages/share_profile_page.dart';
import '../../features/reviews/pages/reviews_add_page.dart';
import '../../features/settings/pages/privacy_policy_page.dart';
import '../../features/settings/pages/setting_help_center_page.dart';

final router = GoRouter(
  initialLocation: Routers.splash,

  routes: <RouteBase>[
    GoRoute(
      path: Routers.splash,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: Routers.home,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routers.myRecipe,
      builder: (context, state) => MyRecipesPage(),
    ),
    GoRoute(
      path: Routers.profile,
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: Routers.addRecipe,
      builder: (context, state) => CreateRecipePage(),
    ),
    GoRoute(
      path: Routers.editRecipe,
      builder: (context, state) => EditRecipePage(
        retcep: (state.extra as Map)["edit-retcep"],
      ),
    ),
    GoRoute(
      path: Routers.editProfile,
      builder: (context, state) => EditProfilePage(
        user: (state.extra as Map)["profile"],
      ),
    ),
    GoRoute(
      path: Routers.profileFollowingFollowers,
      builder: (context, state) => ProfileFollowingFollowersPage(
        user: (state.extra as Map)["vm"],
      ),
    ),
    GoRoute(
      path: Routers.shareProfile,
      builder: (context, state) => ShareProfilePage(
        user: (state.extra as Map)["profile"],
      ),
    ),
    GoRoute(
      path: Routers.settings,
      builder: (context, state) => SettingsPage(),
    ),
    GoRoute(
      path: Routers.settingNotification,
      builder: (context, state) => SettingNotificationPage(),
    ),
    GoRoute(
      path: Routers.settingHelpCenter,
      builder: (context, state) => SettingHelpCenterPage(),
    ),
    GoRoute(
      path: Routers.settingPrivacyPolicy,
      builder: (context, state) => PrivacyPolicyPage(),
    ),

    GoRoute(
      path: Routers.settingLanguage,
      builder: (context, state) => LanguagePage(),
    ),
    GoRoute(
      path: Routers.topChefs,
      builder: (context, state) => TopChefPage(),
    ),
    GoRoute(
      path: Routers.topChefDetail,
      builder: (context, state) => TopChefDetailPage(id: (state.extra as Map)["id"]),
    ),
    GoRoute(
      path: Routers.trendingRecipes,
      builder: (context, state) => TrendingRecipesPage(),
    ),
    GoRoute(
      path: Routers.forgotPassword,
      builder: (context, state) => ForgotEmail(),
    ),
    GoRoute(
      path: Routers.otpScreen,
      builder: (context, state) => OtpScreen(),
    ),
    GoRoute(
      path: Routers.canPassword,
      builder: (context, state) => CANPassword(),
    ),
    GoRoute(
      path: Routers.login,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routers.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routers.createProfile,
      builder: (context, state) => CompleteYourProfilePage(),
    ),
    GoRoute(
      path: Routers.onboarding,
      builder: (context, state) => OnBoarding(),
    ),
    GoRoute(
      path: Routers.welcome,
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(
      path: Routers.onBoardingCookingLevelPage,
      builder: (context, state) => CookingLevelPage(),
    ),
    GoRoute(
      path: Routers.onBoardingPreferencesPage,
      builder: (context, state) => CuisinesPage(),
    ),
    GoRoute(
      path: Routers.onBoardingAllergicPage,
      builder: (context, state) => AllergicPage(),
    ),
    GoRoute(
      path: Routers.categoryPage,
      builder: (context, state) => CategoryPage(),
    ),
    GoRoute(
      path: Routers.recipeListPage,
      builder: (context, state) => RecipeListPage(
        appBarTitle: (state.extra as Map)["appBarTitle"],
        categoryId: (state.extra as Map)["categoryId"],
      ),
    ),
    GoRoute(
      path: Routers.recipeDetailPage,
      builder: (context, state) => RecipeDetailPage(
        title: (state.extra as Map)["title"],
        categoryId: (state.extra as Map)["categoryId"],
        editAppbar: (state.extra as Map)["editAppbar"],
      ),
    ),
    GoRoute(
      path: Routers.reviewsPage,
      builder: (context, state) => ReviewsPage(
        categoriyId: (state.extra as Map)["categoriyId"],
      ),
    ),
    GoRoute(
      path: Routers.reviewsAddPage,
      builder: (context, state) => ReviewsAddPage(
        categoriyId: (state.extra as Map)["categoriyId"],
      ),
    ),
    GoRoute(
      path: Routers.community,
      builder: (context, state) => CommunityPage(),
    ),
    GoRoute(
      path: Routers.notifications,
      builder: (context, state) => NotificationsPage(),
    ),
  ],
);
