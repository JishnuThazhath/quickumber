import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../scale-config.dart';

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

    ScaleConfig().init(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /**** REMOVE_BUTTON ****/
        Container(
          height: ScaleConfig.blockSizeVertical * 6,
          width: ScaleConfig.blockSizeHorizontal * 10,
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScaleConfig.blockSizeVertical * 2)),
            ),
            child: IconButton(
              iconSize: ScaleConfig.blockSizeVertical * 2,
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
        SizedBox(
          width: ScaleConfig.blockSizeHorizontal * 2,
        ),
        Text(
          amount.toString() + " " + widget.unit,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScaleConfig.blockSizeVertical * 2),
        ),
        SizedBox(
          width: ScaleConfig.blockSizeHorizontal * 2,
        ),
        /**** ADD_BUTTON ****/
        Container(
          height: ScaleConfig.blockSizeVertical * 6,
          width: ScaleConfig.blockSizeHorizontal * 10,
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScaleConfig.blockSizeVertical * 2)),
            ),
            child: IconButton(
              iconSize: ScaleConfig.blockSizeVertical * 2,
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