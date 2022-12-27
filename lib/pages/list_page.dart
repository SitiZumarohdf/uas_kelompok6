import 'package:flutter/material.dart';
import 'package:uas_kelompok6/models/item.dart';

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
  List<Item> listItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) {
            Item item = listItem[index];
            return const Padding(
              padding: EdgeInsets.only(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple,
          onPressed: () {},
        ));
  }
}
