import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallButton extends StatefulWidget {

  bool _activate;

  CallButton(this._activate);

  @override
  createState() => new CallButtonState(_activate);
}

class CallButtonState extends State<CallButton> {

  bool activate;

  CallButtonState(this.activate);

  createAlertDialog(BuildContext context){
    TextEditingController customController = TextEditingController();

    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Закажите звонок прямой сейчас!..."),
        content: TextField(
          controller: customController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("Ок"),
            onPressed: (){
              Navigator.of(context).pop(customController.text.toString());
            },
          ),
        ],
      );
    });
  }

  void pressButton() {
    setState(() {
      activate = !activate;
      createAlertDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return new FloatingActionButton(
          backgroundColor: activate ? Colors.red : Colors.green,
          foregroundColor: Colors.white,
          onPressed: pressButton,
    child: Icon( activate ? Icons.local_phone : Icons.local_phone_outlined),
    );
  }

}