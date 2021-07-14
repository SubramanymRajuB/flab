import 'package:flab/rest_api/service/users_service.dart';
import 'package:flutter/material.dart';

import 'models/photos_model.dart';
import 'models/user_model.dart';
import 'service/photo_service.dart';

class RestAPIDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API Demo'),
      ),
        body : 
        //From API
          // FutureBuilder<List<UserDetails>>(
          //   future: getAllEmployees(),
          //   builder: (context, snapshot) {
          //     if(snapshot.hasError){
          //         return Text("Error");
          //       }
          //      else if (!snapshot.hasData) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } 
          //       else {
          //         return ListView.separated(
          //           separatorBuilder: (context, index) => Divider(
          //             color: Colors.black12,
          //           ),
          //           itemCount: snapshot.data.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             return ListTile(
          //               leading: Text(
          //                 "${index + 1}",
          //                 style: TextStyle(fontSize: 20.0),
          //               ),
          //               title: Text(
          //                   "Name: ${snapshot.data[index].name}   Adress: ${snapshot.data[index].address.city} "),
          //               subtitle: Text('EMAIL: ${snapshot.data[index].email}'),
          //             );
          //           },
          //         );
          //       }
          //   }

          //From Local JSON
          FutureBuilder<List<Photo>>(
            future: loadPhotos(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                  return Text("Error");
                }
               else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } 
                else {
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black12,
                    ),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        title: Text(
                            "Name: ${snapshot.data[index].title}"),
                        subtitle: Image.network(
                          snapshot.data[index].thumbnailUrl,
                          width: 60,
                          height: 100,
                          loadingBuilder: (context, child, progress){
                            return progress==null ? child:LinearProgressIndicator();
                          },
                        ),
                      );
                    },
                  );
                }
            }
        )
    );
  }

}