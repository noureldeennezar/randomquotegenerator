import 'package:flutter/material.dart';
import 'dart:math';
import 'package:share_plus/share_plus.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote Generator'),
        centerTitle: true,
      ),
      body: const QuoteScreen(),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  QuoteScreenState createState() => QuoteScreenState();
}

class QuoteScreenState extends State<QuoteScreen> {
  final List<String> quotes = [
    "The best way to predict the future is to invent it. – Alan Kay",
    "Do not wait to strike till the iron is hot; but make it hot by striking. – William Butler Yeats",
    "Not all those who wander are lost. – J.R.R. Tolkien",
    "Happiness is not by chance, but by choice. – Jim Rohn",
    "Be yourself; everyone else is already taken. – Oscar Wilde",
    "Life is what happens when you’re busy making other plans. – John Lennon",
    "If opportunity doesn’t knock, build a door. – Milton Berle",
    "In the end, we only regret the chances we didn’t take. – Lewis Carroll",
    "A day without laughter is a day wasted. – Charlie Chaplin",
    "Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
    "The journey of a thousand miles begins with one step. – Lao Tzu",
    "The purpose of life is not to be happy. It is to be useful, to be honorable, to be compassionate, to have it make some difference that you have lived and lived well. – Ralph Waldo Emerson",
    "To live is the rarest thing in the world. Most people exist, that is all. – Oscar Wilde",
    "The only limit to our realization of tomorrow is our doubts of today. – Franklin D. Roosevelt",
    "Sometimes you will never know the value of a moment until it becomes a memory. – Dr. Seuss",
  ];

  String currentQuote = "Press the button to get a quote!";

  void generateRandomQuote() {
    final random = Random();
    int index = random.nextInt(quotes.length);
    setState(() {
      currentQuote = quotes[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic color based on theme (white for dark mode, black87 for light mode)
    final textColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Text(
              currentQuote,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: textColor, // Dynamic color based on theme
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: generateRandomQuote,
            child: const Text('New Quote'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Share.share(currentQuote);
            },
            child: const Text('Share Quote'),
          ),
        ],
      ),
    );
  }
}
