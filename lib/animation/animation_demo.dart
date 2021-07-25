import 'dart:math';

import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  bool _isPlay = true;
  double _height = 0;
  double _width = 0;
  Color _colorEnd = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addListener(() {
      setState(() {
        _height = 100;
      });
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
    _controller.forward();
  }

  final random = Random();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animation Demo"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            FadeTransition(
                child: ProductBox(
                    name: "iPhone",
                    description: "iPhone is the stylist phone ever",
                    price: 1000,
                    image: "pic_01.jpg"),
                opacity: _animation),
            MyAnimatedWidget(
                child: ProductBox(
                    name: "Pixel",
                    description: "Pixel is the most featureful phone ever",
                    price: 800,
                    image: "pic_02.jpg"),
                animation: _animation),
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _colorEnd,
                borderRadius: _borderRadius,
              ),
              // Define how long the animation should take.
              duration: const Duration(seconds: 1),
              // Provide an optional curve to make the animation feel smoother.
              curve: Curves.fastOutSlowIn,
            ),
            const SizedBox(height: 10),
            Transform.rotate(
              angle: _animation.value,
              //origin: Offset(50.0, 50.0),
              child: Center(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Transform.scale(
              scale: _animation.value,
              origin: Offset(50.0, 50.0),
              child: Container(
                height: 50.0,
                width: 50.0,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            TweenAnimationBuilder(
                tween: ColorTween(begin: Colors.black, end: _colorEnd),
                duration: Duration(seconds: 1),
                builder: (context, color, child) {
                  return Center(
                    child: Container(color: color, height: 100, width: 100),
                  );
                })
          ],
        ),
        // To play TweenAnimationBuilder and AnimatedContainer
        floatingActionButton: FloatingActionButton(
          // When the user taps the button
          onPressed: () {
            //Stop all animation

            if (_isPlay) {
              _isPlay = false;
              _controller.stop();
            } else {
              _isPlay = true;
              _controller.forward();
            }

            // Use setState to rebuild the widget with new values.
            setState(() {
              // Create a random number generator.
              final random = Random();

              // Generate a random width and height.
              _height = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              // Generate a random color.
              _colorEnd = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              // Generate a random border radius.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
          child: _isPlay ? Icon(Icons.play_arrow) : Icon(Icons.pause),
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}

class MyAnimatedWidget extends StatelessWidget {
  MyAnimatedWidget({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Container(
                  child: Opacity(opacity: animation.value, child: child),
                ),
            child: child),
      );
}
