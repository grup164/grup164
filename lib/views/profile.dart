import 'package:flutter/material.dart';
import 'package:wings/views/createdream.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(2, 4), // Shadow position
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF071A54), Color(0xFF95A8E8)],
                ),
              ),
              child: Center(
                child: Row(children: [
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('images/Ellipse.png',
                          width: 100, fit: BoxFit.contain),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset('images/wings.png',
                          width: 60, fit: BoxFit.contain),
                      const Text(
                        "Profil",
                        style: TextStyle(fontSize: 36.0, color: Colors.white),
                      )
                    ],
                  )
                ]),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "İsim"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Soyisim"),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Kullanıcı Adı"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateDream()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      primary: const Color(0xFF062B6E)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("images/wings.png", height: 50),
                      const Text(
                        "Hayal \nEkle",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [GradientButton1(), GradientButton2()],
                ),
              ],
            ),
          ],
        ),
      ),
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
                  colors: <Color>[Color(0xFF8288A0),Color(0xFFE7EBF1)],
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
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
            child: const Text("Çıkış Yap"),
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
                  colors: <Color>[Color(0xFF8288A0),Color(0xFFE7EBF1)],
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
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
            child: const Text("Ayarlar"),
          ),
        ],
      ),
    );
  }
}
