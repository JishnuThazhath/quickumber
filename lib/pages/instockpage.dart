import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickumber/objects/item.dart';
import 'package:quickumber/templates/instock-list-item.dart';

class InStock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InStockState();
}

class _InStockState extends State<InStock> {
  final Item item = new Item(
      "123", "https://picsum.photos/id/1080/200/300", "Rice", 55.0, "KG");
  var items = [
    new Item("100", "https://picsum.photos/id/1081/200/300", "Rice", 55.0, "KG"),
    new Item("200", "https://picsum.photos/id/1082/200/300", "Rice", 100.0, "KG"),
    new Item("300", "https://picsum.photos/id/1083/200/300", "Rice", 200.0, "GM"),
    new Item("400", "https://picsum.photos/id/1084/200/300", "Rice", 40.0, "KG"),
    new Item("500", "https://picsum.photos/id/139/200/300", "Rice", 200.0, "KG"),
    new Item("600", "https://picsum.photos/id/1069/200/300", "Rice", 10.0, "KG"),
    new Item("700", "https://picsum.photos/id/1070/200/300", "Rice", 2.0, "KG"),
    new Item("800", "https://picsum.photos/id/1068/200/300", "Rice", 300.0, "KG"),
    new Item("900", "https://picsum.photos/id/107/200/300", "Rice", 1000.0, "KG"),
    new Item("1000", "https://picsum.photos/id/133/200/300", "Rice", 40.0, "KG"),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: ListView.separated(
        //padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListItem(item: items[index], key: UniqueKey());
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 3,
        ),
      )),
    );
  }
}
