import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'questions_tile.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';
import 'dart:math';

class QuestionList extends StatefulWidget {
  @override
  final Quiz quiz;

  QuestionList({this.quiz});

  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  String category;
  Question question;
  int score = 0;
  int _radioValueCase2 = -1;
  int _radioValueCase3 = -1;
  int _radioValueCase4 = -1;
  int _radioValueCase5 = -1;
  List<int> correctAnswers = List<int>();
  List<int> answerSelections = List<int>();

  void setSelectedRadioCase2(int value, int correctAnswer) {
    setState(() {
      _radioValueCase2 = value;
      answerSelections.add(_radioValueCase2);
      correctAnswers.add(correctAnswer);
      print(answerSelections.toString());
      print(correctAnswers.toString());
      if (_radioValueCase2 == correctAnswer) {
        print('correct');
      } else {
        print('false');
      }
    });
  }

  void setSelectedRadioCase3(int value, int correctAnswer) {
    setState(() {
      _radioValueCase3 = value;

      if (_radioValueCase3 == correctAnswer) {
        print('correct');
      } else {
        print('false');
      }
    });
  }

  void setSelectedRadioCase4(int value, int correctAnswer) {
    setState(() {
      _radioValueCase4 = value;

      if (_radioValueCase4 == correctAnswer) {
        print('correct');
      } else {
        print('false');
      }
    });
  }

  void setSelectedRadioCase5(int value, int correctAnswer) {
    setState(() {
      _radioValueCase5 = value;

      if (_radioValueCase5 == correctAnswer) {
      } else {
        print('false');
      }
    });
  }

  void checkAnswers(List<int> answers, List<int> correctAnswers) {
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == correctAnswers[i]) {
        score++;
      }
    }
  }

  Widget build(BuildContext context) {
    final questions = Provider.of<List<Question>>(context);
    return questions == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    QuestionTile(question: questions[index]),
                    SizedBox(height: 2),
                    _getAnswers(questions[index]),
                    RaisedButton(
                      onPressed: () {
                        checkAnswers(correctAnswers, answerSelections);
                      },
                    ),
                    Text('$score'),
                    SizedBox(height: 10),
                  ]);
            },
          );
  }

  Column _getAnswers(Question question) {
    //int i = -1;
    //do {
    //  i++;
    switch (question.answers.length) {
      case 2:
        print('case 2');

        return Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[0],
                ),
                value: 0,
                groupValue: _radioValueCase2,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase2(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[1],
                ),
                value: 1,
                groupValue: _radioValueCase2,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase2(val, question.correctAnswer);
                },
              ),
            )
          ],
        );

        break;
      case 3:
        print('case 3');
        //  correctAnswers[1] = question.correctAnswer;
        return Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[0],
                ),
                value: 0,
                groupValue: _radioValueCase3,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase3(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[1],
                ),
                value: 1,
                groupValue: _radioValueCase3,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase3(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[2],
                ),
                value: 2,
                groupValue: _radioValueCase3,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase3(val, question.correctAnswer);
                },
              ),
            )
          ],
        );
        break;
      case 4:
        print('case 4');
        //  correctAnswers[2] = question.correctAnswer;
        return Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[0],
                ),
                value: 0,
                groupValue: _radioValueCase4,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase4(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[1],
                ),
                value: 1,
                groupValue: _radioValueCase4,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase4(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[2],
                ),
                value: 2,
                groupValue: _radioValueCase4,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase4(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[3],
                ),
                value: 3,
                groupValue: _radioValueCase4,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase4(val, question.correctAnswer);
                },
              ),
            )
          ],
        );
        break;
      case 5:
        // correctAnswers[3] = question.correctAnswer;
        print('case 5');
        return Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[0],
                ),
                value: 0,
                groupValue: _radioValueCase5,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase5(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[1],
                ),
                value: 1,
                groupValue: _radioValueCase5,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase5(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[2],
                ),
                value: 2,
                groupValue: _radioValueCase5,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase5(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[3],
                ),
                value: 3,
                groupValue: _radioValueCase5,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase5(val, question.correctAnswer);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[4],
                ),
                value: 4,
                groupValue: _radioValueCase5,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadioCase5(val, question.correctAnswer);
                },
              ),
            )
          ],
        );
        break;
      default:
        return Column(children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: RadioListTile(
              title: Text(
                question.answers[0],
              ),
              value: 1,
              groupValue: -1,
              activeColor: Colors.blue,
              onChanged: (val) {
                setSelectedRadioCase5(val, question.correctAnswer);
              },
            ),
          )
        ]);
    }
    // } while (question.answers.length > i);
  }
}
