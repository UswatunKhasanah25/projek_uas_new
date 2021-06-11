import 'package:flutter/material.dart';
import 'package:projek_uas_new/email/drawer_email.dart';
import 'package:projek_uas_new/firestore ktg/dashboard_ktg.dart';
import 'package:projek_uas_new/firestore_menu/dashboard_menu.dart';
import 'drawer_email.dart';

class HomePageEmail extends StatefulWidget {
  @override 
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePageEmail> {
  @override 
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Resto Uswa', style: TextStyle(fontSize: 30))
        ),
        backgroundColor: Colors.brown
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push( 
                        context, 
                        MaterialPageRoute(
                          builder: (context) => DashboardMenu()
                        )
                     );
                    },
                    child: Text("List Menu",
                      style: TextStyle(fontSize: 16)),
                  )
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push( 
                        context, 
                        MaterialPageRoute(
                          builder: (context) => DashboardKategori()
                        )
                     );
                    },
                    child: Text("List Kategori",
                      style: TextStyle(fontSize: 16)),
                  )
                )
              ]
            ),
            Image.network("https://image-cdn.medkomtek.com/_kMbLH1NBowEFKXTIICc0emiLho=/1200x675/smart/klikdokter-media-buckets/medias/2301403/original/041071400_1541671527-Tips-Sehat-Saat-Makan-di-Restoran-Thailand-By-supatchai-Shutterstock.jpg"),
            Image.network("https://cdn-2.tstatic.net/tribunnews/foto/bank/images2/resep-minuman-hangat-cocok-dinikmati-saat-musim-hujan-berikut-cara-membuatnya.jpg"),
            Image.network("https://cf.shopee.co.id/file/96c8b7c5690fa1271258cf6053990415"),
          ]
        )  
       )   
    ),
      drawer: DrawerWithEmail(),
    );
  }
}