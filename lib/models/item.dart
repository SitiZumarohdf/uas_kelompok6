import 'package:flutter/material.dart';

class Item {
  int? nim;
  String? nama;
  String? alamat;
  String? jenisKelamin;

  // String get nim => this._nim;
  // set nim(String value) => this._nim = value;

  // String get nama => this._nama;
  // set nama(String value) => this._nama = value;

  // String get alamat => this._alamat;
  // set alamat(String value) => this._alamat = value;

  // String get jenisKelamin => this._jenisKelamin;
  // set jenisKelamin(String value) => this._jenisKelamin = value;

  // Konstruksi versi 1
  Item(this.nim, this.nama, this.alamat, this.jenisKelamin);

  // Konstruktor versi 2 : konversi dari map ke item
  Item.fromMap(Map<String, dynamic> map) {
    this.nim = map['nim'];
    this.nama = map['nama'];
    this.alamat = map['alamat'];
    this.jenisKelamin = map['jenisKelamin'];
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
