import 'package:uas_kelompok6/database/DbHelper.dart';
import 'package:uas_kelompok6/models/item.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uas_kelompok6/pages/detail_page.dart';

late List<Item> globItemList;

class ListDataPage extends StatefulWidget {
  const ListDataPage({super.key});

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () {

        },
      )
    );
  }

  void updateListView() {
    Future<Database> dbFuture = DbHelper.initDb();
    dbFuture.then((database) {
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

  void navigateToDetailPage(Item item) async {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailPage(
    //       nim: globItemList[index].nim,
    //       nama: globItemList[index].nama,
    //       alamat: globItemList[index].alamat,
    //     ),
    //   ),
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder : (context) {
          return DetailPage(item);
        }
      )
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
              globItemList[index].nim.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              globItemList[index].nama.toString(),
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
              navigateToDetailPage(this.itemList[index]);
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