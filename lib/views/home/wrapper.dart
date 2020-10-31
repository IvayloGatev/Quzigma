import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/quizigma_user.dart';
import 'package:quizigma/views/home/authenticate.dart';
import 'package:quizigma/views/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<QuizigmaUser>(context);

    // Check if the user is logged in and return the coresponding view.
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
