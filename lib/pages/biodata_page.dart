import 'package:flutter/material.dart';
import 'package:uas_kelompok6/models/item.dart';
import 'package:uas_kelompok6/database/dbhelper.dart';

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
                  icon: Icon(Icons.person),
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
              Icon(Icons.people),
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
          
          Padding(
            padding:EdgeInsets.only(top:20.0, bottom:20.0),
            child: ElevatedButton(
              child: Text('SAVE'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                elevation: 3,
              ),
              onPressed: () {
                Navigator.pop(context);

              } 
            ),
          ),
        ],
      ),
    );
  }
  Future<void> addItem(Item item) async {
    print('goto here2');
    int result = await DbHelper.insert(item);
    if (!mounted) return;
    if (result > 0){
      showAlertDialog(context);
    }
  }
  showAlertDialog(BuildContext context) {
  Item item;
  Widget okButton = MaterialButton(
    child: Text("OK"),
    onPressed: () {},
  );
  AlertDialog alert = AlertDialog(
    title: Text("Success"),
    content: Text("Data Telah di Tambahkan"),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
}



