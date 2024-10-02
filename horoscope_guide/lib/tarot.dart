import 'package:flutter/material.dart';
import 'dart:math';

class Tarot extends StatefulWidget {
  const Tarot({super.key});

  @override
  State<Tarot> createState() => _TarotState();
}

class _TarotState extends State<Tarot> with SingleTickerProviderStateMixin {
  final List<String> _cards = List.generate(
      78, (index) => 'lib/assets/images/card.jpg'); // Kartlar listesi
  List<Offset> _cardOffsets = []; // Kartların pozisyonlarını tutan liste
  List<Offset> _targetOffsets =
      []; // Kartların hedef pozisyonlarını tutan liste
  List<String?> _selectedCards = [null, null, null]; // Seçilen kartlar
  late AnimationController _controller;
  late Animation<double> _animation;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initializePositions();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Animasyon süresi
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // Animasyonu başlat
  }

  void _initializePositions() {
    // Başlangıç pozisyonlarını rastgele ayarla
    _cardOffsets = List.generate(78, (index) {
      return Offset(_random.nextDouble() * 300 - 150,
          _random.nextDouble() * 200 - 10); // Dağınık pozisyonlar
    });

    // Hedef pozisyonları sütun ve satırlara göre ayarla
    _targetOffsets.clear();
    for (int colIndex = 0; colIndex < 6; colIndex++) {
      for (int rowIndex = 0; rowIndex < 13; rowIndex++) {
        _targetOffsets
            .add(Offset(colIndex * 60.0, rowIndex * 25.0)); // Hedef yerleşim
      }
    }
  }

  void _shuffleCards() {
    setState(() {
      _initializePositions();
      _controller.reset();
      _controller.forward(); // Animasyonu yeniden başlat
    });
  }

  void _selectCard(String card) {
    setState(() {
      for (int i = 0; i < _selectedCards.length; i++) {
        if (_selectedCards[i] == null) {
          _selectedCards[i] = card;
          break;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Animasyon denetleyiciyi serbest bırak
    super.dispose();
  }

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
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Stack(
                  children: List.generate(
                    78,
                    (index) {
                      Offset beginOffset =
                          _cardOffsets[index]; // Başlangıç pozisyonu
                      Offset endOffset =
                          _targetOffsets[index]; // Hedef pozisyonu

                      return AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          // Animasyon sırasında pozisyonu interpolasyon ile hesapla
                          Offset currentOffset = Offset.lerp(
                              beginOffset, endOffset, _animation.value)!;
                          return Positioned(
                            left: currentOffset.dx,
                            top: currentOffset.dy,
                            child: GestureDetector(
                              onTap: () {
                                _selectCard(_cards[index]); // Kart seçimi
                              },
                              child: Card(
                                elevation: 4.0,
                                child: SizedBox(
                                  width: 50,
                                  height: 90,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      _cards[index], // Kart görselleri
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            // Seçilen kart alanları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return Container(
                  width: 60,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _selectedCards[index] != null
                      ? Image.asset(_selectedCards[index]!, fit: BoxFit.fill)
                      : null, // Seçilen kartı göster
                );
              }),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: _shuffleCards,
              child: const Text('Shuffle',
                  style: TextStyle(fontSize: 25, color: Colors.green)),
            ),
            const SizedBox(
                height: 50), // Buton ve kart alanları arasında boşluk
          ],
        ),
      ),
    );
  }
}
