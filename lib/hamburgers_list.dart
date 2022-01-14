import 'package:flutter/material.dart';
import 'burger_page.dart';

class HamburgerList extends StatefulWidget {
  final int row;
  HamburgerList({this.row});

  @override
  _HamburgerListState createState() => _HamburgerListState();
}

class _HamburgerListState extends State<HamburgerList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;
    Widget baconimage = Container(
      height: 110,
      child: Image.asset("images/baconburger.png"),
    );
    Widget chickenimage = Container(
      height: 160,
      child: Image.asset("images/cheeseburger.png"),
    );
    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items,
            itemBuilder: (context, index) {
              bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
              return Stack(
                children: [
                  Container(
                    height: 240,
                    width: 200,
                    margin: EdgeInsets.only(
                        left: 20, right: index == items ? 20 : 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(Burgerpage.tag,
                            arguments:
                                reverse ? "Chicken Burger" : "Bacon Burger");
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                reverse ? "Chicken Burger" : "Bacon Burger",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    "249.00 ₹",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: reverse ? 50 : 75,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(Burgerpage.tag,
                            arguments:
                                reverse ? "Chicken Burger" : "Bacon Burger");
                      },
                      child: reverse ? chickenimage : baconimage,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
