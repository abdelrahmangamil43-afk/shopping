import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/widgets/custome_form_field.dart';
import 'package:flutter_application_1/core/widgets/custome_material_button.dart';
import 'package:flutter_application_1/features/auth/presentation/view/widgets/auth_navigator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            CustomTextFormField(
              controller: email,
              label: "Email",
              hint: "Enter your Email",
            ),
            CustomTextFormField(
              controller: password,
              label: "Password",
              hint: "Enter your Password",
            ),

            CustomMaterialButton(
              onPressed: () {},
              text: "Login",
              color: AppColors.primaryOrange,
            ),
          ],
        ),
      ),
      floatingActionButton: AuthNavigatorWidget(
        text: "Don't have an account? ",
        actionText: "Sign Up",
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
