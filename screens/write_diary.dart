import 'package:flutter/material.dart';
import '../services/speech_to_text.dart';
import '../services/language_translation.dart';
import '../services/firestore_service.dart';
import '../utils/emotion_detector.dart'; // ✅ Import updated emotion detector
import '../widgets/emoji_suggestion.dart'; // ✅ Optional: show emoji suggestion

class WriteDiaryScreen extends StatefulWidget {
  const WriteDiaryScreen({Key? key}) : super(key: key);

  @override
  _WriteDiaryScreenState createState() => _WriteDiaryScreenState();
}

class _WriteDiaryScreenState extends State<WriteDiaryScreen> {
  final SpeechToTextService _speechService = SpeechToTextService();
  final LanguageTranslationService _translator = LanguageTranslationService();
  final FirestoreService _firestoreService = FirestoreService();

  String _diaryText = '';
  String _translatedText = '';
  String _emotion = 'Neutral';
  bool _isListening = false;
  String _selectedLangCode = 'en';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    bool available = await _speechService.initialize();
    if (!available) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Speech recognition not available')),
      );
    }
  }

  void _toggleListening() {
    if (_isListening) {
      _speechService.stopListening();
    } else {
      _speechService.startListening((recognizedText) {
        setState(() {
          _diaryText = recognizedText;
          _emotion = EmotionDetector.detectEmotion(_diaryText); // ✅ detect emotion
        });
      });
    }

    setState(() {
      _isListening = !_isListening;
    });
  }

  Future<void> _processAndSave() async {
    if (_diaryText.trim().isEmpty) return;

    _emotion = EmotionDetector.detectEmotion(_diaryText); // ✅ detect again if text was edited
    _translatedText = await _translator.translateText(_diaryText, _selectedLangCode);

    await _firestoreService.saveDiaryEntry(
      text: _diaryText,
      translatedText: _translatedText,
      emotion: _emotion,
      languageCode: _selectedLangCode,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Diary entry saved with emotion: $_emotion')),
    );

    setState(() {
      _diaryText = '';
      _translatedText = '';
      _emotion = 'Neutral';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Diary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _processAndSave,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedLangCode,
              onChanged: (value) {
                setState(() {
                  _selectedLangCode = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'hi', child: Text('Hindi')),
                DropdownMenuItem(value: 'es', child: Text('Spanish')),
                DropdownMenuItem(value: 'fr', child: Text('French')),
              ],
            ),
            TextField(
              maxLines: 6,
              controller: TextEditingController(text: _diaryText),
              onChanged: (val) {
                setState(() {
                  _diaryText = val;
                  _emotion = EmotionDetector.detectEmotion(val); // ✅ update emotion live
                });
              },
              decoration: const InputDecoration(
                labelText: 'Diary Entry',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            EmojiSuggestion(emotion: _emotion), // ✅ Display emoji suggestion
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
              label: Text(_isListening ? 'Stop Listening' : 'Start Speaking'),
              onPressed: _toggleListening,
            ),
          ],
        ),
      ),
    );
  }
}
