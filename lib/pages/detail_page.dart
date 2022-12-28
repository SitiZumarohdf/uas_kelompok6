// import 'package:uas_kelompok6/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:uas_kelompok6/database/DbHelper.dart';
import 'package:uas_kelompok6/pages/biodata_page.dart';
import 'package:uas_kelompok6/pages/list_page.dart';

class DetailPage extends StatelessWidget {
  final int nim;
  final String nama;
  final String alamat;
  final String jenisKelamin;

  static const appTitle = 'Edit';

  const DetailPage({super.key,
  required this.nim,
  required this.nama,
  required this.alamat,
  required this.jenisKelamin,
  });

  @override
  // create_state
  State<Edit> createState() => _EditPage(
  nim, 
  nama, 
  alamat, 
  jeniskelamin);
}

enum GenderCharacter {l, p}

class _EditPage extends State<Edit> {
  final formKey = GlobalKey<FormState>();
  final nim = TextEditingController();
  final nama = TextEditingController();
  final alamat = TextEditingController();

  GenderCharacter? _genderCharacter = GenderCharacter.l;

  _EditPage(int nim, String nama, String alamat, String jeniskelamin) {
    nim.text = nim.toString();
    nama.text = nama.toString();
    alamat.text = alamat.toString();
    genderCharacter = jeniskelamin.toString() == 'Laki-laki'
      ? GenderCharacter.l
      : GenderCharacter.p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Text('Edit Data Mahasiswa'),
    ),
    body: Column(
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
              Padding(padding: EdgeInsets.only(top: 10, left: 20)),
              Text('Jenis Kelamin'),
              Expanded(
                child: RadioListTile(
                  title: const Text("L"),
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
                  title: const Text("P"),
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
          var gender =
            _genderCharacter.toString() == 'GenderCharacter.l'
                ? 'Laki-laki'
                : 'Perempuan';

            DHelper.updateItem(
              int.parse(_id.text),
              int.parse(_nim.text),
              _name.text,
              _address.text,
              gender,
            );

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success')),
            );
          
        ;
  }
  Widget buttonElevated() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Back", style: TextStyle(fontSize: 20)),
    );
  }
}
