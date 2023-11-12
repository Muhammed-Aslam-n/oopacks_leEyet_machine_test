import 'package:flutter/material.dart';
import 'package:oopacks/providers/auth_provider.dart';
import 'package:oopacks/utils/extensions_and_validators.dart';
import 'package:oopacks/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

import '../../models/request_models.dart';
import '../feature_screens/home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: size.height * 0.25,
                  alignment: Alignment.center,
                  child: PoppinsText(
                    data: 'OOPACKS',
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                        ),
                        color: Theme.of(context).colorScheme.secondary),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        PoppinsText(
                          data: 'Sign Up',
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: TextFormWidget(
                                textFormTitle: 'First name',
                                hintText: hintFirstName,
                                controller: firstnameController,
                                inputType: TextInputType.text,
                                obscureText: false,validator: (input){
                                  if(input!=null && input.isNotEmpty){
                                    if(input.length < 3){
                                      return 'Invalid name';
                                    }
                                  }
                                  return null;
                              },
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Expanded(
                              child: TextFormWidget(
                                textFormTitle: 'Last name',
                                hintText: hintLastName,
                                controller: lastnameController,
                                inputType: TextInputType.text,
                                obscureText: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormWidget(
                          textFormTitle: 'Email',
                          hintText: hintEmail,
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (input) => input!.validateEmail(input),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormWidget(
                          textFormTitle: 'Password',
                          hintText: hintPassword,
                          controller: passwordController,
                          inputType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) => value!.validatePassword(value),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        ElevatedButton(
                          onPressed: handleLogin,
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                            Size(size.width * 0.85, size.width * 0.14),
                          ),
                          child: PoppinsText(
                            data: 'Sign Up',
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PoppinsText(
                        data: "Already have an account",
                        color: Theme.of(context).primaryColor,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const PoppinsText(
                          data: 'Sign In',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleLogin() async {
    if (_formKey.currentState!.validate()) {
      debugPrint('TextFieldsAreValidated SUCCESSFULLY');
      AuthProvider authProvider =
      Provider.of<AuthProvider>(context, listen: false);

      // Example Login
      RegistrationRequest registrationRequest = RegistrationRequest(
        firstName: firstnameController.text,
        lastName: lastnameController.text,
        emailOrPhoneNumber: emailController.text,
        password: passwordController.text,
      );
      bool registerSuccess =
      await authProvider.authResisterUser(registrationRequest: registrationRequest);
      debugPrint('LoginSuccessHandler $registerSuccess');
      if (registerSuccess) {
        // Navigate to home page or perform other actions upon successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        setState(() {
          // emailController.clear();
          // passwordController.clear();
          _formKey.currentState?.reset();

        });
        showCustomSnackBar(context: context,message: 'Authentication Failed',success: false,textColor: Colors.white,duration: Duration(seconds: 2));
      }
    }

  }
}
