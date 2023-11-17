// ignore_for_file: use_build_context_synchronously

import 'package:chaussure/authentication/connexion_page.dart';
import 'package:chaussure/authentication/services/auth_services.dart';
import 'package:chaussure/view/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool _circular = false;
  AuthClass authClass = AuthClass();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ***************
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // ***************
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Créer un Compte",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: width - 60,
                height: 60,
                child: Card(
                  color: Colors.black,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () async {
                          await authClass.googleSignIn(context);
                        },
                        icon: const Icon(
                          Icons.g_mobiledata_rounded,
                          size: 50,
                          color: Colors.orange,
                        ),
                        label: const Text(
                          "Continuer avec Google",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: width - 70,
                  height: 55,
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: width - 70,
                  height: 55,
                  child: TextField(
                    controller: passwordController,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    _circular = true;
                  });
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    print(userCredential.user?.email);
                    setState(() {
                      _circular = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainNavigator()));
                  } catch (e) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    final snackBar = SnackBar(content: Text(e.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {
                      _circular = false;
                    });
                  }
                },
                child: Container(
                  width: width - 90,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xfffd746c),
                        Color(0xfffd9068),
                        Color(0xfffd746c),
                      ],
                    ),
                  ),
                  child: Center(
                    child: _circular
                        ? const CircularProgressIndicator()
                        : const Text(
                            "S'inscrire",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "J'ai déja un compte",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConnexionPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
