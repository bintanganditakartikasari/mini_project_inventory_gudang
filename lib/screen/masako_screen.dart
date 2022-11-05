import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/models/masako_model.dart';
import 'package:mini_project_inventory_gudang/screen/entry_screen/entry_screen_masako.dart';
import 'package:mini_project_inventory_gudang/widget/masako_produk.dart';
import 'package:mini_project_inventory_gudang/view_model/masako_view_model.dart';
import 'package:provider/provider.dart';

class MasakoScreen extends StatefulWidget {
  static const routeName = '/home/masako';
  const MasakoScreen({super.key});

  @override
  State<MasakoScreen> createState() => _MasakoScreenState();
} 

class _MasakoScreenState extends State<MasakoScreen> {

  final namaController = TextEditingController();
  final beratController = TextEditingController();
  final jumlahController = TextEditingController();
  final produksiController = TextEditingController();
  final expiredController = TextEditingController();

  List<Masako> masakoList = [];

  bool updateMasakoData = false;

  bool deleteMasakoData = false;

  // @override
  // void initState(){
  //   super.initState();

  //   retrieveMasakoData();
  // }

  @override
  Widget build(BuildContext context) {
    final masako = Provider.of<MasakoViewModel>(context).masako;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                            Text('Produk Masako', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView.separated(
              itemBuilder: (context, index) => MasakoProduk(
                masako[index],
                key: Key(
                  masako[index].id.toString(),
                ),
              ), 
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ), 
              itemCount: masako.length)
          ],
        ),
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
                return const MasakoEntryScreen();
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
  
  // void retrieveMasakoData() {
  //   dbRef.child('Masako').onChildAdded.listen((data) {
  //     MasakoData masakoData = MasakoData.fromJson(data.snapshot.value as Map);
  //     Masako masako = Masako(key: data.snapshot.key, masakoData: masakoData);
  //     masakoList.add(masako);
  //     setState(() {});
  //   });
  // }
  
  // Widget masakoWidget(Masako masakoList) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 170,
  //     padding: const EdgeInsets.all(10),
  //     margin:  const EdgeInsets.only(top: 20, left: 20, right: 20),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(10),
  //       border: Border.all(color: const Color.fromARGB(255, 48, 160, 143), width: 2),
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           children: [
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 // Text('Nama Produk\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${masakoList.masakoData!.nama!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //                 // Text('Berat Produk\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${masakoList.masakoData!.berat!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //                 // Text('Jumlah Produk\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${masakoList.masakoData!.jumlah!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //                 // Text('Tanggal Produksi Produk\t : ${masakoList.masakoData!.tanggalProduksi!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //                 // Text('Tanggal Expired Produk\t\t\t\t: ${masakoList.masakoData!.tanggalExpired!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //               ],
  //             ),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 5,
  //         ),
  //         Container(
  //           padding: const EdgeInsets.all(5),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               InkWell(
  //                 onTap: (){
  //                   // namaController.text = masakoList.masakoData.nama!;
  //                   // beratController.text = masakoList.masakoData.berat!;
  //                   // jumlahController.text = masakoList.masakoData.jumlah!;
  //                   // produksiController.text = masakoList.masakoData.tanggalProduksi!;
  //                   // expiredController.text = masakoList.masakoData.tanggalExpired!;
  //                   // deleteMasakoData = true;
  //                   // deletemasakoDialog(key: masakoList.key);
  //                 },
  //                 child: Container(
  //                   padding: const EdgeInsets.all(5),
  //                   decoration: BoxDecoration(
  //                     color: const Color.fromARGB(255, 48, 160, 143),
  //                     borderRadius: BorderRadius.circular(50)
  //                   ),
  //                   child: const Icon(
  //                     Icons.delete, 
  //                     size: 25,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               InkWell(
  //                 onTap: (){
  //                   // namaController.text = masakoList.masakoData.nama!;
  //                   // beratController.text = masakoList.masakoData.berat!;
  //                   // jumlahController.text = masakoList.masakoData.jumlah!;
  //                   // produksiController.text = masakoList.masakoData.tanggalProduksi!;
  //                   // expiredController.text = masakoList.masakoData.tanggalExpired!;
  //                   // updateMasakoData = true;
  //                   // updatemasakoDialog(key: masakoList.key);
  //                 },
  //                 child: Container(
  //                   padding: const EdgeInsets.all(5),
  //                   decoration: BoxDecoration(
  //                     color: const Color.fromARGB(255, 48, 160, 143),
  //                     borderRadius: BorderRadius.circular(50)
  //                   ),
  //                   child: const Icon(
  //                     Icons.edit, 
  //                     size: 25,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void updatemasakoDialog({String? key}) async {
    showDialog(
      context: context, 
      builder: (context) {
      return Dialog(
        child: Container(
          // height: 413,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
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
                    hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
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
                    hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
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
                    hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
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
                  onPressed: () {
                    // Map<String, dynamic> masakodata = {
                    //   'nama produk': namaController.text,
                    //   'berat produk': beratController.text,
                    //   'jumlah produk': jumlahController.text,
                    //   'tanggal produksi': produksiController.text,
                    //   'tanggal expired': expiredController.text,
                    // };

                    // if(updateMasakoData) {
                    //   dbRefMasako.child('Masako').child(key!).update(masakodata).then((value) {
                    //     int index = masakoList.indexWhere((element) => element.key == key);
                    //     masakoList.removeAt(index);
                    //     masakoList.insert(index, Masako(key: key, masakoData: MasakoData.fromJson(masakodata)));
                    //     setState(() {
                          
                    //     });
                    //     Navigator.of(context).pop();
                    //   });
                    // } else {
                    //   dbRefMasako.child('Masako').push().set(masakodata).then((value) {
                    //   Navigator.of(context).pop();
                    // });
                    // }
                  },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
                    ),
                    child: const Text('Update Produk', style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void deletemasakoDialog({String? key}) async {
    showDialog(
      context: context, 
      builder: (context) {
      return Dialog(
        child: Container(
          // height: 413,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text('Apakah anda yakin?', style: GoogleFonts.poppins(fontSize: 15, color: Colors.black)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
                    ),
                    child: const Text('Cancel', style: TextStyle(fontSize: 15))),

                  ElevatedButton(
                    onPressed: () {
                      // Map<String, dynamic> masakodata = {
                      //   'nama produk': namaController.text,
                      //   'berat produk': beratController.text,
                      //   'jumlah produk': jumlahController.text,
                      //   'tanggal produksi': produksiController.text,
                      //   'tanggal expired': expiredController.text,
                      // };

                      // if(deleteMasakoData) {
                      //   dbRefMasako.child('Masako').child(key!).remove().then((value) {
                      //     int index = masakoList.indexWhere((element) => element.key == key);
                      //     masakoList.removeAt(index);
                      //     setState(() {});
                      //     Navigator.of(context).pop();
                      //   });
                      // } else {
                      //   dbRefMasako.child('Masako').push().set(masakodata).then((value) {
                      //   Navigator.of(context).pop();
                      // });
                      // }
                    },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
                      ),
                      child: const Text('Delete Produk', style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
