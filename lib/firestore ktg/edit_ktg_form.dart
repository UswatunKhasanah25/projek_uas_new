import 'package:flutter/material.dart';
import 'database_ktg.dart';
import 'package:projek_uas_new/validator.dart';
import 'package:projek_uas_new/custom_form_field.dart';

class EditKategoriForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode kategoriFocusNode;
  final String currentKode;
  final String currentKategori;
  final String documentId;

  const EditKategoriForm({
     this.kodeFocusNode,
     this.kategoriFocusNode,
     this.currentKode,
     this.currentKategori,
     this.documentId,
  });

  @override
  _EditKategoriFormState createState() => _EditKategoriFormState();
}

class _EditKategoriFormState extends State<EditKategoriForm> {
  final _editKategoriFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

   TextEditingController _kodeController;
   TextEditingController _kategoriController;

  @override
  void initState() {
    _kodeController = TextEditingController(
      text: widget.currentKode,
    );
    _kategoriController = TextEditingController(
      text: widget.currentKategori,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editKategoriFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),
                Text(
                  'Kode',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _kodeController,
                  focusNode: widget.kodeFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Kode',
                  hint: 'Enter your note kode',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Kategori',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _kategoriController,
                  focusNode: widget.kategoriFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Kategori',
                  hint: 'Enter your note kategori',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.brown[400],
                    ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.brown[400],
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      widget.kodeFocusNode.unfocus();
                      widget.kategoriFocusNode.unfocus();

                      if (_editKategoriFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await DatabaseKategori.updateItem(
                          docId: widget.documentId,
                          kode: _kodeController.text,
                          kategori: _kategoriController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'UPDATE KATEGORI',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}