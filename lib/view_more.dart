//import 'package:dokkani/AppConstants.dart';
//import 'package:dokkani/acheteurs/details_produit.dart';
//import 'package:dokkani/langues/languages.dart';
//import 'package:dokkani/vendeurs/ajouter_produit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'components/single_product.dart';

//import 'details_allproduit.dart';

class AllProduits extends StatefulWidget {
  int id_acheteur;
  String jwt;
  //AllProduits(this.id_acheteur,this.jwt);

  @override
  _AllProduitsState createState() => _AllProduitsState();
}

class _AllProduitsState extends State<AllProduits> {

  List<dynamic> listProduits;

  @override
  void initState() {
    super.initState();
    //loadProduits();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //backgroundColor: Colors.grey[300],
      appBar: AppBar(
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.red[700]),
          backgroundColor: Colors.white,
          title: Text('Tous les produits',style: TextStyle(color: Colors.black),),
          actions: [
            new IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: ProduitsSearch()); //this.listProduits,this.widget.id_acheteur,this.widget.jwt,context
                }),
            new IconButton(icon: Icon(Icons.shopping_cart,), onPressed: (){}),
          ]
      ),
      body: Container(
        child: //(this.listProduits==null)?Center(child: CircularProgressIndicator(color: Colors.red[700])):
        GridView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10),
            itemCount: 1, //listProduits.length
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index){
              return /*SingleProductWidget(
                product_name: 'Chaussure pour homme',
                product_picture: 'https://www.yema.cm/1851-large_default/chaussure-pour-homme.jpg',
                product_old_price: '15.000 FCFA',
                product_price: '10.000 FCFA',
              );*/
              Single_product(
                product_id: listProduits[index]['id'],
                product_name: listProduits[index]['nom'],
                product_picture: listProduits[index]['image'],
                product_price: listProduits[index]['prix'],
                description: listProduits[index]['description'],
                acheteur_id: this.widget.id_acheteur,
                jwt: this.widget.jwt,
              );
            }),
      ),
    );
  }

/*  void loadProduits() {
    String urlProduits = "${AppConstants.ipAdress}/produits";
    http.get(urlProduits,headers: {"Authorization":this.widget.jwt}).then((response) {
      setState(() {
        this.listProduits = json.decode(utf8.decode(response.bodyBytes))['_embedded']['produits'];
      });
    }).catchError((err) {
      print(err);
    });
  }*/
}


class Single_product extends StatelessWidget {
  final int product_id;
  final String product_name;
  final String product_picture;
  final double product_price;
  final description;
  final acheteur_id;
  final String jwt;

  Single_product({
    this.product_id,
    this.product_name,
    this.product_picture,
    this.product_price,
    this.description,
    this.acheteur_id,
    this.jwt
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: product_name, child: Material(
          child: InkWell(onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsAllProduit(this.product_id,this.product_name,this.product_picture,this.product_price,this.description,this.acheteur_id,this.jwt)));
          },
            child: GridTile(
              footer: Container(
                height: 40,
                color: Colors.white60,
                child: ListTile(
                  leading: Text(product_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 8),
                  ),
                  title: Text("${product_price} DH",style: TextStyle(color: Colors.red[700],fontSize: 10,fontWeight: FontWeight.w800),),
                ),
              ),
             // child: this.product_picture==null?Icon(Icons.insert_photo):Utility.imageFromBase64String(product_picture),
            ),
          )),
      ),
    );
  }

}

class ProduitsSearch extends SearchDelegate<List<dynamic>>{

  List<dynamic> listProduits;
  int id_acheteur;
  String jwt;
  BuildContext contextWidget;
  //ProduitsSearch(this.listProduits,this.id_acheteur,this.jwt,this.contextWidget);

  /*@override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }*/

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear),onPressed: (){
        query='';
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,color: Colors.blue[300],),
      onPressed: (){
        close(context, null);
      },
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }
  @override
  String get searchFieldLabel => 'Recherche produit}...';
  /* @override
  TextInputType get keyboardType => TextInputType.text;*/
  /* @override
  TextStyle get searchFieldStyle => TextStyle(color: Colors.grey[50]);*/

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList=query.isEmpty?listProduits:listProduits.where((element) => element['nom'].startsWith(query)).toList();
    return GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: suggestionList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Single_product(
            product_id: suggestionList[index]['id'],
            product_name: suggestionList[index]['nom'],
            product_picture: suggestionList[index]['image'],
            product_price: suggestionList[index]['prix'],
            description: suggestionList[index]['description'],
            acheteur_id: this.id_acheteur,
            jwt: this.jwt,
          );
        });
  }

}