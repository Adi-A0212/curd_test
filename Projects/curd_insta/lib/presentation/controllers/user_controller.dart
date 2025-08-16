import 'package:get/get.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user_profile_usecase.dart';

class UserController extends GetxController {
  final GetUserProfileUseCase getUserProfileUseCase;

  var user = Rx<User?>(null);
  var isLoading = false.obs;

  UserController(this.getUserProfileUseCase);

  Future<void> loadUserProfile({bool refresh = false}) async {
    isLoading.value = true;
    try {
      user.value = await getUserProfileUseCase(refresh: refresh);
    } finally {
      isLoading.value = false;
    }
  }
}
