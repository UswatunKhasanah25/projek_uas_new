import 'package:flutter/material.dart';
import 'database_ktg.dart';
import 'edit_ktg_form.dart';

class EditKategori extends StatefulWidget {
  final String currentKode;
  final String currentKategori;
  final String documentId;

  EditKategori({
    this.currentKode,
    this.currentKategori,
    this.documentId,
  });

  @override
  _EditKategoriState createState() => _EditKategoriState();
}

class _EditKategoriState extends State<EditKategori> {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _kategoriFocusNode = FocusNode();

  bool _isDeleting = false;

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
          child: Text('Edit List Kategori', style: TextStyle(fontSize: 20))
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

                      await DatabaseKategori.deleteItem(
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
            child: EditKategoriForm(
              documentId: widget.documentId,
              kodeFocusNode: _kodeFocusNode,
              kategoriFocusNode: _kategoriFocusNode,
              currentKode: widget.currentKode,
              currentKategori: widget.currentKategori,
            ),
          ),
        ),
      ),
    );
  }
}
