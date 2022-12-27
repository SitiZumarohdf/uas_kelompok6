import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  @override
  _BiodataPage createState() => _BiodataPage();
}

enum Gender { male, female }

class _BiodataPage extends State<BiodataPage> {
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Masukkan NIM',
                  labelText: 'NIM',
                  icon: Icon(Icons.assignment),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'Masukkan Nama Lengkap',
                  labelText: 'Nama',
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: TextField(
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                  hintText: 'Masukkan Alamat Lengkap',
                  labelText: 'Alamat',
                  icon: Icon(Icons.location_city),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
            ),
          ),

          Row(
            children: <Widget>[
              Text('Jenis Kelamin'),
              Expanded(
                child: RadioListTile(
                  title: const Text("Pria"),
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  title: const Text("Wanita"),
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// showAlertDialog(BuildContext context) {
//   Item item;
//   Widget okButton = MaterialButton(
//     child: Text("OK"),
//     onPressed: () {},
//   );

//   AlertDialog alert = AlertDialog(
//     title: Text("BERHASIL"),
//     content: Text("Data Anda Berhasil Ditambahkan"),
//     actions: [
//       okButton,
//     ],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// Future<void> addItem(Item item) async {
//     print('goto here2');
//     int result = await DbHelper.insert(item);
//     if (!mounted) return;
//     if (result > 0){
//       showAlertDialog(context);
//     }
//   }