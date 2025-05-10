import 'package:flutter/material.dart';

class PictorialTemplateScreen extends StatelessWidget {
  const PictorialTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> pictorialTemplates = [
      'Nature Reflections',
      'Memory Collage',
      'Mood with Images',
      'Photo Diary'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Pictorial Templates")),
      body: ListView.builder(
        itemCount: pictorialTemplates.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.image),
            title: Text(pictorialTemplates[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PictorialEditor(template: pictorialTemplates[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PictorialEditor extends StatelessWidget {
  final String template;

  const PictorialEditor({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(template)),
      body: const Center(
        child: Text("Here, allow users to upload photos, draw, or caption.", textAlign: TextAlign.center),
      ),
    );
  }
}
