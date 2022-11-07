import 'package:firebase_core/firebase_core.dart';
import 'package:mini_project_inventory_gudang/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_inventory_gudang/screen/home_screen.dart';
import 'package:mini_project_inventory_gudang/view_model/ajinomoto_view_model.dart';
import 'package:mini_project_inventory_gudang/view_model/masako_view_model.dart';
import 'package:mini_project_inventory_gudang/view_model/mayumi_view_model.dart';
import 'package:mini_project_inventory_gudang/view_model/sajiku_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(const MyApp());
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return runApp(
//     ChangeNotifierProvider(
//       child: const MyApp(),
//       create: (BuildContext context) => ThemeChanger(isDarkTheme: prefs.getBool('isDarkTheme') ?? false),
//     )
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(isDarkTheme: prefs.getBool('isDarkTheme') ?? false),
      ),
      ChangeNotifierProvider(
        create: (_) => AjinomotoViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => MasakoViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => MayumiViewModel(),
        ),
      ChangeNotifierProvider(
        create: (_) => SajikuViewModel(),
      ),
    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, themeChanger, child) {
        return MaterialApp(
          title: 'Flutter Project',
          debugShowCheckedModeBanner: false,
          theme: themeChanger.getTheme(),
          home: const HomeScreen(),
        );
      }
    );
  }
}