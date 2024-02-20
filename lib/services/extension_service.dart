import '../data/local_data/enEn.dart';
import '../data/local_data/ruRu.dart';
import '../data/local_data/uzUz.dart';
import 'language_service.dart';

extension LanguageExtension on String{
  String get tr {
    switch (LanguageService.getLanguage) {
      case Language.uz:
        return uz[this] ?? this;
      case Language.ru:
        return ru[this] ?? this;
      case Language.en:
        return en[this] ?? this;
    }
  }
}
