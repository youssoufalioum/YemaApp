import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
//import 'package:yema/components/single_product.dart';
import 'package:yema/details_produit.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name":"Modem Wifi JioFi",
      "picture":"images/products/modem2.png",
      "old_price":30000,
      "price":25000,
    },
    {
      "name":"Batterie Solaire",
      "picture":"images/products/batterie.jpg",
      "old_price":80000,
      "price":60000,
    },
    {
      "name":"Ecran plat",
      "picture":"images/products/smarttv.jpg",
      "old_price":140000,
      "price":120000,
    },
    {
      "name":"Parfum Marocain",
      "picture":"images/products/parfum2.png",
      "old_price":5000,
      "price":2000,
    },
    {
      "name":"Savon noir Marocain",
      "picture":"images/products/savon_noir.png",
      "old_price":7000,
      "price":5000,
    },
    /*{
      "name":"Savon noir Marocain",
      "picture":"https://X6QBSFVPR1IJCVRCG3B79VT8YCIGQFBU@www.yema.cm/api/images/products/18/29",
      "old_price":7000,
      "price":5000,
    },*/
  ];
  //Xml2Json xml2json = new Xml2Json();
  //Map list_products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(8.0),
        itemCount: 5,//product_list.length
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1),
        itemBuilder: (BuildContext context, int index){
          return
          /*SingleProductWidget(
            product_name: 'Chaussure pour homme',
            product_picture: 'https://www.yema.cm/1851-large_default/chaussure-pour-homme.jpg',
            product_old_price: '15.000 FCFA',
            product_price: '10.000 FCFA',
          );*/
          Single_product(
          product_name: product_list[index]['name'],
          product_picture: product_list[index]['picture'],
          product_old_price: product_list[index]['old_price'],
          product_price: product_list[index]['price'],
          );
    });
  }
  @override
  void initState() {
    super.initState();
    //loadNewProducts();
  }
  //Chargement des produits lors du demarrage de l'application.
 /* void loadNewProducts() {
    String url='https://X6QBSFVPR1IJCVRCG3B79VT8YCIGQFBU@www.yema.cm/api/products'; //?display=[id,name,price,images[id],description]
    http.get(url).then((resp) {
      setState(() {
        xml2json.parse(resp.body);
        var jsonData=xml2json.toGData();
        this.list_products=json.decode(jsonData);
        print(list_products);
        //print('${list_products['prestashop']['products']['product']['name']['language']}');
        //print(list_products['prestashop']['products']['id_default_image']['xlink:href']);
      });
    }).catchError((err){
      print(err);
    });
  }*/

  }

class Single_product extends StatelessWidget {

  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Single_product({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price
});
  @override
  Widget build(BuildContext context) {
    return Card(
     child: Hero(tag: product_name, child: Material(
       child: InkWell(onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>new DetailsProduit(product_picture)));
       },
       child: GridTile(
           footer: Container(
             height: 57,
             color: Colors.white70,
             child: ListTile(
               leading: Text(product_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 6),
               ),
               title: Text("$product_price \FCFA",style: TextStyle(color: Colors.red[700],fontSize: 8,fontWeight: FontWeight.w800),),
               subtitle: Text("$product_old_price \FCFA",style: TextStyle(color: Colors.black54,fontSize: 8,fontWeight: FontWeight.w800,decoration: TextDecoration.lineThrough),),
             ),
           ),
           child: Image.asset(product_picture,
           fit: BoxFit.fill,)),
       ),
     )
     ),
    );
  }
}

