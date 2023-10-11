import 'package:e_commerce_project/models/counter_model.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/services/app_translations.dart';
import 'package:e_commerce_project/services/auto_signout_detector.dart';
import 'package:e_commerce_project/services/reusable_functions.dart';
import 'package:e_commerce_project/themes/themes.dart';
import 'package:e_commerce_project/widgets/square_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce_project/utilities/dismiss_keyboard.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final savedLocale = prefs.getString('language');

  // Set the initial locale based on the saved value (or use a default)
  final initialLocale = savedLocale != null
      ? Locale(savedLocale)
      : const Locale('en', 'US'); // You can set a default language here
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(initialLocale),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;

  MyApp(this.initialLocale, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('am', 'ET'), // Add your supported locales
        ],
        locale: initialLocale, // Set the initial locale
        translationsKeys:
            AppTranslations().translations, // Set your translations service
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode: ThemeMode.system,
        home: const AutoSignoutDetector(child: SplashScreen()),
        //home: const SquareContainer(),
      ),
    );
  }
}
