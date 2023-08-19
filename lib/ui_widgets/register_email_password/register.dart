import 'package:flutter/material.dart';

import '../../components/my_button.dart';
import '../../components/my_textfield.dart';
import '../../components/square_tile.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 50),

                Text('Criar Conta',
                  style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),


                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Nome do usuário',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Email do usuário',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Senha do usuário',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Telefone',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Endereço',
                  obscureText: false,
                ),

                const SizedBox(height: 25),
                // sign in button
                MyButton(
                  tittle: "Criar Conta",
                  onTap: signUserIn,
                ),
                const SizedBox(height: 15),
                // or continue with

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
