import 'package:flutter/material.dart';
import 'package:flutterdemo/const.dart';
import 'package:flutterdemo/jokes/models/joke_model.dart';

class FTJokeItem extends StatefulWidget {
  FTJokeItem({this.model}):super();

  final FTJokeModel model;
  
  @override
  State<StatefulWidget> createState() => _FTJokeItemState();
}

class _FTJokeItemState extends State<FTJokeItem> {
  
  Widget _createHeader() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: FadeInImage.assetNetwork(
              image:widget.model.profile_image,
              height: 44.0,
              width: 44.0,
              placeholder: "assets/flutter.png",
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 5)),
          Column(
            // mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.model.name),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                widget.model.created_at,
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _createContent() {
    List<Widget> widgets = [];
    Widget header = _createHeader();
    widgets.add(header);
    widgets.add(_createText());

    if (widget.model.type != "29") {
      widgets.add(_createMedia());
    }

    // add media part
    widgets.add(_createViews());
    widgets.add(Padding(padding: EdgeInsets.only(bottom: 10)));
    return widgets;
  }

  Widget _createText() => Padding(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(widget.model.text),
        ),
      );

  Widget _createViews() {

    String text = widget.model.love + "喜欢  " + widget.model.comment + "跟帖";
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(text,
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: _tapX,
                      child: Text("x",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    )))
          ],
        ));
  }

  Widget _createMedia() {
    
    double imageH = double.parse(widget.model.height)*Consts.screenSize(context).width/double.parse(widget.model.width);
    imageH = imageH > 1000? 1000:imageH;

    List<Widget> stacks = [];
    stacks.add(FadeInImage.assetNetwork(
      fit: BoxFit.fill,
      width: Consts.screenSize(context).width,
      height: imageH,
      placeholder: "assets/bg.jpeg",
      image: widget.model.image0
    ));

    bool isVoice = widget.model.type == "31";
    bool isVideo = widget.model.type == "41";

    if (isVideo || isVoice) {
      stacks.add(GestureDetector(
        onTap: _play,
        child: Image.asset(
          isVideo ? "assets/videoPlay.png" : "assets/voicePlay.png",
          height: 33,
          width: 33,
        ),
      ));

      stacks.add(Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          padding: EdgeInsets.only(left: 2, right: 2),
          color: Colors.grey.withAlpha(150),
          child: Text(widget.model.playcount + " 播放", style: TextStyle(color: Colors.white)),
        ),
      ));
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Stack(
        alignment: const FractionalOffset(0.5, 0.5),
        children: stacks,
      ),
    );
  }

  _tapX() {
    print("delete this post");
  }

  _play() {
    print("play this post");
  }

  @override
  void initState() {
    print(widget.model.toJson());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 7.5, right: 7.5),
        child: Container(
          color: Colors.white,
          child: Column(children: _createContent()),
        ));
  }
}
