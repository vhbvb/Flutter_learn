import 'package:flutter/material.dart';
import 'package:flutterdemo/im/im.dart';
import 'package:flutterdemo/share/share.dart';
import 'package:flutterdemo/tantan/tantan.dart';
import 'package:flutterdemo/ums/ums.dart';
import 'package:flutterdemo/jokes/jokes.dart';

class Router {
  Router({this.path}): super();

  String path;

  Map<String, dynamic> mypages = <String, dynamic>{
    'fg://share': 'share',
    'fg://im': 'im',
    'fg://ums': 'ums',
    'fg://nh': 'nh',
    'fg://tt': 'tt'
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
      case "nh":
        return FTJokes();
      case "tt":
        return FTTantan();
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
