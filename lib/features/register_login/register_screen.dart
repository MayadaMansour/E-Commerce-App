import 'package:flutter/material.dart';
import '../../core/color_resource/color_resources.dart';
import '../../core/text_form/coustom_text_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = "register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      controller: nameController,
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
                      controller: phoneController,
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
                      controller: emailController,
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
                            showPassword = !showPassword;
                            setState(() {});
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
                      controller: emailController,
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
                      height: 50,
                    ),
                    defaultButton(
                      onTap: () {},
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
                          "You Have Account ?",
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
