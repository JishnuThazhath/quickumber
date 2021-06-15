import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickumber/pages/instockpage.dart';
import 'package:quickumber/scale-config.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    //int padding = 10;

    ScaleConfig().init(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
            ScaleConfig.blockSizeHorizontal * 15,
            ScaleConfig.blockSizeVertical * 20,
            ScaleConfig.blockSizeHorizontal * 15,
            ScaleConfig.blockSizeVertical * 5),

        color: Colors.white70,

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  /**
                   * LOGO IMAGE
                   * */
                  ClipRRect(
                      borderRadius: BorderRadius.circular(
                          ScaleConfig.blockSizeVertical * 40),
                      child: Image.asset("assets/logo.jpeg")),

                  /**
                   * LOGO TEXT
                   * */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Quick",
                        style: TextStyle(
                            fontSize: ScaleConfig.blockSizeVertical * 6,
                            fontWeight: FontWeight.bold,
                        color: Colors.lightGreen),
                      ),
                      Text(
                        "Umber",
                        style: TextStyle(
                            fontSize: ScaleConfig.blockSizeVertical * 6,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: ScaleConfig.blockSizeVertical * 20,),

            /**
             * LOGIN BUTTON
             * */
            SizedBox(
              width: ScaleConfig.blockSizeHorizontal * 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              ScaleConfig.blockSizeVertical * 10))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InStock()));
                  },
                  child: Text("LOGIN")),
            ),

            /**
             * SIGNUP BUTTON
             * */
            SizedBox(
              width: ScaleConfig.blockSizeHorizontal * 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              ScaleConfig.blockSizeVertical * 10))),
                  onPressed: () {},
                  child: Text("SIGN UP")),
            ),
          ],
        ),
      ),
    );
  }
}
