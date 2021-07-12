import 'package:flutter/material.dart';


class LoginSimpleForm extends StatefulWidget {
  @override
  _LoginSimpleScreenState createState() => _LoginSimpleScreenState();
}

class _LoginSimpleScreenState extends State<LoginSimpleForm> {

    TextEditingController userNameController = new TextEditingController();
    TextEditingController pwdController = new TextEditingController();
    String _message = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
          elevation: 0,
          title: Text("Forms Validation Demo", style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white70,),
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop(context);
            },
            ),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Enter EMail ID',
                    icon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: pwdController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    icon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 60),
                  child: ElevatedButton(
                    child: Text('Login'),
                    onPressed: (){
                      var userName = userNameController.text;
                      var pwd = pwdController.text;
                      setState(() {
                        _message= "User name : $userName \nPassword : $pwd";
                      });
                    } ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_message),
              )
            ],),
        ),
      ),
    );
  }
}