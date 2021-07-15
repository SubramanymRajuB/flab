import 'package:flutter/material.dart';

import 'grid_count.dart';  
  
class GridCustom extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
        appBar: AppBar(  
          title: Text("Flutter GridView Custom Demo"),  
          //leading: Icon(Icons.arrow_back),
        ), 
        body: 
        GridView.custom(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //childAspectRatio: (2 / 1),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              ),
          childrenDelegate: SliverChildListDelegate(
            choices.map((data) =>
                GestureDetector(
                    onTap: (){
                      //Navigator.of(context).pushNamed(RouteName.GridViewExtent);
                    },
                    child: SelectCard(choice: data)),

            ).toList(),
          )
        ) 
    );  
  }  
}