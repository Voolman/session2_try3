import 'package:flutter/material.dart';
import 'Home.dart';
import 'Track.dart';
import 'Profile.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});


  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  @override
  Widget build(BuildContext context) {

    var pages = [const Home(), const Wallet(), const Track(), const Profile()];
    var currentIndex = 1;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(255, 5, 96, 250),
        unselectedItemColor: const Color.fromARGB(255, 167, 167, 167),
        selectedLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 167, 167, 167),
            fontSize: 12,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal
        ),
        unselectedLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 5, 96, 250),
            fontSize: 12,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal
        ),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Track'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (newIndex){
          setState(() {
            currentIndex = newIndex;
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => pages[newIndex]));
          });
        },
      ),
    );
  }
}