import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOrRemoveItem extends StatefulWidget
{
  String unit;// = "KG";

  AddOrRemoveItem(this.unit) : super(key: UniqueKey());

  @override
  State<StatefulWidget> createState() => _AddOrRemoveItemState();
}

class _AddOrRemoveItemState extends State<AddOrRemoveItem>
{
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /**** REMOVE_BUTTON ****/
        Container(
          height: 35,
          width: 35,
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            child: IconButton(
              iconSize: 20,
              onPressed: () {
                setState(() {
                  if (amount != 0) amount--;
                });
              },
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // SizedBox(
        //   width: 20,
        // ),
        Text(
          amount.toString() + " " + widget.unit,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // SizedBox(
        //   width: 20,
        // ),
        /**** ADD_BUTTON ****/
        Container(
          height: 35,
          width: 35,
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            child: IconButton(
              iconSize: 20,
              // splashColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  if (amount < 100) amount++;
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}