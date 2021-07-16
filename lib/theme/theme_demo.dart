import 'package:flutter/material.dart';

class ThemesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  //   final darkTheme = ThemeData(
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.black,
  //   brightness: Brightness.dark,
  //   backgroundColor: const Color(0xFF212121),
  //   accentColor: Colors.white,
  //   accentIconTheme: IconThemeData(color: Colors.black),
  //   dividerColor: Colors.black12,
  // );

  // final lightTheme = ThemeData(
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.white,
  //   brightness: Brightness.light,
  //   backgroundColor: const Color(0xFFE5E5E5),
  //   accentColor: Colors.black,
  //   accentIconTheme: IconThemeData(color: Colors.white),
  //   dividerColor: Colors.white54,
  // );

    return MaterialApp(
      theme: ThemeData(
          //brightness: Brightness.dark,
          primaryColor: Colors.redAccent,
          accentColor: Colors.blue,
          textTheme: TextTheme(
                        bodyText2:TextStyle(fontSize:30, color: Colors.blue),
                        headline1: TextStyle(fontSize: 32.0, fontStyle: FontStyle.italic, fontFamily: 'Hind')  
                      ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.redAccent)
            )
          ),
        ),
      darkTheme: ThemeData(
        // primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        accentColor: Colors.red,
        textTheme: TextTheme(
                        bodyText2:TextStyle(fontSize:30, color: Colors.blue),
                        headline1: TextStyle(fontSize: 31.0, color: Colors.yellow, fontStyle: FontStyle.italic, fontFamily: 'Hind')  
                      )
      ),//light or dark
      debugShowCheckedModeBanner: false,
      home: ThemesDemoPage(),
    );
  }
}
 
class ThemesDemoPage extends StatefulWidget {
  @override
  _ThemeState createState() => _ThemeState();
}
 
class _ThemeState extends State<ThemesDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Working on Themes"),
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.wb_sunny),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                  'https://api.timeforkids.com/wp-content/uploads/2019/09/final-cover-forest.jpg'),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Forests provide us with shelter, livelihoods, water, food and fuel security. All these activities directly or indirectly involve forests. Some are easy to figure out - fruits, paper and wood from trees, and so on. Others are less obvious, such as by-products that go into everyday items like medicines, cosmetics and detergents.',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text('In addition, 300 million people live in forests, including 60 million indigenous people.Yet, we are losing them.', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Button with MediaQuery size for width"),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  //Theme specific to widget
                  child: Theme(
                    data: ThemeData(
                      elevatedButtonTheme: ElevatedButtonThemeData(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                            )
                        )
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Theme widget with ElevatedButton.style"),
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  //Theme specific to widget
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Theme Body Text',
                      style: Theme.of(context).textTheme.bodyText1
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'TextTheme'
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'headline1 Text',
                  style: Theme.of(context).textTheme.headline1 ,
                ),
              )
            ],
          ),
        ),
        // floatingActionButton: Theme(
        //   data: ThemeData.dark(),
        //   child: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: (){
              
        //   },
        // ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
            
        },
        ),
        );
  }
}