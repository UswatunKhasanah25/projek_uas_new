import 'package:flutter/material.dart';
import 'add_menu_form.dart';

class AddMenu extends StatelessWidget {
  final FocusNode _menuFocusNode = FocusNode();
  final FocusNode _jenisFocusNode = FocusNode();
  final FocusNode _hargaFocusNode = FocusNode();
  final FocusNode _stokFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _menuFocusNode.unfocus();
        _jenisFocusNode.unfocus();
        _hargaFocusNode.unfocus();
        _stokFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.brown,
          title: Center(
          child: Text('Tambah List Menu', style: TextStyle(fontSize: 20))
        ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddMenuForm(
              menuFocusNode: _menuFocusNode,
              jenisFocusNode: _jenisFocusNode,
              hargaFocusNode: _hargaFocusNode,
              stokFocusNode: _stokFocusNode, 
            ),
          ),
        ),
      ),
    );
  }
}