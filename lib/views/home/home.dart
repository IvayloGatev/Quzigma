import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/services/app_localization.dart';

class Home extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('home_title') +
                'Quizigma'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text(
                    AppLocalizations.of(context).translate('logout_label')),
                onPressed: () async {
                  await _controller.signOut();
                },
              )
            ]));
  }
}
