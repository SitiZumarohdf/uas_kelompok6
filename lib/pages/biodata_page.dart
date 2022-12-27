import 'package:flutter/material.dart';
import 'package:uas_kelompok6/models/item.dart';
import 'package:uas_kelompok6/database/dbhelper.dart';
import 'package:uas_kelompok6/pages/list_page.dart';

class BiodataPage extends StatefulWidget {
  @override
  _BiodataPage createState() => _BiodataPage();
}

enum Gender { male, female }

class _BiodataPage extends State<BiodataPage> {
  Gender _gender = Gender.male;
  TextEditingController nim = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController jk = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: TextField(
              controller: nim,
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
              top: 15,
            ),
            child: TextField(
              controller: nama,
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
              top: 15,
            ),
            child: TextField(
              controller: alamat,
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
              Padding(padding: EdgeInsets.only(top: 15, left: 25)),
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
          Center(
            child: ElevatedButton(
              onPressed: () {
                DbHelper.insert(Item(
                    int.parse(nim.text),
                    nama.text,
                    alamat.text,
                    _gender.toString() == 'Gender.male' ? 'male' : 'female'));
                // Navigator.pop(context);
              },
              child: Text('SAVE'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                elevation: 3,
              ),
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
    if (result > 0) {
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
