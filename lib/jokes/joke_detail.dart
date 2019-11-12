import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/jokes/joke_http.dart';
import 'package:flutterdemo/jokes/joke_item.dart';
import 'models/joke_model.dart';

class FTJokeDetail extends StatefulWidget{
  FTJokeDetail({this.identifier}):super();
  final identifier;
  @override
  State<StatefulWidget> createState() => _FTJokeDetailState();
}

class _FTJokeDetailState extends State<FTJokeDetail> {

  List<FTJokeModel> models = [];

  @override
  void initState() {
    _req();
    super.initState();
  }

  void _req(){
    FTJokeRequest.getJokes(widget.identifier, null, (List<FTJokeModel> res){
      setState(() {
        models = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        // padding: EdgeInsets.only(bottom: 100),
        
        itemCount: models.length,
        itemBuilder: (BuildContext context, int index) {
        return FTJokeItem(model: models[index]);
      },
    )
    );
  }
}

