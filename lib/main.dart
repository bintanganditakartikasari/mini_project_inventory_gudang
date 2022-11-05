import 'package:firebase_core/firebase_core.dart';
import 'package:mini_project_inventory_gudang/screen/home_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_inventory_gudang/view_model/ajinomoto_view_model.dart';
import 'package:mini_project_inventory_gudang/view_model/masako_view_model.dart';
import 'package:mini_project_inventory_gudang/view_model/mayumi_view_model.dart';
import 'package:mini_project_inventory_gudang/view_model/sajiku_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AjinomotoViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MasakoViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MayumiViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SajikuViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: HomeScreen.routeName,
        // routes: {
        //   HomeScreen.routeName:(context) => const HomeScreen(),
        //   AjinomotoScreen.routeName:(context) => const AjinomotoScreen(),
        //   MasakoScreen.routeName:(context) => const MasakoScreen(),
        //   MayumiScreen.routeName:(context) => const MayumiScreen(),
        //   SajikuScreen.routeName:(context) => const SajikuScreen(),
        //   AjinomotoEntryScreen.routeName:(context) => const AjinomotoEntryScreen(),
        //   MasakoEntryScreen.routeName:(context) => const MasakoEntryScreen(),
        //   MayumiEntryScreen.routeName:(context) => const MayumiEntryScreen(),
        //   SajikuEntryScreen.routeName:(context) => const SajikuEntryScreen(),
        // },
      ),
      // child: Consumer<ThemeChanger>(
      //   builder: (context, value, child) {
      //     return MaterialApp(
      //       debugShowCheckedModeBanner: false,
      //       title: 'Flutter Demo',
      //       theme: value.getTheme(),
      //       initialRoute: HomeScreen.routeName,
      //       routes: {
              // HomeScreen.routeName:(context) => const HomeScreen(),
              // AjinomotoScreen.routeName:(context) => const AjinomotoScreen(),
              // MasakoScreen.routeName:(context) => const MasakoScreen(),
              // MayumiScreen.routeName:(context) => const MayumiScreen(),
              // SajikuScreen.routeName:(context) => const SajikuScreen(),
              // AjinomotoEntryScreen.routeName:(context) => const AjinomotoEntryScreen(),
              // MasakoEntryScreen.routeName:(context) => const MasakoEntryScreen(),
              // MayumiEntryScreen.routeName:(context) => const MayumiEntryScreen(),
              // SajikuEntryScreen.routeName:(context) => const SajikuEntryScreen(),
      //       },
      //     );
      //   },
      // ),
    );
  }
}