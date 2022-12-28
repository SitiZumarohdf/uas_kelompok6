import 'package:flutter/material.dart';
import 'package:uas_kelompok6/database/DbHelper.dart';

class Edit extends StatefulWidget {
  final int nim;
  final String nama;
  final String alamat;
  final String jenisKelamin;

  const Edit({
    super.key,
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
  });

  @override
  // ignore: no_logic_in_create_state
  State<Edit> createState() => _Edit(nim, nama, alamat, jenisKelamin);
}

class _Edit extends State<Edit> {
  final _nim = TextEditingController();
  final _nama = TextEditingController();
  final _alamat = TextEditingController();

  _Edit(int nim, String nama, String alamat, String jenisKelamin) {
    _nim.text = nim.toString();
    _nama.text = nama.toString();
    _alamat.text = alamat.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        title: Text('Edit Data Page'),
      )),
    );
  }
}
