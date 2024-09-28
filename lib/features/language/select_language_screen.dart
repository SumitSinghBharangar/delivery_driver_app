import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage = 'English';

  final languages = [
    {'name': 'English', 'code': 'En'},
    {'name': 'Hindi', 'code': 'हिन्दी'},
    {'name': 'Kannada', 'code': 'ಕನ್ನಡ'},
    {'name': 'Telugu', 'code': 'తెలుగు'},
    {'name': 'Tamil', 'code': 'தமிழ்'},
    {'name': 'Bengali', 'code': 'বাংলা'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose App Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose the language you want to see in the entire app',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text(
                      languages[index]['name']!,
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      languages[index]['code']!,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    value: languages[index]['name'],
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value as String?;
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the continue action here
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                // Background color
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
