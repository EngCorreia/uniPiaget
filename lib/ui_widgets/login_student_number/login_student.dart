import 'package:flutter/material.dart';

import '../../components/my_button.dart';
import '../../components/my_textfield.dart';
import '../../components/square_tile.dart';
import '../register_email_password/register.dart';



class LoginStudentPage extends StatelessWidget {
  LoginStudentPage({super.key});

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

                const CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),

                // welcome back, you've been missed!
                Text('Universidade Jean Piaget',
                  style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Número do estudante',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Esqueci a senha?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // sign in button
                MyButton(
                  tittle: "Entrar",
                  onTap: signUserIn,
                ),


                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
