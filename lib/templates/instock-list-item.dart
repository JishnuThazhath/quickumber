import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickumber/objects/item.dart';

import '../scale-config.dart';
import 'add-or-remove.dart';

class ListItem extends StatefulWidget {
  Item item;
  var key;
  static var favoriteList = [];

  ListItem({this.item, this.key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListItemState(item, key);
}

class _ListItemState extends State<ListItem> {
  var key;
  Item item;
  Color likeButtonColor = Colors.black12;
  int amount = 1;

  addFavorite(String item) {
    ListItem.favoriteList.add(item);
    likeButtonColor = Colors.red;
  }

  removeFavorite(String item) {
    ListItem.favoriteList.remove(item);
    likeButtonColor = Colors.black12;
  }

  _ListItemState(this.item, this.key);

  @override
  Widget build(BuildContext context) {
    ScaleConfig().init(context);

    return Container(
        padding: EdgeInsets.all(ScaleConfig.blockSizeVertical * 1),
        height: ScaleConfig.blockSizeVertical * 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /** IMAGE */
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(ScaleConfig.blockSizeVertical * 2),
                child: Image.network(
                  this.item.displayImgUrl,
                  fit: BoxFit.fill,
                  height: ScaleConfig.blockSizeVertical * 20,
                  width: ScaleConfig.blockSizeHorizontal * 20,
                ),
              ),
            ),

            SizedBox(
              width: ScaleConfig.blockSizeHorizontal * 10,
            ),

            //CENTER-PORTION
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.item.displayName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScaleConfig.blockSizeVertical * 2,),
                    ),
                  ),
                  //
                  // SizedBox(
                  //   height: ScaleConfig.blockSizeVertical * 3,
                  // ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(this.item.price.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScaleConfig.blockSizeVertical * 2)),
                  ),
                  //
                  // SizedBox(
                  //   height: ScaleConfig.blockSizeVertical * 1,
                  // ),

                  Container(
                    //width: ScaleConfig.blockSizeHorizontal * 1,
                    child: AddOrRemoveItem(this.item.unit)
                  ),

                  // SizedBox(
                  //   height: ScaleConfig.blockSizeVertical * 1,
                  // ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: ScaleConfig.blockSizeHorizontal * 35,
                      height: ScaleConfig.blockSizeVertical * 4,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScaleConfig.blockSizeVertical * 2),
                        ),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(ScaleConfig.blockSizeVertical * 3))),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //LAST PORTION
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: ScaleConfig.blockSizeVertical * 4,
                      width: ScaleConfig.blockSizeHorizontal * 20,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "\$10 Discount",
                              style: TextStyle(fontSize: ScaleConfig.blockSizeVertical * 1,),
                            ),
                          ))),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          likeButtonColor == Colors.black12
                              ? addFavorite(this.item.uid)
                              : removeFavorite(this.item.uid);
                        });
                        print(ListItem.favoriteList);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: likeButtonColor,
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
