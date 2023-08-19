import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../inscricao/inscricao.dart';
import 'dashboard.dart';



class MenuWidgets extends StatefulWidget {
  @override
  _MenuWidgetsState createState() => _MenuWidgetsState();
}

class _MenuWidgetsState extends State<MenuWidgets> {
  int _current = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(context) {
    final List<Widget> imageSliders = imgList.map((item) => Container(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        child: Stack(
          children: [
            Image.asset(item,
              fit: BoxFit.cover,
              width: 1000,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(' ${imgList.indexOf(item) +1} Imagem',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Universidade Jean Piaget",style: TextStyle(
            color: Colors.black,
            fontSize: 16
        ),),
        elevation: 0,

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Image.asset("assets/images/school.png"),
            ),
          )
        ],
      ),

      drawer: Drawer(
        elevation: 1,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, int index) {
              return Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Image.asset("assets/images/graduate.png"),
                    ),
                    accountName: const Text("profile do usuario", style: TextStyle()),
                    accountEmail: const Text("geral@cki.ao"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home_outlined,color: Colors.black,),
                    title: const Text('Sobre',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    onTap: () {

                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings,color: Colors.black,),
                    title: const Text('Horario',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    onTap: () {

                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.account_balance,color: Colors.black,),
                    title: const Text('UniPiaget',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    onTap: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> const Equipe()));

                    },
                    // Users(userId: UserModel.userId)
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.photo,color: Colors.black,),
                    title: const Text('Ensino',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    onTap: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> const Gallery()));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    onTap: (){

                    },
                    leading: const Icon(Icons.call,color: Colors.black,),
                    title: const Text('Cursos',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: (){

                    },
                    leading: const Icon(Icons.call,color: Colors.black,),
                    title: const Text('Recursos',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Sair', style: TextStyle(),
                    ),
                    onTap: () async {
                      final pref = await SharedPreferences.getInstance();
                      pref.setBool("showHome", false);
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashWidgets()));
                    },
                  ),

                  const Divider(),

                ],
              );
            }),
      ),
      floatingActionButton: SpeedDial(
        onOpen: () {

        },
        backgroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        overlayOpacity: 0.7,
        animatedIconTheme: const IconThemeData(
          size: 30.0,
          color: Colors.orange,
        ),
        children: [
          SpeedDialChild(
            labelWidget: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
              child: Container(
                height: 45,
                width: 150,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Colors.white, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Professores",
                            style: TextStyle(

                                color: Colors.blue),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Terminar o dia",
                            style: TextStyle(

                                color: Colors.black,
                                fontSize: 10),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            child: const Icon(FontAwesomeIcons.powerOff, color: Colors.red, size: 20,),
            labelStyle: TextStyle(color: Colors.blue),
            onTap: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context)=> const Teachers()));
            },
          ),

          SpeedDialChild(
            labelWidget: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
              child: Container(
                height: 45,
                width: 150,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Colors.white, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Perfil do usuario",
                            style: TextStyle(
                                color: Colors.blue),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Editar usuario",
                            style: TextStyle(

                                color: Colors.black,
                                fontSize: 10),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            child: const Icon(FontAwesomeIcons.powerOff, color: Colors.red, size: 20,),
            labelStyle: TextStyle(color: Colors.blue),
            onTap: (){

            },
          ),

          SpeedDialChild(
            labelWidget: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
              child: Container(
                height: 45,
                width: 150,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Colors.white, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Check - out",
                            style: TextStyle(
                                color: Colors.blue),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Terminar o dia",
                            style: TextStyle(

                                color: Colors.black,
                                fontSize: 10),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            child: const Icon(FontAwesomeIcons.powerOff, color: Colors.red, size: 20,),
            labelStyle: TextStyle(color: Colors.blue),
            onTap: (){

            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 3,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? const Color.fromRGBO(0, 0, 0, 0.9) : const Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  mainAxisExtent: 160),

              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Container(
                      width: 140,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 1,
                            // offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: dashboardList(index),
                    ),
                  ),
                );
              },
              itemCount: dashboard.length,
            ),

            const SizedBox(height: 25.0),

            GestureDetector(
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 90,right: 90,bottom: 5),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                        spreadRadius: 1,
                        // offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text("Listar cursos",style: TextStyle(

                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25.0),

          ],
        ),
      ),
    );
  }

  final List<Dashboard> dashboard = [
    Dashboard(
        image: "assets/images/education.png",
        tittle: "Professores",
        subTittle: "25 Professores"
    ),

    Dashboard(
        image: "assets/images/school.png",
        tittle: "Salas de aula",
        subTittle: "30 salas de aulas"
    ),

    Dashboard(
        image: "assets/images/books.png",
        tittle: "Calendario",
        subTittle: "Ver calendario"
    ),

    Dashboard(
        image: "assets/images/readingbook.png",
        tittle: "Classes",
        subTittle: "Listagem de classes"
    ),

  ];

  final List<String> imgList = [
    'assets/images/education.png',
    'assets/images/education.png',
    'assets/images/education.png',
  ];

  dashboardList(int index){
    return GestureDetector(
      onTap: (){
        if(index == 0){
         // Navigator.push(context, MaterialPageRoute(builder: (context)=> const Teachers()));
        }
      },
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 70,
              child: Image.asset(dashboard[index].image)),
          const SizedBox(
            height: 10,
          ),
          Text(dashboard[index].tittle,style: TextStyle(
              fontWeight: FontWeight.bold
          ),),

          Text(dashboard[index].subTittle,style: TextStyle(
              fontWeight: FontWeight.normal
          ),),
        ],
      ),
    );
  }

}
