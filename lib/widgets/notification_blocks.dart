import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationBlock extends StatefulWidget {
  const NotificationBlock({Key? key}) : super(key: key);

  @override
  _NotificationBlockState createState() => _NotificationBlockState();
}

class _NotificationBlockState extends State<NotificationBlock> {
  List<String> notificationDummy = [
    "Notification 1",
    "Notification 2",
  ];

  List<String> notificationSubDummy = [
    "Notification subtitle 1",
    "Notification subtitle 2",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Notifications",
          style: TextStyle(fontSize: 30),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: notificationDummy.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can

                        onPressed: (_) {
                          notificationDummy.removeAt(index);
                          notificationSubDummy.removeAt(index);
                          setState(() {});
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              "assets/images/welcome_1.png",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notificationDummy[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(notificationSubDummy[index]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
