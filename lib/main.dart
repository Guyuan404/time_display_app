import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Display',
      theme: ThemeData.dark(),
      home: const TimeDisplayScreen(),
    );
  }
}

class TimeDisplayScreen extends StatefulWidget {
  const TimeDisplayScreen({super.key});

  @override
  State<TimeDisplayScreen> createState() => _TimeDisplayScreenState();
}

class _TimeDisplayScreenState extends State<TimeDisplayScreen> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}:${_currentTime.second.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: orientation == Orientation.portrait ? 60 : 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${_currentTime.year}-${_currentTime.month.toString().padLeft(2, '0')}-${_currentTime.day.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: orientation == Orientation.portrait ? 30 : 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
