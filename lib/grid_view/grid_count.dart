import 'package:flutter/material.dart'; 

class GridCount extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
        appBar: AppBar(  
          title: Text("Flutter GridView Count Demo"),  
          //leading: Icon(Icons.arrow_back),
        ),  
        body: 
        GridView.count(  
          crossAxisCount: 3,  
          crossAxisSpacing: 4.0,  
          mainAxisSpacing: 8.0,  
          children: List.generate(choices.length, (index) {  
            return Center(  
               child: SelectCard(choice: choices[index]),  
              );  
            }  
            )  
          )  
        
    );  
  }  
}  
  
class Choice {  
  const Choice({this.title, this.icon});  
  final String title;  
  final IconData icon;  
}  
  
const List<Choice> choices = const <Choice>[  
  const Choice(title: 'Home', icon: Icons.home),  
  const Choice(title: 'Contact', icon: Icons.contacts),  
  const Choice(title: 'Map', icon: Icons.map),  
  const Choice(title: 'Phone', icon: Icons.phone),  
  const Choice(title: 'Camera', icon: Icons.camera_alt),  
  const Choice(title: 'Setting', icon: Icons.settings),  
  const Choice(title: 'Album', icon: Icons.photo_album),  
  const Choice(title: 'WiFi', icon: Icons.wifi),  
];  
  
class SelectCard extends StatelessWidget {  
  const SelectCard({Key key, this.choice}) : super(key: key);  
  final Choice choice;  
  
  @override  
  Widget build(BuildContext context) {  
    final TextStyle textStyle = Theme.of(context).textTheme.display1;  
    return Card(  
        color: Colors.orange,  
        child: Center(child: Column(  
            crossAxisAlignment: CrossAxisAlignment.center,  
            children: <Widget>[  
              Expanded(child: Icon(choice.icon, size:50.0, color: textStyle.color)),  
              Text(choice.title, style: textStyle),  
            ]  
        ),  
        )  
    );  
  }  
}  