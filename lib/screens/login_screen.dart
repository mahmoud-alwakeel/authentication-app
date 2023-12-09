import 'package:authentication/component/custom_logo.dart';
import 'package:authentication/component/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: GestureDetector(
        onTap: (){
          Focus.of(context).unfocus();
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const CustomLogo(),
              const SizedBox(height: 40,),
              const Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              const Text('Login to continue using the app', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
              const Text('Email', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
              CustomTextFormField(hintText: 'enter your email', myController: emailController),
              const SizedBox(height: 30,),
              const Text('Password', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
              CustomTextFormField(hintText: 'enter your password', myController: passwordCOntroller),
              const SizedBox(height: 40,),
              MaterialButton(
                onPressed: (){}, 
                color: Colors.deepPurple, 
                child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                ),
                const SizedBox(height: 20,),
                const Text('Or login with',textAlign: TextAlign.center,),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){},
                  child: Image.asset('assets/images/4.png', height: 50, width: 50,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ? '),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: const Text('Sign up', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w700),))
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}