import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:html';
import 'dart:typed_data';
import 'package:yousend/step2.dart';
import 'package:filesize/filesize.dart';
import 'step1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(4285108466),
        body: Center(
          child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  step1(),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: Container(
                      width: 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.grey.withOpacity(0.6)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  step2()
                ],
              )),
        ));
  }

  Widget step2() {
    return Container(
        child: Column(
      children: [
        Container(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: names.map((e) {
                  var index = names.indexOf(e);
                  return Container(
                    child: Row(
                      children: [
                        // StreamBuilder<fb.UploadTaskSnapshot>(
                        //     stream: _uploadTask?.onStateChanged,
                        //     builder: (context, snapshot) {
                        //       final event = snapshot?.data;

                        //       // Default as 0
                        //       double progressPercent = event != null
                        //           ? event.bytesTransferred /
                        //               event.totalBytes *
                        //               1
                        //           : 0;

                        //       if (progressPercent == 100) {
                        //         return Text('Successfully uploaded file 🎊');
                        //       } else if (progressPercent == 0) {
                        //         return SizedBox();
                        //       } else {
                        //         return CircularPercentIndicator(
                        //           radius: 20.0,
                        //           lineWidth: 2.0,
                        //           animation: false,
                        //           percent: 0.7,
                        //           circularStrokeCap: CircularStrokeCap.round,
                        //           progressColor: Colors.indigo,
                        //         );
                        //       }
                        //     }),
                        SizedBox(
                          width: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e ?? "",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "${filesize(size)}" ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 13.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(top: 0),
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                  child: Icon(
                                    Icons.check_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }).toList()),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        // Text(
        //   name ?? "",
        //   style: GoogleFonts.poppins(fontSize: 20),
        // ),
      ],
    ));
  }

  Widget step1() {
    return Container(
        child: Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/upload.png",
              color: Color(4285108466),
              scale: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Drag And Drop A File",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.withOpacity(0.9))),
            SizedBox(
              height: 10,
            ),
            Text("or",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.withOpacity(0.9))),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                _startFilePicker();
              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(4285108466),
                ),
                child: Center(
                  child: Text("Browse Files",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  fb.UploadTask _uploadTask;

  _startFilePicker() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
      (changeEvent) {
        final file = uploadInput.files.first;
        final reader = FileReader();
        // The FileReader object lets web applications asynchronously read the
        // contents of files (or raw data buffers) stored on the user's computer,
        // using File or Blob objects to specify the file or data to read.
        // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader

        reader.readAsDataUrl(file);
        // The readAsDataURL method is used to read the contents of the specified Blob or File.
        //  When the read operation is finished, the readyState becomes DONE, and the loadend is
        // triggered. At that time, the result attribute contains the data as a data: URL representing
        // the file's data as a base64 encoded string.
        // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader/readAsDataURL

        reader.onLoadEnd.listen(
          // After file finiesh reading and loading, it will be uploaded to firebase storage
          (loadEndEvent) async {
            setState(() {
              name = file.name;
              size = ((file.size / 100).ceil()).toString();
              uploadedImage = file;
              sizes.add((file.size));
              names.add(file.name);
              uploadToFirebase(file, name);
            });
          },
        );
      },
    );
  }

  Future uploadToFirebase(imageFile, name) async {
    final filePath = "${DateTime.now()}$name";

    setState(() {
      _uploadTask = fb
          .storage()
          .refFromURL("gs://yousend-474b4.appspot.com")
          .child(filePath)
          .put(imageFile);
    });
  }

  File uploadedImage;
  bool isdone_step1 = false;
  String size;

  String name;
  String option1Text;
  List names = [];
  List sizes = [];
  List urls = [];
  List progress = [];
  PageController controller;
}
