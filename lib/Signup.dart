import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
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
                const CustomField(text: 'Full name', hint: 'Ivanov Ivan'),
                const CustomField(text: 'Phone Number', hint: '+7(999)999-99-99'),
                const CustomField(text: 'Email Address', hint: '***********@mail.com'),
                const CustomField(text: 'Password', hint: '**********'),
                const CustomField(text: 'Confirm Password', hint: '**********'),
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
                      onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));},
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
    );
  }
}