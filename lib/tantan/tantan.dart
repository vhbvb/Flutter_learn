import 'package:flutter/material.dart';
import 'package:flutterdemo/tantan/cards.dart';

class FTTantan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FTTantanState();
}

class _FTTantanState extends State<FTTantan> {
  List images = [
    "http://hbimg.b0.upaiyun.com/828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658",
    "http://hbimg.b0.upaiyun.com/bbc54cf0b3296636d30a28467ed209637f3a465d7c48f-ywKTo0_fw658",
    "http://i2.sinaimg.cn/ent/s/m/p/2007-12-25/U1145P28T3D1849968F326DT20071225140655.jpg",
    "http://img2.utuku.china.com/uploadimg/game/20161214/5b5fb0df-8cbe-4ba6-a81d-ddd5ac17305d.jpg",
    "http://pic49.nipic.com/file/20140921/7796254_034538760000_2.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573796674000&di=58c20d7e3855103393336c556484d94d&imgtype=0&src=http%3A%2F%2Fimg004.hc360.cn%2Fm1%2FM04%2F60%2FD1%2FwKhQb1Q0nQqEbwD7AAAAABl7BXM148.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573796674000&di=52e22e975edc33221608f970eab282b3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F055d4449f21d81d9437c60924cdf292c4831bc0b73bda-0s9suh_fw236",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573796674000&di=bf238e485a09854c90df0768dda839e8&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201204%2F20%2F20120420182113_QXFcy.thumb.700_0.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573796673999&di=598e820b805889fb7393d5a478f7110a&imgtype=0&src=http%3A%2F%2Fwww.doubor.com%2Fwp-content%2Fuploads%2F2016%2F07%2F111589890433068418.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573796673999&di=74b309ce156d013ccd4b8bc0c807f1d6&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F0b58c501507d44d00ab4c55b8868771c0c8775754841-Qp00Oj_fw658"
  ];

  String finish =
      "http://b-ssl.duitang.com/uploads/item/201805/05/20180505144831_hqbyw.thumb.700_0.jpeg";

  double offsetX = 0;

  double _likeRate() {
    if (offsetX < 0) {
      double r = (offsetX / 100).abs();
      return (r > 1 ? 1 : r);
    }
    return 0;
  }

  double _unlikeRate() {
    if (offsetX > 0) {
      double r = offsetX / 100;
      return (r > 1 ? 1 : r);
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("探探", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
      ),
      body: Stack(
        children: <Widget>[
          FTSelectCards(
            feed: (index) {
              
              if (index < images.length) {
                return Image.network(images[index],fit: BoxFit.fill);
              }else{
                return Image.network(images.last,fit: BoxFit.fill);
              }

            },
            onPan: (Offset offset) {
              setState(() {
                offsetX = offset.dx;
              });
            },
            onResult: (bool cancel,bool like){
              setState(() {
                offsetX = 0;
              });
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Opacity(
                        opacity: _likeRate(),
                        child: Image.asset("assets/like.png",
                            height: 33 + 10 * _likeRate(),
                            width: 33 + 10 * _likeRate()),
                      ),
                    ),
                    Expanded(
                        child: Opacity(
                      opacity: _unlikeRate(),
                      child: Image.asset("assets/unlike.png",
                          height: 33, width: 33),
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
