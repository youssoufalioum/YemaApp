import 'dart:convert';
import 'dart:typed_data';
//import 'package:dokkani/AppConstants.dart';
//import 'package:dokkani/langues/languages.dart';
//import 'package:dokkani/vendeurs/modifier_produit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:yema/components/product_images.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:image_picker/image_picker.dart';


class DetailsProduit extends StatefulWidget {
  int id_produit;
  String nom_produit;
  String img_produit;
  double prix_produit;
  String description;
  int id_vendeur;
  int id_acheteur;
  String jwt;
  DetailsProduit(this.img_produit);
  //DetailsProduit(this.id_produit,this.nom_produit,this.img_produit,this.prix_produit,this.description,this.id_vendeur,this.id_acheteur,this.jwt);

  @override
  _DetailsProduitState createState() => _DetailsProduitState();
}

class _DetailsProduitState extends State<DetailsProduit> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: new AppBar(
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.red[700]),
        backgroundColor: Colors.white,
        title: //Image.asset('images/logo.png',height: 250.0,width: 100,),
        Text('Détails produit',style: TextStyle(color: Colors.black),),
        actions: [
          new IconButton(icon: Icon(Icons.search,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,), onPressed: (){}),
          // Center(child: Text('(0)',style: TextStyle(color: Colors.black),)),
        ],
      ),
      body: Column(
       children: [
         SizedBox(
           width: double.infinity,
           child: AspectRatio(
             aspectRatio: 1,
               child: Image.asset(this.widget.img_produit)
           ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ...List.generate(3, (index) => Container(
               margin: EdgeInsets.all(15),
               padding: EdgeInsets.all(8),
               height: 60,
               width: 60,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 border: Border.all(color: Colors.red[700]),
               ),
               child: Image.asset(this.widget.img_produit[index]),
             ),
    )
           ],
         ),
       ],
      ),
      );
  }

  //Methode permettant à l'acheteur de passer sa commande.
 /* Future<void> passerCommande() async {
    String urlPasserCommande = "www.yema.cm/dokkani/api/passercommande";
    bool statut=false;
    Map data = {
      'quantite': quantiteProduitController.text,
      'modePaiement': modeDePaiement,
      'accepterOUrefuser':statut,
      'produit': this.widget.id_produit,
      'acheteur': this.widget.id_acheteur,
      'vendeur': this.widget.id_vendeur,
    };
    String body = json.encode(data);

    var response = await http.post(
      urlPasserCommande,
      headers: {"Content-Type": "application/json","Authorization":this.widget.jwt}, //"x-www-form-urlencoded"
      body: body,
    );
    if(response.statusCode==200) {
      Fluttertoast.showToast(
          msg: "Commander avec succes",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green[600],
          textColor: Colors.white,
          timeInSecForIos: 10
      );
    }
  }*/
}

class UtilityDetail {

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}