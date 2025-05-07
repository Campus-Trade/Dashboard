import 'package:dashboard/Features/Auth/Data/models/reset_passowrd.dart';
import 'package:dashboard/Features/Auth/Presentation/Auth/Cubit/password_cubit.dart/passowrd_state.dart';
import 'package:dashboard/Features/Auth/Presentation/Auth/Cubit/password_cubit.dart/password_cubit.dart';
import 'package:dashboard/Features/Auth/Presentation/Auth/Views/Sign_In.dart';
import 'package:dashboard/Features/Auth/Presentation/Auth/Widgets/Sign_In&Forget_password/Custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Constants/Color_Manager.dart';
import '../Widgets/Sign_In&Forget_password/CustomText_form_field.dart';

class ForgetPaswword extends StatefulWidget {
  const ForgetPaswword({super.key});

  @override
  State<ForgetPaswword> createState() => _ForgetPaswwordState();
}

TextEditingController emailController = TextEditingController();
GlobalKey<FormState> _formState = GlobalKey<FormState>();

class _ForgetPaswwordState extends State<ForgetPaswword> {
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PasswordCubit, PassowrdState>(
        listener: (context, state) {
          if (state is PassowrdLoading) {
            showDialog(
              context: context,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          } else if (state is PassowrdFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is PassowrdSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: _formState,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.PrimaryColor,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: ColorManager.SecondaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 66,
                            right: 100,
                            top: 90,
                            bottom: 76,
                          ),
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Enter the email associated with your \n account.",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto_Condensed',
                          fontWeight: FontWeight.w700,
                          color: ColorManager.blackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      hintText: "Email",
                      controller: emailController,
                      obscureText: false,
                    ),
                    Spacer(),
                    CustomButton(
                      text: "Send",
                      onPressed: () {
                        if (_formState.currentState!.validate()) {
                          final resetPass = ResetPassowrdModel(
                            email: emailController.text,
                          );
                          context.read<PasswordCubit>().resetPassword(
                            resetPass,
                          );
                          // emailController.clear();
                        } else {
                          print("Validation failed");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
