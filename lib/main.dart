import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final outputController = TextEditingController(text: "Result here...");
  final translator = GoogleTranslator();

  String inputText = '';
  String inputLanguage = 'en';
  String outputLanguage = 'my';

  Future<void> translateText() async {
    final translated = await translator.translate(
      inputText,
      from: inputLanguage,
      to: outputLanguage,
    );
    setState(() {
      outputController.text = translated.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "images/translate.png",
                fit: BoxFit.contain,
                height: 250,
              ),
              SizedBox(height: 16),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter text to translate",
                ),
                onChanged: (value) {
                  setState(() {
                    inputText = value;
                  });
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter text to translate",
                ),
                onChanged: (value) {
                  setState(() {
                    inputText = value;
                  });
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
