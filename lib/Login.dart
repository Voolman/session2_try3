import 'package:flutter/material.dart';
import 'Theme.dart';
import 'Signup.dart';
import 'Home.dart';
import 'core/CustomField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Fill in your email and password to continue',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                const SizedBox(height: 9),
                const CustomField(text: 'Email Address', hint: "***********@mail.com"),
                const CustomField(text: 'Password', hint: "**********"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 11, right: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      'Remember password',
                      style: Theme.of(context).textTheme.titleSmall
                    )
                  ],
                ),
                const Text(
                    'Forgot Password?',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(255, 5, 96, 250)
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19, right: 19, top: 353),
            child: Column(
              children: [
                SizedBox(
                  height: 46,
                  width: 352,
                  child: FilledButton(
                    style: Theme.of(context).filledButtonTheme.style,
                      onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));},
                      child: const Text(
                        'Login',
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Not have account?', style:
                        Theme.of(context).textTheme.titleMedium
                        ),
                        const TextSpan(
                          text: 'Sign Up',
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
      )
    );
  }
}