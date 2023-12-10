import 'package:authentication/component/custom_button.dart';
import 'package:authentication/component/custom_logo.dart';
import 'package:authentication/component/text_form_field.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
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
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Login to continue using the app',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const Text(
                'Email',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "email can't be empty";
                    }
                  },
                  hintText: 'enter your email',
                  myController: emailController),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  validator: (value) {
                    if (value!.length < 8) {
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
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordCOntroller.text);
                        if (credential.user!.emailVerified) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          Fluttertoast.showToast(
                            msg: "please verify your email",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.deepPurple,
                            textColor: Colors.white,
                            fontSize: 16.0);
                            print('after toast');
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('user not found');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: 'Warning',
                            desc: 'The account already exists for that email',
                          )..show();
                        } else if (e.code == 'wrong-password') {
                          print('wrong password');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'Wrong password provided for that user',
                          )..show();
                        }
                      }
                    } else {}
                  },
                  buttonTitle: 'Login'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Or login with',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/4.png',
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account ? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: const Text(
                        'Sign up',
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
