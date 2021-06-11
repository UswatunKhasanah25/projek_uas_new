import 'package:flutter/material.dart';
import 'add_ktg_form.dart';

class AddKategori extends StatelessWidget {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _kategoriFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _kodeFocusNode.unfocus();
        _kategoriFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.brown,
          title: Center(
          child: Text('Tambah List Kategori', style: TextStyle(fontSize: 20))
        ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddKategoriForm(
              kodeFocusNode: _kodeFocusNode,
              kategoriFocusNode: _kategoriFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}