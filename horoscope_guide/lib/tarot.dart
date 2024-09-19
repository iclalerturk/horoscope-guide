import 'package:flutter/material.dart';

class Tarot extends StatefulWidget {
  const Tarot({super.key});

  @override
  State<Tarot> createState() => _TarotState();
}

class _TarotState extends State<Tarot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 49, 108, 73),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 49, 108, 73),
          title: const Text(
            "Tarot",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (colIndex) {
              // Her bir sütun
              return Expanded(
                // Expanded ile sütunun boyutu kontrol altına alınıyor
                child: Stack(
                  children:
                      List.generate(11 + (colIndex == 0 ? 1 : 0), (rowIndex) {
                    // Her sütundaki kart sayısı değişiyor (örnek olarak 6 + colIndex)
                    return Positioned(
                      top: rowIndex *
                          30.0, // Her kart bir öncekinin biraz altında
                      child: Card(
                        elevation: 4.0,
                        child: SizedBox(
                          width: 50,
                          height: 90,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'lib/assets/images/card.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
