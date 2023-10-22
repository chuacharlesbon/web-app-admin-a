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