import 'package:flutter/material.dart';
import 'package:wings/views/profile.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
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
            const Text("Profil Oluştur")
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
            TextButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("şifremi unuttum");
                },
                child: const Text("Profil Fotoğrafı Ekle")),
            const SizedBox(
              height: 50,
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
              padding: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Kullanıcı Adı"),
              ),
            ),
            const SizedBox(height: 50),
            const GradientButton(),
          ],
        ),
      )),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
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
              padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 20),
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
            child: const Text(
              'Başlayalım',
              style: TextStyle(color: Color(0xFF071A54)),
            ),
          ),
        ],
      ),
    );
  }
}
