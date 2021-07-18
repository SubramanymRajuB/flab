import 'package:flutter/material.dart';

class InheritedWidgetDemo extends StatelessWidget {  
 @override  
 Widget build(BuildContext context) {  
   return Scaffold(  
     body: CounterProvider(  
       counter: Counter(0),  
       child: InheritedWidgetTest(),  
     ),  
   );  
 }  
}  
   
class InheritedWidgetTest extends StatefulWidget {  
 InheritedWidgetTest({Key key, this.title}) : super(key: key);  
 final String title;  
   
 @override  
 _InheritedWidgetTestState createState() => _InheritedWidgetTestState();  
}  
   
class _InheritedWidgetTestState extends State<InheritedWidgetTest> {  
 var counterProvider;  
 void _incrementCounter() {  
   setState(() {  
     counterProvider.counter.increment();  
   });  
 } 

 void _decrementCounter() {  
   setState(() {  
     counterProvider.counter.decrement();  
   });  
 }  
   
 @override  
 Widget build(BuildContext context) {  
   counterProvider = CounterProvider.of(context);  
   return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        title: Text(
          'Counter Inherited Widget Demo',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child:Text('Items add & remove: ${counterProvider.counter.count}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: new FloatingActionButton(
                    onPressed: _decrementCounter,
                    child: new Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: new FloatingActionButton(
                    onPressed: _incrementCounter,
                    child: new Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {  
 final Widget child;  
 final Counter counter;  
 CounterProvider({Key key, this.child, this.counter})  
     : super(key: key, child: child);  
   
 static CounterProvider of(BuildContext context) {  
   return (context.dependOnInheritedWidgetOfExactType<CounterProvider>());  
 }  
   
 @override  
 bool updateShouldNotify(CounterProvider oldWidget) 
 {  
   //return true;
   if(oldWidget.counter!=null){
   return counter.count != oldWidget.counter.count;  
   }
   return false;
 }  
}  
   
class Counter {  
  int count;  
  Counter(this.count);  

  increment() {  
    count++;  
  }   
  
  decrement() {  
    count--;  
  } 
}  
