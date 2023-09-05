import 'package:e_commerce_project/utilities/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade200,
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
              ),
              centerTitle: true,
              foregroundColor: Colors.black,
              backgroundColor: Colors.grey.shade200),
        ),
        title: 'Shemach',
        home: const HomePage(),
      ),
    );
  }
}
