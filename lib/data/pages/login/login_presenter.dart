import 'package:chat_clone_app/data/rest_data.dart';
import 'package:chat_clone_app/models/user.dart';

abstract class LoginPageContract{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter{
  LoginPageContract _view;
  RestData api = RestData();
  LoginPagePresenter(this._view);
  
  doLogin(String username, String password){
    api
    .login(username, password)
    .then((user) => _view.onLoginSuccess(user))
    .catchError((onError) => _view.onLoginError(onError));
  }
}