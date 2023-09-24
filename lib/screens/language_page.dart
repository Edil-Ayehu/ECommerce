import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagePage extends StatefulWidget {
  String? selectedLanguage;
  LanguagePage({required this.selectedLanguage});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  //late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    _loadLanguagePreference();
  }

  _loadLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedLanguage = prefs.getString('language');
    if (storedLanguage != null) {
      setState(() {
        widget.selectedLanguage = storedLanguage;
      });
    }
  }

  _saveLanguagePreference(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', locale);
  }

  void _changeLocale(String locale) {
    Get.updateLocale(Locale(locale)); // Update the locale in GetX
    _saveLanguagePreference(locale); // Save the selected language
    setState(() {
      widget.selectedLanguage = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('language'.tr),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("English"),
            onTap: () {
              _changeLocale('en_US'); // Change to English
            },
            leading: Radio<String>(
              value: 'en_US',
              groupValue: widget.selectedLanguage,
              onChanged: (value) {
                _changeLocale(value!);
              },
            ),
          ),
          ListTile(
            title: const Text("አማርኛ"),
            onTap: () {
              _changeLocale('am_ET'); // Change to Amharic
            },
            leading: Radio<String>(
              value: 'am_ET',
              groupValue: widget.selectedLanguage,
              onChanged: (value) {
                _changeLocale(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
