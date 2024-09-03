import 'package:flutter/material.dart';
//import 'package:flutter_application_1/sayfalar/oturum/giris.dart';

void main() {
  runApp(const MyApp());
}

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
          toolbarHeight: deviceHeight / 10,
          backgroundColor: const Color.fromARGB(255, 145, 31, 245),
          title: const Text(
            "Burç Uygulaması",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: ListView.builder(
            itemCount: burclar.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage("lib/assets/images/akrep8.png"),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                          width: 10), // Görüntü ile metin arasında boşluk
                      Expanded(
                        child: Text(
                          burclar[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          // Geçiş fonksiyonu burada aktif olabilir
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => GirisSayfasi(),
                          //   ),
                          // );
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
