import '../../../core/client.dart';
import '../../../core/utils/result.dart';
import '../../models/onboarding_models/allergic_model.dart';
import '../../models/onboarding_models/onboarding_model.dart';

class OnboardingRepositoryRemote {
  OnboardingRepositoryRemote({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  Future<Result<List<OnboardingModel>>> getOnboardingRemote() async {
    var response = await _client.get<List>("/onboarding/list");

    return response.fold(
      (error) => Result.error(error),
      (value) async {
        return Result.ok(value.map((x) => OnboardingModel.fromJson(x)).toList());
      },
    );
  }

  Future<Result<List<AllergicModel>>> getCuisineRemote() async {
    final response = await _client.get<List>("/cuisines/list");

    return response.fold(
      (error) => Result.error(error),
      (value) async {
        return Result.ok(value.map((x) => AllergicModel.fromJson(x)).toList());
      },
    );
  }

  Future<Result<List<AllergicModel>>> getAllergicRemote() async {
      final response = await _client.get<List>("/allergic/list");

    return response.fold(
      (error) => Result.error(error),
      (value) async {
        return Result.ok(value.map((x) => AllergicModel.fromJson(x)).toList());
      },
    );
  }
}
