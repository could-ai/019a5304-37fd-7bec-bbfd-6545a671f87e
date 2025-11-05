import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Writing Test Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const TopicTestGeneratorScreen(),
    );
  }
}

class TopicTestGeneratorScreen extends StatefulWidget {
  const TopicTestGeneratorScreen({super.key});

  @override
  State<TopicTestGeneratorScreen> createState() => _TopicTestGeneratorScreenState();
}

class _TopicTestGeneratorScreenState extends State<TopicTestGeneratorScreen> {
  final TextEditingController _topicController = TextEditingController();
  String _generatedTest = '';

  void _generateTest() {
    setState(() {
      final topic = _topicController.text;
      if (topic.isNotEmpty) {
        _generatedTest =
            'Write a short essay on the topic of "$topic". Discuss its importance, challenges, and future prospects.';
      } else {
        _generatedTest = 'Please enter a topic to generate a test.';
      }
    });
  }

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Writing Test Generator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _topicController,
              decoration: const InputDecoration(
                labelText: 'Enter a topic',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateTest,
              child: const Text('Generate Test'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Generated Test:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _generatedTest,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
