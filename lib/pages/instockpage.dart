import 'package:flutter/material.dart';
import 'package:quickumber/objects/item.dart';
import 'package:quickumber/pages/item-description.dart';
import 'package:quickumber/templates/instock-list-item.dart';

class InStock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InStockState();
}

class _InStockState extends State<InStock> {

  static String dummy_desc_for_all = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";

  final Item item = new Item(
      "123", "https://picsum.photos/id/1080/200/300", "Rice", 55.0, "KG", dummy_desc_for_all);
  var items = [
    new Item(
        "100", "https://picsum.photos/id/1081/200/300", "Wheat", 55.0, "KG", dummy_desc_for_all),
    new Item(
        "200", "https://picsum.photos/id/1082/200/300", "Orange", 100.0, "KG", dummy_desc_for_all),
    new Item(
        "300", "https://picsum.photos/id/1083/200/300", "Apple", 200.0, "GM", dummy_desc_for_all),
    new Item(
        "400", "https://picsum.photos/id/1084/200/300", "Banana", 40.0, "KG", dummy_desc_for_all),
    new Item(
        "500", "https://picsum.photos/id/139/200/300", "Diary Milk", 200.0, "UNIT", dummy_desc_for_all),
    new Item(
        "600", "https://picsum.photos/id/1069/200/300", "Wheat Flour", 10.0, "KG", dummy_desc_for_all),
    new Item("700", "https://picsum.photos/id/1070/200/300", "Washing Powder", 2.0, "KG",dummy_desc_for_all),
    new Item(
        "800", "https://picsum.photos/id/1068/200/300", "Pears Soap", 300.0, "UNIT", dummy_desc_for_all),
    new Item(
        "900", "https://picsum.photos/id/107/200/300", "Red Rice", 1000.0, "KG", dummy_desc_for_all),
    new Item(
        "1000", "https://picsum.photos/id/133/200/300", "Flour", 40.0, "KG", dummy_desc_for_all),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: ListView.separated(
        //padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemDescription(items[index])));
              },
              child: ListItem(item: items[index], key: UniqueKey()));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 3,
        ),
      )),
    );
  }
}
