import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickumber/login-form.dart';
import 'package:quickumber/signup-form.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.blue, Colors.green],
          ),
        ),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("QuickUmber",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 40)),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLogin = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, onPrimary: Colors.green),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                OutlineButton(
                    onPressed: () {
                      setState(() {
                        isLogin = true;
                      });
                    },
                    borderSide: BorderSide(
                      color: Colors.white, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 3, //width of the border
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            isLogin == true ? LoginForm() : SignUpForm(),
            Divider(
              thickness: 2,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  SizedBox(
                      height: 50,
                      width: 500,
                      child: OutlineButton(
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 3, //width of the border
                          ),
                          child: Text(
                            'LOGIN WITH GMAIL',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      height: 50,
                      width: 500,
                      child: OutlineButton.icon(
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 3, //width of the border
                          ),
                          icon: const Icon(
                            Icons.add,
                            size: 18,
                            color: Colors.white,
                          ),
                          label: Text(
                            'LOGIN WITH FACEBOOK',
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
