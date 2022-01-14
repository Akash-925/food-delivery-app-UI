import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'header.dart';
import 'categories.dart';
import 'hamburgers_list.dart';
import 'burger_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orangeAccent,
        canvasColor: Colors.red[600],
        primaryColor: Colors.red[600],
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.red[600], centerTitle: true),
        bottomAppBarColor: Colors.red[600],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orangeAccent,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.orangeAccent,
        canvasColor: Colors.red[600],
        primaryColor: Colors.red[600],
        cardColor: Color.fromRGBO(20, 20, 20, 1),
        appBarTheme: AppBarTheme(color: Colors.red[600], centerTitle: true),
        bottomAppBarColor: Colors.red[600],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orangeAccent,
        ),
      ),
      home: Hamburger(),
      routes: {Burgerpage.tag: (_) => Burgerpage()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class Hamburger extends StatefulWidget {
  @override
  _HamburgerState createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: light
          ? Color.fromRGBO(240, 240, 240, 1)
          : Color.fromRGBO(35, 35, 35, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Zomato"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
            ],
          ),
          Header(),
          Categories(),
          HamburgerList(row: 1),
          HamburgerList(row: 2),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        ),
        child: Container(
          color: Colors.black38,
          child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              child: Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_alert),
                    color: Colors.white,
                  ),
                  Spacer(),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.turned_in),
                    color: Colors.white,
                  ),
                  Spacer(),
                ],
              )),
        ),
      ),
    );
  }
}
