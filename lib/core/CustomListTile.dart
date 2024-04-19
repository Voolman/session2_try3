import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget{
  final IconData icon;
  final Color color;
  final String label;
  final String? text;
  const CustomListTile({super.key, required this.icon, required this.color, required this.label, this.text});


  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const SizedBox(height: 14),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: Offset(0, 2),
                  color: Color.fromARGB(38, 0, 0, 0)
              )
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 12),
            leading: Icon(icon, color: color),
            title: (text != null) ? Padding(
              padding: const EdgeInsets.only(top:13),
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16)
              ),
            ) : Text(
                  label,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16)
                ),
            subtitle: (text != null) ? Padding(
              padding: const EdgeInsets.only(bottom:13),
              child: Text(
                  text!,
                  style: Theme.of(context).textTheme.titleSmall
              ),
            ) : null,
            trailing: const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color.fromARGB(255, 41, 45, 50),
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}