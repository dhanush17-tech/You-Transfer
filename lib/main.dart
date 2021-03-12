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
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> item = <Widget>[];
    uploadtask.forEach((fb.UploadTask element) {
      final index = uploadtask.indexOf(element);
      final Widget man = Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: StreamBuilder<fb.UploadTaskSnapshot>(
                stream: element?.onStateChanged,
                builder: (context, snapshot) {
                  var man_event;

                  final event = snapshot?.data;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      man_event = event;
                    });
                  });
                  // Default as 0
                  double progressPercent = event != null
                      ? event.bytesTransferred / event.totalBytes * 1
                      : 0;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      progressPercent == 0
                          ? CircularPercentIndicator(
                              radius: 20.0,
                              lineWidth: 2.0,
                              animation: false,
                              percent: 0,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.indigo,
                            )
                          : CircularPercentIndicator(
                              radius: 20.0,
                              lineWidth: 2.0,
                              animation: false,
                              percent: progressPercent,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.indigo,
                            ),
                      SizedBox(
                        width: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Container(
                                    height: 50,
                                    width: 145,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                          ),
                                          child: Text(
                                            names[index] ?? "",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500),
                                          )),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 36.0),
                                  child: Text(
                                    "${filesize(size[index])}" ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 42,
                            ),
                            event != null
                                ? event.bytesTransferred / event.totalBytes == 1
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Icon(
                                          Icons.check_rounded,
                                          size: 20,
                                          color: Colors.indigo,
                                        ))
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Icon(
                                          Icons.check_rounded,
                                          size: 20,
                                          color: Colors.white,
                                        ))
                                : Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Icon(
                                      Icons.check_rounded,
                                      size: 20,
                                      color: Colors.white,
                                    ))
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      );
      item.add(man);
    });
    return Scaffold(
        backgroundColor: Color(4285108466),
        body: Center(
          child: Container(
              alignment: Alignment.topCenter,
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
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: item,
                        ),
                      ),
                    ),
                  )
                ],
              )),
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

  List<fb.UploadTask> uploadtask = <fb.UploadTask>[];

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
      fb.UploadTask upload_progress = fb
          .storage()
          .refFromURL("gs://yousend-474b4.appspot.com")
          .child(filePath)
          .put(imageFile);
      uploadtask.add(upload_progress);
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
}
