import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RideCompletePage extends StatefulWidget {
  const RideCompletePage({Key? key}) : super(key: key);

  @override
  _RideCompletePageState createState() => _RideCompletePageState();
}

class _RideCompletePageState extends State<RideCompletePage> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
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
            title: Text("Your Bill"),
            centerTitle: true,
            actions: [
              TextButton(
                child: Text(
                  "Support?",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        preferredSize: Size(_size.width, 50),
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 16, //8 from here
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/success.png"),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text(
                    "Ride Complete",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "\u20B9 251.55",
              style: TextStyle(fontSize: 40, color: const Color(0xff32325D)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.local_taxi,
                  color: Color(0xff32325D),
                  size: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "MINI",
                  style: TextStyle(fontSize: 25, color: Color(0xff32325D)),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.my_location,
                        color: Colors.green,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Buxipur, Gorakhpur, 273001",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    "assets/images/complete_ride_arrow.png",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.near_me,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rustampur, Gorakhpur, 273001",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0), //4from here
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "How was your ride?",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (_size.width * 0.5) - 62,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/welcome_1.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff172B4D),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text("Done"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
