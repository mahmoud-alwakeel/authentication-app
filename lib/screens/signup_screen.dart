import 'package:authentication/component/custom_button.dart';
import 'package:authentication/component/custom_logo.dart';
import 'package:authentication/component/text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();

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
      body: GestureDetector(
        onTap: () {
          Focus.of(context).unfocus();
        },
        child: Container(
          padding: const EdgeInsets.all(16),
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
                  hintText: 'enter your username',
                  myController: emailController),
              const Text(
                'Email',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
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
                  hintText: 'enter your password',
                  myController: passwordCOntroller),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'confirm Password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  hintText: 'confirm your password',
                  myController: passwordCOntroller),
              const SizedBox(
                height: 40,
              ),
              CustomButton(onPressed: () {}, buttonTitle: 'Sign up'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/register');
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
