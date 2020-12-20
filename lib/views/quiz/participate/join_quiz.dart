import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/quiz_list.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';

class JoinQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(15),
      child: StreamProvider<List<Quiz>>.value(
        value: QuizController().database.quizes,
        child: Scaffold(
          backgroundColor: Colors.purple[50],
          appBar: AppBar(
            title: Text('Welcome to your Quiz'),
            backgroundColor: Colors.purple[200],
            elevation: 0.0,
          ),
          body: QuizList(),
        ),
      ),
      onPressed: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => JoinQuestions()));
      },
    );
  }
}
