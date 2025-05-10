import 'package:translator/translator.dart';

class LanguageTranslationService {
  final translator = GoogleTranslator();

  Future<String> translateText(String input, String toLangCode) async {
    try {
      var translation = await translator.translate(input, to: toLangCode);
      return translation.text;
    } catch (e) {
      print("Translation Error: $e");
      return input;
    }
  }
}
