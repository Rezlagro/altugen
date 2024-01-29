// ignore_for_file: camel_case_types

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MaterialApp(home: MyApp()));
}

Color hexToColor(String hexString) {
  int value = int.parse(hexString.substring(1), radix: 16);
  return Color(value);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('Ana Ekran'),
        backgroundColor: Color(0xFFef3038),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF001F3F),
              ),
              child: Text(
                'Seçenekler',
                style: TextStyle(color: Colors.white, fontSize: 24, height: 5),
              ),
            ),
            buildListTile(
              context,
              'Etkinlikler',
              'event.png',
              const Etkinlik(),
            ),
            buildListTile(
              context,
              'Alışveriş',
              'shop.png',
              const alisveris(),
            ),
            buildListTile(
              context,
              'Sanatçılar',
              'sanatci.png',
              const Sanatci(),
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.white70,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Etkinlik()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                width: 350,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/g_festivali.jpg',
                    height: 300,
                    width: 400,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.60,
            left: 80,
            child: RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  const TextSpan(
                    text: 'Giyilmesi önerilenler',
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const alisveris(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          'assets/shopping.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      BuildContext context, String title, String icon, Widget page) {
    return ListTile(
      title: Text(title),
      leading: Image.asset(
        'assets/$icon',
        height: 45,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

class alisveris extends StatefulWidget {
  const alisveris({Key? key}) : super(key: key);
  @override
  _alisveris createState() => _alisveris();
}

class _alisveris extends State<alisveris> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Alışveriş'),
          backgroundColor: Color(0xFFef3038),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 160.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '36',
                      icon: Image.asset(
                        'assets/shoe.png',
                        width: 30,
                        height: 30,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 240.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Kapişonlu',
                      icon: Image.asset(
                        'assets/hoodie.png',
                        width: 30,
                        height: 30,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 320.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Large',
                      icon: Image.asset(
                        'assets/clothes.png',
                        width: 30,
                        height: 30,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 400.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'M',
                      icon: Image.asset(
                        'assets/trouser.png',
                        width: 30,
                        height: 30,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 500.0),
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFFef3038)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => shop()),
                    );
                  },
                  child: Text(
                    'Alışverişe Başlayın',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class shop extends StatefulWidget {
  const shop({Key? key}) : super(key: key);
  @override
  _shop createState() => _shop();
}

class _shop extends State<shop> {
  double size = 35;
  double icons = 50;
  double container_uzunluk = 350;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey, // Ekranın arka plan rengi
      appBar: AppBar(
        title: Text('Market'),
        centerTitle: true,
        backgroundColor: Color(0xFFef3038),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            buildContainerWithText('assets/krampon.png', 'Adidas'),
            SizedBox(height: size),
            buildContainerWithText('assets/terlik.png', 'Lumberjack'),
            SizedBox(height: size),
            buildContainerWithText('assets/tshirt.png', 'DeFacto'),
            SizedBox(height: size),
            buildContainerWithText('assets/team_uniform.png', 'Puma'),
            SizedBox(height: size),
            buildContainerWithText('assets/boot.png', 'Camper'),
          ],
        ),
      ),
    );
  }

  Widget buildContainerWithText(String imagePath, String text) {
    return Container(
      width: container_uzunluk,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              imagePath,
              width: icons,
              height: icons,
            ),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Etkinlik extends StatefulWidget {
  const Etkinlik({Key? key}) : super(key: key);

  @override
  _EtkinlikState createState() => _EtkinlikState();
}

class _EtkinlikState extends State<Etkinlik>
    with SingleTickerProviderStateMixin {
  final List<String> imagePaths = [
    'sagopa_konser.jpeg',
    'konser2.jpg',
    'konser3.jpeg',
    'konser4.jpg',
    'konser5.jpg',
    'konser6.png',
  ];
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: const Offset(0, 10),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etkinlikler'),
        backgroundColor: Color(0xFFef3038),
      ),
      body: Stack(
        children: [
          // Arka plan
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.54),
            width: double.infinity,
            height: double.infinity,
          ),
          // Liste
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final imagePath = imagePaths[index % imagePaths.length];
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        width: 350,
                        height: 380,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/$imagePath',
                          height: 350,
                          width: 400,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 6,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class sarkici extends StatefulWidget {
  const sarkici({Key? key}) : super(key: key);

  @override
  _SarkiciState createState() => _SarkiciState();
}

class SharkiciInfo {
  String name;
  String imageUrl;
  bool isTik;

  SharkiciInfo(this.name, this.imageUrl, {this.isTik = false});
}

class _SarkiciState extends State<sarkici> with SingleTickerProviderStateMixin {
  List<SharkiciInfo> sharkicilar = [
    SharkiciInfo('Tarkan', 'assets/tarkan.jpg'),
    SharkiciInfo('Sagopa Kajmer', 'assets/sagopa.jpg'),
    SharkiciInfo('Şanışer', 'assets/saniser.jpg'),
    SharkiciInfo('Ceza', 'assets/ceza.jpeg'),
    SharkiciInfo('Norm Ender', 'assets/norm_ender.jpeg'),
    SharkiciInfo('Serdar Ortaç', 'assets/serdar_ortaç.jpg'),
  ];

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: const Offset(0, 10),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanatçılar'),
        backgroundColor: Color(0xFFef3038),
      ),
      body: Container(
        color: Colors.grey, // Arka plan rengi
        child: ListView.builder(
          itemCount: (sharkicilar.length / 2).ceil(),
          itemBuilder: (context, index) {
            final firstIndex = index * 2;
            final secondIndex = firstIndex + 1;

            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSanatciContainer(sharkicilar[firstIndex]),
                      const SizedBox(width: 20),
                      if (secondIndex < sharkicilar.length)
                        buildSanatciContainer(sharkicilar[secondIndex]),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildSanatciContainer(SharkiciInfo sanatci) {
    return GestureDetector(
      onTap: () {
        setState(() {
          sanatci.isTik = !sanatci.isTik;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 4,
              blurRadius: 2.5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 225,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              sanatci.imageUrl,
              width: 120,
              height: 120,
            ),
            Text(
              sanatci.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              sanatci.isTik ? 'assets/check.gif' : 'assets/cross.gif',
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Sanatci extends StatefulWidget {
  const Sanatci({Key? key}) : super(key: key);

  @override
  _SanatciState createState() => _SanatciState();
}

class _SanatciState extends State<Sanatci> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: const Offset(0, 10),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
    _controller.repeat(reverse: true); // Animasyonu sürekli olarak oynat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alanlar'),
        backgroundColor: Color(0xFFef3038),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white70, // Arka plan rengi
            width: double.infinity,
            height: double.infinity,
          ),
          // Bulanık arka plan
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color:
                  Colors.black.withOpacity(0.5), // Bulanıklık rengi ve opaklık
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Animasyonlu Container
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => sarkici()),
                );
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: _offsetAnimation.value,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      width: 200,
                      height: 200,
                      color: Colors.white,
                      child: Center(
                        widthFactor: 170,
                        heightFactor: 170,
                        child: Image.asset('assets/microphone.png'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
