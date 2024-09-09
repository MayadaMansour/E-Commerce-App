import 'package:e_commarce/domain/di/di.dart';
import 'package:e_commarce/features/register_login/register/cubit/register_cubit.dart';
import 'package:e_commarce/features/register_login/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_resource/color_resources.dart';
import '../../../core/text_form/coustom_text_form.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName = "register_screen";

  final GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = true;
  final RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (BuildContext context, state) {
        if (state is LoadingRegisterState) {
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
        } else if (state is ErrorRegisterState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration failed: ${state.failure.errorMsg}')),
          );
        } else if (state is SucessRegisterState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Sucess')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorResources.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CoustomTextForm(
                      controller: viewModel.nameController,
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field your name";
                        }
                        return null;
                      },
                      prefIcon: const Icon(Icons.perm_identity_sharp),
                      prefIconColor: ColorResources.primaryColor,
                      passwordText: false,
                      label: "Your Name",
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
                      height: 25,
                    ),
                    CoustomTextForm(
                      controller: viewModel.phoneController,
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field your Phone";
                        }
                        return null;
                      },
                      prefIcon: const Icon(Icons.phone_iphone_rounded),
                      prefIconColor: ColorResources.primaryColor,
                      passwordText: false,
                      label: "Your Phone",
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
                      height: 25,
                    ),
                    CoustomTextForm(
                      controller: viewModel.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "field your Email";
                        }
                        return null;
                      },
                      prefIcon: const Icon(Icons.email_outlined),
                      prefIconColor: ColorResources.primaryColor,
                      passwordText: false,
                      label: "Your Email",
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
                      height: 25,
                    ),
                    CoustomTextForm(
                        suffixIcone: IconButton(
                            onPressed: () {
                              // setState(() {
                              //   showPassword = !showPassword;
                              // });
                            },
                            icon: showPassword
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined)),
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "Please re-enter your Password";
                          } else if (data !=
                              viewModel.passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        prefIcon: Icon(
                          Icons.lock_open_outlined,
                          color: ColorResources.primaryColor,
                        ),
                        prefIconColor: ColorResources.primaryColor,
                        controller: viewModel.passwordController,
                        passwordText: showPassword,
                        label: "Password",
                        text: TextInputType.emailAddress,
                        museTextColor: Colors.white,
                        borderColor: ColorResources.primaryColor,
                        borderReduse: 15,
                        labelColor: Colors.grey,
                        userTextColor: Colors.black,
                        fillColor: ColorResources.white,
                        padding: 10,
                        maxLineTex: 1),
                    const SizedBox(
                      height: 25,
                    ),
                    CoustomTextForm(
                        suffixIcone: IconButton(
                            onPressed: () {
                              // setState(() {
                              //   showPassword = !showPassword;
                              // });
                            },
                            icon: showPassword
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined)),
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "Please re-enter your Password";
                          } else {
                            return null;
                          }
                        },
                        prefIcon: Icon(
                          Icons.lock_open_outlined,
                          color: ColorResources.primaryColor,
                        ),
                        prefIconColor: ColorResources.primaryColor,
                        controller: viewModel.rePasswordController,
                        passwordText: showPassword,
                        label: "Re-enter Password",
                        text: TextInputType.emailAddress,
                        museTextColor: Colors.white,
                        borderColor: ColorResources.primaryColor,
                        borderReduse: 15,
                        labelColor: Colors.grey,
                        userTextColor: Colors.black,
                        fillColor: ColorResources.white,
                        padding: 10,
                        maxLineTex: 1),
                    const SizedBox(
                      height: 50,
                    ),
                    defaultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          viewModel.register();
                        }
                      },
                      text: 'Register',
                      bgColor: ColorResources.white,
                      textColor: ColorResources.primaryColor,
                      height: 60,
                      borderColor: ColorResources.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You Have an Account?",
                          style: TextStyle(
                              color: ColorResources.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: ColorResources.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
