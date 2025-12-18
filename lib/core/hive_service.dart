import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../data/models/category_models/category_model.dart';
import '../data/models/onboarding_models/allergic_model.dart';
import '../data/models/onboarding_models/onboarding_model.dart';
import '../data/models/recipe_models/recipes_model.dart';
import '../data/models/top_chef_models/top_chef_model.dart';
import '../data/models/user/profile_model.dart';


Future<void> initHiveStorage() async {
  final dir = await getTemporaryDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(CategoryModelAdapder());
  await Hive.openBox<CategoryModel>("category");
  Hive.registerAdapter(OnboardingModelAdapder());
  await Hive.openBox<OnboardingModel>("onboarding");
  Hive.registerAdapter(AllergicModelAdapder());
  await Hive.openBox<AllergicModel>("allergic");
  await Hive.openBox<AllergicModel>("cuisine");
  Hive.registerAdapter(ProfileModelAdapdet());
  await Hive.openBox<ProfileModel>("profile");
  Hive.registerAdapter(TopChefModelAdapder());
  await Hive.openBox<TopChefModel>("topchef");
  await Hive.openBox<TopChefModel>("followers");
  await Hive.openBox<TopChefModel>("followings");
  Hive.registerAdapter(RecipesModelAdapder());
  await Hive.openBox<RecipesModel>("resipes");
}

