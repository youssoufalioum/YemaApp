import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        //elevation: 0.5,
      ),
      iconTheme: IconThemeData(color: Colors.red[600]),
    ),
    debugShowCheckedModeBanner: false,
    home: YemaHome(),
  ));
}

class YemaHome extends StatefulWidget {

  @override
  _YemaHomeState createState() => _YemaHomeState();
}

class _YemaHomeState extends State<YemaHome> {

  WebViewController controller;
  final Completer<WebViewController> controllerCompleter = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //systemNavigationBarColor: Colors.white,
      //systemNavigationBarIconBrightness: Brightness.dark
    ));
    return WillPopScope(
      onWillPop: () => goBack(context),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.phone,color: Colors.red[600],size: 32,),
              SizedBox(width: 13,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Service client', style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  Text('(+237) 699700819', style: TextStyle(color: Colors.black,fontSize: 15),),
                ],
              ),
            ],
          ),
          //centerTitle: true,
          actions: [
            PopupOptionMenu(),
          ],
        ),
        body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: 'https://www.yema.cm/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controllerCompleter.future.then((value) => controller = value);
              controllerCompleter.complete(webViewController);
            },
          );
        },),

        //Boutton pour contacter le service client
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            launch("https://wa.me/+237699700819");  //launch("tel://699700819");
          },
          child: Image.asset('images/whatsapp.png',width: 100,),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Future<bool> goBack(BuildContext context) async {
    if (await controller.canGoBack()) {
      controller.goBack();
      return Future.value(false);
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('Voulez-vous quitter Yema'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('Oui'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Non'),
                  ),
                ],
              ));
      return Future.value(true);
    }
  }
}

class PopupOptionMenu extends StatelessWidget {
  //const PopupOptionMenu({Key key}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon:Icon(Icons.more_vert,color: Colors.red[600],),
      itemBuilder: (content) =>
      [
        PopupMenuItem(
          value: 1,
          child: Text('A Propos'),
        ),
      ],
      onSelected: (value) {
        //print(value);
        switch (value) {
          case 1:
            return showAboutDialog(
              context: context,
              applicationVersion: 'Version 1.0.0',
              applicationIcon: Image.asset('images/logo.png',width: 80,),
              applicationLegalese: 'Powered by Yema',
            );
            break;
          default:
        }
      },
    );
  }

}