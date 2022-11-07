import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/screen/entry_screen/entry_screen_mayumi.dart';
import 'package:mini_project_inventory_gudang/view_model/mayumi_view_model.dart';
import 'package:provider/provider.dart';

class MayumiScreen extends StatefulWidget {
  static const routeName = '/home/mayumi';
  const MayumiScreen({super.key});

  @override
  State<MayumiScreen> createState() => _MayumiScreenState();
}

class _MayumiScreenState extends State<MayumiScreen> {

  final namaController = TextEditingController();
  final beratController = TextEditingController();
  final jumlahController = TextEditingController();
  final produksiController = TextEditingController();
  final expiredController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var dataMayumi = Provider.of<MayumiViewModel>(context);

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
                      Text('Produk Mayumi', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: dataMayumi.mayumi.length,
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
                              Text('Nama Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataMayumi.mayumi[index].nama}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                              Text('Berat Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataMayumi.mayumi[index].berat} gr', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                              Text('Jumlah Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataMayumi.mayumi[index].jumlah} pcs', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                              Text('Tanggal Produksi Produk  : ${dataMayumi.mayumi[index].tanggalProduksi}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                              Text('Tanggal Expired Produk \t\t\t: ${dataMayumi.mayumi[index].tanggalExpired}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
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
                                                  child: Text('Apakah anda yakin akan menghapus ${dataMayumi.mayumi[index].nama}?', style: GoogleFonts.poppins(fontSize: 15, color: Colors.black)),
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
                                                        Provider.of<MayumiViewModel>(context, listen: false).deleteMayumi(dataMayumi.mayumi[index].id!.toString());
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
                                                  keyboardType: TextInputType.name,
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
                                                  keyboardType: TextInputType.number,
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
                                                  keyboardType: TextInputType.number,
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
                                                  keyboardType: TextInputType.datetime,
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
                                                  keyboardType: TextInputType.datetime,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                  child: ElevatedButton(
                                                    onPressed: (){},
                                                    style: const ButtonStyle(
                                                      backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143))
                                                    ),
                                                    child: const Text('Update Produk', style: TextStyle(fontSize: 15)),
                                                  ), 
                                                ),
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
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EntryScreen()));
              Navigator.of(context).push(PageRouteBuilder(
                reverseTransitionDuration: const Duration(milliseconds: 300),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                return const MayumiEntryScreen();
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
  
  // void retrieveMayumiData() {
  //   dbRef.child('Mayumi').onChildAdded.listen((dataMayumi) {
  //     MayumiData mayumiData = MayumiData.fromJson(dataMayumi.snapshot.value as Map);
  //     Mayumi mayumi = Mayumi(key: dataMayumi.snapshot.key, mayumiData: mayumiData);
  //     mayumiList.add(mayumi);
  //     setState(() {});
  //   });
  // }
  
  // Widget mayumiWidget(Mayumi mayumiList) {
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
  //                 // Text('Nama Produk\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${mayumiList.mayumiData!.nama!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //                 // Text('Berat Produk\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${mayumiList.mayumiData!.berat!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //                 // Text('Jumlah Produk\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${mayumiList.mayumiData!.jumlah!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //                 // Text('Tanggal Produksi Produk\t : ${mayumiList.mayumiData!.tanggalProduksi!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
  //                 // Text('Tanggal Expired Produk\t\t\t\t: ${mayumiList.mayumiData!.tanggalExpired!}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
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
  //                   // namaController.text = mayumiList.mayumiData.nama!;
  //                   // beratController.text = mayumiList.mayumiData.berat!;
  //                   // jumlahController.text = mayumiList.mayumiData.jumlah!;
  //                   // produksiController.text = mayumiList.mayumiData.tanggalProduksi!;
  //                   // expiredController.text = mayumiList.mayumiData.tanggalExpired!;
  //                   // deleteMayumiData = true;
  //                   // deletemayumiDialog(key: mayumiList.key);
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
  //                   // namaController.text = mayumiList.mayumiData.nama!;
  //                   // beratController.text = mayumiList.mayumiData.berat!;
  //                   // jumlahController.text = mayumiList.mayumiData.jumlah!;
  //                   // produksiController.text = mayumiList.mayumiData.tanggalProduksi!;
  //                   // expiredController.text = mayumiList.mayumiData.tanggalExpired!;
  //                   // updateMayumiData = true;
  //                   // updatemayumiDialog(key: mayumiList.key);
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

  // void updatemayumiDialog({String? key}) async {
  //   showDialog(
  //     context: context, 
  //     builder: (context) {
  //     return Dialog(
  //       child: Container(
  //         // height: 413,
  //         padding: const EdgeInsets.all(10),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextFormField(
  //               decoration: InputDecoration(
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 prefixIcon: const Icon(
  //                   Icons.inventory_2,
  //                   color: Color.fromARGB(255, 48, 160, 143),
  //                 ),
  //                   hintText: 'Nama Produk',
  //                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
  //                   filled: true,
  //                   fillColor: Colors.white,
  //                ),
  //                controller: namaController,
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             TextFormField(
  //               decoration: InputDecoration(
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 prefixIcon: const Icon(
  //                   Icons.note_add_outlined,
  //                   color: Color.fromARGB(255, 48, 160, 143),
  //                 ),
  //                   hintText: 'Berat Bersih Produk',
  //                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
  //                   filled: true,
  //                   fillColor: Colors.white,
  //                ),
  //                controller: beratController,
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             TextFormField(
  //               decoration: InputDecoration(
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 prefixIcon: const Icon(
  //                   Icons.add_circle_outline_rounded,
  //                   color: Color.fromARGB(255, 48, 160, 143),
  //                 ),
  //                   hintText: 'Jumlah Produk',
  //                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
  //                   filled: true,
  //                   fillColor: Colors.white,
  //                ),
  //                controller: jumlahController,
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             TextFormField(
  //               decoration: InputDecoration(
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 prefixIcon: const Icon(
  //                   Icons.date_range,
  //                   color: Color.fromARGB(255, 48, 160, 143),
  //                 ),
  //                   hintText: 'Tanggal Produksi Produk',
  //                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
  //                   filled: true,
  //                   fillColor: Colors.white,
  //                ),
  //                controller: produksiController,
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             TextFormField(
  //               decoration: InputDecoration(
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 prefixIcon: const Icon(
  //                   Icons.date_range,
  //                   color: Color.fromARGB(255, 48, 160, 143),
  //                 ),
  //                   hintText: 'Tanggal Expired Produk',
  //                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
  //                   filled: true,
  //                   fillColor: Colors.white,
  //                ),
  //                controller: expiredController,
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Center(
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   // Map<String, dynamic> mayumidataMayumi = {
  //                   //   'nama produk': namaController.text,
  //                   //   'berat produk': beratController.text,
  //                   //   'jumlah produk': jumlahController.text,
  //                   //   'tanggal produksi': produksiController.text,
  //                   //   'tanggal expired': expiredController.text,
  //                   // };

  //                   // if(updateMayumiData) {
  //                   //   dbRefMayumi.child('Mayumi').child(key!).update(mayumidataMayumi).then((value) {
  //                   //     int index = mayumiList.indexWhere((element) => element.key == key);
  //                   //     mayumiList.removeAt(index);
  //                   //     mayumiList.insert(index, Mayumi(key: key, mayumiData: MayumiData.fromJson(mayumidataMayumi)));
  //                   //     setState(() {
                          
  //                   //     });
  //                   //     Navigator.of(context).pop();
  //                   //   });
  //                   // } else {
  //                   //   dbRefMayumi.child('Mayumi').push().set(mayumidataMayumi).then((value) {
  //                   //   Navigator.of(context).pop();
  //                   // });
  //                   // }
  //                 },
  //                   style: const ButtonStyle(
  //                     backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
  //                   ),
  //                   child: const Text('Update Produk', style: TextStyle(fontSize: 15),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   });
  // }

  // void deletemayumiDialog({String? key}) async {
  //   showDialog(
  //     context: context, 
  //     builder: (context) {
  //     return Dialog(
  //       child: Container(
  //         // height: 413,
  //         padding: const EdgeInsets.all(10),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Center(
  //               child: Text('Apakah anda yakin?', style: GoogleFonts.poppins(fontSize: 15, color: Colors.black)),
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 ElevatedButton(
  //                   onPressed: (){
  //                     Navigator.of(context).pop();
  //                   }, 
  //                   style: const ButtonStyle(
  //                     backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
  //                   ),
  //                   child: const Text('Cancel', style: TextStyle(fontSize: 15))),

  //                 ElevatedButton(
  //                   onPressed: () {
  //                     // Map<String, dynamic> mayumidataMayumi = {
  //                     //   'nama produk': namaController.text,
  //                     //   'berat produk': beratController.text,
  //                     //   'jumlah produk': jumlahController.text,
  //                     //   'tanggal produksi': produksiController.text,
  //                     //   'tanggal expired': expiredController.text,
  //                     // };

  //                     // if(deleteMayumiData) {
  //                     //   dbRefMayumi.child('Mayumi').child(key!).remove().then((value) {
  //                     //     int index = mayumiList.indexWhere((element) => element.key == key);
  //                     //     mayumiList.removeAt(index);
  //                     //     setState(() {});
  //                     //     Navigator.of(context).pop();
  //                     //   });
  //                     // } else {
  //                     //   dbRefMayumi.child('Mayumi').push().set(mayumidataMayumi).then((value) {
  //                     //   Navigator.of(context).pop();
  //                     // });
  //                     // }
  //                   },
  //                     style: const ButtonStyle(
  //                       backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
  //                     ),
  //                     child: const Text('Delete Produk', style: TextStyle(fontSize: 15),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   });
  // }
}

