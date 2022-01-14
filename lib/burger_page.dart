import 'dart:ui';

import 'package:flutter/material.dart';
import 'hamburgers_list_mini.dart';

class Burgerpage extends StatefulWidget {
  static const tag = "burger_page";
  @override
  _BurgerpageState createState() => _BurgerpageState();
}

class _BurgerpageState extends State<Burgerpage> {
  Widget baconimage = Container(
    height: 110,
    child: Image.asset("images/baconburger.png"),
  );
  Widget chickenimage = Container(
    height: 160,
    child: Image.asset("images/cheeseburger.png"),
  );
  int number = 0;
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    Size size = MediaQuery.of(context).size;
    String nameargument = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 15,
              child: CircleAvatar(
                backgroundImage: AssetImage("images/dog.jpeg"),
                radius: 13,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameargument,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Zomato Burger. Fast Delivery and Great Service! ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    nameargument == "Chicken Burger"
                        ? chickenimage
                        : baconimage,
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(
                            "249.00 ₹",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.white),
                            Icon(Icons.star, color: Colors.white),
                            Icon(Icons.star, color: Colors.white),
                            Icon(Icons.star, color: Colors.white),
                            Icon(Icons.star, color: Colors.white),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.red[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(45),
            ),
            child: Container(
              width: size.width,
              color: light
                  ? Color.fromRGBO(240, 240, 240, 1)
                  : Color.fromRGBO(20, 20, 20, 1),
              height: size.height / 1.6,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 28),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id ante vitae felis elementum tristique. Aenean arcu leo, placerat sit amet lorem sit amet, faucibus posuere mi. Curabitur egestas gravida nisl, vitae tempor ipsum posuere cursus. Fusce sit amet est purus. Mauris dignissim blandit nunc. Sed tellus turpis, dignissim nec erat ut, lobortis molestie quam. Cras vestibulum mattis varius. Morbi rutrum eros in nisi elementum dapibus. Duis accumsan tortor id sapien volutpat rutrum. Nulla vitae commodo lacus. Pellentesque mauris quam, convallis quis risus et, dapibus luctus nunc. Sed condimentum nulla at viverra mattis. Maecenas porta aliquam fringilla.",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  Spacer(),
                  HamburgersListMini(),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2)),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                color: Theme.of(context).accentColor,
                                onPressed: () {
                                  setState(() {
                                    number--;
                                  });
                                },
                              ),
                              Text(number.toString()),
                              IconButton(
                                icon: Icon(Icons.add_circle),
                                color: Theme.of(context).accentColor,
                                onPressed: () {
                                  setState(() {
                                    number++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: MaterialButton(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
