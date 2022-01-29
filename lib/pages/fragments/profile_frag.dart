import 'package:cab_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            bottom: 30,
            right: 30,
            left: 30,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 90),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff172B4D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                          width: 55,
                          height: 35,
                          child: const Center(
                            child: Text(
                              "Edit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      //text data
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "42",
                                  style: TextStyle(
                                    color: Color(0xff525F7F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Total Rides",
                                  style: TextStyle(
                                    color: Color(0xff525F7F),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "10",
                                  style: TextStyle(
                                    color: Color(0xff525F7F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Cancelled",
                                  style: TextStyle(
                                    color: Color(0xff525F7F),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    color: Color(0xff525F7F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Rating",
                                  style: TextStyle(
                                    color: Color(0xff525F7F),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      //Personal Info
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "DexterTalha",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text("mycity, mystate"),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text("+91 9876543210"),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: ListTile(
                          title: Text("History"),
                          leading: Icon(Icons.history),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: ListTile(
                          title: Text("Address"),
                          leading: Icon(Icons.my_location),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: ListTile(
                          title: Text("Wallet"),
                          leading: Icon(Icons.account_balance_wallet),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: ListTile(
                          title: Text(
                            "Logout",
                            style: TextStyle(color: Colors.red),
                          ),
                          leading: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          //image

          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                "assets/images/welcome_1.png",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height - 30)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
