// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laba1/AppModel.dart';
import 'package:laba1/GoogleMaps.dart';
//import 'package:laba1/RestaurantList.dart';
import 'package:laba1/pizza_item.dart';
import 'MenuApi.dart';
import 'call_button.dart';
import 'SaleColumn.dart';
import 'PizzaColumn.dart';
import 'package:provider/provider.dart';
import 'AppModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(
    ChangeNotifierProvider(
        create: (context) => AppModel(),
        child: MyApp(),
    )
);


class MyApp extends StatefulWidget {



  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    _restaurantListNavigatorKey,
  ];


  setWoWeekendFromPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Provider.of<AppModel>(context, listen: false).woWeekend = prefs.getBool('woWeekend') ?? false;
      print(prefs.getBool('woWeekend'));
    });
  }

  @override
  void initState() {
    tabs = <List<Tab>>[
      <Tab>[
        Tab(text: "Акции"),
        Tab(text: "Пицца"),
        Tab(text: "Напитки"),
        Tab(text: "Наборы"),
        Tab(text: "Десерти"),
      ],
      <Tab>[
        Tab(text: "Карта"),
        Tab(text: "Список"),
      ]
    ];
    pages = <Widget>[
      SaleColumn(),
      PizzaColumn(),
      Container(),
      Container(),
      Container(),
    ];
    super.initState();
    setWoWeekendFromPref();
  }

   List<Widget> pages;

   List<List<Tab>> tabs = new List<List<Tab>>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/PizzaColumn': (context) => PizzaColumn(),
        '/PizzaItem' : (context) => PizzaItem(),
      },
      title: 'Welcome to Flutter',
      home: DefaultTabController(
        length: tabs[_selectedIndex].length,
        child: Scaffold(
          floatingActionButton: CallButton(true),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.red,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(

                icon: Icon(Icons.local_pizza, size: 30),
                label: "Продукты",

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30),
                label: "Рестораны",

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.border_color, size: 30),
                label: "Заказы",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu, size: 30),
                label: "Меню",
              ),
            ],
          ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: TabBar(
            labelPadding: const EdgeInsets.only(top: 40.0, right: 23.0, left:20.0),
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            isScrollable: true,
            unselectedLabelColor:Color(0xFF686868) ,
            tabs: tabs[_selectedIndex],
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            TabBarView(
              children: pages.map((Widget page) {
                return page;
              }).toList(),
            ),
            TabBarView(
              children: [
                GoogleMaps(),
                RestaurantList(),
              ],
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    ),
    );



  }
}

class RestaurantListNavigator extends StatefulWidget {
  @override
  _RestaurantListNavigatorState createState() => _RestaurantListNavigatorState();
}

GlobalKey<NavigatorState> _restaurantListNavigatorKey = GlobalKey<NavigatorState>();

class _RestaurantListNavigatorState extends State<RestaurantListNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _restaurantListNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            // ignore: missing_return
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return FullRestaurantList();
                case '/FullRestaurantList':
                  return FullRestaurantList();
              }
            });
      },
    );
  }
}

class RestaurantList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text("Go to list"),
          onPressed: () {Navigator.pushNamed(context, '/FullRestaurantList');},
        ),
      ],
    );
  }


}
class FullRestaurantList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("Some restaurants"),
        ],
      ),
    );
  }


}