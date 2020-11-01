import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class QuizController extends ControllerMVC {
  factory QuizController() {
    if (_this == null) {
      _this = QuizController._();
    }
    return _this;
  }

  static QuizController _this;

  // Variables for the quizCreator() method. Testing Purposes.
  /*
  String _quizId;
  String _quizCatalog;
  String _quizName;
  String _quizDescription;

  String _answer1;
  String _answer2;
  String _answer3;
  String _answer4;
  String _answer5;
  */

  final firestore = FirebaseFirestore.instance;

  QuizController._();

  //create quiz method. TESTING PURPOSES!!!
  /*
  quizCreator() async {
    _quizId = randomAlphaNumeric(8);

    _quizCatalog = 'Programming Language';
    _quizName = 'my beautiful quiz';
    _quizDescription = 'inst this quiz marvelous?';

    Map<String, String> quizMap = {
      "catalog": _quizCatalog,
      "id": _quizId,
      "name": _quizName,
      "description": _quizDescription
    };

    _answer1 = "C++";
    _answer2 = "Python";
    _answer3 = "Java";
    _answer4 = "Kotlin";
    _answer5 = "Dart";

    Map<String, String> questionMap = {
      "answer_1": _answer1,
      "answer_2": _answer2,
      "answer_3": _answer3,
      "answer_4": _answer4,
      "answer_5": _answer5
    };

    await addQuizData(quizMap, _quizId).then((value) {});
    await addQuestionData(questionMap, _quizId).then((value) {});
  }
  */

  // This method pushes the quiz data like catalog, name and description
  // to the firebase.
  Future<void> addQuizData(
      Map quizMap, String quizCatalog, String quizId) async {
    await firestore
        .collection("Catalog")
        .doc(quizCatalog)
        .collection("Quiz")
        .doc(quizId)
        .set(quizMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  // This method pushes the questions and answers (QNA) of a specific quiz to the firebase.
  Future<void> addQuestionData(
      Map questionMap, String quizCatalog, String quizId) async {
    await firestore
        .collection("Catalog")
        .doc(quizCatalog)
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(questionMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  //The methods below are the getters for Catalog, Quizzes for each catalog
  // and Questions/Answers for each Quizz.
  getCatalogData() async {
    return await firestore.collection("Catalog").get();
  }

  getQuizData(String quizCatalog) async {
    return await firestore
        .collection("Catalog")
        .doc(quizCatalog)
        .collection("Quiz")
        .get();
  }

  getQuestionData(String quizCatalog, String quizId) async {
    return await firestore
        .collection("Catalog")
        .doc(quizCatalog)
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }
}
