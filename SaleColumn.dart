import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:laba1/AppModel.dart';
import 'sale.dart';

class SaleColumn extends StatelessWidget {


  Widget build(BuildContext context) {
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
                    children: [
                      Sale(
                        index: 0,
                        image: 'assets/images/discount.jpg',
                        label: "Пицца дня!",
                        description: "Получи скидку прямо сейчас!...",
                      ),
                      Sale(
                          index: 1,
                        image: 'assets/images/discount1.jpg',
                        label: " Бесплатные напитки",
                        description: "Не пропусти акцию",
                      ),

                      Sale(
                          index: 2,
                        image: 'assets/images/sale.png',
                        label: "Любая пицца за 100грн!",
                        description: "Заказывай пиццу по низкой цене",
                      )

                    ],
                  )

              )
          ),

        ],
      ),
    );
  }
}