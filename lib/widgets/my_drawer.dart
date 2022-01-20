import 'package:cab_app/widgets/app_text_bold.dart';
import 'package:cab_app/widgets/app_text_normal.dart';
import 'package:cab_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  //getting selected menu to home page
  final Function(int) onMenuTap;
  final int indexPage;
  const MyDrawer({
    Key? key,
    required this.indexPage,
    required this.onMenuTap,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //initial index
  int initialIndex = 0;

  //active and inactive styles

  final activeTextStyle = TextStyle(color: Colors.white);
  final inactiveTextStyle = TextStyle(color: Colors.black);
  final activeDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: buttonColor,
  );

  final List<String> menus = [
    "Booking",
    "History",
    "Profile",
    "Address",
    "Wallet",
  ];
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.history,
    Icons.person,
    Icons.my_location,
    Icons.account_balance_wallet_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/welcome_1.png",
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: AppTextNormal(
                  text: "Name",
                  color: Colors.black54,
                  size: 25,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          //generating menus

          Column(
            children: List.generate(
              menus.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    decoration: widget.indexPage == index ? activeDecoration : BoxDecoration(),
                    child: ListTile(
                      onTap: () {
                        widget.onMenuTap(index);
                      },
                      title: Text(
                        menus[index],
                        style: widget.indexPage == index ? activeTextStyle : inactiveTextStyle,
                      ),
                      leading: Icon(
                        icons[index],
                        color: widget.indexPage == index ? Colors.white : Colors.black54,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black54,
            thickness: 0.5,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20),
            child: Text("DOCUMENTATION"),
          ),

          ListTile(
            title: Text("Privacy Policy"),
            leading: Icon(Icons.security_outlined),
          ),
          ListTile(
            title: Text("Share"),
            leading: Icon(Icons.share),
          ),
          ListTile(
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
