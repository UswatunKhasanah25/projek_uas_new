import 'package:flutter/material.dart';
import 'package:projek_uas_new/pages/sign_in.dart';
import 'package:projek_uas_new/pages/login_page.dart';

class DrawerWithEmail extends StatelessWidget {
  
  const DrawerWithEmail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
            accountName:  Text("Admin",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('$email',
                style: TextStyle(
                    fontSize: 15),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/apple/96/female-cook-type-1-2_1f469-1f3fb-200d-1f373.png")
              ),
      ),
      ListTile(
        leading: Icon(Icons.restaurant_menu, 
          color: Colors.brown[700], 
          size: 30),
        title: Text("Menu"),
        onTap: () {
          
        }
      ),
      ListTile(
        leading: Icon(Icons.add_shopping_cart_rounded, 
          color: Colors.brown[700], 
          size: 30),
        title: Text("Tambah Menu"),
        onTap: () {
          
        }
      ),
      Divider(
        color: Colors.black,
        height: 20,
        thickness: 1,
        indent: 26,
        endIndent: 26,
      ),
      ListTile(
        leading: Icon( Icons.category_rounded,
          color: Colors.brown[700],
          size: 30,
        ),
        title: Text("Kategori"),
        onTap: () {
          
        }
      ),
      ListTile(
        leading: Icon( Icons.addchart_outlined,
          color: Colors.brown[700],
          size: 30,
        ),
        title: Text("Tambah Kategori"),
        onTap: () {
          
        }
      ),
      Divider(
        color: Colors.black,
        height: 20,
        thickness: 1,
        indent: 26,
        endIndent: 26,
      ),
      Expanded(
        child: Container(
          height: 300,
        ),
      ),
      Divider(
        color: Colors.black,
        height: 20,
        thickness: 1,
        indent: 26,
        endIndent: 26,
      ),
      ListTile(
        title: Text("Log Out"),
        leading: Icon(Icons.logout,
          color: Colors.brown[700],
          size: 30,
        ),
         onTap: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }), ModalRoute.withName('/'));
                },
      ),
    ]));
  }
}