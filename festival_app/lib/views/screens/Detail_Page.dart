import 'dart:io';
import 'dart:ui';

import 'package:festival_app/utils/Color_util.dart';
import 'package:festival_app/utils/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({super.key});

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double w = s.width;
    double h = s.height;
    Map fest_data = ModalRoute.of(context)!.settings.arguments as Map;

    GlobalKey key = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme_2,
        backgroundColor: theme_1,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        actions: [
          SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () async {
              debugPrint("hello");
              print("Sharing started...");

              final boundary = key.currentContext?.findRenderObject()
                  as RenderRepaintBoundary?;
              final image = await boundary?.toImage(pixelRatio: 12);
              final byteData =
                  await image?.toByteData(format: ImageByteFormat.png);
              final imageBytes = byteData?.buffer.asUint8List();

              if (imageBytes != null) {
                print("Bytes generated...");

                final directory = await getApplicationDocumentsDirectory();
                final imagePath =
                    await File('${directory.path}/container_image.png')
                        .create();
                await imagePath.writeAsBytes(imageBytes);
                ImageGallerySaver.saveFile(imagePath.path)
                    .then((value) => print("Save response: $value"));

                // ShareExtend.share(imagePath.path, "file")
                //     .then((value) => print("Sharedd.."))
                //     .onError((error, stackTrace) => print("Eroor..."));
              }
            },
            icon: Icon(
              Icons.save_alt,
              color: theme_2,
              size: 25,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            // alignment: Alignment.center,
            children: [
              Container(
                width: w,
                height: 180,
                decoration: BoxDecoration(
                    color: theme_1,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(300),
                      bottomLeft: Radius.circular(300),
                    )),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: RepaintBoundary(
                      key: key,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(fest_data['assets_image'][0]),
                                fit: BoxFit.fill),
                            color: Colors.grey),
                        alignment: Alignment.center,
                        // child: Text(
                        //   "Happy ${fest_data['title']}",
                        //   style: TextStyle(
                        //       fontFamily: 'Great Vibes',
                        //       color: Colors.amber,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 22),
                        // ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(MyRoutes.Editing_Page, arguments: fest_data);
                },
                child: Container(
                  width: w,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff36D1C4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Edit Template",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme_2,
                        fontSize: 26),
                  ),
                ),
              )),
          Spacer(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: w,
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(250),
                      topLeft: Radius.circular(250),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: w,
                  height: 200,
                  decoration: BoxDecoration(
                      color: theme_1,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(250),
                        topLeft: Radius.circular(250),
                      )),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "FestiVals",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Great Vibes',
                            color: theme_2),
                      ),
                      Text(
                        "Create Your Template With Us!!",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Great Vibes',
                            color: theme_2),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
