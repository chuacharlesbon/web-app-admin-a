import 'package:flutter/widgets.dart';

abstract class Languages {
  static final all = [english, japanese];

  static final english = Language(
    code: 'en',
    icon: Image.asset('images/en.png'),
    name: "English",
  );
  static final japanese = Language(
    code: 'ar',
    icon: Image.asset('images/jp.png'),
    name: "Arabic",
  );

  static Language fromCode(String code) {
    switch (code) {
      case 'en':
        return Languages.english;
      case 'ja':
        return Languages.japanese;
      default:
        return Languages.english;
    }
  }
}

class Language {
  final String code;
  final String name;
  final Widget icon;
  const Language({
    required this.code,
    required this.name,
    required this.icon,
  });
}

class Translations {
  static const submit = {
    "submit-en": "Submit",
    "submit-ar": "يُقدِّم",
  };

  static const fullname = {
    "name-en": "Enter full name",
    "name-ar": "أدخل الاسم الكامل"
  };

  static const mobile = {
    "mobile-en": "Mobile number",
    "mobile-ar": "رقم الهاتف المحمول",
  };

  static const loginOption = {
    "loginOption-en": "Or Log in with",
    "loginOption-ar": "أو تسجيل الدخول مع",
  };

  static const terms = {
    "terms-en": "Terms of Service",
    "terms-ar": "شروط الخدمة",
  };

  static const privacy = {
    "privacy-en": "Data Privacy",
    "privacy-ar": "خصوصية البيانات",
  };

  static const welcomeMsg = {
    "welcomeMsg-en": "Thank you for using Captive Portal!",
    "welcomeMsg-ar": "شكرًا لك على استخدام البوابة الأسيرة!",
  };

  static const visitUs = {
    "visitUs-en": "Visit us to learn more.",
    "visitUs-ar": "تفضل بزيارتنا لمعرفة المزيد.",
  };

  static const languageEn = {
    "en": "English",
    "ar": "إنجليزي",
  };

  static const languageAr = {
    "en": "Arabic",
    "ar": "عربي",
  };
}