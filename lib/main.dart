import 'package:flutter/material.dart';
import 'package:uas_kelompok6/pages/biodata_page.dart';
import 'package:uas_kelompok6/pages/detail_page.dart';
import 'package:uas_kelompok6/pages/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kelompok 6',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Biodata Mahasiswa'),
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Tambah Data"),
                Tab(icon: Icon(Icons.assignment_ind), text: "Data List"),
              ],
            ),
          ),
          body: TabBarView(children: [
            BiodataPage(),
            ListDataPage(),
          ]),
        ));
  }
}
