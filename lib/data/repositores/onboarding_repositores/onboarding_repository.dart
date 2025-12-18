import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

import '../../models/onboarding_models/allergic_model.dart';
import '../../models/onboarding_models/onboarding_model.dart';
import 'onboarding_repository_local.dart';
import 'onboarding_repository_remote.dart';

class OnboardingRepository {
  OnboardingRepository({
    required OnboardingRepositoryLocal localRepo,
    required OnboardingRepositoryRemote remoteRepo,
  }) : _localRepo = localRepo,
       _remoteRepo = remoteRepo;

  final OnboardingRepositoryLocal _localRepo;
  final OnboardingRepositoryRemote _remoteRepo;
  final bool ignoreCacheob = false, ignoreCacheCusine = false, ignoreCacheAllergic = false;

  Future<Result<List<OnboardingModel>>> getOnboarding() async {
    if (!ignoreCacheob) {
      final cachedOnboarding = await _localRepo.getOnboardingLocal();
      if (cachedOnboarding.isNotEmpty) return Result.ok(cachedOnboarding);
    }

    final result = await _remoteRepo.getOnboardingRemote();

    return result.fold(
      (error) => Result.error(error),
      (value) async {
        await _localRepo.saveOb(value);
        return Result.ok(value);
      },
    );
  }

  Future<Result<List<AllergicModel>>> getCuisine() async {
    if (!ignoreCacheCusine) {
      final cachedCuisine = await _localRepo.getCuisineLocal();
      if (cachedCuisine.isNotEmpty) return Result.ok(cachedCuisine);
    }

    final result = await _remoteRepo.getCuisineRemote();

    return result.fold(
      (error) => Result.error(error),
      (value) async {
        await _localRepo.saveCuisine(value);
        return Result.ok(value);
      },
    );
  }

  Future<Result<List<AllergicModel>>> getAllergic() async {
    if (!ignoreCacheAllergic) {
      final cachedAllergic = await _localRepo.getAllergicLocal();
      if (cachedAllergic.isNotEmpty) return Result.ok(cachedAllergic);
    }

    final result = await _remoteRepo.getAllergicRemote();

    return result.fold(
      (error) => Result.error(error),
      (value) async {
        await _localRepo.saveAllergic(value);
        return Result.ok(value);
      },
    );
  }
}
