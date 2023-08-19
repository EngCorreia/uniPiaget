import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unipiaget/ui_widgets/money_student/money_student.dart';
import 'package:unipiaget/ui_widgets/student/student.dart';

import '../home_page/home_page.dart';
import '../inscricao/inscricao.dart';
import '../notification/notifications.dart';
import 'dashboard.dart';



class MenuWidgets extends StatefulWidget {
  @override
  _MenuWidgetsState createState() => _MenuWidgetsState();
}

class _MenuWidgetsState extends State<MenuWidgets> {

  int _selectedIndex = 0;
  late List<Widget> firstFlowPagesList = [];

  @override
  void initState() {
    super.initState();
    firstFlowPagesList.clear();
    firstFlowPagesList
      ..add(const HomePage())
      ..add(const StudentInformation())
      ..add(const MoneyStudent())
      ..add(const NotificationUi());

  }


  @override
  Widget build(context) {


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
            labelStyle: const TextStyle(color: Colors.blue),
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

      body: Center(
        child: firstFlowPagesList.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.orange[900],
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black54,
              tabs: [

                GButton(
                  icon: Icons.home_rounded,
                  text: 'Menu',
                  iconSize: 20,
                  textStyle: TextStyle(
                      color: Colors.orange[900]
                  ),
                ),

                GButton(
                  icon: FontAwesomeIcons.graduationCap,
                  text: 'Aluno',
                  iconSize: 20,
                  textStyle: TextStyle(

                      color: Colors.orange[900]
                  ),
                ),

                GButton(
                  icon: FontAwesomeIcons.moneyBillAlt,
                  text: 'Finança',
                  iconSize: 20,
                  textStyle: TextStyle(
                      color: Colors.orange[900]
                  ),
                ),
                GButton(
                  icon: FontAwesomeIcons.bell,
                  iconSize: 20,
                  text: 'Alertas',
                  textStyle: TextStyle(
                      color: Colors.orange[900]
                  ),
                ),

              ],

              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },

            ),
          ),
        ),
      ),
    );
  }
}
