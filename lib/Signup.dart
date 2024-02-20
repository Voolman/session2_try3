import 'package:flutter/material.dart';
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
      body: Padding(
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
            const SizedBox(height: 33),
            Row(
              children: [
                Text(
                    "Full name",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 167, 167, 167),
                          width: 1
                      )
                  ),
                  contentPadding: const EdgeInsets.only(top: 14, bottom: 14,left: 10),
                  label: const Text(
                      "Ivanov Ivan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                          color: Color.fromARGB(255, 167, 167, 167)
                      )
                  )
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                    "Phone Number",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 167, 167, 167),
                            width: 1
                        )
                    ),
                    contentPadding: const EdgeInsets.only(top: 14, bottom: 14,left: 10),
                    label: const Text(
                        "+7(999)999-99-99",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                            color: Color.fromARGB(255, 167, 167, 167)
                        )
                    )
                )
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                    "Email Address",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 167, 167, 167),
                          width: 1
                      )
                  ),
                  contentPadding: const EdgeInsets.only(top: 14, bottom: 14,left: 10),
                  label: const Text(
                      "***********@mail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                          color: Color.fromARGB(255, 167, 167, 167)
                      )
                  )
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                    "Password",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 167, 167, 167),
                            width: 1
                        )
                    ),
                    contentPadding: const EdgeInsets.only(top: 14, bottom: 14,left: 10),
                    label: const Text(
                        "**********",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                            color: Color.fromARGB(255, 167, 167, 167)
                        )
                    )
                )
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                    "Confirm Password",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 167, 167, 167),
                            width: 1
                        )
                    ),
                    contentPadding: const EdgeInsets.only(top: 14, bottom: 14,left: 10),
                    label: const Text(
                        "**********",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                            color: Color.fromARGB(255, 167, 167, 167)
                        )
                    )
                )
            ),
            const SizedBox(height: 12),
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
                            TextSpan(
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
            const SizedBox(height: 45),
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
            )
          ],
        ),
      ),
    );
  }
}