import 'package:flutter/material.dart';

class CustomField extends StatelessWidget{
  final String text;
  final String hint;
  final TextEditingController controller;
  final Function(String)? onChanged;
  const CustomField({super.key, required this.text, required this.hint, required this.controller, this.onChanged});


  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 167, 167, 167),
                      width: 1
                  )
              ),
              contentPadding: const EdgeInsets.only(top: 14, bottom: 14,left: 10),
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.titleMedium,
            ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}