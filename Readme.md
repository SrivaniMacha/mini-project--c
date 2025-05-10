
# 📓 Echo Diary

**Echo Diary** is a cross-platform Flutter application that allows users to record and store personal diary entries through voice or text. It supports multilingual translation, emotion-based classification, motivational prompts, and intuitive templates tailored to user age and gender. 

---

## ✨ Features

- 🔐 **Secure Authentication** via Firebase
- 🗣 **Speech-to-Text** and manual entry
- 🌍 **Language Translation** support
- 😊 **Emotion Detection** for categorizing entries
- 🎭 **Emoji Suggestions** based on mood
- 🔄 **Age and Gender-based Diary Templates**
- 📸 **Pictorial Diary Support** for older users
- 🎯 **Streak Rewards** with motivational popups
- ☁️ **Cloud Syncing** using Firestore

---

## 📁 Folder Structure

```
lib/
├── main.dart
├── splash_screen.dart
├── auth/
│   ├── login.dart
│   └── register.dart
├── screens/
│   ├── age_check.dart
│   ├── home.dart
│   ├── write_diary.dart
│   └── read_diary.dart
├── services/
│   ├── auth_service.dart
│   ├── speech_to_text.dart
│   ├── language_translation.dart
│   ├── emotion_detector.dart
│   └── firestore_service.dart
└── widgets/
    ├── emoji_suggestion.dart
    ├── motivational_popup.dart
    └── age_template_picker.dart
```

---

## 🚀 Getting Started

### 1. Prerequisites
- Flutter SDK (>= 3.7.0)
- Dart SDK
- Firebase project set up

### 2. Clone the Repo
```bash
git clone https://github.com/yourusername/echo-diary.git
cd echo-diary
```

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Setup Firebase
- Follow the Firebase setup for Android & iOS
- Add your `google-services.json` and `GoogleService-Info.plist`

### 5. Run the App
```bash
flutter run
```

---

## 🧠 Contributors Guide

### ✅ How to Contribute
- Fork the repo
- Create a branch (`git checkout -b feature/YourFeature`)
- Commit changes (`git commit -m "Added your feature"`)
- Push to the branch (`git push origin feature/YourFeature`)
- Open a Pull Request

### 📌 Issue Tracking
We use GitHub Issues for bugs, features, and suggestions.

---

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🙌 Acknowledgements

- Flutter Team
- Firebase by Google
- OpenAI for language and emotion APIs
