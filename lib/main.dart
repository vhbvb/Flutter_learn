import 'package:flutterdemo/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new FlutterTest());

class FlutterTest extends StatefulWidget {

  @override
   _FTAppState createState() => new _FTAppState();
}

class _FTAppState extends State<FlutterTest> {

    @override
      Widget build(BuildContext context) {
        return new MaterialApp(
          title: "Flutter Go",
          color: Colors.lightBlue,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,//主题色
            primaryColor: Colors.lightBlue,//导航栏颜色
            canvasColor: Colors.white,//画布颜色
          ),
          home: new FTHomePage(
            title: "Flutter Go",
          )
        );
      }
}