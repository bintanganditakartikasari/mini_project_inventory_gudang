import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/provider/provider_theme.dart';
import 'package:mini_project_inventory_gudang/screen/ajinomoto_screen.dart';
import 'package:mini_project_inventory_gudang/screen/masako_screen.dart';
import 'package:mini_project_inventory_gudang/screen/mayumi_screen.dart';
import 'package:mini_project_inventory_gudang/screen/sajiku_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
              child: Stack(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      ThemeChanger themeChanger = Provider.of<ThemeChanger>(
                        context,
                        listen: false,
                      );
                      themeChanger.swapTheme();
                    }, 
                    icon: const Icon(Icons.brightness_6),
                    color: Colors.white,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        // padding: const EdgeInsets.only(left: 40, right: 20, bottom: 20),
                        height: size.height * 0.3 - 40,
                        decoration: const BoxDecoration(
                          // color: Color.fromARGB(255, 116, 178, 181),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: [
                              Color.fromARGB(255, 21, 135, 105),
                              Color.fromARGB(255, 48, 160, 143),
                              Color.fromARGB(255, 121, 195, 185),
                            ]
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 87, 178, 183),
                              spreadRadius: 2,
                              blurRadius: 15,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(height: 65,),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Inventory Gudang', style: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                                  Text('Pabrik Ajinomoto', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                width: 250,
                height: 250,
                child: Container(
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/image_02.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(PageRouteBuilder(
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                  return const MasakoScreen();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final tween = Tween(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  );
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }),);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                width: 250,
                height: 250,
                child: Container(
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/image_06.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(PageRouteBuilder(
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                  return const AjinomotoScreen();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final tween = Tween(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  );
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }),);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                width: 250,
                height: 250,
                child: Container(
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/image_04.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(PageRouteBuilder(
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                  return const SajikuScreen();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final tween = Tween(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  );
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }),);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                width: 250,
                height: 250,
                child: Container(
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/image_05.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(PageRouteBuilder(
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                  return const MayumiScreen();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final tween = Tween(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  );
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }),);
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}