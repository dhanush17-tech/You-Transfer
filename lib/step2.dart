// import 'package:flutter/material.dart';
// import 'dart:typed_data';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:yousend/step1.dart';
// import 'step1.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'dart:io' as io;
// import 'package:firebase/firebase.dart' as fb;
// import 'dart:io';

// class Step2 extends StatefulWidget {
//   @override
//   _Step2State createState() => _Step2State();
// }

// class _Step2State extends State<Step2> {
//   // fb.UploadTask _uploadTask;

//   // /// Upload file to firebase storage and updates [_uploadTask] to the latest
//   // /// file upload
//   // final filePath = "${DateTime.now()}$name";

//   // Future uploadToFirebase(imageFile) async {
//   //   setState(() async {
//   //     _uploadTask = await fb
//   //         .storage()
//   //         .refFromURL("gs://yousend-474b4.appspot.com")
//   //         .child(filePath)
//   //         .put(imageFile);
//   //   });
//   // }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     setState(() {});
//     return Container(
//         child: Column(
//       children: [
//         Container(
//           width: 250,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 30, bottom: 30),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: names.map((e) {
//                   var index = names.indexOf(e);
//                   return Container(
//                     child: Row(
//                       children: [
//                         // StreamBuilder<fb.UploadTaskSnapshot>(
//                         //     stream: _uploadTask?.onStateChanged,
//                         //     builder: (context, snapshot) {
//                         //       final event = snapshot?.data;

//                         //       // Default as 0
//                         //       double progressPercent = event != null
//                         //           ? event.bytesTransferred /
//                         //               event.totalBytes *
//                         //               1
//                         //           : 0;

//                         //       if (progressPercent == 100) {
//                         //         return Text('Successfully uploaded file 🎊');
//                         //       } else if (progressPercent == 0) {
//                         //         return SizedBox();
//                         //       } else {
//                         //         return CircularPercentIndicator(
//                         //           radius: 20.0,
//                         //           lineWidth: 2.0,
//                         //           animation: false,
//                         //           percent: 0.7,
//                         //           circularStrokeCap: CircularStrokeCap.round,
//                         //           progressColor: Colors.indigo,
//                         //         );
//                         //       }
//                         //     }),
//                         SizedBox(
//                           width: 12,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     e ?? "",
//                                     style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   Text(
//                                     "ff" ?? "",
//                                     style: GoogleFonts.poppins(
//                                         color: Colors.grey,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 70,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 13.0),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   padding: EdgeInsets.only(top: 0),
//                                   width: 25,
//                                   height: 25,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.blue),
//                                   child: Icon(
//                                     Icons.check_rounded,
//                                     size: 20,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 }).toList()),
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         // Text(
//         //   name ?? "",
//         //   style: GoogleFonts.poppins(fontSize: 20),
//         // ),
//       ],
//     ));
//   }
// }

