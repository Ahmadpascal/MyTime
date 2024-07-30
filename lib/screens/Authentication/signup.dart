import 'package:mytime/Bloc/AuthBloc/auth_bloc.dart';
import 'package:mytime/Models/users.dart';
import 'package:mytime/screens/Authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/button.dart';
import '../../widgets/textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessRegister) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 200,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      const ListTile( 
                        contentPadding: EdgeInsets.only(left: 10),
                        title: Text("Signup", style: TextStyle(fontSize: 23)),
                        subtitle: Text("Create new account"),
                      ),
                      InputField(
                          icon: Icons.person,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Full name is required";
                            }
                            return null;
                          },
                          controller: fullName,
                          hintText: "Full name"),
                      InputField(
                          icon: Icons.email,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                          controller: email,
                          hintText: "Email"),
                      InputField(
                          icon: Icons.account_circle_rounded,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Username is required";
                            }
                            return null;
                          },
                          controller: username,
                          hintText: "Username"),
                      InputField(
                          icon: Icons.lock,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          controller: password,
                          hintText: "Password"),
                      InputField(
                          icon: Icons.lock,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Re-enter password is required";
                            } else if (password.text != confirmPassword.text) {
                              return "Passwords don't match";
                            }
                            return null;
                          },
                          controller: confirmPassword,
                          hintText: "Re-enter password"),
                      state is Loading
                          ? const CircularProgressIndicator()
                          : Button(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<AuthBloc>()
                                      .add(RegisterEvent(Users(
                                        fullName: fullName.text,
                                        email: email.text,
                                        username: username.text,
                                        password: password.text,
                                      )));
                                }
                              },
                              label: "REGISTER",
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
