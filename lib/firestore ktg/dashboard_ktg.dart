import 'package:flutter/material.dart';
import 'add_kategori.dart';
import 'kategori_list.dart';

class DashboardKategori extends StatefulWidget {
  @override
  _DashboardKategoriState createState() => _DashboardKategoriState();
}

class _DashboardKategoriState extends State<DashboardKategori> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown,
        title: Center(
          child: Text('List Kategori', style: TextStyle(fontSize: 25))
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddKategori(),
            ),
          );
        },
        backgroundColor: Colors.brown[400],
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: KategoriList(),
        ),
      ),
    );
  }
}
