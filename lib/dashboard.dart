import 'package:dashboard/Features/Auth/Presentation/Auth/Cubit/password_cubit.dart/password_cubit.dart';
import 'package:dashboard/Features/Auth/Presentation/Auth/Views/Sign_In.dart';
import 'package:dashboard/Features/Home/Data/repo/repo_product_state.dart';
import 'package:dashboard/Features/Home/Presentation/cubit/change_product_cubit.dart';
import 'package:dashboard/Features/Home/Presentation/cubit/get_pending_product_cubit.dart';
import 'package:dashboard/Features/Home/Presentation/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Core/services/get_it_sevice.dart';
import 'Features/Auth/Presentation/Auth/Cubit/signin_cubit/signin_cubit.dart';
import 'Features/Auth/domain/repos/auth_repo.dart';
import 'Features/Home/Data/repo/repo_product_impl.dart';
import 'Features/Home/Presentation/cubit/Approved_products_count.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<ApprovedProductsCountProvider>(
          create:
              (context) =>
                  getIt<
                    ApprovedProductsCountProvider
                  >(), // استخدم DI بدلاً من الإنشاء المباشر
        ),
        BlocProvider(create: (context) => SigninCubit(getIt<AuthRepo>())),
        BlocProvider(create: (context) => PasswordCubit(getIt<AuthRepo>())),
        BlocProvider(
          create:
              (context) =>
                  PendingProductCubit(getIt<RepoProductImpl>())
                    ..fetchPendingProducts(),
        ),
        BlocProvider(
          create:
              (context) => ChangeProductCubit(getIt<RepoProductStateImpl>()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              FirebaseAuth.instance.currentUser == null
                  ? SignIn()
                  : HomeScreen(),
        ),
      ),
    );
  }
}
