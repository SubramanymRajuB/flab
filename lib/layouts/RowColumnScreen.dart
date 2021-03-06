import "package:flutter/material.dart";
import 'package:flab/views/app_bar.dart';
import 'package:flab/constants/main_const.dart';
import 'package:flab/views/row_column_selector.dart' show RowColumnSelector, LayType;
import 'package:flab/constants/size_const.dart';
class RowColumnScreen extends StatefulWidget {
  RowColumnScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _RowColumnState createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumnScreen> {
  LayType _layType = LayType.row;
  MainAxisSize _size = MainAxisSize.min;
  MainAxisAlignment _mainAlign = MainAxisAlignment.start;
  CrossAxisAlignment _crossAlign = CrossAxisAlignment.start;

  void _changeLayout(LayType type) {
    setState(() {
      _layType = type;
    });
  }

  void _changeMainSize(MainAxisSize size) {
    setState(() {
      _size = size;
    });
  }

  void _changeMainAlign(MainAxisAlignment align) {
    setState(() {
      _mainAlign = align;
    });
  }

  void _changeCrossAlign(CrossAxisAlignment align) {
    setState(() {
      _crossAlign = align;
    });
  }

  Widget _body() {
    List<Widget> children = [
      Icon(
        Icons.add_a_photo,
        size: 50,
        color: BAR_BACK_COLORS[widget.group.index],
      ),
      Icon(
        Icons.add_a_photo,
        size: 100,
        color: BAR_BACK_COLORS[widget.group.index],
      ),
      Icon(
        Icons.add_a_photo,
        size: 50,
        color: BAR_BACK_COLORS[widget.group.index],
      )
    ];
    return _layType == LayType.column
        ? Column(
            mainAxisSize: _size,
            mainAxisAlignment: _mainAlign,
            crossAxisAlignment: _crossAlign,
            children: children,
          )
        : Row(
            mainAxisSize: _size,
            mainAxisAlignment: _mainAlign,
            crossAxisAlignment: _crossAlign,
            children: children,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
          group: widget.group,
          itemType: ItemType.row_column,
          onClick: widget.onClick,
          right: IconButton(
          icon: Icon(Icons.cancel, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          ),
          bottomView: PreferredSize(
            preferredSize: Size(0.0, SELECTOR_TWO_HEIGHT),
            child: RowColumnSelector(
              clickLayout: _changeLayout,
              clickMainSize: _changeMainSize,
              clickMainAlign: _changeMainAlign,
              clickCrossAlign: _changeCrossAlign,
              mainColor: Colors.white,
            ),
          )),
      body: Container(
        color: Colors.black26,
        child: _body(),
      ),
    );
  }
}
