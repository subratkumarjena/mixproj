import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{

  //// all the logic of data base
  AppDatabase._();
  ///accessing the appdb class object
  static final AppDatabase db = AppDatabase._();

// all logic of data base

  Database? MyDb;

  Future<Database>  getDb()async{
    if(MyDb!=null){
      return MyDb!;
    }else{
      MyDb= await initDb();
      return MyDb!;

    }
  }

  Future<Database> initDb() async {

    var rootpath = await getApplicationDocumentsDirectory();
    print('data baselocation :'+rootpath.path);


    var actualpath = join(rootpath.path,"noteDB.db");

    return await openDatabase(actualpath, version: 1,onCreate: (db, version){
      // table create
      db.execute("create table note ( note_id integer primary key autoincrement, note_title text, note_desc text )");


    });

  }





  void addNote({ required String ntitle, required String ndesc}) async{

    var cdb = await getDb();
    cdb.insert( "note" , {

      "note_title": ntitle ,
      "note_desc" : ndesc
    });

  }

  Future<List<Map<String,dynamic>>> fetchallnote() async{
    var cdb = await getDb();
    var data =   await cdb.query( "note");
    return data;

  }


  void remove(int id) async {
    var cdb = await getDb();
    cdb.delete("note", where: "note_id = ?", whereArgs: [id]);
  }
  void updateda({ required String ntitle, required String ndesc, required id}) async{

    var cdb = await getDb();
    cdb.update("note", {

      "note_title": ntitle ,
      "note_desc" : ndesc,

    },where: "note_id = ?", whereArgs: [id],);

  }


}