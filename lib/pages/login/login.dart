import 'package:flutter/material.dart';
import 'package:hello_world/app_store/app_state.dart';
import 'package:hello_world/app_store/chat_provider.dart';
import 'package:hello_world/pages/forgot_password/forgot_password.dart';
import 'package:hello_world/pages/home/home.dart';
import 'package:hello_world/pages/register/register.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  var appState;
  String password;
  String username;

  void _goToregister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void _login() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      appState = Provider.of<AppState>(context);
      appState.login(password, username);
    }
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    var chatState = Provider.of<ChatProvider>(context);
    if (appState.getisUserLogedIn() == true) {
      if (!chatState.getIsConnected()) {
        chatState.createSignalRConnection(appState.getUserLoginDetails());
      }
      return HomePage();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                new Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new TextFormField(
                            decoration:
                                new InputDecoration(labelText: "Username"),
                            onSaved: (val) => username = val,
                            keyboardType: TextInputType.emailAddress),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new TextFormField(
                          decoration:
                              new InputDecoration(labelText: "Password"),
                          onSaved: (val) => password = val,
                          obscureText: true,
                        ),
                      ),
                      new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(40.0)),
                                ),
                                onPressed: _login,
                                child: Text('Login'),
                              ))),
                      new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(40.0)),
                                ),
                                onPressed: _goToregister,
                                child: Text('Register'),
                              ))),
                      GestureDetector(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity),
                                child: Center(
                                  child: Text('Forgot Password'),
                                ))),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPassWordPage();
                          }));
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
