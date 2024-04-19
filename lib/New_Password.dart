import 'package:flutter/material.dart';
import 'supabase.dart';
import 'package:session2_try3/utlis.dart';

import 'Login.dart';
import 'core/CustomField.dart';

class NewPassword extends StatefulWidget{
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool enableButton = false;
  void isValid(){
    setState(() {
      enableButton = passwordController.text.isNotEmpty &&
          passwordConfirmController.text.isNotEmpty &&
          passwordController.text == passwordConfirmController.text;
    });
  }

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
                          'Новый пароль',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Введите новый пароль',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 56),
                    CustomField(text: 'Пароль', hint: "**********", controller: passwordController),
                    const SizedBox(height: 24),
                    CustomField(text: 'Потвердить пароль', hint: "**********", controller: passwordConfirmController),
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
                          changePassword(
                              newPassword: passwordController.text,
                              onResponse: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));},
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
                ],
              ),
            ]
        )
    );
  }
}