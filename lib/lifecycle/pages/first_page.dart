import 'package:flutter/material.dart';

import 'new_page.dart';

class IntializeTitle extends StatefulWidget {
    @override
  _IntializeTitleState createState() => _IntializeTitleState();
}

class _IntializeTitleState extends State<IntializeTitle> {
  String title = 'First Page Old Title';
  VoidCallback onPressed;
  void updateTitle(){
    setState(() {
      title='First Page New Title';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstPage(title: title, onPressed: updateTitle,),
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title, this.onPressed}) : super(key: key);

  final String title;
  final VoidCallback onPressed; // For understanding didUpdateWidget

//Widget Life cycles
  @override
  _FirstPageState createState() {
    print("1: Create State");
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {

//Widget Life cycles
  @override
  void initState() {
    print("2: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("3: didChangeDependencies");
    super.didChangeDependencies();
  }
  
    int count = 0;
    void _increment(){
      setState(() {
           print("6: setState");
           count++;
          });
    }
  
  @override
  Widget build(BuildContext context) {
    
    print("4: build");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'counter value is: $count',
                ),
                SizedBox(height: 8.0,),
                Text(
                  'Orientation: $orientation',
                ),
                SizedBox(height: 8.0,),
                ElevatedButton(
                  child: Text('DidUpdateWidget'),
                  onPressed: widget.onPressed,
                ),
                SizedBox(height: 8.0,),
                ElevatedButton(
                  child: Text('Navigate to new route'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NewPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: (){
          _increment();
        }
      ),
    );
  }

  @override
  void didUpdateWidget(covariant FirstPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("5: didUpdateWidget");
    if(this.widget.title!=oldWidget.title){
      print("Title Changed");
    }
  }

  @override
  void deactivate() {
    print("7: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("8: dispose");
    super.dispose();
  }

}

