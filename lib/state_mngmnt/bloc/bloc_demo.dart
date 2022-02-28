import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'weather_bloc.dart';
import 'weather_model.dart';
import 'weather_repo.dart';

class BlocDemo extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        // body: BlocProvider(
        //   create: (context) => WeatherBloc(WeatherRepo()),
        //   child: SearchPage(),
        // ),
        body: BlocProvider(
          create: (context) => WeatherCubit(WeatherRepo()),
          child: SearchPage(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherCubit>(context);
    var cityController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Bloc Demo",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Container(
            child: FlareActor(
              "assets/WorldSpin.flr",
              fit: BoxFit.contain,
              animation: "roll",
            ),
            height: 300,
            width: 300,
          )),
          BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherIsNotSearched)
                return Container(
                  padding: EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Search Weather",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      ),
                      Text(
                        "Instanly",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: Colors.white70),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white70,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.white70,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid)),
                          hintText: "City Name",
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            weatherBloc.FetchWeather(cityController.text);
                            //weatherBloc.add(FetchWeather(cityController.text));
                          },
                          child: Text(
                            "Search",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              else if (state is WeatherIsLoading)
                return Center(child: CircularProgressIndicator());
              else if (state is WeatherIsLoaded)
                return ShowWeather(state.getWeather, cityController.text);
              else
                return Text(
                  "Error",
                  style: TextStyle(color: Colors.white),
                );
            },
          )
          // BlocBuilder<WeatherBloc, WeatherState>(
          //   builder: (context, state){
          //     if(state is WeatherIsNotSearched)
          //       return Container(
          //         padding: EdgeInsets.only(left: 32, right: 32,),
          //         child: Column(
          //           children: <Widget>[
          //             Text("Search Weather", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white70),),
          //             Text("Instanly", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200, color: Colors.white70),),
          //             SizedBox(height: 24,),
          //             TextFormField(
          //               controller: cityController,

          //               decoration: InputDecoration(

          //                 prefixIcon: Icon(Icons.search, color: Colors.white70,),
          //                 enabledBorder: OutlineInputBorder(
          //                     borderRadius: BorderRadius.all(Radius.circular(10)),
          //                     borderSide: BorderSide(
          //                         color: Colors.white70,
          //                         style: BorderStyle.solid
          //                     )
          //                 ),

          //                 focusedBorder: OutlineInputBorder(
          //                     borderRadius: BorderRadius.all(Radius.circular(10)),
          //                     borderSide: BorderSide(
          //                         color: Colors.blue,
          //                         style: BorderStyle.solid
          //                     )
          //                 ),

          //                 hintText: "City Name",
          //                 hintStyle: TextStyle(color: Colors.white70),

          //               ),
          //               style: TextStyle(color: Colors.white70),

          //             ),

          //             SizedBox(height: 20,),
          //             Container(
          //               width: double.infinity,
          //               height: 50,
          //               child: ElevatedButton(
          //                 onPressed: (){
          //                   weatherBloc.add(FetchWeather(cityController.text));
          //                 },
          //                 child: Text("Search", style: TextStyle(color: Colors.white70, fontSize: 16),),

          //               ),
          //             )

          //           ],
          //         ),
          //       );
          //     else if(state is WeatherIsLoading)
          //       return Center(child : CircularProgressIndicator());
          //     else if(state is WeatherIsLoaded)
          //       return ShowWeather(state.getWeather, cityController.text);
          //     else
          //       return Text("Error",style: TextStyle(color: Colors.white),);
          //   },
          // )
        ],
      ),
    );
  }
}

class ShowWeather extends StatelessWidget {
  WeatherModel weather;
  final city;

  ShowWeather(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(
          children: <Widget>[
            Text(
              city,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              weather.getTemp.round().toString() + "C",
              style: TextStyle(color: Colors.white70, fontSize: 50),
            ),
            Text(
              "Temprature",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      weather.getMinTemp.round().toString() + "C",
                      style: TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    Text(
                      "Min Temprature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      weather.getMaxTemp.round().toString() + "C",
                      style: TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    Text(
                      "Max Temprature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<WeatherCubit>(context).ResetWeather();
                  //BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
                },
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            )
          ],
        ));
  }
}
