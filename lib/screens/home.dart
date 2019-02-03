import 'package:drower_demo/screens/customer_screen.dart';
import 'package:drower_demo/screens/product_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Demo"),
      ),
      body: Container(
        child: Center(
          child: Text("Anasyfa"),
        ),
      ),
      drawer: buildDrawer(context),
    );
  }

  Drawer createMenuItems(BuildContext context) {
    createNavationItems(var icon, String page, String routName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(page),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routName);
          });
        },
      );
    }

    var navgationList = [
      createNavationItems(
          Icons.account_box, "Customers", CustomerScreen.routeName),
      createNavationItems(Icons.shop, "Products", ProductScreen.routeName),
      createNavationItems(Icons.home, "Home", "/"),
    ];
    ListView menuItems = new ListView(
      children: navgationList,
    );
    return Drawer(
      child: menuItems,
    );
  }

  buildDrawer(BuildContext context) {
    return Drawer(
      child: createMenuItems(context),
    );
  }
}
