import 'package:flab/devtools/rounded_card.dart';
import 'package:flutter/material.dart';
import 'item_line.dart';
import 'lorem_ipsum.dart';

class YellowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.yellow,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ItemLine(name: loremIpsum[index % loremIpsum.length]);
        },
      ),
    );
  }
}
