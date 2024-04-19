import 'package:flutter/material.dart';
import 'package:session2_try3/Login.dart';
import 'supabase.dart';
import 'package:session2_try3/utlis.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Wallet.dart';
import 'Track.dart';
import 'Home.dart';
import 'core/CustomListTile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var pages = [const Home(), const Wallet(), const Track(), const Profile()];
  var currentIndex = 3;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(255, 5, 96, 250),
        unselectedItemColor: const Color.fromARGB(255, 167, 167, 167),
        selectedLabelStyle: Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
        unselectedLabelStyle: Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
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
      body: Padding(
        padding: const EdgeInsets.only(top: 71, left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(
              height: 75,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                leading: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 207, 207, 207)
                    ),
                    child: const Icon(Icons.person, color: Color.fromARGB(255, 58, 58, 58))
                ),
                title: const Text(
                  "Hello Ken",
                  style: TextStyle(
                      color: Color.fromARGB(255, 58, 58, 58),
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500
                  ),
                ),
                subtitle: RichText(
                    text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "Current balance: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 58, 58, 58),
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400
                              )
                          ),
                          TextSpan(
                              text: "N10,712:00",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 5, 96, 250),
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500
                              )
                          )
                        ]
                    )
                ),
              ),
            ),
            const CustomListTile(
                color: Color.fromARGB(255, 58, 58, 58),
                icon: Icons.person,
                label: "Edit Profile",
                text: 'Name, phone no, address, email ...'
            ),
            const CustomListTile(
                icon: Icons.list_alt,
                color: Color.fromARGB(255, 58, 58, 58),
                label: "Statements & Reports",
                text: 'Download transaction details, orders, deliveries'
            ),
            const CustomListTile(
                icon: Icons.ring_volume,
                color: Color.fromARGB(255, 58, 58, 58),
                label: "Notification Settings",
                text: 'mute, unmute, set location & tracking setting'
            ),
            const CustomListTile(
                icon: Icons.wallet,
                color: Color.fromARGB(255, 58, 58, 58),
                label: "Card & Bank account settings",
                text: 'change cards, delete card details'
            ),
            const CustomListTile(
                icon: Icons.people,
                color: Color.fromARGB(255, 58, 58, 58),
                label: "Referrals",
                text: 'check no of friends and earn'
            ),
            const CustomListTile(
                icon: Icons.map,
                color: Color.fromARGB(255, 58, 58, 58),
                label: "About Us",
                text: 'know more about us, terms and conditions'
            ),
            GestureDetector(
              onTap: (){
                signOut(
                    onResponse: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                      },
                    onError: (String e){showError(context, e);}
                  );
                },
              child: const CustomListTile(
                  icon: Icons.output,
                  color: Color.fromARGB(255, 237, 58, 58),
                  label: "Log Out",
              ),
            ),
          ],
        ),
      ),
    );
  }
}