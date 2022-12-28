// import 'package:uas_kelompok6/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:uas_kelompok6/database/DbHelper.dart';
import 'package:uas_kelompok6/pages/biodata_page.dart';
import 'package:uas_kelompok6/pages/list_page.dart';
import 'package:uas_kelompok6/pages/edit_list.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key, 
    int? nim, 
    String? nama, 
    String? alamat
  });

  static const appTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detail Page'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            // Text('NIM : ')
          ],
        )
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Text('Edit Data'),
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
