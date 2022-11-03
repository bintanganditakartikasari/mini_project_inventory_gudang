import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_inventory_gudang/provider/provider_theme.dart';
import 'package:mini_project_inventory_gudang/screen/ajinomoto/ajinomoto_screen.dart';
import 'package:mini_project_inventory_gudang/screen/homescreen/home_screen.dart';
import 'package:mini_project_inventory_gudang/screen/masako/masako_screen.dart';
import 'package:mini_project_inventory_gudang/screen/mayumi/mayumi_screen.dart';
import 'package:mini_project_inventory_gudang/screen/produk%20baru/entry_screen_ajinomoto.dart';
import 'package:mini_project_inventory_gudang/screen/produk%20baru/entry_screen_masako.dart';
import 'package:mini_project_inventory_gudang/screen/produk%20baru/entry_screen_mayumi.dart';
import 'package:mini_project_inventory_gudang/screen/produk%20baru/entry_screen_sajiku.dart';
import 'package:mini_project_inventory_gudang/screen/sajiku/sajiku_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (BuildContext context) => ThemeChanger(isDarkTheme: prefs.getBool('isDarkTheme') ?? false),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: value.getTheme(),
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName:(context) => const HomeScreen(),
            AjinomotoScreen.routeName:(context) => const AjinomotoScreen(),
            MasakoScreen.routeName:(context) => const MasakoScreen(),
            MayumiScreen.routeName:(context) => const MayumiScreen(),
            SajikuScreen.routeName:(context) => const SajikuScreen(),
            AjinomotoEntryScreen.routeName:(context) => const AjinomotoEntryScreen(),
            MasakoEntryScreen.routeName:(context) => const MasakoEntryScreen(),
            MayumiEntryScreen.routeName:(context) => const MayumiEntryScreen(),
            SajikuEntryScreen.routeName:(context) => const SajikuEntryScreen(),
          },
        );
      },
    );
  }
}