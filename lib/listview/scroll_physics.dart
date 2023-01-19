import 'package:flutter/material.dart';

class ListScrollPhysics extends StatelessWidget {
  final items = List<String>.generate(30, (i) => 'Item $i');
  final FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text('ListView physics and selection'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white70,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          )),
      body:
          //  ListView.builder(
          //   physics: new ClampingScrollPhysics(), //new ClampingScrollPhysics(), new NeverScrollableScrollPhysics(), new BouncingScrollPhysics()
          //   itemCount: items.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text('${items[index]}'),
          //       onTap: (){
          //         AlertDialog alert = AlertDialog(
          //           title: Text("Selected: "),
          //           content: Text("${items[index]}")
          //         );

          //         showDialog(
          //           context: context,
          //           builder: (BuildContext context) {
          //             return alert;
          //           },
          //         );
          //       },
          //     );
          //   },
          // ),

          ListWheelScrollView(
        controller: fixedExtentScrollController,
        physics: FixedExtentScrollPhysics(),
        useMagnifier: false,
        magnification: 1.5,
        diameterRatio: 1.5,
        offAxisFraction: -0.5,
        onSelectedItemChanged: (int index) {
          // AlertDialog alert = AlertDialog(
          //         title: Text("Selected: "),
          //         content: Text("${items[index]}")
          //       );

          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return alert;
          //         },
          //       );
        },
        children: items.map((month) {
          return Card(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  month,
                  style: TextStyle(fontSize: 18.0),
                ),
              )),
            ],
          ));
        }).toList(),
        itemExtent: 60.0,
      ),
    ));
  }
}
