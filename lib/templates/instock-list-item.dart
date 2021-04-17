import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickumber/objects/item.dart';

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

  removeFavorite(String item)
  {
    ListItem.favoriteList.remove(item);
      likeButtonColor = Colors.black12;
  }

  _ListItemState(this.item, this.key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //IMAGE
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  this.item.displayImgUrl,
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                ),
              ),
            ),

            //CENTER-PORTION
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    this.item.displayName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(this.item.price.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    width: 150,
                    child: Row(
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
                                  if(amount != 0)
                                    amount--;
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
                          amount.toString() + " " + this.item.unit,
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
                                  if(amount < 100)
                                    amount++;
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
                    ),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Container(
                    width: 170,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
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
                      height: 30,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "\$10 Discount",
                            style: TextStyle(fontSize: 11.0),
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
                        Icons.circle,
                        color: likeButtonColor,
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
