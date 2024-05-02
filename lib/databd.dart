
import 'package:flutter/material.dart';
import 'package:mixproj/appDatabase.dart';
import 'package:mixproj/notedetails.dart';


class Databd extends StatefulWidget {


  @override
  State<Databd> createState() => _DatabdState();


}

// class _DatabdState extends State<Databd> {
//   AppDatabase? appdb;
//   List<Map<String, dynamic>> mData = [];
//
//   var titleContrller = TextEditingController();
//   var decoContrller = TextEditingController();
//   bool showActionButton = false;
//   int? longPressedIndex;
//   Set<int> selectedIndices = Set<int>();
//
//   void showBottomSheet( int? id){
//     if(id!= null){
//       final _existingdata = mData.firstWhere((element) => false)["note_id"];
//       titleContrller.text=_existingdata["note_title"];
//       decoContrller.text=_existingdata["note_desc"];
//
//
//
//
//
//     }else(
//
//     );
//
//
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     appdb = AppDatabase.db;
//     getsNotes();
//   }
//
//   void getsNotes() async {
//     mData= await appdb!.fetchallnote();
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Database"),
//         actions: [
//           if(selectedIndices.isNotEmpty && showActionButton )IconButton(
//             icon: Icon(Icons.delete), // Icon you want to add
//             onPressed: () {
//               if (selectedIndices.isNotEmpty ){
//
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Confirm"),
//                       content: Text("Do you want to delete this item?"),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text("Cancel"),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             for (int index in selectedIndices) {
//                               appdb!.remove(mData[index]["note_id"]);
//                             }
//                             selectedIndices.clear(); // Clear selected items
//                             getsNotes();
//                                showActionButton = false;
//                             Navigator.of(context).pop();
//                           },
//                           child: Text("Delete"),
//                         ),
//                       ],
//                     );
//                   },
//                 );// al
//               }
//
//
//             },
//           ),
//         ],
//       ),
//       body: mData.isNotEmpty ? ListView.builder(
//           itemCount: mData.length,
//           itemBuilder:(context,index){
//             return ListTile(
//
//               onTap:(){
//
//                 setState(() {
//                   if (selectedIndices.contains(index)) {
//                     selectedIndices.remove(index); // Deselect item if already selected
//                   } else {
//                     selectedIndices.add(index); // Select item if not selected
//                   }
//                 });
//                 showActionButton = true;
//               } ,
//               onLongPress: (){
//
//
//
//               },
//               leading: selectedIndices.contains(index)
//                   ? CircleAvatar(
//                     child: Icon(
//                       Icons.done,
//                       color: Colors.purple,
//                     ),
//                   )
//                   : CircleAvatar(
//                 child: Text(mData[index]["note_title"].substring(0, 1)),
//               ),
//               title:Text( mData[index]["note_title"])  ,
//               subtitle: Text(mData[index]["note_desc"]),
//               trailing: PopupMenuButton<String>(
//                 onSelected: (String value) {
//                   if (value == 'edit') {
//
//                     titleContrller.text = mData[index]["note_title"];
//                     decoContrller.text = mData[index]["note_desc"];
//                     int id = mData[index]["note_id"];
//
//                     showModalBottomSheet(
//                         context: context, builder: (_){
//                       return Padding(
//                         padding: const EdgeInsets.all(11.0),
//                         child: Container(
//                           height: 800,
//                           child: Column(
//
//                             children: [
//
//                               Text('Update Notes',style: TextStyle(fontSize: 21),),
//                               TextField(controller: titleContrller,
//                                 // Set the initial text from mData
//
//
//                               ),
//                               SizedBox(height: 11,),
//                               TextField(controller: decoContrller,
//                               ),
//                               SizedBox(height: 16,),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   ElevatedButton(onPressed: (){
//
//                                     appdb!.updateda(ntitle: titleContrller.text, ndesc: decoContrller.text, id: id);
//
//                                     getsNotes();
//                                     Navigator.pop(context);
//
//                                   }, child: Text("Update")),
//                                   SizedBox(width: 11,),
//                                   ElevatedButton(onPressed: (){
//                                     Navigator.pop(context);
//
//                                   }, child: Text('Cancel')),
//
//                                 ],
//                               ),
//
//
//
//                             ],
//                           ),
//                         ),
//                       );
//                     });
//                     setState(() {
//
//
//
//                     });
//
//                   } else if (value == 'delete') {
//                     // Handle delete option
//                     appdb!.remove(mData[index]["note_id"]);
//                     getsNotes();
//
//                   }
//                 },
//                 itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                   PopupMenuItem<String>(
//                     value: 'edit',
//                     child: Row(
//                       children: [
//                         Text('Edit'),
//                         SizedBox(width: 11,),
//                         Icon(Icons.edit,size: 18,),
//                       ],
//                     ),
//                   ),
//                   PopupMenuItem<String>(
//                     value: 'delete',
//                     child: Row(
//                       children: [
//                         Text('Delete'),
//                         SizedBox(width: 11,),
//                         Icon(Icons.delete,size:18,)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//             );
//
//           } ): Center(child: Text("Data not found"),),
//
//       floatingActionButton: FloatingActionButton(onPressed: (){
//
//
//         titleContrller.clear();
//         decoContrller.clear();
//         showModalBottomSheet(
//
//             context: context,
//             builder: (_){
//               return Container(
//                 height: 800,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Text('Add Notes',style: TextStyle(fontSize: 21),),
//                       TextField(
//                         controller: titleContrller,
//
//                       ),
//                       SizedBox(height: 11,),
//                       TextField(
//                         controller: decoContrller,
//                       ),
//
//                       SizedBox(height: 16,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(onPressed: (){
//
//
//                             String title = titleContrller.text;
//                             String desc = decoContrller.text;
//
//                             appdb!.addNote(ntitle: title, ndesc:desc );
//                             getsNotes();
//                             Navigator.pop(context);
//
//                           }, child: Text("Add")),
//                           SizedBox(width: 11,),
//                           ElevatedButton(onPressed: (){
//                             Navigator.pop(context);
//
//                           }, child: Text('Cancel')),
//
//                         ],
//                       ),
//
//
//
//                     ],
//                   ),
//                 ),
//
//               );
//
//             }
//         );// btmsheet
//
//
//
//
//
//       }, child: Icon(Icons.add),),
//     );
//
//
//
//
//   }
// }

