import 'package:flutter/material.dart';

class Item {
  late int _nim;
  late String _nama;
  late String _alamat;
  late String _jenisKelamin;

  int get nim => this._nim;
  set nim(int value) => this._nim = value;

  String get nama => this._nama;
  set nama(String value) => this._nama = value;

  String get alamat => this._alamat;
  set alamat(String value) => this._alamat = value;

  String get jenisKelamin => this._jenisKelamin;
  set jenisKelamin(String value) => this._jenisKelamin = value;

  // Konstruksi versi 1
  Item(this._nim, this._nama, this._alamat, this._jenisKelamin);

  // Konstruktor versi 2 : konversi dari map ke item
  Item.fromMap(Map<String, dynamic> map) {
    this._nim = map['nim'];
    this._nama = map['nama'];
    this._alamat = map['alamat'];
    this._jenisKelamin = map['jenisKelamin'];
  }

  // Konversi dari item ke map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['nim'] = this.nim;
    map['nama'] = nama;
    map['alamat'] = alamat;
    map['jenisKelamin'] = jenisKelamin;

    return map;
  }
}
