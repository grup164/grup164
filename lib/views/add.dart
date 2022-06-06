
import 'package:flutter/material.dart';
import 'package:wings/dao/hayaldao.dart';
import 'package:wings/views/home.dart';


class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  var tfhayalAdi = TextEditingController();
  var tfhayalHedefi = TextEditingController();

  Future<void> kayit(String hayalAdi,int hayalHedefi) async {
    await Hayaldao().hayalEkle(hayalAdi, hayalHedefi,);
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
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
            const Text("Hedef Ekle")
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: tfhayalAdi,
                decoration: const InputDecoration(hintText: "Hayal Adı"),
              ),
              TextField(
                controller: tfhayalHedefi,
                decoration: const InputDecoration(hintText: "Hayal Hedefi"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          kayit(tfhayalAdi.text, int.parse(tfhayalHedefi.text));
        },
        tooltip: 'Hayal Kayıt',
        icon: const Icon(Icons.save),
        backgroundColor: const Color(0xFF071A54),
        label: const Text("Kaydet"),
      ),
    );
  }
}
