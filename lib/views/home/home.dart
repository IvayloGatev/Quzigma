import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/creator/creator.dart';
import 'package:quizigma/views/quiz/Participate/Categories.dart';


class Home extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('home_title') +
                'Quizigma'),
            backgroundColor: Colors.purple,
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
            ]),
        body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
                SizedBox(width: 15),
            FlatButton(
              height: 70.00,
              minWidth: 100.00,
              child:
                  Text("Create a Quiz", style: TextStyle(fontSize: 15)),
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Creator()));
              },
            ),
            /* FlatButton(
              height: 70.00,
              minWidth: 70.00,
              child: Text("Create a Quiz", style: TextStyle(fontSize: 15)),
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () async {
                print('create!');
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Creator()));
                
              },
            ), */
            SizedBox(width: 15),
            FlatButton(
              height: 70.00,
              minWidth: 100.00,
              child:
                  Text("Participate in a Quiz", style: TextStyle(fontSize: 15)),
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Categories()));
              },
            ),
          ]),
        ));
  }
}