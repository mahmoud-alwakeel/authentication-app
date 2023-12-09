import 'package:authentication/component/custom_button.dart';
import 'package:authentication/component/custom_logo.dart';
import 'package:authentication/component/text_form_field.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formState,
          child: ListView(
            children: [
              const CustomLogo(),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Sign up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Sign up to start using the app',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Username',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == "") {
                    return "username can't be empty";
                  }
                },
                  hintText: 'enter your username',
                  myController: usernameController),
              const Text(
                'Email',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == "") {
                    return "email can't be empty";
                  }
                },
                  hintText: 'enter your email', myController: emailController),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                validator: (value){
                    if(value!.length < 8) {
                      return "password can't be less than 8 characters";
                    }
                  },
                  hintText: 'enter your password',
                  myController: passwordCOntroller),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                  onPressed: () async {
                    if (formState.currentState!.validate()) {
                      try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordCOntroller.text,
                      );
                      Navigator.pushReplacementNamed(context, '/home');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email');
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Warning',
                          desc: 'The account already exists for that email',
                        ).show();
                      }
                    } catch (e) {
                      print(e);
                    }
                    }
                  },
                  buttonTitle: 'Sign up'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
