import 'package:flutter/material.dart';

//Ici la partie est statelessWidget parce que la partie categorie reste statique
//mais s'il faut changer les données il faudra le changer en StatefullWidget
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
          image_location: 'images/cats/telephonie.png',
          image_caption: 'Téléphonie',
          ),
          Category(
            image_location: 'images/cats/man.png',
            image_caption: 'Homme',
          ),
          Category(
            image_location: 'images/cats/woman.png',
            image_caption: 'Femme',
          ),
          Category(
            image_location: 'images/cats/cosmetic.png',
            image_caption: 'Cosmetic',
          ),
          Category(
            image_location: 'images/cats/computer.png',
            image_caption: 'Informatique',
          ),
          Category(
            image_location: 'images/cats/librairy.png',
            image_caption: 'Librairie',
          ),
          Category(
            image_location: 'images/cats/electronic.png',
            image_caption: 'Electronique',
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {

  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){},
    child: Container(
      width: 71,
      child: ListTile(
        title: Image.asset(image_location,width: 60,height: 35,),
        subtitle: Container(
          alignment: Alignment.topCenter,
          child: Text(image_caption,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 7)),
        )
      ),
    ),
    ),
    );
  }
}

