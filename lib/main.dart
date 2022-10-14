import 'dart:async'; // To use timer and its functions

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterDownApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({Key? key}) : super(key: key);

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  int numberOfSeconds = 60;  // initial value , can be changed!
  Timer? repeatedFunction;

  startTimer() {
    repeatedFunction = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (numberOfSeconds > 0) {
          numberOfSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (numberOfSeconds > 0)
                ? numberOfSeconds.toString().padLeft(2, "0")
                : "👌",
            style: (numberOfSeconds > 0)
                ? const TextStyle(fontSize: 80, color: Colors.white)
                : const TextStyle(fontSize: 55, color: Colors.white),
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            "seconds",
            style: TextStyle(fontSize: 30, color: Colors.white , fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startTimer();
                  if (numberOfSeconds == 0) {
                    setState(() {
                      numberOfSeconds = 4;
                    });
                  }
                },
                child: const Text(
                  "Start Timer",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 25, 120, 197)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
              ),
              const SizedBox(
                width: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  repeatedFunction!.cancel();
                },
                child: const Text(
                  "STOP TIMER",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 197, 25, 97)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}