import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GYM APP MVP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _timeLeft = 5;

  void _incrementCounter() {
    setState(() {
      if (_counter == 4) {
        _counter = 0;
      } else {
        _counter++;
      }
    });
  }

  // timer method
  void _startCountDoun() {
    if (_timeLeft == 0) {
      _timeLeft = 5;
    }

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          // change the timer value
          _timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _timeLeft != 0 ? _timeLeft.toString() : 'DONE',
              style: const TextStyle(fontSize: 50),
            ),
            MaterialButton(
              onPressed: _startCountDoun,
              color: Colors.deepPurple,
              child: const Text(
                'S T A R T - T I M E R',
                style: TextStyle(color: Colors.amber),
              ),
            ),
            Image.asset('assets/images/$_counter.gif'),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
