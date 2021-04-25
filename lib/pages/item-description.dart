import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickumber/objects/item.dart';
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
    return Scaffold(
        body: Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /** IMAGE */
          Flexible(
            flex: 3,
            child: Image.network(
              this.item.displayImgUrl,
              fit: BoxFit.fill,
            ),
          ),

          /** SUB TITLE */
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
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
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          this.item.price.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "\$10 Discount",
                              style: TextStyle(fontSize: 11.0),
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
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  this.item.description,
                  style: TextStyle(fontSize: 17),
                )),
          ),

          Divider(thickness: 5,),

          /** FOOTER */
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(150.0, 50.0)),
                    child: AddOrRemoveItem(this.item.unit)),

                SizedBox(height: 20,),

                /** ADD TO CART BUTTON */
                Container(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
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
