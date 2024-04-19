import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:session2_try3/Fotgot_pas.dart';
import 'package:session2_try3/New_Password.dart';
import 'supabase.dart';
import 'package:session2_try3/utlis.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'Login.dart';

class OTP_Verification extends StatefulWidget {
  const OTP_Verification({super.key});

  @override
  State<OTP_Verification> createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {

  bool enableButton = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 83),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'OTP Verification',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Enter the 6 digit numbers sent to your email',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 58),
              Pinput(
                controller: controller,
                length: 6,
                separatorBuilder: (context) => const SizedBox(width: 30),
                onChanged: (text){
                  setState(() {
                    enableButton = text.length == 6;
                  });
                },
                defaultPinTheme: PinTheme(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: const Color.fromARGB(255, 129, 129, 129)),
                    borderRadius: BorderRadius.circular(0)
                  )
                ),
              ),
              const SizedBox(height: 48),
              Countdown(
                  seconds: 60,
                  build: (context, time){
                    var lostSecond = time.toInt();
                    if ((lostSecond != 0)) {
                      return Text("Получить код повторно через $lostSecondс", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14));
                    } else {
                      return GestureDetector(
                          onTap: (){
                            sendOTP(
                                email: emailController.text,
                                onResponse: (){
                                  setState(() {
                                    lostSecond = 60;
                                  });
                                },
                                onError: (String e){
                                  showError(context, e);
                              }
                            );
                          },
                          child: Text(
                              'Получить новый код',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color.fromARGB(255, 5, 96, 250)
                              )
                          ),
                      );
                    }
                  },
                interval: const Duration(seconds: 1),
              ),
              const SizedBox(height: 449),
              Column(
                children: [
                  SizedBox(
                    height: 46,
                    width: 352,
                    child: FilledButton(
                        style: Theme.of(context).filledButtonTheme.style,
                        onPressed: (enableButton) ? () async {
                          verifyOTP(
                              email: emailController.text,
                              code: controller.text,
                              onResponse: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewPassword()));},
                              onError: (String e){showError(context, e);}
                          );
                        } : null,
                        child: const Text(
                          'Set New Password',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto",
                              color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 10),
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
