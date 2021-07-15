import 'package:flab/grid_view/grid_builder.dart';
import 'package:flab/grid_view/grid_count.dart';
import 'package:flab/grid_view/grid_custom.dart';
import 'package:flab/grid_view/grid_extent.dart';
import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Demo's"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: new ClampingScrollPhysics(),
          children: [ 
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('GridView Count'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridCount()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('GridView Builder'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridBuilder()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Gridview Custom'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridCustom()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('GridView Extent'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridExtent()),
                    );
                  },
                )
              ],
            ),
          )
          ],
        ),
      )
    );
  }
}