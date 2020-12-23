import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppModel.dart';

class ActivateButton extends StatefulWidget {

  var index;

  ActivateButton(this.index);

  @override
  createState() => new ActivateButtonState(index);
}

class ActivateButtonState extends State<ActivateButton> {

  var active_button;
  var index;

  ActivateButtonState(this.index);

  @override
  void initState() {
    if (index ==0){
      active_button = Provider.of<AppModel>(context, listen: false).isActiveDiscount;
    } else if (index == 1) {
      active_button = Provider.of<AppModel>(context, listen: false).isActiveDiscount;
    } else if (index == 2) {
    active_button = Provider.of<AppModel>(context, listen: false).woWeekend;
    }
    super.initState();
  }

  void pressButton() {
    setState(() {
       if (index == 0) {
            if (active_button == false) {
              Provider.of<AppModel>(context, listen: false).activateDiscount(20.0);
            } else if(active_button == true) {
              Provider.of<AppModel>(context, listen: false).activateDiscount(0.0);
            }
            active_button = Provider.of<AppModel>(context, listen: false).isActiveDiscount;
       } else if (index == 1) {
         if (active_button == false) {
           Provider.of<AppModel>(context, listen: false).activateDiscount(20.0);
         } else if(active_button == true) {
           Provider.of<AppModel>(context, listen: false).activateDiscount(0.0);
         }
         active_button = Provider.of<AppModel>(context, listen: false).isActiveDiscount;
       }
       else if (index == 2) {
             Provider.of<AppModel>(context, listen: false).activateWoweekend();
             active_button = Provider.of<AppModel>(context, listen: false).woWeekend;
       }
    });
  }

  @override
  Widget build(BuildContext context) {

     return new Container(

       child: RaisedButton(
         onPressed: pressButton,

         color: (active_button == true) ? Colors.green : Colors.red,


         child: Text((active_button == true) ? "Активировано" : "Активировать",
           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: Colors.white),
         ),
       ),
     );
   }

  }

