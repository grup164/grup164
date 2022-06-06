// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var tfController = TextEditingController();

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
            const Text("Giriş")
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
              const Text("Giriş Yap",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF071A54))),
              const SizedBox(
                height: 50,
              ),
              const Kullaniciadi(),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Şifre"),
                ),
              ),
              TextButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print("şifremi unuttum");
                  },
                  child: const Text("Şifremi Unuttum")),
              const SizedBox(height: 50),
              const GradientButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class Kullaniciadi extends StatelessWidget {
  const Kullaniciadi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Mail veya Kullanıcı Adınız"),
      ),
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
                  colors: <Color>[Color(0xFF071A54), Color(0xFF95A8E8)],
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
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
            },
            child: const Text('Giriş Yap'),
          ),
        ],
      ),
    );
  }
}
