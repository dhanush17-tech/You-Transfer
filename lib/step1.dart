// import 'package:firebase/firebase.dart' as fb;
// import 'package:flutter/material.dart';
// import 'package:fdottedline/fdottedline.dart';
// import 'dart:html';
// import 'dart:typed_data';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:yousend/main.dart';
// import 'package:yousend/radial.dart';
// import 'package:yousend/step2.dart';

// class Step1 extends StatefulWidget {
//   @override
//   _Step1State createState() => _Step1State();
// }

// class _Step1State extends State<Step1> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Container(
//       width: 300,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 120.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/upload.png",
//               color: Color(4285108466),
//               scale: 2,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text("Drag And Drop A File",
//                 style: GoogleFonts.poppins(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey.withOpacity(0.9))),
//             SizedBox(
//               height: 10,
//             ),
//             Text("or",
//                 style: GoogleFonts.poppins(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey.withOpacity(0.9))),
//             SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//               onTap: () {
//                 _startFilePicker();
//               },
//               child: Container(
//                 width: 150,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Color(4285108466),
//                 ),
//                 child: Center(
//                   child: Text("Browse Files",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.poppins(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white)),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }

//   fb.UploadTask _uploadTask;

//   _startFilePicker() async {
//     InputElement uploadInput = FileUploadInputElement();
//     uploadInput.click();

//     uploadInput.onChange.listen(
//       (changeEvent) {
//         final file = uploadInput.files.first;
//         final reader = FileReader();
//         // The FileReader object lets web applications asynchronously read the
//         // contents of files (or raw data buffers) stored on the user's computer,
//         // using File or Blob objects to specify the file or data to read.
//         // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader

//         reader.readAsDataUrl(file);
//         // The readAsDataURL method is used to read the contents of the specified Blob or File.
//         //  When the read operation is finished, the readyState becomes DONE, and the loadend is
//         // triggered. At that time, the result attribute contains the data as a data: URL representing
//         // the file's data as a base64 encoded string.
//         // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader/readAsDataURL

//         reader.onLoadEnd.listen(
//           // After file finiesh reading and loading, it will be uploaded to firebase storage
//           (loadEndEvent) async {
//             setState(() {
//               name = file.name;
//               uploadedImage = file;
//               sizes.add((file.size).toString());
//               names.add(file.name);
//             });
//           },
//         );
//       },
//     );
//   }

//   // _startFilePicker() async {
//   //   InputElement uploadInput = FileUploadInputElement();
//   //   uploadInput.click();

//   //   uploadInput.onChange.listen((e) {
//   //     final file = uploadInput.files.first;

//   //     FileReader reader = FileReader();

//   //     setState(() {
//   //       reader.onLoadEnd.listen((e) async {
//   //         setState(() async {
//   //           // uploadedImage = file;
//   //           // name = file.name;
//   //           // print(isdone_step1);
//   //           // sizes.add((file.size).toString());
//   //           // names.add(file.name);
//   //           // await uploadToFirebase(uploadedImage, name);

//   //           isdone_step1 = true;
//   //           print(isdone_step1);
//   //         });
//   //       });
//   //     });

//   //     reader.onError.listen((fileEvent) {
//   //       setState(() {
//   //         option1Text = "Some Error occured while reading the file";
//   //       });
//   //     });
//   //   });
//   // }

//   Future uploadToFirebase(imageFile, name) async {
//     final filePath = "${DateTime.now()}$name";

//     setState(() {
//       _uploadTask = fb
//           .storage()
//           .refFromURL("gs://yousend-474b4.appspot.com")
//           .child(filePath)
//           .put(imageFile);
//     });
//   }

//   File uploadedImage;
//   bool isdone_step1 = false;
//   String size;

//   String name;
//   String option1Text;
// }
