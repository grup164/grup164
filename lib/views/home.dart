import 'package:flutter/material.dart';
import 'package:wings/dao/hayaldao.dart';
import 'package:wings/models/hayal.dart';
import 'package:wings/views/add.dart';
import 'package:wings/views/details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Hayal>> hayal() async {
    var hayalListesi = await Hayaldao().hayal();
    return hayalListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/wings.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Ana Sayfa"),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF071A54), Color(0xFF95A8E8)]),
          ),
        ),
      ),
      body: FutureBuilder<List<Hayal>>(
        future: hayal(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var hayalListesi = snapshot.data;
            return ListView.builder(
              itemCount: hayalListesi?.length,
              itemBuilder: (context, indeks) {
                var hayal = hayalListesi![indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                                  hayal: hayal,
                                )));
                  },
                  child: Card(
                    child: SizedBox(
                      width: 200,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            hayal.hayalAdi,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(hayal.hayalHedefi.toString() + " TL"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Add()));
        },
        tooltip: 'Hedef Ekle',
        child: Icon(Icons.money_off_rounded),
        backgroundColor: Color(0xFF071A54),
      ),
    );
  }
}
