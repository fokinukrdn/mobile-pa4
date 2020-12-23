import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MenuApi.dart';
import 'pizza.dart';
import 'AppModel.dart';

class PizzaColumn extends StatefulWidget {

  @override
  _PizzaColumnState createState() => _PizzaColumnState();
}

class _PizzaColumnState extends State<PizzaColumn> {
  Future<Menu> futureMenu;

  @override
  void initState(){
    super.initState();
    futureMenu = fetchMenu();
  }

  Widget build(BuildContext context) {

    return FutureBuilder<Menu>(
      future: futureMenu,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                    ),

                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: snapshot.data.menu_items.map((MenuItem pizza_item) {
                            return Pizza(
                              image: 'assets/images/pizza' + pizza_item.id.toString() + '.png',
                              description: pizza_item.description,
                              label: pizza_item.name,
                              price: (Provider.of<AppModel>(context, listen: false).woWeekend == true) ? 100 : pizza_item.price - Provider.of<AppModel>(context, listen: false).discount,
                            );
                          }).toList(),
                        )

                    )
                ),

              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return  Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
              width: 50,
              height: 50,
        ));

      },
    );

  }
}

