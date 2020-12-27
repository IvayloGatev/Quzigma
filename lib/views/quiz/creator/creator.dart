import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/creator/creator_alert.dart';
import 'package:quizigma/views/quiz/creator/question_list.dart';

class QuizCreator extends StatefulWidget {
  @override
  _QuizCreatorState createState() => _QuizCreatorState();
}

//Note to backend: You can retrieve the information from answersList of _MyFormState class.
class _QuizCreatorState extends State<QuizCreator> {
  List<int> bottom = [0];
  List<String> categories = [
    'Literature',
    'History',
    'Physics',
    'Chemistry',
    'Biology',
    'General Knowledge',
    'Polictics',
    'Nature'
  ];

  String category = 'Literature';
  int dropdownValue = 15;
  List<int> dropDownValues = [
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45
  ];

  List<QuestionTextEditor> editors = List<QuestionTextEditor>();
  TextEditingController nameEditingController = TextEditingController();
  List<int> top = [];

  final _controller = QuizController();
  final _formKey = GlobalKey<FormState>();

  void _showCreatorAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CreatorAlert();
        });
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Create a quiz'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, true),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: nameEditingController,
                    decoration: InputDecoration(hintText: 'Enter quiz name'),
                    validator: (v) {
                      if (v.trim().isEmpty) return 'Please enter something';
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropdownButtonFormField<String>(
                    value: category,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 16,
                    elevation: 16,
                    decoration: InputDecoration(
                      labelText: 'Select category',
                      labelStyle: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        category = value;
                      });
                    },
                    items: categories.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropdownButtonFormField<int>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 16,
                    elevation: 16,
                    decoration: InputDecoration(
                      labelText: 'Select question timer',
                      labelStyle: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    onChanged: (int newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items:
                        dropDownValues.map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropdownButtonFormField<int>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 16,
                    elevation: 16,
                    decoration: InputDecoration(
                      labelText: 'Select question timer',
                      labelStyle: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    onChanged: (int newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items:
                        dropDownValues.map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: QuestionList(editors: editors),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      String name = nameEditingController.text;
                      List<Question> questions = List<Question>();
                      int value = dropdownValue;
                      for (var editor in editors) {
                        String questionText =
                            editor.questionTextController.text;
                        List<String> answers = List<String>();
                        for (var answerTextController
                            in editor.answerTextControllers) {
                          answers.add(answerTextController.text);
                        }
                        questions.add(Question(
                            questions.length + 1,
                            questionText,
                            answers,
                            editor.correctAnswer,
                            value));
                      }

                      Quiz quiz = Quiz(category, name, questions);
                      _controller.addQuiz(quiz);
                      _showCreatorAlert();
                    }
                  },
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text('Submit'),
                  color: Colors.deepPurple,
                ),
              ])),
        ])));
  }
}
