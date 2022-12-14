import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/view_model/theme_view_model.dart';
import 'package:mini_project_inventory_gudang/screen/ajinomoto_screen.dart';
import 'package:mini_project_inventory_gudang/screen/masako_screen.dart';
import 'package:mini_project_inventory_gudang/screen/mayumi_screen.dart';
import 'package:mini_project_inventory_gudang/screen/sajiku_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Text('Inventory Gudang', style: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                        Text('Pabrik Ajinomoto', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          alignment: Alignment.bottomRight,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              child: Container(
                height: 250,
                width: 250,
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
              onTap: (){
                // Navigator.of(context).pushNamed(MasakoScreen.routeName);
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
                height: 250,
                width: 250,
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
              onTap: (){
                // Navigator.of(context).pushNamed(AjinomotoScreen.routeName);
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
                height: 250,
                width: 250,
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
              onTap: (){
                // Navigator.of(context).pushNamed(SajikuScreen.routeName);
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
                height: 250,
                width: 250,
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
              onTap: (){
                // Navigator.of(context).pushNamed(MayumiScreen.routeName);
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