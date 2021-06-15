import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickumber/objects/item.dart';
import 'package:quickumber/scale-config.dart';
import 'package:quickumber/templates/add-or-remove.dart';

class ItemDescription extends StatelessWidget {
  Item item;

  ItemDescription(this.item);

  Color likeButtonColor = Colors.black12;

  addFavorite(String item) {
    //ListItem.favoriteList.add(item);
    likeButtonColor = Colors.red;
  }

  removeFavorite(String item) {
    //ListItem.favoriteList.remove(item);
    likeButtonColor = Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    ScaleConfig().init(context);
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(
          ScaleConfig.blockSizeHorizontal * 1,
          ScaleConfig.blockSizeVertical * 1,
          ScaleConfig.blockSizeHorizontal * 1,
          ScaleConfig.blockSizeVertical * 1),
      //clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /** IMAGE */
          Flexible(
            flex: 2,
            child: Image.network(
              this.item.displayImgUrl,
              fit: BoxFit.fill,
            ),
          ),

          /** SUB TITLE */
          Flexible(
            flex: 1,
            child: Container(
              //padding: EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          this.item.displayName,
                          style: TextStyle(
                              fontSize: ScaleConfig.blockSizeVertical * 3,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          this.item.price.toString(),
                          style: TextStyle(
                              fontSize: ScaleConfig.blockSizeVertical * 3,
                              fontWeight: FontWeight.bold),
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "\$10 Discount",
                              style: TextStyle(
                                  fontSize: ScaleConfig.blockSizeVertical * 2),
                            )),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          // setState(() {
                          //   likeButtonColor == Colors.black12
                          //       ? addFavorite(this.item.uid)
                          //       : removeFavorite(this.item.uid);
                          // });
                        },
                        icon: Icon(
                          Icons.circle,
                          color: likeButtonColor,
                        ))
                  ]),
            ),
          ),

          /** DESCRIPTION */
          Flexible(
            flex: 2,
            child: Text(
              this.item.description,
              style: TextStyle(fontSize: ScaleConfig.blockSizeVertical * 2.5),
            ),
          ),
          Divider(
            thickness: 5,
          ),

          /** FOOTER */
          Flexible(
            flex: 1,
            child: Container(
              //width: ScaleConfig.blockSizeHorizontal * 5,
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddOrRemoveItem(this.item.unit, MainAxisAlignment.center),
                    SizedBox(
                      height: ScaleConfig.blockSizeVertical * 2,
                    ),

                    /** ADD TO CART BUTTON */
                    Container(
                      width: ScaleConfig.blockSizeHorizontal * 40,
                      height: ScaleConfig.blockSizeVertical * 6,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: ScaleConfig.blockSizeVertical * 5),
                          textScaleFactor: 0.5,
                        ),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    ScaleConfig.blockSizeVertical * 5))),
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    ));
  }
}
