import 'package:cab_app/pages/fragments/address_frag.dart';
import 'package:cab_app/pages/fragments/booking_frag.dart';
import 'package:cab_app/pages/fragments/history_frag.dart';
import 'package:cab_app/pages/fragments/profile_frag.dart';
import 'package:cab_app/pages/fragments/wallet_frag.dart';
import 'package:cab_app/widgets/constants.dart';
import 'package:cab_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page selected
  int indexPage = 0;
  final List fragments = const [
    BookingPage(),
    HistoryPage(),
    ProfilePage(),
    AddressPage(),
    WalletPage(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff190E45),
                Color(0xff5339A5),
                Color(0xff5E43AE),
              ],
            ),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(
        indexPage: indexPage,
        onMenuTap: (page) {
          print(page);
          Navigator.pop(context);
          setState(() {
            indexPage = page;
          });
        },
      ),
      body: fragments[indexPage],
    );
  }
}
