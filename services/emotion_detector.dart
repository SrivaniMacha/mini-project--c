class EmotionDetectorService {
  String detectEmotion(String text) {
    final lowerText = text.toLowerCase();

    if (lowerText.contains("happy") ||
        lowerText.contains("joy") ||
        lowerText.contains("excited")) {
      return "happy";
    } else if (lowerText.contains("sad") ||
        lowerText.contains("unhappy") ||
        lowerText.contains("cry")) {
      return "sad";
    } else if (lowerText.contains("angry") ||
        lowerText.contains("mad") ||
        lowerText.contains("furious")) {
      return "angry";
    } else if (lowerText.contains("love") ||
        lowerText.contains("romantic") ||
        lowerText.contains("caring")) {
      return "love";
    } else {
      return "neutral";
    }
  }
}
