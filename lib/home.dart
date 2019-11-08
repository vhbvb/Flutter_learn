import 'package:flutter/material.dart';
import 'package:flutterdemo/route.dart';

class FTHomePage extends StatefulWidget {
  FTHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FTHomePageState createState() => new _FTHomePageState();
}


class _FTHomePageState extends State<FTHomePage> {


  Image _mainItem(int index) {

    switch (index) {
      case 0:
        return Image.asset("assets/main/sharesdk.png");
      case 1:
        return Image.asset("assets/main/ddk.png");
      case 2:
        return Image.asset("assets/main/ums.png");
      case 3:
        return Image.asset("assets/main/im.png");
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(top: 20,left: 10,right: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
          childAspectRatio: 2
        ), 
        itemBuilder: (BuildContext context, int index) {

          return GestureDetector(
            onTap: (){
             String path;
             switch (index) {
               case 0:
                 path = "fg://share";
                 break;
               case 1:
                 path = "fg://im";
                 break;
              case 2:
                 path = "fg://ums";
                 break;
              case 3:
                 path = "fg://wechat";
                 break;
               default:
             }
              Router(path: path).push(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(15),
                borderRadius: BorderRadius.circular(5)
              ),
              child: _mainItem(index),
            )
          );
        },
        itemCount: 4,
      )
    );
  }
}
