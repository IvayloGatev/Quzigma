import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/Participate/questions_list.dart';

class JoinQuestions extends StatelessWidget {
  final String quizId;
  const JoinQuestions({this.quizId});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Question>>.value(
      value: QuizController().database.getquestions(quizId),
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: Text('Welcome to your Quiz'),
          backgroundColor: Colors.deepPurple[200],
          elevation: 0.0,
        ),
        body: QuestionList(),
      ),
    );
  }
}
