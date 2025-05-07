import 'package:dashboard/Features/Home/Data/repo/repo_product_impl.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Auth/Data/repos/auth_repo_impl.dart';
import '../../Features/Auth/domain/repos/auth_repo.dart';
import '../../Features/Home/Data/repo/repo_product_state.dart';
import '../../Features/Home/Presentation/cubit/Approved_products_count.dart';
import 'firebase_auth_services.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
  getIt.registerSingleton<RepoProductImpl>(RepoProductImpl());
  getIt.registerSingleton<RepoProductStateImpl>(RepoProductStateImpl());
  getIt.registerSingleton<ApprovedProductsCountProvider>(
    ApprovedProductsCountProvider(getIt<RepoProductImpl>()),
  );
}
