import 'package:flutter/material.dart';
import 'package:flutterdemo/jokes/joke_detail.dart';

class FTJokes extends StatefulWidget {

  @override
    State<StatefulWidget> createState() => _FTJokesState();
}

class _FTJokesState extends State<FTJokes> with SingleTickerProviderStateMixin
{
  final channels = {"推荐":"1","视频":"41","图文":"10","内涵段子":"29","音乐":"31","标题6":"1","标题7":"1","标题8":"1","标题9":"1"};
  TabController _tapController;
  // ScrollController _scrollController;

  @override
  void initState() {
    _tapController = TabController(vsync: this, length: channels.length)..addListener((){
      // _tapController.indexIsChanging
      // print(_tapController.offset);
    });

    _tapController.animation.addListener((){
      print(_tapController.animation.status);
      print(_tapController.animation.value);
    });

    // _scrollController = ScrollController();
    super.initState();
  }

  List<Widget> _createTaps() {
    return channels.entries.map((entry){
      return Text(entry.key);
    }).toList();
  }

  List<Widget> _creatTabViews() {
    return channels.entries.map((f){
      return FTJokeDetail(identifier: f.value);
    }).toList();
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("网易新闻",style: TextStyle(color: Colors.red))
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 44.0,
              child: TabBar(
                isScrollable: true,
                controller: _tapController,
                tabs: _createTaps(),
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                indicator:UnderlineTabIndicator(
                  borderSide: BorderSide(style: BorderStyle.none)
                )
              ),
            ),

            Expanded (
              child: TabBarView(
                controller: _tapController,
                children: _creatTabViews(),
              )
            )
          ],
        )
      );
    }
}