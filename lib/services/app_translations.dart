import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> translations = {
    'en_US': {
      'welcome': 'Welcome',
      'language': 'Language',
      'notification': 'Notification',
      'about': 'About',
    },
    'am_ET': {
      'welcome': 'እንኳን ደህና መጡ',
      'language': 'ቋንቋ',
      'notification': 'ማሳወቂያ',
      'about': 'ስለ እኛ',
    },
  };

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => translations;
}
