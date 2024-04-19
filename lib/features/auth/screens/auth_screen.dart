import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  AuthService authService = AuthService();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    print('clicked');

    AuthService().signUpUser(
        email: _emailController.text.toString(),
        password: _passwordController.text.toString(),
        name: _nameController.text.toString(),
        context: context);
  }

  void signInUser() {
    print('clicked');

    AuthService().signInUser(
        email: _emailController.text.toString(),
        password: _passwordController.text.toString(),
        context: context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              ListTile(
                title: Text('Create Account'),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signup)
                Column(
                  children: [
                    CustomTextField(
                        controller: _emailController, hintText: 'Email'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: _nameController, hintText: 'Name'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: _passwordController, hintText: 'Password'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: 'SignUp',
                        ontap: () {
                          // if (_signUpFormKey.currentState!.validate()) {
                          signUpUser();
                          // print(_emailController.text);
                          // }
                        }),
                  ],
                ),
              ListTile(
                title: Text('Sign-in'),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signin)
                Column(
                  children: [
                    CustomTextField(
                        controller: _emailController, hintText: 'Email'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: _passwordController, hintText: 'Password'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: 'SignIn',
                        ontap: () {
                          signInUser();
                        }),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
