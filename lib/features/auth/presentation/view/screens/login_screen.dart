import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_dialogs.dart';
import 'package:flutter_application_1/core/widgets/custome_form_field.dart';
import 'package:flutter_application_1/core/widgets/custome_material_button.dart';
import 'package:flutter_application_1/features/auth/presentation/view/widgets/auth_navigator.dart';
import 'package:flutter_application_1/features/auth/presentation/view_model/cubit/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email;
  late TextEditingController password;
  late LoginCubit _cubit;

  @override
  void initState() {
    super.initState();
    email = TextEditingController(text: "test@gmail.com");
    password = TextEditingController(text: "Boody@123");
    _cubit = LoginCubit();
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
      body: BlocListener<LoginCubit, LoginState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is LoginLoading) {
            AppDialog.showLoading(context);
          }

          if (state is LoginError) {
            Navigator.of(context).pop();
            AppDialog.showErorr(context, _cubit.messageError ?? "");
          }
          if (state is LoginSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(AppRoutes.appSection);
          }
        },
        child: SingleChildScrollView(
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
                onPressed: () async {
                  await _cubit.login(email.text, password.text);
                },
                text: "Login",
                color: AppColors.primaryOrange,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AuthNavigatorWidget(
        text: "Don't have an account? ",
        actionText: "Sign Up",
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
