import 'package:flutter/material.dart';
import 'package:session2_try3/Login.dart';
import 'package:session2_try3/OTP_verif.dart';
import 'supabase.dart';
import 'package:session2_try3/utlis.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/CustomField.dart';

class Forgot_Pas extends StatefulWidget {
  const Forgot_Pas({super.key});

  @override
  State<Forgot_Pas> createState() => _Forgot_PasState();

}
TextEditingController emailController = TextEditingController();
class _Forgot_PasState extends State<Forgot_Pas> {
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
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Enter your email address',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                const SizedBox(height: 56),
                CustomField(text: 'Email Address', hint: "***********@mail.com", controller: emailController),
              ],
            ),
          ),
            const SizedBox(height: 56),
            Column(
              children: [
                SizedBox(
                  height: 46,
                  width: 352,
                  child: FilledButton(
                      style: Theme.of(context).filledButtonTheme.style,
                      onPressed: (){
                        sendOTP(
                            email: emailController.text,
                            onResponse: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OTP_Verification()));},
                            onError: (String e){showError(context, e);}
                        );
                      },
                      child: const Text(
                        'Send OTP',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                            color: Color.fromARGB(255, 255, 255, 255)
                        ),
                      )
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
                  },
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Remember password? Back to ',
                              style: Theme.of(context).textTheme.titleMedium
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
        ]
      )
    );
  }
}