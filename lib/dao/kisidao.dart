import 'package:wings/DbHelper/DbHelper.dart';
import 'package:wings/models/kisi.dart';

class Kisidao{
  Future<List<Kisi>> kisi() async {
    var db = await DbHelper.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * FROM kisi");
    return List.generate(maps.length, (i){
    var satir = maps[i];
    return Kisi(satir["kisiID"],satir["kisiIsim"],satir["kisiSoyisim"]);
    });
  }
  Future<void> kisiEkle(String kisiIsim,String kisiSoyisim) async {
    var db = await DbHelper.veritabaniErisim();

    var bilgi = <String,dynamic>{};
    bilgi["kisiIsım"]= kisiIsim;
    bilgi["kisiSoyisim"]= kisiSoyisim;
    await db.insert("kisi", bilgi);
    }
  Future<void> kisiGuncelle(String kisiIsim,String kisiSoyisim) async {
    var db = await DbHelper.veritabaniErisim();

    var bilgi = <String,dynamic>{};
    bilgi["kisiIsım"]= kisiIsim;
    bilgi["kisiSoyisim"]= kisiSoyisim;
    await db.update("kisi", bilgi, where: "kisiID=?",whereArgs: [1]);
    }
  Future<void> kisiSil(int kisiID) async {
    var db = await DbHelper.veritabaniErisim();
    await db.delete("kisi", where: "kisiID=?",whereArgs: [kisiID]);
    }
  }