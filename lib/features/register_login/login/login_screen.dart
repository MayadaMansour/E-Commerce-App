import 'package:e_commarce/features/register_login/login/cubit/login_cubit.dart';
import 'package:e_commarce/features/register_login/login/cubit/login_state.dart';
import 'package:e_commarce/features/register_login/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_resource/color_resources.dart';
import '../../../core/text_form/coustom_text_form.dart';
import '../../../domain/di/di.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const String routeName = "Login_screen";

  GlobalKey<FormState> formKey = GlobalKey();

  bool showPassword = true;
  final LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
        bloc: viewModel,
        listener: (BuildContext context, state) {
          if (state is LoadingLoginStates) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorResources.primaryColor,
                  ),
                );
              },
            );
          } else if (state is ErrorLoginStates) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Registration failed: ${state.failure.errorMsg}')),
            );
          } else if (state is SucessLoginStates) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Sucess')),
            );
          }
        },
        child: Scaffold(
          backgroundColor: ColorResources.primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  CoustomTextForm(
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "Please Enter your Email Address";
                      } else {
                        return null;
                      }
                    },
                    prefIcon: const Icon(Icons.email_outlined),
                    prefIconColor: ColorResources.primaryColor,
                    controller: viewModel.emailController,
                    passwordText: false,
                    label: "Email",
                    text: TextInputType.emailAddress,
                    museTextColor: Colors.white,
                    borderColor: ColorResources.primaryColor,
                    borderReduse: 15,
                    labelColor: Colors.grey,
                    userTextColor: Colors.black,
                    fillColor: ColorResources.white,
                    padding: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CoustomTextForm(
                    suffixIcone: IconButton(
                        onPressed: () {
                          // showPassword = !showPassword;
                          // setState(() {});
                        },
                        icon: showPassword
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined)),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "Please Enter your Password Address";
                      } else {
                        return null;
                      }
                    },
                    prefIcon: Icon(
                      Icons.lock_open_outlined,
                      color: ColorResources.primaryColor,
                    ),
                    prefIconColor: ColorResources.primaryColor,
                    controller: viewModel.passwordController,
                    passwordText: false,
                    label: "Password",
                    text: TextInputType.emailAddress,
                    museTextColor: Colors.white,
                    borderColor: ColorResources.primaryColor,
                    borderReduse: 15,
                    labelColor: Colors.grey,
                    userTextColor: Colors.black,
                    fillColor: ColorResources.white,
                    padding: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Don`t Have Account ?",
                      style: TextStyle(
                          color: ColorResources.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  defaultButton(
                    onTap: () {
                      viewModel.login();
                    },
                    text: 'LogIn',
                    bgColor: ColorResources.white,
                    textColor: ColorResources.primaryColor,
                    height: 60,
                    borderColor: ColorResources.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don`t Have Account ?",
                        style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              color: ColorResources.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
