import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/screen/entry_screen/entry_screen_ajinomoto.dart';
import 'package:mini_project_inventory_gudang/service/ajinomoto_api.dart';
import 'package:mini_project_inventory_gudang/view_model/ajinomoto_view_model.dart';
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

  @override
  Widget build(BuildContext context) {

    var dataAjinomoto = Provider.of<AjinomotoViewModel>(context);

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
              itemCount: dataAjinomoto.ajinomoto.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 170,
                  padding: const EdgeInsets.all(10),
                  margin:  const EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromARGB(255, 48, 160, 143), width: 2),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].nama}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                              Text('Berat Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].berat} gr', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                              Text('Jumlah Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].jumlah} pcs', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                              Text('Tanggal Produksi Produk  : ${dataAjinomoto.ajinomoto[index].tanggalProduksi}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                              Text('Tanggal Expired Produk \t\t\t: ${dataAjinomoto.ajinomoto[index].tanggalExpired}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    showDialog(
                                      context: context, 
                                      builder: (context) {
                                        return Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  widthFactor: double.infinity,
                                                  child: Text('Apakah anda yakin akan menghapus ${dataAjinomoto.ajinomoto[index].nama}?', style: GoogleFonts.poppins(fontSize: 15, color: Colors.black)),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        //masih hapus semua data. Nanti coba lagi
                                                        Provider.of<AjinomotoViewModel>(context, listen: false).deleteAjinomoto(dataAjinomoto.ajinomoto[index].id!.toString());
                                                        Navigator.of(context).pop();
                                                      }, 
                                                      style: const ButtonStyle(
                                                        backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
                                                      ),
                                                      child: const Text('Delete Produk', style: TextStyle(fontSize: 15))
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        Navigator.of(context).pop();
                                                      }, 
                                                      style: const ButtonStyle(
                                                        backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
                                                      ),
                                                      child: const Text('Batal', style: TextStyle(fontSize: 15))
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 48, 160, 143),
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: const Icon(
                                      Icons.delete, 
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){},
                                    child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 48, 160, 143),
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: const Icon(
                                      Icons.edit, 
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ), 
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 10,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 48, 160, 143),
            onPressed: (){
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