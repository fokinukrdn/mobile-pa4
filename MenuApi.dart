import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async' show Future;

Future<Menu> fetchMenu() async{
  final response = await http.get('https://api.jsonbin.io/b/5fe31c9047ed0861b36ad792');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Menu.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load restaurant info');
  }
}

class Menu {
  final List<MenuItem> menu_items;

Menu({this.menu_items});

factory Menu.fromJson(Map<String, dynamic> json){

  var parsed_menu_items = json['menu_items'] as List;
  //print(parsed_menu_items.runtimeType); //returns List<dynamic>
  List<MenuItem> menuList = parsed_menu_items.map((i) => MenuItem.fromJson(i)).toList();


  return Menu(
      menu_items: menuList,
  );

}

}

class MenuItem {

  final int id;
  final String name;
  final double price;
  final String description;

  MenuItem({this.id, this.name, this.price, this.description});

  factory MenuItem.fromJson(Map<String, dynamic> json){
    return MenuItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],

    );
  }
}