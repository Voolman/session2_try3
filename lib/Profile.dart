import 'package:flutter/material.dart';
import 'Wallet.dart';
import 'Track.dart';
import 'Home.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(top: 71, left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(
              width: 342,
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
            const Padding(
              padding: EdgeInsets.only(top: 14),
              child: SizedBox(
                width: 342,
                height: 62,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  leading: Icon(Icons.person, color: Color.fromARGB(255, 58, 58, 58)),
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                      'Name, phone no, address, email ...',
                      style: TextStyle(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromARGB(255, 41, 45, 50),
                    size: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14),
              child: SizedBox(
                width: 342,
                height: 62,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  leading: Icon(Icons.list_alt, color: Color.fromARGB(255, 58, 58, 58)),
                  title: Text(
                    "Statements & Reports",
                    style: TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                      'Download transaction details, orders, deliveries',
                      style: TextStyle(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromARGB(255, 41, 45, 50),
                    size: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14),
              child: SizedBox(
                width: 342,
                height: 62,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  leading: Icon(Icons.ring_volume, color: Color.fromARGB(255, 58, 58, 58)),
                  title: Text(
                    "Notification Settings",
                    style: TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                      'mute, unmute, set location & tracking setting',
                      style: TextStyle(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromARGB(255, 41, 45, 50),
                    size: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14),
              child: SizedBox(
                width: 342,
                height: 62,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  leading: Icon(Icons.wallet, color: Color.fromARGB(255, 58, 58, 58)),
                  title: Text(
                    "Card & Bank account settings",
                    style: TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                      'change cards, delete card details',
                      style: TextStyle(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromARGB(255, 41, 45, 50),
                    size: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14),
              child: SizedBox(
                width: 342,
                height: 62,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  leading: Icon(Icons.people, color: Color.fromARGB(255, 58, 58, 58)),
                  title: Text(
                    "Referrals",
                    style: TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                      'check no of friends and earn',
                      style: TextStyle(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromARGB(255, 41, 45, 50),
                    size: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14),
              child: SizedBox(
                width: 342,
                height: 62,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  leading: Icon(Icons.map, color: Color.fromARGB(255, 58, 58, 58)),
                  title: Text(
                    "About Us",
                    style: TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                      'know more about us, terms and conditions',
                      style: TextStyle(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromARGB(255, 41, 45, 50),
                    size: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14),
              child: SizedBox(
                width: 342,
                height: 62,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  leading: Icon(Icons.output, color: Color.fromARGB(
                      255, 237, 58, 58)),
                  title: Text(
                    "Log Out",
                    style: TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromARGB(255, 41, 45, 50),
                    size: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}