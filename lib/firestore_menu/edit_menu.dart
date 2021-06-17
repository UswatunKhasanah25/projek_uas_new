import 'package:flutter/material.dart';
import 'database_menu.dart';
import 'edit_menu_form.dart';

class EditMenu extends StatefulWidget {
  final String currentMenu;
  final String currentJenis;
  final int currentHarga;
  final int currentStok;
  final String documentId;

  EditMenu({
    this.currentMenu,
    this.currentJenis,
    this.currentHarga,
    this.currentStok,
    this.documentId, String currencyValue, String selectedCurrency,
  });

  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  final FocusNode _menuFocusNode = FocusNode();
  final FocusNode _jenisFocusNode = FocusNode();
  final FocusNode _hargaFocusNode = FocusNode();
  final FocusNode _stokFocusNode = FocusNode();

  bool _isDeleting = false;

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
          child: Text('Edit List Menu', style: TextStyle(fontSize: 20))
        ),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditMenuForm(
              documentId: widget.documentId,
              menuFocusNode: _menuFocusNode,
              jenisFocusNode: _jenisFocusNode,
              hargaFocusNode: _hargaFocusNode,
              stokFocusNode: _stokFocusNode,
              currentMenu: widget.currentMenu,
              currentJenis: widget.currentJenis,
              currentHarga: widget.currentHarga,
              currentStok: widget.currentStok,
            ),
          ),
        ),
      ),
    );
  }
}
