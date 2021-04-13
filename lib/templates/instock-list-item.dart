import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickumber/objects/item.dart';

class ListItem extends StatefulWidget {
  Item item;

  ListItem(this.item);

  @override
  State<StatefulWidget> createState() => _ListItemState(item);
}

class _ListItemState extends State<ListItem> {
  Item item;

  _ListItemState(this.item);

  Color likeButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
        height: 150,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                this.item.displayImgUrl,
                height: 100,
                width: 100,
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(this.item.displayName, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(this.item.price.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Ink(
                              decoration: ShapeDecoration(
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text(this.item.unit, style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 20,),
                          Container(
                            height: 40,
                            width: 40,
                            child: Ink(
                              decoration: ShapeDecoration(
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              child: IconButton(
                                // splashColor: Colors.transparent,
                                // highlightColor: Colors.transparent,
                                onPressed: () {},
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
                    SizedBox(height: 10,),
                    Container(
                      width: 170,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text('Add to Cart', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                    )
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed: () {}, child: Text("\$10 Discount")),
                IconButton(
                    onPressed: () {
                      setState(() {
                        likeButtonColor == Colors.grey
                            ? likeButtonColor = Colors.red
                            : likeButtonColor = Colors.grey;
                      });
                    },
                    icon: Icon(
                      Icons.circle,
                      color: likeButtonColor,
                    ))
              ],
            )
          ],
        ));
  }
}
