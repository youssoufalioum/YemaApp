import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:yema/categories.dart';

//My own imports
import 'package:yema/components/horizontal_listview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yema/view_more.dart';
import 'components/products.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {


  Future<Null> refreshPage() async{
    await Future.delayed(Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {

    Widget images_carousel = ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.red[700],
      indicatorBackgroundColor: Colors.white,
      onPageChanged: (value) {
        //debugPrint('Page changed: $value');
      },
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        Image.asset(
          'images/c1.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'images/m1.jpeg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'images/m2.jpg',
          fit: BoxFit.cover,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      //Ici c'est la barre de Menu
      appBar: new AppBar(
        elevation: 0.2,
        iconTheme: IconThemeData(color: Colors.red[700]),
        backgroundColor: Colors.white,
        title: Image.asset('images/logo.png',height: 250.0,width: 100,),
        //Text('YEMA',style: TextStyle(color: Colors.black),),
        actions: [
          new IconButton(icon: Icon(Icons.search,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,), onPressed: (){}),
         // Center(child: Text('(0)',style: TextStyle(color: Colors.black),)),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            //Header
            new UserAccountsDrawerHeader(
              accountName: Text('Youssoufou Alioum'),
              accountEmail: Text('youssoufalioum@yahoo.fr'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.red[700],size: 50),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.red[700],
              ),
              ),


            //Body
            InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Mon Compte'),
                  leading: Icon(Icons.person),
                )
            ),
            InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Mes Commandes'),
                  leading: Icon(Icons.shopping_basket),
                )
            ),
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Categories()));
                },
                child: ListTile(
                  title: Text('Catégories'),
                  leading: Icon(Icons.dashboard),
                )
            ),
            Divider(), //color:Colors.red[700]
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                  launch("https://fb.me/yema.cm");
                },
                child: ListTile(
                  title: Text('Page facebook Yema'),
                  leading: Image.asset('images/facebook_page.png',width: 27,),
                )
            ),
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                  launch("https://m.me/yema.cm");
                },
                child: ListTile(
                  title: Text('Service Client'),
                  leading: Image.asset('images/facebook_messenger.png',width: 27,),
                )
            ),
            InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Yema Service'),
                  leading: Icon(Icons.location_on),
                )
            ),
         /*   InkWell(
                onTap: (){
                  Navigator.pop(context);
                  showAboutDialog(
                    context: context,
                    applicationVersion: 'Version 1.0.0',
                    applicationIcon: Image.asset('images/logo.png',width: 80,),
                    applicationLegalese: 'Yema est une plateforme developpée par son Fondateur Youssouf Alioum',
                  );
                },
                child: ListTile(
                  title: Text('A Propos'),
                  leading: Icon(Icons.help),
                )
            ),*/
          //Partie copyright Yema
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 200, 8, 8),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('images/logo.png',width: 100,),
                SizedBox(height: 2,),
                Text('Version 1.0.0',style: TextStyle(fontSize: 11),),
                SizedBox(height: 15,),
                Text('\u00A9 2021 YEMA GROUP',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshPage,
        color: Colors.red[700],
        child: new ListView(
          children: [
            //Image carousel
            images_carousel,
            new Padding(padding: const EdgeInsets.all(8.0),
                child: new Text('Catégorie Populaire',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,),)),


            //Horizontal ListView commence ici
            HorizontalList(),

            //Partie banniere publicitaire
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              child: Image.asset('images/ban.png'),
            ),
            ),

            //Partie Vente Flash
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                //margin: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 50),
               // padding: EdgeInsets.all(8.0),
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      //offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Ventes Flash',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Icon(Icons.flash_on,color: Colors.amberAccent,size: 16,),
                            ],
                          ),
                          Text('Plus vendus cette semaine',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                          Text('19:55:01',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    Divider(),
                      //Partie pour presenter les produits en promotion ou les plus vendus de la semaine

                    ],
                  ),
                ),
              ),
            ),

            //Partie banniere publicitaire2
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.asset('images/ban.png'),
              ),
            ),

            new Padding(padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nouveaux Produits',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,),),
                    InkWell(
                      onTap: (){
                        print('VOIR PLUS');
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new AllProduits()));
                      },
                        child: Text('VOIR PLUS >',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.red[700])))
                  ],
                )
            ),


            //Partie Nouveaux Produits
            Container(
              height: 200,
              child: Products(),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),

      //Boutton pour contacter le service client par Appel
    /*  floatingActionButton: FloatingActionButton(
        onPressed: (){
          launch("tel://699700819");
        },
        child: Icon(
          Icons.phone,
          color: Colors.red[700],
        ),
        backgroundColor: Colors.white,
      ),*/
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.grey[200],
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: [
          Image.asset('images/whatsapp.gif',width: 30,),
        Icon(Icons.phone,size: 25,color: Colors.red[700],),
          Image.asset('images/telegram.gif',width: 30,),
      ],
        animationDuration: Duration(
          milliseconds: 200,
        ),
        index: 1,
        animationCurve: Curves.bounceInOut,
        onTap: (index){
        debugPrint('index $index');
        switch(index){
          case 0:
            setState(() {
              launch("https://wa.me/+237699700819");
            });
            break;
          case 1:
            setState(() {
              launch("tel://699700819");
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>new ViewMoreProducts()));
            });
            break;
          case 2:
            setState(() {
              launch("https://t.me/yemacm");
            });
        }
        },
      ),
    );
  }
}