class _DatabdState extends State<Databd> {
  AppDatabase? appdb;
  List<Map<String, dynamic>> mData = [];
  var titleContrller = TextEditingController();
  var decoContrller = TextEditingController();
  bool showActionButton = false;
  //int? longPressedIndex;
  Set<int> selectedIndices = Set<int>();

  @override
  void initState() {
    super.initState();
    appdb = AppDatabase.db;
    getsNotes();
  }

  void getsNotes() async {
    mData = await appdb!.fetchallnote();
    setState(() {});
  }

  void showBottomSheet(int? id, String pgname  ,  String btname   ) {
    if (id != null) {
      final _existingdata = mData.firstWhere((element) => element["note_id"] == id);
      titleContrller.text = _existingdata["note_title"];
      decoContrller.text = _existingdata["note_desc"];
    }

    showModalBottomSheet(
      elevation: 5,

      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            height: 800,
            child: Column(
              children: [
                Text('$pgname', style: TextStyle(fontSize: 21)),
                TextField(
                  controller: titleContrller,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: decoContrller,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (id != null) {
                          appdb!.updateda(
                            ntitle: titleContrller.text,
                            ndesc: decoContrller.text,
                            id: id,
                          );
                        } else {
                          appdb!.addNote(
                            ntitle: titleContrller.text,
                            ndesc: decoContrller.text,
                          );
                        }
                        getsNotes();
                        Navigator.pop(context);
                      },
                      child: Text("$btname"),
                    ),
                    SizedBox(width: 11,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        actions: [
          if (selectedIndices.isNotEmpty && showActionButton) IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              if (selectedIndices.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm"),
                      content: Text("Do you want to delete this item?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            for (int index in selectedIndices) {
                              appdb!.remove(mData[index]["note_id"]);
                            }
                            selectedIndices.clear();
                            getsNotes();
                            showActionButton = false;
                            Navigator.of(context).pop();
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      body: mData.isNotEmpty ? ListView.builder(
        itemCount: mData.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              setState(() {
                if (selectedIndices.contains(index)) {
                  selectedIndices.remove(index);
                } else {
                  selectedIndices.add(index);
                }
              });
              showActionButton = true;
            },
            leading: selectedIndices.contains(index)
                ? CircleAvatar(
              child: Icon(
                Icons.done,
                color: Colors.purple,
              ),
            )
                : CircleAvatar(
              child: Text(mData[index]["note_title"].substring(0, 1)),
            ),
            onLongPress:(){

             Navigator.push(context, MaterialPageRoute(builder: (cotext){
               return Notedetails();
             }));
              // showModalBottomSheet(context: context,
              //     builder: (_){
              //   return Container(
              //    height: 1000,
              //   );
              //     }
              // );
            },
            title: Text(mData[index]["note_title"]),
            subtitle: Text(mData[index]["note_desc"]),
            trailing: PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'edit') {
                  showBottomSheet(mData[index]["note_id"],"Update Data","Update");
                } else if (value == 'delete') {
                  appdb!.remove(mData[index]["note_id"]);
                  getsNotes();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Row(
                    children: [
                      Text('Edit'),
                      SizedBox(width: 11,),
                      Icon(Icons.edit, size: 18,),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    children: [
                      Text('Delete'),
                      SizedBox(width: 11,),
                      Icon(Icons.delete, size: 18,),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ) : Center(child: Text("Data not found")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleContrller.clear();
          decoContrller.clear();
          showBottomSheet(null,"Add Data","Save");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

