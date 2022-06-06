import 'package:wings/DbHelper/DbHelper.dart';
import 'package:wings/models/hayal.dart';

class Hayaldao{

  Future<List<Hayal>> hayal() async {
    var db = await DbHelper.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * FROM hayal");
    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Hayal(satir["hayalID"],satir["hayalAdi"],satir["hayalHedefi"]);
    });
  }

  Future<void> hayalEkle(String hayalAdi,int hayalHedefi) async {
    var db = await DbHelper.veritabaniErisim();

    var bilgi = <String,dynamic>{};
    bilgi["hayalAdi"]= hayalAdi;
    bilgi["hayalHedefi"]= hayalHedefi;
    await db.insert("hayal", bilgi);
  }

  Future<void> hayalGuncelle(int hayalID,String hayalAdi,String hayalHedefi) async {
    var db = await DbHelper.veritabaniErisim();

    var bilgi = <String,dynamic>{};
    bilgi["hayalAdi"]= hayalAdi;
    bilgi["hayalHedefi"]= hayalHedefi;
    await db.update("hayal", bilgi, where: "hayalID=?",whereArgs: [hayalID]);
  }
  Future<void> hayalSil(int hayalID) async {
    var db = await DbHelper.veritabaniErisim();
    await db.delete("hayal", where: "hayalID=?",whereArgs: [hayalID]);
  }
}