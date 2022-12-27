// import 'package:flutter/material.dart';
// import 'package:uas_kelompok6/models/item.dart';

// class ListDataPage extends StatefulWidget {
//   @override
//   _ListDataPage createState() => _ListDataPage();
// }

// class _ListDataPage extends State<ListDataPage> {
//   List<Item> listItem = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           Item item = listItem[index];
//           return Padding(
//             padding: EdgeInsets.only(),
//           );
//         }
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         backgroundColor: Colors.deepPurple,
//         onPressed: () {
          
//         },
//       )
//     );
//   }
// }

// ignore_for_file: file_names, camel_case_types

import 'package:uas_kelompok6/database/DbHelper.dart';
import 'package:uas_kelompok6/models/item.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uas_kelompok6/pages/detail_page.dart';

late List<Item> globItemList;

class ListDataPage extends StatefulWidget {
  const ListDataPage({super.key});

  // const ListDataPage({
  //   Key key,
  //   this.id,
  //   this.nim,
  //   this.nama,

  // }): super(key: key);

  @override
  State<ListDataPage> createState() => _ListDataPage();
}

class _ListDataPage extends State<ListDataPage> {
  int count = 0;
  late List<Item> itemList;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: createListView(count: count),
          ),
        ],
      ),
    );
  }

  void updateListView() {
    Future<Database> dbFuture = DbHelper.initDb();
    dbFuture.then((database) {
      //todo
      Future<List<Item>> itemListFuture = DbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          globItemList = itemList;
          count = itemList.length;
        });
      });
    });
  }

  void navigateToDetailPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
      ),
    );
  }

  createListView({required int count}) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              globItemList[index].nama.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              globItemList[index].nim.toString(),
            ),
            trailing: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () async {
                // TODO: Delete
                DbHelper.delete(int.parse(globItemList[index].nim.toString()));
                updateListView();
              },
            ),
            // TODO: Navigasi ke DetailPage
            onTap: () async {
              navigateToDetailPage(context);
            },
            // onTap: () async {
            //   var item = ;
            //   await navigateToDetailPage(context, globItemList[index]);
            //   TODO: Edit
            //   editItem(globItemList[index]);
            // },
          ),
        );
      },
    );
  }
}
