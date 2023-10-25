import 'package:chat_students/chat.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'chat.dart';

void main (){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),

    home: chatapp(),
  )
  );
}




class chatapp extends StatefulWidget{
  const chatapp ({Key? key}) : super(key: key);

  @override

  _chatappState createState() => _chatappState();
}

class _chatappState extends State<chatapp>{

  final List<String> imageList = [
    'lib/assets/banner1.png',
    'https://www.itca.edu.sv/wp-content/uploads/2020/02/BannerP_2.jpg',
    'https://www.itca.edu.sv/wp-content/uploads/2017/02/BannerWeb_Quienes.jpg',
    'https://www.itca.edu.sv/wp-content/uploads/2023/09/JuntaITCA_2023_F.jpg',
    'https://www.itca.edu.sv/wp-content/uploads/2021/04/BannerWeb_Megatec_ZACATECOLUCA.jpg',
    'https://www.itca.edu.sv/wp-content/uploads/2017/10/conoce.jpg',

  ];

  Widget _BScard(int value){
    String url="";
    if (value==1){
      url= "lib/assets/zacatecoluca.png";
    }else if(value == 2){
      url="https://www.itca.edu.sv/wp-content/uploads/2020/05/ITCA-REGIONAL-SANTA-ANA-INAUGURo-MODERNA-ACADEMIA-CISCO-5.jpeg";
    }else if(value == 3){
      url="https://i.ytimg.com/vi/flCF20m6ZbU/maxresdefault.jpg";
    }else if(value == 4){
      url="https://i.ytimg.com/vi/feJEMeYW-F0/maxresdefault.jpg";
    }
    return Card(
      child: Image.network(url,
      fit: BoxFit.fill,
      width: 150.0,
      height: 150.0,
      ),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
    );
  }



  Widget _BSDetails(String Degree, String prof, int value){
    String Desp="";
    if (value==1){
      Desp="Sede en Zacatecoluca, La Paz";
     
    }else if(value == 2){
      Desp="Desarrollador de Aplicaciones Web.";
    }else if(value==3){
      Desp="ZACATECOLUCA: Nocturna";
    }else if(value ==4){
      Desp="Desarrollar aplicaciones para Web y Multimedia.";
    }
    return SizedBox(
              width: double.infinity,
              height: 160.0,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Degree, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    SizedBox(
                      width: 135.0,
                      child: Divider(),
                    ),
                    Text(prof),
                    SizedBox(
                      width: 170.0,
                      child: Divider(),
                    ),
                    Text(Desp),
                  ],
                 ), 
                ),
              ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: Text("Chat Students ITCA ZACATECOLUCA"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(accountName: Text("ITCA"),
             accountEmail: Text("megateczacatecoluca@itca.edu.sv"),
             currentAccountPicture: new CircleAvatar(
              child: new Image.asset("lib/assets/itca.png"),
             ),
             ),
             Divider(),
             new ListTile(
              title: new Text("Sitio de ITCA"),
              trailing: new Icon(Icons.web),
              onTap:(){
                 const link = "https://www.itca.edu.sv";

                 launchUrl(
                  Uri.parse(link),
                  mode: LaunchMode.externalApplication
                 );
              },
             ),
             Divider(),
             new ListTile(
              title: new Text("¿Donde estamos ubicados?"),
              trailing: new Icon(Icons.location_on),
              onTap:(){
                 const link = "https://maps.app.goo.gl/rD6yZskCvx9xjZst7";

                 launchUrl(
                  Uri.parse(link),
                  mode: LaunchMode.externalApplication
                 );
              },
             ),
              Divider(),
              new ListTile(
              title: new Text("Descarga el pensum de la carrera"),
              trailing: new Icon(Icons.book),
              onTap:(){
                 const link = "https://drive.google.com/file/d/1ol9DUDmdyMi9LcLVevKwgXHPOKltv6Bu/view?usp=drive_link";

                 launchUrl(
                  Uri.parse(link),
                  mode: LaunchMode.externalApplication
                 );
              },
             ),
            Divider(),
             new ListTile(
              title: new Text("Contactanos"),
              trailing: new Icon(Icons.phone),
              onTap:(){
                 const link = "";

                 launchUrl(
                  Uri(scheme: 'tel', path: "76289457"),
                  mode: LaunchMode.externalApplication
                 );
              },
             ),
             Divider(),
             
          ],
        ),
      ),

      
        
      body: ListView(
        padding: EdgeInsets.only(top: 40.0),
        children: [
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: imageList.map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(e,
                    width: 1050.0,
                    height: 350.0,
                    fit: BoxFit.cover,
                    )
                  ],
                ),
              )).toList(),
              )
            ),
            new Divider(height: 50.0,),
            _BScard(1),
            _BSDetails("REGIONAL DE ZACATECOLUCA", "TÉCNICO EN INGENIERÍA EN DESARROLLO DE SOFTWARE",1),
             //POSIBLES OCUPACIONES DE TRABAJO:
             _BScard(2),
            _BSDetails("POSIBLES OCUPACIONES DE TRABAJO:", "Desarrollador de Sistemas de Información.",2),

            _BScard(3),
            _BSDetails("JORNADA:", "ZACATECOLUCA: Diurna.",3),

            _BScard(4),
            _BSDetails("PRINCIPALES COMPETENCIAS", "Utilizar lenguajes de programación estructurada y orientada a objetos.",4),

        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>chatpage()));
  },
  label: Row(
    children: [
      Image.asset(
        'lib/assets/ROCKOBOT.png',  // Ruta a tu imagen en los assets
        height: 40,  // Altura deseada de la imagen
        width: 40,   // Anchura deseada de la imagen
      ),
      SizedBox(width: 8), // Espacio entre la imagen y el texto (ajústalo según lo necesites)
      Text("Rocko Bot"),
    ],
  ),
  tooltip: 'Entra al chat',
),
    );
  }
  
}