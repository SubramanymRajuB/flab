import 'package:dio/dio.dart';
import 'package:flab/rest_api/models/user_model.dart';

Future<List<UserDetails>> getAllEmployees() async {
  var url = "https://jsonplaceholder.typicode.com/users";

  // final response = await http.get(Uri.parse(url));
  // return allUsersFromJson(response.body);

  Response response = await Dio().get(url);
  var userList = List<UserDetails>.from(
      (response.data as List).map((user) => UserDetails.fromJson(user)));
  return userList;
}
