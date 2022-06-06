import 'package:flutter/material.dart';

class CreateDream extends StatefulWidget {
  const CreateDream({Key? key}) : super(key: key);

  @override
  State<CreateDream> createState() => _CreateDreamState();
}

class _CreateDreamState extends State<CreateDream> {
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
            const Text("Hayalini Ekle")
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
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/Ellipse.png',
              width: 100,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Hayalinizin İsmi"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Hedef Miktar"),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [GradientButton1(), GradientButton2()],
            ),
          ],
        ),
      )),
    );
  }
}

class GradientButton1 extends StatelessWidget {
  const GradientButton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0xFF8288A0), Color(0xFFE7EBF1)],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Geri Dön"),
          ),
        ],
      ),
    );
  }
}

class GradientButton2 extends StatelessWidget {
  const GradientButton2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0xFF8288A0), Color(0xFFE7EBF1)],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateDream()));
            },
            child: const Text("Hayali Kaydet"),
          ),
        ],
      ),
    );
  }
}
