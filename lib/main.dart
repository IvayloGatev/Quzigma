import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/models/quizigma_user.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/views/home/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Quizigma());
}

class Quizigma extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuizigmaUser>.value(
        value: HomeController().user,
        child: MaterialApp(
          // List all of the app's supported locales here.
          supportedLocales: [Locale('en', 'US')],
          // These delegates make sure that the localization data for the proper language is loaded.
          localizationsDelegates: [
            // A class which loads the translations from JSON files.
            AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets.
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL.
            GlobalWidgetsLocalizations.delegate,
          ],
          // Returns a locale which will be used by the app.
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            // If the locale of the device is not supported, use the first one from the list.
            return supportedLocales.first;
          },
          home: Wrapper(),
        ));
  }
}
