import 'package:flutter/material.dart';

class TextOnlyDiaryScreen extends StatelessWidget {
  const TextOnlyDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    final gender = arguments?['gender'] ?? 'Other';
    final age = arguments?['age'] ?? 0;

    List<String> templates = [];

    if (gender == 'Male' || gender == 'Boy') {
      templates = [
        'Adventure Journal',
        'Success Tracker',
        'Mindset Mastery',
        'Goal Getter',
        'Hero Diary',
        'Confidence Chronicles'
      ];
    } else if (gender == 'Female' || gender == 'Girl') {
      templates = [
        'Self-Love Journal',
        'Gratitude Glow',
        'Wellness & Wishes',
        'Dream Builder',
        'Queen’s Journal',
        'Emotional Wellness Log'
      ];
    } else {
      templates = [
        'Daily Reflections',
        'Thought Catcher',
        'Balanced Mind',
        'Calm Notes',
        'Self Check-In',
      ];
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Choose a Super Diary Template')),
      body: ListView.builder(
        itemCount: templates.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.bookmark, color: Colors.deepPurple),
              title: Text(templates[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JournalEntryScreen(templateName: templates[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class JournalEntryScreen extends StatefulWidget {
  final String templateName;

  const JournalEntryScreen({super.key, required this.templateName});

  @override
  State<JournalEntryScreen> createState() => _JournalEntryScreenState();
}

class _JournalEntryScreenState extends State<JournalEntryScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> savedEntries = [];

  void _saveEntry() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        savedEntries.add(_controller.text.trim());
        _controller.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Diary entry saved successfully!")),
      );
    }
  }

  Widget _buildTemplateHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.templateName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTemplateHeader(widget.templateName),
            const SizedBox(height: 12),
            const Text('Write Your Thoughts:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Start writing here...',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton.icon(
                onPressed: _saveEntry,
                icon: const Icon(Icons.save),
                label: const Text('Save Entry'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Your Saved Entries:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: savedEntries.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.purple[50],
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: const Icon(Icons.notes, color: Colors.purple),
                      title: Text(savedEntries[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
