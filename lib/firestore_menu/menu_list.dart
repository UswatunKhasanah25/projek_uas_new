import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'edit_menu.dart';
import 'database_menu.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data.docs[index].data();
              String docID = snapshot.data.docs[index].id;
              String menu = noteInfo['menu'];
              String jenis = noteInfo['jenis'];
              int harga = noteInfo['harga'];
              int stok = noteInfo['stok'];

              return Ink(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditMenu(
                        currentMenu: menu,
                        currentJenis: jenis,
                        currentHarga: harga,
                        currentStok: stok,
                        documentId: docID,
                      ),
                    ),
                  ),
                  title: Text( 
                    menu,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kategori        : " + jenis,
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       ),
                      Text(
                        "Harga            : Rp." + harga.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Jumlah stok : "+ stok.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.orange,
            ),
          ),
        );
      },
    );
  }
}