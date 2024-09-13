import 'dart:async';
import 'package:flutter/material.dart';
import 'package:horoscope_guide/main.dart'; // MyApp sınıfının tanımlı olduğu yer

void main() {
  runApp(const MyApp()); // Uygulama başlatılırken MaterialApp oluşturuluyor
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // İlk sayfa olarak HomePage kullanılıyor
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // 5 saniye bekleyip yeni sayfaya geçiş yap
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 108, 73),
      body: Center(
        child: Image.asset(
          "lib/assets/images/app_icon.png",
        ),
      ),
    );
  }
}

