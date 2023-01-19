import 'package:flutter/material.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        body: _DemoPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.orange,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                color: Colors.cyanAccent,
                width: 80.0,
                height: 80.0,
              ),
              Center(
                  child: Container(
                padding: const EdgeInsets.all(0.0),
                color: Colors.cyanAccent,
                width: 80.0,
                height: 80.0,
              )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    color: Colors.cyanAccent,
                    width: 80.0,
                    height: 80.0,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(24, 32, 24, 32),
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    color: Colors.cyanAccent,
                    width: 80.0,
                    height: 80.0,
                  )),
              SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: Card(
                      color: Colors.indigoAccent,
                      child: Center(
                          child: Text(
                        'SizedBox',
                        style: TextStyle(color: Colors.white),
                        textDirection: TextDirection.ltr,
                      )))),
              Flexible(
                child: Container(color: Colors.cyan, height: 80),
                flex: 1,
                fit: FlexFit.tight, //simialr to expand
              ),
              Flexible(
                child: Container(color: Colors.indigoAccent, height: 80),
                fit: FlexFit.tight,
                flex: 2,
              ),
              Flexible(
                child: Container(color: Colors.red, height: 80),
                fit: FlexFit.tight,
                flex: 3,
              ),
              Expanded(
                child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    fit: StackFit
                        .loose, //expand value stack should wrapped inside expanded widget
                    children: <Widget>[
                      // Max Size Widget
                      Container(
                        height: 150,
                        width: 150,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            'Top Widget: Green',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 30,
                          left: 20,
                          child: Container(
                              height: 100,
                              width: 150,
                              color: Colors.orange,
                              child: Center(
                                child: Text(
                                  'First Widget',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ))),
                      Positioned(
                        top: 30,
                        right: 20,
                        child: Container(
                          height: 100,
                          width: 150,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Second Widget',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              // Stack(
              //   alignment: AlignmentDirectional.topStart,
              //   fit: StackFit.loose,
              //   textDirection: TextDirection.ltr,
              //   children: [
              //     Container(
              //       height: 200.0,
              //       width: 200.0,
              //       color: Colors.red,
              //     ),
              //     Positioned(
              //       top: 30,
              //       left: 30,
              //       child: Container(
              //         height: 150.0,
              //         width: 150.0,
              //         color: Colors.blue,
              //       ),
              //     ),
              //     Container(
              //       height: 50.0,
              //       width: 50.0,
              //       color: Colors.yellow,
              //     ),
              //   ],
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              // ),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.end,
                textDirection: TextDirection.ltr,
                spacing: 10,
                runSpacing: 10,
                children: [
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                ],
              ),
              Icon(
                Icons.flight_takeoff,
                color: Colors.blue,
                size: 18.0,
              ),
              Image.asset(
                'assets/pic_03.jpg',
                width: 60,
                height: 70,
                fit: BoxFit.fill,
                color: Colors.blueAccent,
                colorBlendMode: BlendMode.darken,
              ),
              Image.network(
                'http://example.com/dash.png',
                width: 60,
                height: 70,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.lightGreen,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0))
            ]),
        width: 50,
        height: 50);
  }
}
