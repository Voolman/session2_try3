import 'package:flutter/material.dart';
import 'package:session2_try3/utlis.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase.dart';
import 'core/CustomField.dart';
import 'Home.dart';
import 'Login.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool enableButton = false;

  void isValid(){
    setState(() {
      enableButton = emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          passwordConfirmController.text.isNotEmpty &&
          nameController.text.isNotEmpty &&
          phoneController.text.length == 16 &&
          passwordController.text == passwordConfirmController.text &&
          isChecked;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 19, right: 19, top: 78),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Create an account',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Complete the sign up process to get started',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 9),
                    CustomField(
                        text: 'Full name',
                        hint: 'Ivanov Ivan',
                        controller: nameController,
                      onChanged: (newText){
                          isValid();
                          },
                    ),
                    CustomField(
                      text: 'Phone Number',
                      hint: '+7(999)999-99-99',
                      controller: phoneController,
                      onChanged: (newText){
                        isValid();
                      }
                    ),
                    CustomField(
                        text: 'Email Address',
                        hint: '***********@mail.com',
                        controller: emailController,
                        onChanged: (newText) {
                          isValid();
                        }
                    ),
                    CustomField(
                        text: 'Password',
                        hint: '**********',
                        controller: passwordController,
                        onChanged: (newText) {
                          isValid();
                        }
                    ),
                    CustomField(
                        text: 'Confirm Password',
                        hint: '**********',
                        controller: passwordConfirmController,
                        onChanged: (newText) {
                          isValid();
                        }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 12, right: 19),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            side: const BorderSide(
                                color: Color.fromARGB(255, 167, 167, 167),
                                width: 1
                            ),
                            value: isChecked,
                            onChanged: (value){
                              setState(() {
                                isChecked = value!;
                              });
                            }
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10),
                          child: SizedBox(
                            width: 317,
                            child: RichText(
                              maxLines: 2,
                                softWrap: true,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'By ticking this box, you agree to our ',
                                      style: Theme.of(context).textTheme.titleSmall
                                    ),
                                    const TextSpan(
                                      text: 'Terms and conditions and private policy',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                          color: Color.fromARGB(255, 235, 188, 46)
                                      )
                                    )
                                  ]
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19, right: 19, top: 45),
                child: Column(
                  children: [
                    SizedBox(
                      height: 46,
                      width: 352,
                      child: FilledButton(
                          style: Theme.of(context).filledButtonTheme.style,
                          onPressed: (enableButton) ? () async {
                            await signUp(
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                name: nameController.text,
                                onResponse: (AuthResponse response){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
                                },
                                onError: (String e){
                                  showError(context, e);
                                }
                            );
                            } : null,
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                                color: Color.fromARGB(255, 255, 255, 255)
                            ),
                          )
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
                      },
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Already have an account?', style:
                              Theme.of(context).textTheme.titleMedium
                              ),
                              const TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto",
                                    color: Color.fromARGB(255, 5, 96, 250)
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}