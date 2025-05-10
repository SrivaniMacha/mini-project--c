import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Auth
import 'auth/login.dart';
import 'auth/register.dart';

// Screens
import 'screens/age_check.dart';
import 'screens/referral_screen.dart';
import 'screens/pictorial_template_screen.dart';
import 'screens/text_only_diary_screen.dart';
import 'screens/home.dart';
import 'screens/write_diary.dart';
import 'screens/read_diary.dart';

// Widgets
import 'widgets/age_template_picker.dart';
import 'widgets/emoji_suggestion.dart';
import 'widgets/motivational_popup.dart';

// Splash
import 'splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EchoDiaryApp());
}

class EchoDiaryApp extends StatelessWidget {
  const EchoDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echo Diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/age_check': (context) => const AgeCheckScreen(),
        '/referral': (context) => const ReferralScreen(),
        '/pictorial': (context) => const PictorialTemplateScreen(),
        '/text_only': (context) => const TextOnlyDiaryScreen(),
        '/home': (context) => const HomeScreen(),
        '/write': (context) => const WriteDiaryScreen(),
        '/read': (context) => const ReadDiaryScreen(),
      },
    );
  }
}
