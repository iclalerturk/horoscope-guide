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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, // Bir satırda 7 kart
                  crossAxisSpacing: 1.0, // Kartlar arasındaki yatay boşluk
                  mainAxisSpacing: 1.0, // Kartlar arasındaki dikey boşluk
                  childAspectRatio: 2 / 3),
              itemCount: 78, // Toplam kart sayısı
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  child: Center(
                    child: Text(
                      '${index + 1}', // Kart numarasını göster
                      //style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
