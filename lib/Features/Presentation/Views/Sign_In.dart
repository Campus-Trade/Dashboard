import 'package:dashboard/Features/Data/models/login_request_model.dart';
import 'package:dashboard/Features/Presentation/Constants/Text_Style_Manger.dart';
import 'package:dashboard/Features/Presentation/Widgets/Sign_In&Forget_password/CustomText_form_field.dart';
import 'package:dashboard/Features/Presentation/Widgets/Sign_In&Forget_password/Custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/signin_cubit/signin_cubit.dart';
import 'forget_paswword.dart';
import 'home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController Emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
bool isObscure = true;
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninLoading) {
            showDialog(
              context: context,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          } else if (state is SigninFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is SigninSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 119,
                        vertical: 96,
                      ),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    CustomTextFormField(
                      hintText: "Mobile number or email",
                      controller: Emailcontroller,
                      obscureText: false,
                    ),
                    CustomTextFormField(
                      obscureText: isObscure,
                      hintText: "password",
                      controller: passwordcontroller,
                      icon:
                          isObscure
                              ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(Icons.visibility_off),
                              )
                              : IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(Icons.visibility),
                              ),
                    ),
                    InkWell(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyleManger.mediumStyle14,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPaswword(),
                          ),
                        );
                      },
                    ),
                    CustomButton(
                      text: "Sign In",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Sign In button pressed");
                          final password = passwordcontroller.text;
                          final loginModel = LoginRequestModel(
                            email: Emailcontroller.text,
                            password: password,
                          );
                          context.read<SigninCubit>().signin(loginModel);
                        } else {
                          print("Validation failed");
                        }
                      },
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        """                   By signing up, you accept our
Terms of Service, Privacy Policy, and use of Cookies""",
                        style: TextStyleManger.regularStyle12,
                      ),
                    ),
                    SizedBox(height: 20),
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
