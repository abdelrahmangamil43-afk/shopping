import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_dialogs.dart';
import 'package:flutter_application_1/core/widgets/custome_form_field.dart';
import 'package:flutter_application_1/core/widgets/custome_material_button.dart';
import 'package:flutter_application_1/features/auth/data/models/register_request_model.dart';
import 'package:flutter_application_1/features/auth/presentation/view/widgets/auth_navigator.dart';
import 'package:flutter_application_1/features/auth/presentation/view_model/cubit/register/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController userName;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late RegisterCubit cubit;

  @override
  void initState() {
    super.initState();
    userName = TextEditingController(text: "Abdelrahman");
    phone = TextEditingController(text: "01004172756");
    email = TextEditingController(text: "test@gmail.com");
    password = TextEditingController(text: "Boody@123");
    confirmPassword = TextEditingController(text: "Boody@123");
    cubit = RegisterCubit();
  }

  @override
  void dispose() {
    userName.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up")),
      body: BlocListener<RegisterCubit, RegisterState>(
        bloc: cubit,
        listener: (context, state) {
          bloc:
          cubit;
          if (state is RegisterLoading) {
            AppDialog.showLoading(context);
          }
          if (state is RegisterSuccess) {
            Navigator.of(context).pop(); // يقفل الـ loading dialog
            Navigator.of(context).pushNamed(AppRoutes.login);
          }
          if (state is RegisterError) {
            Navigator.of(context).pop(); // يقفل الـ loading dialog
            AppDialog.showErorr(
              context,
              cubit.messageError ?? "Error From cubit",
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormField(
                controller: userName,
                label: "UserName",
                hint: "Enter your username",
              ),
              CustomTextFormField(
                controller: phone,
                label: "Phone",
                hint: "Enter your phone number",
              ),
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
              CustomTextFormField(
                controller: confirmPassword,
                label: "ConfirmPassword",
                hint: "Enter your ConfirmPassword",
              ),
              CustomMaterialButton(
                onPressed: () async {
                  var request = RegisterRequestModel(
                    name: userName.text,
                    email: email.text,
                    phone: phone.text,
                    password: password.text,
                    confirmPassword: confirmPassword.text,
                  );
                  await cubit.register(request);
                },
                text: "Sign up",
                color: AppColors.primaryOrange,
              ),
            ],
          ),
        ),
      ),
      // Already have an account?
      floatingActionButton: AuthNavigatorWidget(
        text: "Already have an account?",
        actionText: "Login",
        onTap: () => Navigator.of(context).pushNamed(AppRoutes.login),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
