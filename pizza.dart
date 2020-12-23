import 'package:flutter/material.dart';
import 'package:laba1/pizza_item.dart';
import 'activate_button.dart';
import 'package:provider/provider.dart';

class Pizza extends StatelessWidget {

  var image;
  var description;
  var label;
  var price;
  var soTasty;

  Pizza({this.image, this.description, this.label, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]
      ),
      child: Column(
        children: [
            InkWell(
              child: Container(
                    child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0)),
                  child: Image.asset(image),
                          ),
                            ),
//**********************************UNNAMED NAVIGATION*****************************************************
              /*onTap:  ()async { soTasty = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PizzaItem(
                          image: image,
                          description: description + soTasty.toString(),
                          label: label,
                          price: price,
                          )),
                          );},*/
              //***********************************************************************************
              onTap: () {Navigator.pushNamed(context, '/PizzaItem', arguments: {
                'image': image,
                'description': description,
                'label': label,
                'price' : price,
              } );},

            ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

              child: Text(
                description,
                style: TextStyle(fontSize: 16),

              ),
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
              label,
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
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        price.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      Text(
                        " грн",
                        style: TextStyle(fontSize: 16),
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
    );
  }
}