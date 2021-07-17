import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.grey,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: 'car',),
                Tab(icon: Icon(Icons.directions_transit), text: 'transit'),
                Tab(icon: Icon(Icons.directions_bike), text: 'bike'),
              ],
              onTap: (index){

              },
            ),
            title: Text('Tabs Demo'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white70,),
              onPressed: (){
                Navigator.of(context, rootNavigator: true).pop(context);
              },
              ),
            actions : [IconButton(
              icon: Icon(Icons.border_bottom, color: Colors.white70,),
              onPressed: (){
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNav()),
                    );
              }
            )]
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}



