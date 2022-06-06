import 'package:flutter/material.dart';
import 'package:wings/dao/hayaldao.dart';
import 'package:wings/models/hayal.dart';
import 'package:wings/views/home.dart';

class Details extends StatefulWidget {
  final Hayal hayal;

  const Details({Key? key,required this.hayal}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var tfhayalAdi = TextEditingController();
  var tfhayalHedefi = TextEditingController();

  Future<void> sil(int hayalID) async {
    await Hayaldao().hayalSil(hayalID);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  Future<void> guncelle(int hayalID,String hayalAdi,int hayalHedefi) async {
    await Hayaldao().hayalGuncelle(hayalID, hayalAdi, hayalHedefi.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    var hayal = widget.hayal;
    tfhayalAdi.text = hayal.hayalAdi;
    tfhayalHedefi.text = hayal.hayalHedefi.toString();
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
            const Text("Hayal Detay")
          ],
        ),
        actions: [
          TextButton(
            child: Text("Sil",style: TextStyle(color: Colors.white),),
            onPressed: (){
              sil(widget.hayal.hayalID);
            },
          ),
          TextButton(
            child: Text("Güncelle",style: TextStyle(color: Colors.white),),
            onPressed: (){
              guncelle(widget.hayal.hayalID, tfhayalAdi.text, int.parse(tfhayalHedefi.text));
            },
          ),
        ],
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
                decoration: InputDecoration(hintText: "Hayal Adı"),
              ),
              TextField(
                controller: tfhayalHedefi,
                decoration: InputDecoration(hintText: "Hayal Hedefi"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}