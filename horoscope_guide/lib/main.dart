import 'package:flutter/material.dart';
import 'package:horoscope_guide/burc_sayfasi.dart';

List<String> burclar = [
  "Koç",
  "Boğa",
  "İkizler",
  "Yengeç",
  "Aslan",
  "Başak",
  "Terazi",
  "Akrep",
  "Yay",
  "Oğlak",
  "Kova",
  "Balık"
];
String normalize(String input) {
  return input
      .toLowerCase() // Tüm metni küçük harfe çevir
      .replaceAll('ç', 'c')
      .replaceAll('ğ', 'g')
      .replaceAll('ş', 's')
      .replaceAll('ü', 'u')
      .replaceAll('ö', 'o')
      .replaceAll('ı', 'i');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          toolbarHeight: deviceHeight / 10,
          backgroundColor: const Color.fromARGB(255, 49, 108, 73),
          title: const Text(
            "Burç Rehberi",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: ListView.builder(
            itemCount: burclar.length,
            itemBuilder: (context, index) {
              String normalizedBurc = normalize(burclar[index]);
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Image.asset(
                        "lib/assets/images/${normalizedBurc + (index + 1).toString()}.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error, size: 50);
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          burclar[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BurcSayfasi(
                                index: index,
                                burcAdi: burclar[index],
                                imagePath:
                                    "lib/assets/images/${"${normalizedBurc}_buyuk${index + 1}"}.png",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      // home: const GirisSayfasi(),
    );
  }
}
