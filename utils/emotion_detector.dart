// lib/utils/emotion_detector.dart
class EmotionDetector {
  static String detectEmotion(String text) {
    final lowerText = text.toLowerCase();

    if (lowerText.contains('happy') ||
        lowerText.contains('joy') ||
        lowerText.contains('excited') ||
        lowerText.contains('grateful')) {
      return 'Happy';
    } else if (lowerText.contains('sad') ||
        lowerText.contains('depressed') ||
        lowerText.contains('unhappy') ||
        lowerText.contains('lonely')) {
      return 'Sad';
    } else if (lowerText.contains('angry') ||
        lowerText.contains('furious') ||
        lowerText.contains('mad') ||
        lowerText.contains('irritated')) {
      return 'Angry';
    } else if (lowerText.contains('wow') ||
        lowerText.contains('shocked') ||
        lowerText.contains('surprised')) {
      return 'Surprised';
    } else {
      return 'Neutral';
    }
  }
}
