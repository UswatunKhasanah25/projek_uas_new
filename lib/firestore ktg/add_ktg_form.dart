import 'package:flutter/material.dart';
import 'database_ktg.dart';
import 'package:projek_uas_new/validator.dart';
import 'package:projek_uas_new/custom_form_field.dart';

class AddKategoriForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode kategoriFocusNode;

  const AddKategoriForm({
    this.kodeFocusNode,
    this.kategoriFocusNode,
      });
    
      @override
      _AddKategoriFormState createState() => _AddKategoriFormState();
    }
    

class _AddKategoriFormState extends State<AddKategoriForm> {
  final _addKategoriFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addKategoriFormKey,
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
                  hint: 'Masukkan kode kategori',
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
                  hint: 'Masukkan kategori',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
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

                      if (_addKategoriFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await DatabaseKategori.addItem(
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
                        'ADD KATEGORI',
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