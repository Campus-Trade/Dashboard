import 'package:dashboard/Features/Presentation/Views/Sign_In.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Core/services/get_it_sevice.dart';
import 'Features/Presentation/Cubit/signin_cubit/signin_cubit.dart';
import 'Features/domain/repos/auth_repo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SignIn()),
    );
  }
}
