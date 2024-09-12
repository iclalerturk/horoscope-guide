import 'package:flutter/material.dart';
import 'package:horoscope_guide/utils/Informations.dart';

class BurcSayfasi extends StatefulWidget {
  final String imagePath;
  final String burcAdi;
  const BurcSayfasi(
      {super.key, required this.imagePath, required this.burcAdi});

  @override
  State<BurcSayfasi> createState() => _BurcSayfasiState();
}

class _BurcSayfasiState extends State<BurcSayfasi> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: deviceHeight / 4,
          backgroundColor: Colors.transparent,
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    width: deviceWidth,
                  ),
                ),
              ),
              Positioned(
                top: 30.0, // Üstten biraz boşluk bırakır
                left: 8.0, // Sol kenara yakın konumlandırma
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 33.0, // Üstten biraz boşluk bırakır
                left: 60, // Yazıyı ortalar
                child: Text(
                  "${widget.burcAdi} Burcu ve Özellikleri",
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  Informations.GENERAL_INFO[1],
                  style: const TextStyle(fontSize: 20),
                  softWrap: true, // Metnin taşmasını önler
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
