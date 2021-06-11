import 'package:flutter/material.dart';
import 'database_menu.dart';
import 'package:projek_uas_new/validator.dart';
import 'package:projek_uas_new/custom_form_field.dart';

class AddMenuForm extends StatefulWidget {
  final FocusNode menuFocusNode;
  final FocusNode jenisFocusNode;
  final FocusNode hargaFocusNode;
  final FocusNode stokFocusNode;

  const AddMenuForm({
    this.menuFocusNode,
    this.jenisFocusNode,
    this.hargaFocusNode,
    this.stokFocusNode,
      });
    
      @override
      _AddMenuFormState createState() => _AddMenuFormState();
    }
    

class _AddMenuFormState extends State<AddMenuForm> {
  final _addMenuFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _menuController = TextEditingController();
  final TextEditingController _jenisController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addMenuFormKey,
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
                  'Menu',
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
                  controller: _menuController,
                  focusNode: widget.menuFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Menu',
                  hint: 'Masukkan menu',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Jenis',
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
                  controller: _jenisController,
                  focusNode: widget.jenisFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Jenis',
                  hint: 'Pilih kategori',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Harga',
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
                  controller: _hargaController,
                  focusNode: widget.hargaFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Harga',
                  hint: 'Masukkan harga',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Stok',
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
                  controller: _stokController,
                  focusNode: widget.stokFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Stok',
                  hint: 'Masukkan jumlah stok',
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
                      widget.menuFocusNode.unfocus();
                      widget.jenisFocusNode.unfocus();
                      widget.hargaFocusNode.unfocus();
                      widget.stokFocusNode.unfocus();

                      if (_addMenuFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
                          menu: _menuController.text,
                          jenis: _jenisController.text,
                          harga: int.tryParse(_hargaController.text),
                          stok: int.tryParse(_stokController.text),
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
                        'ADD MENU',
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