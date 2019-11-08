import 'package:flutter/material.dart';
import 'package:flutterdemo/im/im.dart';
import 'package:flutterdemo/share/share.dart';
import 'package:flutterdemo/ums/ums.dart';
import 'package:flutterdemo/wechat/wechat.dart';

class Router {
  Router({this.path}): super();

  String path;

  Map<String, dynamic> mypages = <String, dynamic>{
    'fg://share': 'share',
    'fg://im': 'im',
    'fg://ums': 'ums',
    'fg://wechat': 'wechat'
  };

  Widget route() {
    String pageId = mypages[path];
    return getPageFromPageId(pageId);
  }

  Widget getPageFromPageId(String pageId) {
    print("---------->" + pageId);
    switch (pageId) {
      case 'share':
        return FTShareHomePage();
      case 'im':
        return FTIMHomePage();
      case "ums":
        return FTUMSHomePage();
      case "wechat":
        return FTWechat();
    }
    return null;
  }

  void push(BuildContext context) {
    Widget t = this.route();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => t
    ));
  }
}
