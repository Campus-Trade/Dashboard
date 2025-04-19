import 'package:dashboard/Features/Presentation/Constants/Text_Style_Manger.dart';
import 'package:dashboard/Features/Presentation/Widgets/Sign_In&Forget_password/Custom_Button.dart';
import 'package:flutter/material.dart';

import '../Constants/Color_Manager.dart';
import '../Widgets/Sign_In&Forget_password/CustomText_form_field.dart';

class ForgetPaswword extends StatefulWidget {
  const ForgetPaswword({super.key});

  @override
  State<ForgetPaswword> createState() => _ForgetPaswwordState();
}

TextEditingController emailController = TextEditingController();

class _ForgetPaswwordState extends State<ForgetPaswword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.primaryColor,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorManager.secondaryColor,
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
              CustomButton(text: "Send", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
