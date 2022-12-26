import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:uas_kelompok6/DbHelper.dart';
import 'package:uas_kelompok6/models/item.dart';


class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Biodata"),
          ),
          body: myBody(),
        ),
      ),
    );
  }
}

class myBody extends StatefulWidget {
  @override
  State<myBody> createState() => _mybody();
}

enum Gender { male, female }

class _mybody extends State<myBody> {
  Gender _gender = Gender.male;

  Item item;

  // DbHelper dbHelper = DbHelper();

  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(
              "Add Biodata",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                label: Text("NIM : "),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: nimController,
            ),
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                label: Text("Nama :"),
              ),
              keyboardType: TextInputType.name,
              controller: namaController,
            ),
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(label: Text("Alamat :")),
              keyboardType: TextInputType.streetAddress,
              controller: alamatController,
            ),
            margin: EdgeInsets.only(
              left: 100,
              right: 100,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RadioListTile(
                  title: const Text("Male"),
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  contentPadding:
                      EdgeInsets.only(left: 10, top: 20, bottom: 20),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  title: const Text("Female"),
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (Gender value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  contentPadding:
                      EdgeInsets.only(top: 20, bottom: 20),
                ),
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var gender = _gender.toString();

                  if (gender == "Gender.male") {
                    gender = "male";
                  } else {
                    gender = "female";
                  }

                  item = Item(int.parse(nimController.text),
                      namaController.text, alamatController.text, gender);
                  if (item != null) {
                    print('goto here');
                    await addItem(item);
                    if (!mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataPage(),
                      ),
                    );
                  }
                },
                child: Text("Tambah Data"),
                style: ButtonStyle(
                  alignment: Alignment.center,
                ),
              ),
            ],
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