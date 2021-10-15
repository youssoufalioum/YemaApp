import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 10,
        child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              pinned: true,
              floating: true,
              bottom: TabBar(
                indicatorColor: Colors.red[700],
                labelColor: Colors.black,
                isScrollable: true,
                tabs: [
                  Text('Toute'),
                  Tab(icon: Icon(Icons.account_circle),),
                  Tab(icon: Icon(Icons.category),),
                  Tab(icon: Icon(Icons.description),),
                  Tab(icon: Icon(Icons.account_circle),),
                  Tab(icon: Icon(Icons.category),),
                  Tab(icon: Icon(Icons.description),),
                  Tab(icon: Icon(Icons.account_circle),),
                  Tab(icon: Icon(Icons.category),),
                  Tab(icon: Icon(Icons.description),),
                ],
              ),
              iconTheme: IconThemeData(color: Colors.red[700]),
              backgroundColor: Colors.white,
              title: Text('Catégorie',style: TextStyle(color: Colors.black),),
                actions: [
                  new IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                       // showSearch(context: context, delegate: ProduitsSearch()); //this.listProduits,this.widget.id_acheteur,this.widget.jwt,context
                      }),
                  new IconButton(icon: Icon(Icons.shopping_cart,), onPressed: (){}),
                ],
            ),

    ];
  },
          body: TabBarView(
            children: [
              Center(child: Text('Toute catégorie')),
              Icon(Icons.account_circle,size: 350,),
              Icon(Icons.category,size: 350,),
              Icon(Icons.description,size: 350,),
              Icon(Icons.account_circle,size: 350,),
              Icon(Icons.category,size: 350,),
              Icon(Icons.description,size: 350,),
              Icon(Icons.account_circle,size: 350,),
              Icon(Icons.category,size: 350,),
              Icon(Icons.description,size: 350,),
            ],
          ),
        )),
    );
  }
}
