import 'package:flutter/material.dart';
import 'supabase.dart';
import 'package:session2_try3/utlis.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Fotgot_pas.dart';
import 'Theme.dart';
import 'Signup.dart';
import 'Home.dart';
import 'core/CustomField.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://hawusttfcqcomedevycj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhhd3VzdHRmY3Fjb21lZGV2eWNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk3MzQwNDIsImV4cCI6MjAyNTMxMDA0Mn0.FaTVbgSsA1uzIp5miFfUdTH4-G7cnIL9CwGs0rOJ1Hs',
  );

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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                          'Welcome Back',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
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
                    CustomField(text: 'Email Address', hint: "***********@mail.com", controller: emailController),
                    CustomField(text: 'Password', hint: "**********", controller: passwordController),
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
                    GestureDetector(
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Forgot_Pas()));},
                      child: const Text(
                          'Forgot Password?',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                            color: Color.fromARGB(255, 5, 96, 250)
                        ),
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
                          onPressed: (){
                          signIn(
                              password: passwordController.text,
                              email: emailController.text,
                              onResponse: (AuthResponse response){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));},
                              onError: (String e){showError(context, e);}
                            );
                          },
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
          ),
        ],
      )
    );
  }
}