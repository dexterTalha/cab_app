import 'package:cab_app/pages/fragments/address_frag.dart';
import 'package:cab_app/pages/fragments/booking_frag.dart';
import 'package:cab_app/pages/fragments/history_frag.dart';
import 'package:cab_app/pages/fragments/profile_frag.dart';
import 'package:cab_app/pages/fragments/wallet_frag.dart';
import 'package:cab_app/widgets/constants.dart';
import 'package:cab_app/widgets/my_drawer.dart';
import 'package:cab_app/widgets/notification_blocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_container/overlay_container.dart';

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

  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                onPressed: _toggleDropdown,
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
      body: Stack(
        children: [
          fragments[indexPage],
          OverlayContainer(
            show: _dropdownShown,
            // Let's position this overlay to the right of the button.

            // The content inside the overlay.
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width - 32,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 3,
                    spreadRadius: 6,
                  )
                ],
              ),
              child: NotificationBlock(),
            ),
          ),
        ],
      ),
    );
  }
}
