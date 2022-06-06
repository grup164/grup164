import 'package:flutter/material.dart';
import 'package:wings/views/login.dart';
import 'package:wings/views/register.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/wings.png',
                        height: 50,
                        width: 100,
                        fit: BoxFit.fitWidth,
                      ),
                      Image.asset('images/label.png',
                          height: 100, width: 200, fit: BoxFit.fitWidth),
                    ]),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const GradientButton(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Register()));
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                primary: Colors.white, // background
                onPrimary: Colors.black, // foreground
              ),
              child: const Text(
                "Kayıt Ol",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Home()));
        },
        label: const Text(
          'DEMO',
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text('Giriş Yap'),
          ),
        ],
      ),
    );
  }
}
