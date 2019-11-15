import 'dart:core';
import 'dart:core' as prefix0;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterdemo/const.dart';

class FTSelectCards extends StatefulWidget {
  @override
  FTSelectCards({this.feed, this.onPan, this.onResult})
      : assert(feed != null && onPan != null && onResult != null),
        super();
  Function(int index) feed;
  Function(Offset offset) onPan;
  Function(bool cancel, bool like) onResult;

  State<StatefulWidget> createState() => _FTSelectCardsState();
}

class _FTSelectCardsState extends State<FTSelectCards>
    with SingleTickerProviderStateMixin {
  final double padding = 25;
  final double hwRate = 1.5;
  final double selectOffset = 100;

  AnimationController controller;
  Animation<Offset> animation;

  Offset offset = Offset(0, 0);
  bool allowTransform = true;
  bool reserve = false;

  int index = 0; //目前显示的第几张
  List<Widget> cards = [];

  // 此函数在滑动后回调
  panDidCompleted(bool cancel, bool like) {
    widget.onResult(cancel, like);
    print("cancel:" + cancel.toString());
    print("like:" + like.toString());
    if (!cancel) {
      this.setState(() {
        index = index + 1;
        offset = Offset(0, 0);
      });
    }
  }

  Widget _createCard(int index) {
    Widget card;
    if (cards.length > index) {
      card = cards[index];
    } else {
      card = widget.feed(index);
      cards.add(card);
    }

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: Consts.screenSize(context).width - padding * 2,
        height: (Consts.screenSize(context).width - padding * 2) * hwRate,
        child: card,
      ),
    );
  }

  List<Widget> _cards() {
    double total = pi / 15.0;
    double angle = (offset.dx / 750.0) * total;
    if (reserve) {
      angle = -angle;
    }

    double vpt = 200;
    double vptRate = (offset.dx.abs() < vpt ? offset.dx.abs() : vpt) / vpt;

    Widget first = _createCard(index);
    Widget second = _createCard(index + 1);
    Widget third = _createCard(index + 2);
    Widget fourth = _createCard(index + 3);

    return [
      Positioned(
        top: 10 + padding,
        left: 10 + padding,
        child: fourth,
      ),
      Positioned(
        top: padding + 5 * (2 - vptRate),
        left: padding + 5 * (2 - vptRate),
        child: third,
      ),
      Positioned(
        top: padding + 5 * (1 - vptRate),
        left: padding + 5 * (1 - vptRate),
        child: second,
      ),
      Positioned(
        top: padding + offset.dy,
        left: padding + offset.dx,
        child: Transform.rotate(
          angle: angle,
          child: first,
        ),
      )
    ];
  }

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // color: Colors.red,
        // alignment: Alignment.center,
        child: Stack(children: _cards()),
      ),
      onPanUpdate: (DragUpdateDetails detail) {
        setState(() {
          double x = offset.dx + detail.delta.dx;
          double y = offset.dy + detail.delta.dy;
          offset = Offset(x, y);
          widget.onPan(offset);
        });
      },
      onPanEnd: (DragEndDetails detail) {
        print("onPanEnd");

        Animation curve =
            CurvedAnimation(parent: controller, curve: Curves.easeIn);

        Offset end = Offset(0, 0);

        if (offset.dx > selectOffset) {
          end = Offset(Consts.screenSize(context).width, 0);
        } else if (offset.dx < -selectOffset) {
          end = Offset(-Consts.screenSize(context).width, 0);
        }

        animation = Tween(begin: offset, end: end).animate(curve)
          ..addListener(() {
            setState(() {
              offset = animation.value;
            });
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              if (!allowTransform) {
                //回调可能回调用2次
                panDidCompleted(offset.dx.abs() < selectOffset, offset.dx < 0);
              }
              allowTransform = true;
            }
          });
        controller.forward();
      },
      onPanStart: (DragStartDetails detail) {
        if (allowTransform) {
          double screenWidth = Consts.screenSize(context).width;
          bool canPan = detail.localPosition.dx > padding &&
              detail.localPosition.dx < (screenWidth - padding) &&
              detail.localPosition.dy > padding &&
              detail.localPosition.dy <
                  (padding + hwRate * (screenWidth - 2 * padding));
          if (canPan) {
            allowTransform = false;
            controller.reset();
            offset = Offset(0, 0);
            widget.onPan(offset);
            reserve = detail.localPosition.dy >
                (padding + (screenWidth - 2 * padding) * hwRate / 2);
          }
        }
      },
    );
  }
}
