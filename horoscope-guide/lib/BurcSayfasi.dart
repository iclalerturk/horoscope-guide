import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/Informations.dart';

class BurcSayfasi extends StatefulWidget {
  final String imagePath;
  final String burcAdi;
  final int index;
  const BurcSayfasi(
      {super.key,
      required this.imagePath,
      required this.burcAdi,
      required this.index});

  @override
  State<BurcSayfasi> createState() => _BurcSayfasiState();
}

class _BurcSayfasiState extends State<BurcSayfasi> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        child: Scaffold(
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
                      width: double.infinity,
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
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                //child: SingleChildScrollView(
                child: Text(
                  Informations.GENERAL_INFO[widget.index],
                  style: const TextStyle(fontSize: 20),
                  softWrap: true, // Metnin taşmasını önler
                ),
                //),
              ),
            ),
          ),
        ),
      ),
      // home: const GirisSayfasi(),
    );
  }
}
