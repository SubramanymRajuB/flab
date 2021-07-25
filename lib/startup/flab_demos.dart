import 'package:flab/animation/animation_demo.dart';
import 'package:flab/devtools/devtools_demo.dart';
import 'package:flab/drawer/drawer_demo.dart';
import 'package:flab/grid_view/gridview_demo.dart';
import 'package:flab/layouts/layouts_demo.dart';
import 'package:flab/lifecycle/lifecycle_manager.dart';
import 'package:flab/lifecycle/pages/first_page.dart';
import 'package:flab/listview/listview_demo.dart';
import 'package:flab/native/simple_msg.dart';
import 'package:flab/navigation/first_nav.dart';
import 'package:flab/rest_api/rest_api_demo.dart';
import 'package:flab/sqlite/sqlite_demo.dart';
import 'package:flab/sqlite/sqlite_demo_stream.dart';
import 'package:flab/state_mngmnt/bloc/bloc_demo.dart';
import 'package:flab/state_mngmnt/bloc/simple/simple_bloc_demo.dart';
import 'package:flab/state_mngmnt/getx/views/product_list.dart';
import 'package:flab/state_mngmnt/inherited/inherited_widget_simple.dart';
import 'package:flab/state_mngmnt/inherited/pages/Inherite_demo.dart';
import 'package:flab/state_mngmnt/mobx/mobx_demo.dart';
import 'package:flab/state_mngmnt/provider/provider_demo.dart';
import 'package:flab/state_mngmnt/redux/model/app_state.dart';
import 'package:flab/state_mngmnt/redux/redux/reducers.dart';
import 'package:flab/state_mngmnt/redux/redux_demo.dart';
import 'package:flab/tab/tab_bar_demo.dart';
import 'package:flab/theme/theme_demo.dart';
import 'package:flab/validation/login_validation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class Welcome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo\'s',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(title: 'Flutter Demo\'s'),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  child: Text('LifeCycle Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LifeCycleManager(
                        child: IntializeTitle())),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Layouts Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LayoutDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Animation Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnimationDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('ListView Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListViewDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('GridView Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridViewDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Drawer Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DrawerDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('TabBar Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TabBarDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Forms Validation Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginForm()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Themes Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThemesDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Navigation Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigarionDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('InheritedWidget & InheritedModel'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InheritedDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Provider Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProviderDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Bloc Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SimpleBLocDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('MobX Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MobXDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('GetX Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GetXDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('ReduX Demo'),
                  onPressed: (){
                    Store<AppState> reduxStore =
                    Store<AppState>(reducer, initialState: AppState(sliderFontSize: 0.5));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReduxDemo(reduxStore)),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Native API Acess Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SimplePlatformMsg()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Rest API Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RestAPIDemo()),
                      // MaterialPageRoute(builder: (context) => SQLiteStreamDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('SQLite Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SQLiteDemo()),
                      // MaterialPageRoute(builder: (context) => SQLiteStreamDemo()),
                    );
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Dart Dev Tools Demo'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DevToolsDemo())
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