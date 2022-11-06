import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';
import 'package:mini_project_inventory_gudang/screen/entry_screen/entry_screen_ajinomoto.dart';
import 'package:mini_project_inventory_gudang/view_model/ajinomoto_view_model.dart';
import 'package:mini_project_inventory_gudang/widget/ajinomoto_produk.dart';
import 'package:provider/provider.dart';

class AjinomotoScreen extends StatefulWidget {
  static const routeName = '/home/ajinomoto';
  const AjinomotoScreen({super.key});

  @override
  State<AjinomotoScreen> createState() => _AjinomotoScreenState();
}

class _AjinomotoScreenState extends State<AjinomotoScreen> {

  final namaController = TextEditingController();
  final beratController = TextEditingController();
  final jumlahController = TextEditingController();
  final produksiController = TextEditingController();
  final expiredController = TextEditingController();

  List<Ajinomoto> ajinomotoList = [];

  @override
  Widget build(BuildContext context) {

    final ajinomoto = Provider.of<AjinomotoViewModel>(context).ajinomoto;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
                      Text('Produk Ajinomoto', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
          child: ListView.separated(
            itemBuilder: (context, value) => AjinomotoProduk(
              ajinomoto[value],
              key: Key(
                ajinomoto[value].id!.toString(),
              ),
            ), 
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ), 
            itemCount: ajinomoto.length),
        )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 48, 160, 143),
            onPressed: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EntryScreen()));
              Navigator.of(context).push(PageRouteBuilder(
                reverseTransitionDuration: const Duration(milliseconds: 300),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                return const AjinomotoEntryScreen();
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
            child: const Icon(Icons.add_rounded, color: Colors.white,),
          ),
        ],
      ),
    );
  }
}