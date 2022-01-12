import 'package:cab_app/pages/login_page.dart';
import 'package:cab_app/widgets/app_text_bold.dart';
import 'package:cab_app/widgets/app_text_normal.dart';
import 'package:cab_app/widgets/blinking_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int pageValue = 0;

  final PageController _pageController = PageController(initialPage: 0, keepPage: true);

  List images = [
    "assets/images/welcome_1.png",
    "assets/images/welcome_2.png",
    "assets/images/welcome_3.png",
  ];

  //dummy text for the show
  List<String> textHeader = [
    "Want to reach early?",
    "Easy to get a ride",
    "Comfortable cabs on the road",
  ];
  List<String> textSubHeader = [
    "Grab our cabs in one click",
    "Get your ride within a minute",
    "Assurance of comfort and security",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (i) => setState(() {
                pageValue = i;
                //print(pageValue);
              }),
              itemCount: images.length,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 55, left: 20, right: 20),
                  //-------background image--------
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.darken),
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),

                  //------------Text--------------

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //decorating text
                      AppTextBold(text: textHeader[index]),
                      AppTextNormal(
                        text: textSubHeader[index],
                        size: 25,
                      ),
                    ],
                  ),
                );
              },
            ),

            //-------Slider Indicator--------
            Positioned(
              right: MediaQuery.of(context).size.width / 2 - 60,
              bottom: 10,
              child: Row(
                children: List.generate(
                  images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: pageValue == index ? 30 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: pageValue == index ? Colors.orange : Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),

            //-------blinking button-------

            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              right: 10,
              child: BlinkingButton(
                onTap: () {
                  print(pageValue);
                  //slide page
                  if (pageValue + 1 < images.length) {
                    _pageController.animateToPage(
                      pageValue + 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                  }
                  //making to move to new page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//to animate make it animated container