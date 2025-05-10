// lib/widgets/emoji_suggestion.dart
import 'package:flutter/material.dart';

class EmojiSuggestion extends StatelessWidget {
  final String emotion;

  const EmojiSuggestion({required this.emotion, super.key});

  String _getEmoji(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return '😄';
      case 'sad':
        return '😢';
      case 'angry':
        return '😠';
      case 'surprised':
        return '😲';
      case 'neutral':
        return '😐';
      default:
        return '📝';
    }
  }

  @override
  Widget build(BuildContext context) {
    final emoji = _getEmoji(emotion);
    return Row(
      children: [
        const Text('Your emotion: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$emoji $emotion', style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
