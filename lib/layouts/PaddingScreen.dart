import "package:flutter/material.dart";
import 'package:flab/views/app_bar.dart';
import 'package:flab/constants/main_const.dart';
import 'package:flab/views/padding_selector.dart';
import 'package:flab/constants/size_const.dart';
const _PADDING_TIMES = 5.0;

class PaddingScreen extends StatefulWidget {
  PaddingScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _PaddingState createState() => _PaddingState();
}

class _PaddingState extends State<PaddingScreen> {
  double paddingLeft = 0.0;
  double paddingRight = 0.0;
  double paddingTop = 0.0;
  double paddingBottom = 0.0;

  void _clickLeft(int pos) {
    setState(() {
      print("$pos");
      paddingLeft = _PADDING_TIMES * pos;
    });
  }

  void _clickRight(int pos) {
    setState(() {
      paddingRight = _PADDING_TIMES * pos;
    });
  }

  void _clickTop(int pos) {
    setState(() {
      paddingTop = _PADDING_TIMES * pos;
    });
  }

  void _clickBottom(int pos) {
    setState(() {
      paddingBottom = _PADDING_TIMES * pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.padding,
        onClick: widget.onClick,
        bottomView: PreferredSize(
            child: PaddingSelector(
              clickLeft: _clickLeft,
              clickRight: _clickRight,
              clickTop: _clickTop,
              clickBottom: _clickBottom,
              mainColor: Colors.white,
            ),
            preferredSize: Size(0.0, SELECTOR_TWO_HEIGHT)),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.deepPurple,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            paddingLeft,
            paddingTop,
            paddingRight,
            paddingBottom,
          ),
          child: Container(
            color: Colors.yellowAccent,
          ),
        ),
      ),
    );
  }
}
