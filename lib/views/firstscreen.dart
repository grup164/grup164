import 'package:flutter/material.dart';
import 'package:wings/views/home.dart';
import 'package:wings/views/welcome.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF071A54),
              Color(0xFF062B6E),
              Color(0xFF7F95E4),
              Color(0xFFBDCEEE),
              Color(0xFFE7EBF1)
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/wings.png',
                height: 100,
                width: 200,
                fit: BoxFit.fitWidth,
              ),
              Image.asset(
                'images/label.png',
                height: 200,
                width: 2000,
                fit: BoxFit.fitWidth
              ),
              const Center(
                child: Text(
                  'Hayallere Ulaşmanın \nYeni Yolu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23.19,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
        label: const Text(
          'İleri',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        icon: const Icon(
          Icons.arrow_circle_right,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
