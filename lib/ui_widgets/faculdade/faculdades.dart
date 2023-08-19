
import 'package:flutter/material.dart';
import 'package:unipiaget/ui_widgets/menu/dashboard.dart';

class Faculdades extends StatefulWidget {
  final Dashboard dashboard;
  const Faculdades({Key? key, required this.dashboard}) : super(key: key);

  @override
  State<Faculdades> createState() => _FaculdadesState();
}

class _FaculdadesState extends State<Faculdades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Cursos"),
      ),
      body: const SingleChildScrollView(
        child: Text(""),
      ),
    );
  }
}
