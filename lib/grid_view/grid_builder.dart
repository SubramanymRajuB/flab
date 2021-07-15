import 'package:flutter/material.dart';

import 'grid_count.dart';  
  
  
class GridBuilder extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
        appBar: AppBar(  
          title: Text("Flutter GridView Builder Demo"),  
          //leading: Icon(Icons.arrow_back),
        ), 
        body: 
        GridView.builder(
          itemCount:choices.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).orientation ==
                  Orientation.landscape ? 3: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            //childAspectRatio: (2 / 1),
          ),
          itemBuilder: (context,index,) {
            return GestureDetector(
              onTap:(){
                //Navigator.of(context).pushNamed(RouteName.GridViewCustom);
              },
              child:SelectCard(choice: choices[index]));
          },
        )  
    );  
  }  
}