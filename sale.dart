import 'package:flutter/material.dart';
import 'activate_button.dart';

class Sale extends StatelessWidget {

  var index;
  var image;
  var label;
  var description;

  Sale({this.index, this.image, this.label, this.description});

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
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            child:  Image.asset(image),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
          Divider(
            height: 0,
            thickness: 2,
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
          ActivateButton(index),



        ],
      ),
    );
  }
}