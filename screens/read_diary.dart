import 'package:flutter/material.dart';
import '../widgets/emoji_suggestion.dart';
import '../services/firestore_service.dart';
import '../utils/emotion_detector.dart';

class WriteDiaryScreen extends StatefulWidget {
  const WriteDiaryScreen({super.key});

  @override
  State<WriteDiaryScreen> createState() => _WriteDiaryScreenState();
}

class _WriteDiaryScreenState extends State<WriteDiaryScreen> {
  final TextEditingController _diaryController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  String _selectedEmotion = 'Neutral';
  bool _manuallySelectedEmotion = false;

  final List<String> _emotions = ['Happy', 'Sad', 'Angry', 'Neutral'];

  void _saveEntry() async {
    final text = _diaryController.text.trim();
    if (text.isEmpty) return;

    final detectedEmotion = EmotionDetector.detectEmotion(text);
    final emotionToSave = _manuallySelectedEmotion ? _selectedEmotion : detectedEmotion;

    final entry = {
      'text': text,
      'translatedText': text, // Placeholder for future translation
      'emotion': emotionToSave,
      'timestamp': DateTime.now(),
    };

    await _firestoreService.saveDiaryEntry(entry);
    Navigator.pop(context);
  }

  void _onDiaryTextChanged(String text) {
    if (!_manuallySelectedEmotion) {
      final detectedEmotion = EmotionDetector.detectEmotion(text);
      setState(() {
        _selectedEmotion = detectedEmotion;
      });
    }
    setState(() {}); // Refresh UI for emoji suggestion
  }

  @override
  Widget build(BuildContext context) {
    final inputText = _diaryController.text;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Diary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedEmotion,
              decoration: const InputDecoration(
                labelText: 'Select Emotion',
                border: OutlineInputBorder(),
              ),
              items: _emotions
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.toUpperCase())))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedEmotion = value;
                    _manuallySelectedEmotion = true; // Prevent auto override
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _diaryController,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: 'Start writing your thoughts...',
                border: OutlineInputBorder(),
              ),
              onChanged: _onDiaryTextChanged,
            ),
            const SizedBox(height: 12),
            if (inputText.isNotEmpty)
              EmojiSuggestion(emotion: _selectedEmotion),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save Entry'),
              onPressed: _saveEntry,
            ),
          ],
        ),
      ),
    );
  }
}
