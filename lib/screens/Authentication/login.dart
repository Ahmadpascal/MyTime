import 'package:mytime/widgets/textfield.dart';
import 'package:mytime/screens/Authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/AuthBloc/auth_bloc.dart';
import '../../widgets/button.dart';
import '../home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is Authenticated){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
    }else if(state is ErrorState){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Hero(
                        tag: "image",
                        child: Image.asset("assets/images/logo.png")),
                  ),
                  const ListTile(
                      contentPadding: EdgeInsets.only(left: 15),
                      title: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromARGB(224, 75, 75, 75)),
                      ),
                    ),
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
                  state is Loading? const CircularProgressIndicator() : Button(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                            LoginEvent(username.text, password.text));
                      }
                    },
                    label: "LOGIN",
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
                          },
                          child: const Text("Register",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),))
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
