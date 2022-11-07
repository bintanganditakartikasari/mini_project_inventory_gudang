import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';
import 'package:mini_project_inventory_gudang/screen/entry_screen/entry_screen_ajinomoto.dart';
import 'package:mini_project_inventory_gudang/view_model/ajinomoto_view_model.dart';
import 'package:provider/provider.dart';

class AjinomotoScreen extends StatefulWidget {
  const AjinomotoScreen({super.key});

  @override
  State<AjinomotoScreen> createState() => _AjinomotoScreenState();
}

class _AjinomotoScreenState extends State<AjinomotoScreen> {

  final formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final beratController = TextEditingController();
  final jumlahController = TextEditingController();
  final produksiController = TextEditingController();
  final expiredController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final Ajinomoto newAjinomoto = Ajinomoto(
      berat: beratController.toString(), 
      jumlah: jumlahController.toString(), 
      nama: namaController.toString(), 
      tanggalExpired: expiredController.toString(), 
      tanggalProduksi: produksiController.toString());

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
          // Expanded(
          //   child: AnimatedList(
          //     padding: const EdgeInsets.all(10),
          //     initialItemCount: 0,
          //     itemBuilder: (context, index, animation) {
          //       return SizeTransition(
          //         sizeFactor: animation,
          //         child: ListView.separated(
          //           padding: const EdgeInsets.all(8),
          //           itemCount: dataAjinomoto.ajinomoto.length,
          //           itemBuilder: (context, index) {
          //             return Container(
          //               height: 170,
          //               padding: const EdgeInsets.all(10),
          //               margin:  const EdgeInsets.only(top: 20, left: 20, right: 20),
          //               decoration: BoxDecoration(
          //                 color: Colors.transparent,
          //                 borderRadius: BorderRadius.circular(10),
          //                 border: Border.all(color: const Color.fromARGB(255, 48, 160, 143), width: 2),
          //               ),
          //               child: Column(
          //                 children: [
          //                   Row(
          //                     children: [
          //                       Column(
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Text('Nama Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].nama}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
          //                           Text('Berat Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].berat} gr', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
          //                           Text('Jumlah Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].jumlah} pcs', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
          //                           Text('Tanggal Produksi Produk  : ${dataAjinomoto.ajinomoto[index].tanggalProduksi}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
          //                           Text('Tanggal Expired Produk \t\t\t: ${dataAjinomoto.ajinomoto[index].tanggalExpired}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                   const SizedBox(
          //                     height: 5,
          //                   ),
          //                   Row(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       Container(
          //                         padding: const EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.end,
          //                           crossAxisAlignment: CrossAxisAlignment.end,
          //                           children: [
          //                             InkWell(
          //                               onTap: (){
          //                                 showDialog(
          //                                   context: context, 
          //                                   builder: (context) {
          //                                     return Dialog(
          //                                       child: Container(
          //                                         padding: const EdgeInsets.all(10),
          //                                         child: Column(
          //                                           mainAxisSize: MainAxisSize.min,
          //                                           children: [
          //                                             Center(
          //                                               widthFactor: double.infinity,
          //                                               child: Text('Apakah anda yakin akan menghapus ${dataAjinomoto.ajinomoto[index].nama}?', style: GoogleFonts.poppins(fontSize: 15, color: Colors.black)),
          //                                             ),
          //                                             const SizedBox(
          //                                               height: 10,
          //                                             ),
          //                                             Row(
          //                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                                               children: [
          //                                                 ElevatedButton(
          //                                                   onPressed: (){
          //                                                     //masih hapus semua data. Nanti coba lagi
          //                                                     Provider.of<AjinomotoViewModel>(context, listen: false).deleteAjinomoto(dataAjinomoto.ajinomoto[index].id!.toString());
          //                                                     Navigator.of(context).pop();
          //                                                   }, 
          //                                                   style: const ButtonStyle(
          //                                                     backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
          //                                                   ),
          //                                                   child: const Text('Delete Produk', style: TextStyle(fontSize: 15))
          //                                                 ),
          //                                                 ElevatedButton(
          //                                                   onPressed: (){
          //                                                     Navigator.of(context).pop();
          //                                                   }, 
          //                                                   style: const ButtonStyle(
          //                                                     backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
          //                                                   ),
          //                                                   child: const Text('Batal', style: TextStyle(fontSize: 15))
          //                                                 ),
          //                                               ],
          //                                             )
          //                                           ],
          //                                         ),
          //                                       ),
          //                                     );
          //                                   }
          //                                 );
          //                               },
          //                               child: Container(
          //                                 padding: const EdgeInsets.all(5),
          //                                 decoration: BoxDecoration(
          //                                   color: const Color.fromARGB(255, 48, 160, 143),
          //                                   borderRadius: BorderRadius.circular(50)
          //                                 ),
          //                                 child: const Icon(
          //                                   Icons.delete, 
          //                                   size: 25,
          //                                   color: Colors.white,
          //                                 ),
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                       Container(
          //                         alignment: Alignment.centerRight,
          //                         padding: const EdgeInsets.all(5),
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.end,
          //                           crossAxisAlignment: CrossAxisAlignment.end,
          //                           children: [
          //                             InkWell(
          //                               onTap: (){
          //                                 namaController.text = dataAjinomoto.ajinomoto[index].nama.toString();
          //                                 beratController.text = dataAjinomoto.ajinomoto[index].berat.toString();
          //                                 jumlahController.text = dataAjinomoto.ajinomoto[index].jumlah.toString();
          //                                 produksiController.text = dataAjinomoto.ajinomoto[index].tanggalProduksi.toString();
          //                                 expiredController.text = dataAjinomoto.ajinomoto[index].tanggalExpired.toString();
          //                                 showDialog(
          //                                   context: context, 
          //                                   builder: (context) {
          //                                     return Dialog(
          //                                       child: Container(
          //                                         padding: const EdgeInsets.all(10),
          //                                         child: Column(
          //                                           mainAxisSize: MainAxisSize.min,
          //                                           children: [
          //                                             TextFormField(
          //                                               decoration: InputDecoration(
          //                                                 enabledBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 focusedBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 prefixIcon: const Icon(
          //                                                   Icons.inventory_2,
          //                                                   color: Color.fromARGB(255, 48, 160, 143),
          //                                                 ),
          //                                                   hintText: 'Nama Produk',
          //                                                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
          //                                                   filled: true,
          //                                                   fillColor: Colors.white,
          //                                               ),
          //                                               controller: namaController,
          //                                               keyboardType: TextInputType.name,
          //                                             ),
          //                                             const SizedBox(
          //                                               height: 10,
          //                                             ),
          //                                             TextFormField(
          //                                               decoration: InputDecoration(
          //                                                 enabledBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 focusedBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 prefixIcon: const Icon(
          //                                                   Icons.note_add_outlined,
          //                                                   color: Color.fromARGB(255, 48, 160, 143),
          //                                                 ),
          //                                                   hintText: 'Berat Bersih Produk',
          //                                                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
          //                                                   filled: true,
          //                                                   fillColor: Colors.white,
          //                                               ),
          //                                               controller: beratController,
          //                                               keyboardType: TextInputType.number,
          //                                             ),
          //                                             const SizedBox(
          //                                               height: 10,
          //                                             ),
          //                                             TextFormField(
          //                                               decoration: InputDecoration(
          //                                                 enabledBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 focusedBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 prefixIcon: const Icon(
          //                                                   Icons.add_circle_outline_rounded,
          //                                                   color: Color.fromARGB(255, 48, 160, 143),
          //                                                 ),
          //                                                   hintText: 'Jumlah Produk',
          //                                                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
          //                                                   filled: true,
          //                                                   fillColor: Colors.white,
          //                                               ),
          //                                               controller: jumlahController,
          //                                               keyboardType: TextInputType.number,
          //                                             ),
          //                                             const SizedBox(
          //                                               height: 10,
          //                                             ),
          //                                             TextFormField(
          //                                               decoration: InputDecoration(
          //                                                 enabledBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 focusedBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 prefixIcon: const Icon(
          //                                                   Icons.date_range,
          //                                                   color: Color.fromARGB(255, 48, 160, 143),
          //                                                 ),
          //                                                   hintText: 'Tanggal Produksi Produk',
          //                                                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
          //                                                   filled: true,
          //                                                   fillColor: Colors.white,
          //                                               ),
          //                                               controller: produksiController,
          //                                               keyboardType: TextInputType.datetime,
          //                                             ),
          //                                             const SizedBox(
          //                                               height: 10,
          //                                             ),
          //                                             TextFormField(
          //                                               decoration: InputDecoration(
          //                                                 enabledBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 focusedBorder: OutlineInputBorder(
          //                                                   borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
          //                                                   borderRadius: BorderRadius.circular(6),
          //                                                 ),
          //                                                 prefixIcon: const Icon(
          //                                                   Icons.date_range,
          //                                                   color: Color.fromARGB(255, 48, 160, 143),
          //                                                 ),
          //                                                   hintText: 'Tanggal Expired Produk',
          //                                                   hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
          //                                                   filled: true,
          //                                                   fillColor: Colors.white,
          //                                               ),
          //                                               controller: expiredController,
          //                                               keyboardType: TextInputType.datetime,
          //                                             ),
          //                                             const SizedBox(
          //                                               height: 10,
          //                                             ),
          //                                             Center(
          //                                               child: ElevatedButton(
          //                                                 onPressed: (){
          //                                                   // Provider.of<AjinomotoViewModel>(context, listen: false).updateAjinomoto();
          //                                                 },
          //                                                 style: const ButtonStyle(
          //                                                   backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143))
          //                                                 ),
          //                                                 child: const Text('Update Produk', style: TextStyle(fontSize: 15)),
          //                                               ), 
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       ),
          //                                     );
          //                                   }
          //                                 );
          //                               },
          //                                 child: Container(
          //                                 padding: const EdgeInsets.all(5),
          //                                 decoration: BoxDecoration(
          //                                   color: const Color.fromARGB(255, 48, 160, 143),
          //                                   borderRadius: BorderRadius.circular(50)
          //                                 ),
          //                                 child: const Icon(
          //                                   Icons.edit, 
          //                                   size: 25,
          //                                   color: Colors.white,
          //                                 ),
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ],
          //               ), 
          //             );
          //           },
          //           separatorBuilder: (BuildContext context, int index) => const SizedBox(
          //             height: 10,
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
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
                              Text('Nama Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].nama}', style: GoogleFonts.poppins(fontSize: 13)),
                              Text('Berat Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].berat} gr', style: GoogleFonts.poppins(fontSize: 13)),
                              Text('Jumlah Produk \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${dataAjinomoto.ajinomoto[index].jumlah} pcs', style: GoogleFonts.poppins(fontSize: 13)),
                              Text('Tanggal Produksi Produk  : ${dataAjinomoto.ajinomoto[index].tanggalProduksi}', style: GoogleFonts.poppins(fontSize: 13)),
                              Text('Tanggal Expired Produk \t\t\t: ${dataAjinomoto.ajinomoto[index].tanggalExpired}', style: GoogleFonts.poppins(fontSize: 13)),
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
                                                  child: Text('Apakah anda yakin akan menghapus ${dataAjinomoto.ajinomoto[index].nama}?', style: GoogleFonts.poppins(fontSize: 15)),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: (){
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
                                  onTap: (){
                                    namaController.text = dataAjinomoto.ajinomoto[index].nama.toString();
                                    beratController.text = dataAjinomoto.ajinomoto[index].berat.toString();
                                    jumlahController.text = dataAjinomoto.ajinomoto[index].jumlah.toString();
                                    produksiController.text = dataAjinomoto.ajinomoto[index].tanggalProduksi.toString();
                                    expiredController.text = dataAjinomoto.ajinomoto[index].tanggalExpired.toString();
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
                                                  ),
                                                  controller: expiredController,
                                                  keyboardType: TextInputType.datetime,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      if (formKey.currentState!.validate()) {
                                                        final ajinomoto = Provider.of<AjinomotoViewModel>(context, listen: false);
                                                        Ajinomoto ajinomotoData = Ajinomoto(
                                                          id: newAjinomoto.id,
                                                          nama: newAjinomoto.nama, 
                                                          berat: newAjinomoto.berat, 
                                                          jumlah: newAjinomoto.jumlah, 
                                                          tanggalProduksi: newAjinomoto.tanggalProduksi, 
                                                          tanggalExpired: newAjinomoto.tanggalExpired,
                                                        );
                                                      }
                                                      await ajinomotoData.updateAjinomoto(ajinomoto.ajinomotoData);
                                                    },
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