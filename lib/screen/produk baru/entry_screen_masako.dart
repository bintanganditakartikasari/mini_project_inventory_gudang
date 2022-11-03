import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MasakoEntryScreen extends StatefulWidget {
  static const routeName = '/masako/new';
  const MasakoEntryScreen({super.key});

  @override
  State<MasakoEntryScreen> createState() => _MasakoEntryScreen();
}

class _MasakoEntryScreen extends State<MasakoEntryScreen> {

  final namaController = TextEditingController();
  final beratController = TextEditingController();
  final jumlahController = TextEditingController();
  final produksiController = TextEditingController();
  final expiredController = TextEditingController();

  late DatabaseReference dbRefMasako;

  @override
  void initState(){
    super.initState();
    dbRefMasako = FirebaseDatabase.instance.ref().child('Masako');
  }

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
              child: Stack(
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
                          offset: Offset(0, 3)
                        )
                      ]
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
                              Text('Tambah Produk', style: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                              Text('Masako', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.inventory_2,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Nama Produk',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: namaController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.note_add_outlined,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Berat Bersih Produk',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: beratController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.add_circle_outline_rounded,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Jumlah Produk',
                        hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: jumlahController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.date_range,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Tanggal Produksi Produk',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: produksiController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.date_range,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Tanggal Expired Produk',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: expiredController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: (){
                          Map<String, String> masako = {
                            'nama produk': namaController.text,
                            'jumlah produk': jumlahController.text,
                            'berat produk': beratController.text,
                            'tanggal produksi': produksiController.text,
                            'tanggal expired': expiredController.text,
                          };
                          dbRefMasako.push().set(masako);
                          Navigator.of(context).pop();
                        }, 
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
                        ),
                        child: const Text('Tambahkan Produk', style: TextStyle(fontSize: 15),)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}