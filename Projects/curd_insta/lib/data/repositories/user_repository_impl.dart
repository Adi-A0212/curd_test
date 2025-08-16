import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote_api.dart';
import '../datasources/user_local_db.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteApi remoteApi;
  // final UserLocalDb localDb;

  UserRepositoryImpl({required this.remoteApi,
    // required this.localDb
  });

  @override
  Future<User> getUserProfile({bool refresh = false}) async {
    // if (refresh) {
      final userModel = await remoteApi.fetchUserProfile();
      // await localDb.saveUser(userModel);

      return User(
        id: userModel.id,
        username: userModel.username,
        profileImageUrl: userModel.profileImageUrl,
        bio: userModel.bio,
      );
    // } else {
      // final cachedUser = await localDb.getUser();
      // if (cachedUser != null) {
      //   return User(
      //     id: cachedUser.id,
      //     username: cachedUser.username,
      //     profileImageUrl: cachedUser.profileImageUrl,
      //     bio: cachedUser.bio,
      //   );
      // }

      // final userModel = await remoteApi.fetchUserProfile();
      // await localDb.saveUser(userModel);

      // return User(
      //   id: userModel.id,
      //   username: userModel.username,
      //   profileImageUrl: userModel.profileImageUrl,
      //   bio: userModel.bio,
      // );
    // }
  }
}
