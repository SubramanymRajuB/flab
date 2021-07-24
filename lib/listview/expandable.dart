import 'package:flutter/material.dart';

final List<DataList> data = <DataList>[
  DataList(
    'Mobiles',
    <DataList>[
      DataList(
        'MI',
        <DataList>[
          DataList('Redmi Note 9'),
          DataList('Redmi Note 10'),
          DataList('Mi 10i 5G'),
        ],
      ),
      DataList('Samsung'),
      DataList('Apple'),
    ],
  ),
  DataList(
    'Laptops',
    <DataList>[
      DataList('Dell'),
      DataList('HP'),
    ],
  ),
  DataList(
    'Appliances',
    <DataList>[
      DataList('Washing Machine'),
      DataList('AC'),
      DataList(
        'Home Appliances',
        <DataList>[
          DataList('Water Purifier'),
          DataList('Inverter'),
          DataList('Vacuum Cleaner'),
        ],
      ),
    ],
  ),
];

class ExpandableListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expandable ListView in Flutter'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              DataPopUp(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

class DataPopUp extends StatelessWidget {
  const DataPopUp(this.popup);

  final DataList popup;

  Widget _buildTiles(DataList root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return Card(
      child: ExpansionTile(
        backgroundColor: Colors.amber,
        key: PageStorageKey<DataList>(root),
        // leading: Text("test"),
        // trailing: Text("n"),
        title: Text(
          root.title,
        ),
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(popup);
  }
}

class DataList {
  DataList(this.title, [this.children = const <DataList>[]]);

  final String title;
  final List<DataList> children;
}
