// import 'package:uas_kelompok6/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:uas_kelompok6/database/DbHelper.dart';
import 'package:uas_kelompok6/pages/biodata_page.dart';
import 'package:uas_kelompok6/pages/list_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  static const appTitle = 'Edit Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Form(
        key: super.key,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
          ),
        ]),
      ),
    );

//     return DefaultTabController(
//       initialIndex: 0,
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//           bottom: const TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.article),
//                 child: Text('Isi Data'),
//               ),
//               Tab(
//                 icon: Icon(Icons.list),
//                 child: Text('List Data'),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             BiodataPage(),
//             ListDataPage(),
//           ],
// ),
//       ),
//     );
  }

  Widget buttonElevated() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Back", style: TextStyle(fontSize: 20)),
    );
  }
}
