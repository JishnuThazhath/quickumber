import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickumber/objects/item.dart';
import 'package:quickumber/templates/instock-list-item.dart';

class InStock extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _InStockState();
}

class _InStockState extends State<InStock>
{
  final Item item = new Item("123", "https://picsum.photos/id/1080/200/300", "Rice", 55.0, "KG");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: ListView.separated(
            //padding: const EdgeInsets.all(8),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(item);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
      ),
    );
  }

}