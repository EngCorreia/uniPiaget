import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../faculdade/faculdades.dart';
import '../inscricao/inscricao.dart';
import '../menu/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
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
      body:  SingleChildScrollView(
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  mainAxisExtent: 150),

              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Container(
                      width: 200,
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
        image: "assets/menus/achados.jpeg",
        tittle: "Perdido e achado",
        subTittle: "Saiba mais"
    ),

    Dashboard(
        image: "assets/menus/calendarios.png",
        tittle: "Calendario",
        subTittle: "Ver calendario"
    ),

    Dashboard(
        image: "assets/menus/alunos.png",
        tittle: "Faculdade",
        subTittle: "Saiba mais"
    ),

  ];

  final List<String> imgList = [
    'assets/menus/menu1.jpeg',
    'assets/menus/menu2.jpeg',
    'assets/menus/menu3.jpeg',
  ];

  dashboardList(int index){
    return GestureDetector(
      onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>
                  Faculdades(dashboard: dashboard[index])));
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
          Text(dashboard[index].tittle,style: const TextStyle(
              fontWeight: FontWeight.bold
          ),),

          Text(dashboard[index].subTittle,style: const TextStyle(
              fontWeight: FontWeight.normal
          ),),
        ],
      ),
    );
  }
}
