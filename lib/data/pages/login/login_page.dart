import 'package:chat_clone_app/data/pages/login/login_presenter.dart';
import 'package:chat_clone_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>implements LoginPageContract {
  
  BuildContext _ctx;
  bool _isLoading;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPagePresenter _pagePresenter;

  _LoginPageState(this._username, this._password){
    _pagePresenter = new LoginPagePresenter(this);
  }

  void _submit(){
    final form = formKey.currentState;
    if(form.validate()){
      setState(() {
        _isLoading = true;
        form.save();
        _pagePresenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text){
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: ,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new ElevatedButton(
      onPressed: _submit, 
      child: new Text("Login"),);

      var loginForm = new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("App Login", textScaleFactor:2.0),
          Form(
            key: formKey,
            child: Column(children:<Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: InputDecoration(labelText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: InputDecoration(labelText: "Password"),
                ),
              )
            ],)
          ),
          loginBtn
        ],
      );
      return Scaffold(
        appBar: AppBar(title: Text("Login Page"),
        ),
        key: scaffoldKey,
        body: Container(
          child: Center(child: loginForm,)
        ),
      );
    }

  @override
  void onLoginError(String error) {
      // TODO: implement onLoginError
    }
  
    @override
    void onLoginSuccess(User user) {
    // TODO: implement onLoginSuccess
  }
}