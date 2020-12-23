import 'package:flutter/material.dart';

class PizzaItem extends StatelessWidget {

  var image;
  var description;
  var label;
  var price;

  PizzaItem({this.image, this.description, this.label, this.price});
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Material(
      child: Container(
        margin: const EdgeInsets.only(top: 24.0),
        padding: const EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              InkWell(
                //**********************************UNNAMED NAVIGATION*****************************************************
                //onTap: () {Navigator.pop(context, 11);},
                  onTap: (){Navigator.pop(context);},
                  child: Container(
                  child: Image.asset(args['image']),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

                  child: Text("Состав: " +
                      args['description'],
                    style: TextStyle(fontSize: 17, color: Colors.black),

                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset("assets/images/tomatoes.jpg", height: 140, width: 140,),
                    Image.asset("assets/images/pepperoni.jpg", height: 140, width: 140,),
                    Image.asset("assets/images/mozarella.jpg", height: 140, width: 140,),
                    Image.asset("assets/images/bbq.jpg", height: 140, width: 140,),],
                ),
              ),

              Divider(
                height: 0,
                thickness: 2,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    args['label'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

                  child: Row(
                    children: [
                      Text(
                        "от ",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      Text(
                        args['price'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        " грн",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: RaisedButton(
                                onPressed: (){},
                                color: Colors.red,
                                child: Text("В корзину",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: Colors.white),
                                ),
                              )))
                    ],
                  ),
                ),
              ),




            ],
          ),
        )
      ),
    );
  }
}