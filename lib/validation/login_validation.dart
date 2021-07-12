import 'package:flutter/material.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginValdiationState createState() => _LoginValdiationState();
}

class _LoginValdiationState extends State<LoginForm> {

    TextEditingController userNameController = new TextEditingController();
    TextEditingController pwdController = new TextEditingController();
    String _message = "";
    final _globalFormKey = GlobalKey<FormState>();

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
          child: Form(
            key: _globalFormKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                    validator: (value){
                            if(value.isEmpty)
                            {
                              return "Please enter user name";
                            }
                            return null;
                          },
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                    validator: (value){
                            if(value.isEmpty)
                            {
                              return "Please enter password";
                            }
                            return null;
                          },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 60),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: (){
                        if(_globalFormKey.currentState.validate())
                        {
                          var userName = userNameController.text;
                          var pwd = pwdController.text;
                          setState(() {
                            _message= "User name : $userName \nPassword : $pwd";
                          });
                        }
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
      ),
    );
  }
}