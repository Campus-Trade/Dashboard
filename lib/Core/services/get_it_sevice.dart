import 'package:get_it/get_it.dart';

import '../../Features/Data/repos/auth_repo_impl.dart';
import '../../Features/domain/repos/auth_repo.dart';
import 'firebase_auth_services.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
}
