import 'dart:io';
import 'dart:ui';

import 'package:festival_app/utils/Color_util.dart';
import 'package:festival_app/utils/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:lorem_ipsum_generator/lorem_ipsum_generator.dart';

class Editing_Page extends StatefulWidget {
  const Editing_Page({super.key});

  @override
  State<Editing_Page> createState() => _Editing_PageState();
}

class _Editing_PageState extends State<Editing_Page> {
  int asset_image_index = 0;
  int indexed_Stack_index = 0;
  int indexed_Stack_font = 0;
  Color? Bg_Color;
  String? Text_fest;

  double Font_Size = 22;
  Color Font_Color = theme_1;
  FontWeight Font_Text_Weight = FontWeight.bold;
  // TextAlign Font_Text_Align = TextAlign.center;
  Alignment Font_Text_Align = Alignment.center;
  FontStyle? Font_Text_Style;

  List<Color> fontColorList = [
    Colors.black,
    Colors.white,
    Color(0xffE3B7A0),
    Color(0xffFF6666),
    Color(0xffFF8989),
    Color(0xffFCAEAE),
    Color(0xffFFEADD),
    Color(0xffA78295),
    Color(0xff73777B),
    Color(0xff826F66),
    Color(0xff99627A),
    Color(0xff867070),
    Color(0xff9E7676),
    Color(0xffBB9981),
    Color(0xff6B728E),
    Color(0xffC1A3A3),
    Color(0xff845460),
    Color(0xffF3C5C5),
    ...Colors.primaries
  ];
  Color ftColor = theme_1;
  Color? currentColour;
  Color pickerColor = theme_1;

  void ChangeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  List<TextStyle> quoteFontFamily = [
    GoogleFonts.abel(),
    GoogleFonts.roboto(),
    GoogleFonts.dancingScript(),
    GoogleFonts.bitter(),
    GoogleFonts.anton(),
    GoogleFonts.yatraOne(),
    GoogleFonts.pacifico(),
    GoogleFonts.fjallaOne(),
    GoogleFonts.shadowsIntoLight(),
    GoogleFonts.indieFlower(),
    GoogleFonts.zillaSlab(),
    GoogleFonts.satisfy(),
    GoogleFonts.permanentMarker(),
    GoogleFonts.amaticSc(),
    GoogleFonts.cinzel(),
    GoogleFonts.sairaCondensed(),
    GoogleFonts.kalam(),
    GoogleFonts.courgette(),
    GoogleFonts.righteous(),
    GoogleFonts.tinos(),
    GoogleFonts.lobster(),
    GoogleFonts.changa(),
    GoogleFonts.greatVibes(),
    GoogleFonts.zeyada(),
    GoogleFonts.aladin(),
    GoogleFonts.kaushanScript(),
    GoogleFonts.pathwayGothicOne(),
    GoogleFonts.sacramento()
  ];

  late List<String> quoteFontFamilyName;
  int? fontFamilyIndexVal;

  Color? Bg_Gradient1;
  Color? Bg_Gradient2;

  bool fontEditingVisibility = false;
  bool canvasEditingVisibility = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quoteFontFamilyName =
        List.generate(quoteFontFamily.length, (index) => loremIpsum(words: 3));
  }

  @override
  Widget build(BuildContext context) {
    Map fest_data = ModalRoute.of(context)!.settings.arguments as Map;

    GlobalKey key = GlobalKey();

    Size s = MediaQuery.of(context).size;
    double w = s.width;
    double h = s.height;

    return WillPopScope(
      onWillPop: () async {
        bool willpop = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: theme_1,
                  title: Text(
                    "Are you sure you want to quit.",
                    style: TextStyle(color: theme_2),
                  ),
                  // content: Text(loremIpsum(words: 10)),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("YES"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme_2, foregroundColor: theme_1),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: theme_2),
                        )),
                  ],
                ));
        return willpop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          foregroundColor: theme_2,
          backgroundColor: theme_1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(MyRoutes.Home, (route) => false);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              // size: 25,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    asset_image_index = 0;
                    Bg_Color = null;
                    Bg_Gradient1 = null;
                    Bg_Gradient2 = null;
                    Text_fest = null;

                    Font_Size = 22;
                    Font_Color = theme_1;
                    Font_Text_Weight = FontWeight.bold;
                    Font_Text_Align = Alignment.center;
                    Font_Text_Style = null;
                    fontFamilyIndexVal = null;
                  });
                },
                icon: Icon(
                  Icons.refresh,
                  size: 25,
                )),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(0),
                child: RepaintBoundary(
                  key: key,
                  child: Container(
                    width: w,
                    height: w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Bg_Color,
                        gradient: (Bg_Gradient2 != null)
                            ? LinearGradient(
                                colors: [Bg_Gradient1!, Bg_Gradient2!],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )
                            : null,
                        image: (Bg_Color == null && Bg_Gradient1 == null)
                            ? DecorationImage(
                                image: AssetImage(fest_data['assets_image']
                                    [asset_image_index]),
                                fit: BoxFit.fill)
                            : null),
                    alignment: Font_Text_Align,
                    child: (Text_fest != null)
                        ? Text(
                            Text_fest!,
                            style: (fontFamilyIndexVal != null)
                                ? quoteFontFamily[fontFamilyIndexVal!]
                                    .merge(TextStyle(
                                    fontSize: Font_Size,
                                    fontWeight: Font_Text_Weight,
                                    color: Font_Color,
                                    fontStyle: Font_Text_Style,
                                  ))
                                : TextStyle(
                                    fontSize: Font_Size,
                                    fontWeight: Font_Text_Weight,
                                    color: Font_Color,
                                    fontStyle: Font_Text_Style,
                                  ),
                          )
                        : null,
                  ),
                )),
            Spacer(),
            Visibility(
              visible: canvasEditingVisibility,
              child: Container(
                width: w,
                height: 200,
                decoration: BoxDecoration(
                  color: theme_1,
                ),
                child: IndexedStack(
                  index: indexed_Stack_index,
                  children: [
                    //bg options
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Change BackGround Image And Color",
                          style: TextStyle(
                              fontSize: 16,
                              color: theme_2,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexed_Stack_index = 1;
                                });
                              },
                              child: Container(
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: theme_1,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                      )
                                    ]),
                                alignment: Alignment.center,
                                child: Text(
                                  "BackGround",
                                  style:
                                      TextStyle(fontSize: 18, color: theme_2),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexed_Stack_index = 2;
                                });
                              },
                              child: Container(
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: theme_1,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                      )
                                    ]),
                                alignment: Alignment.center,
                                child: Text(
                                  "BG Color",
                                  style:
                                      TextStyle(fontSize: 18, color: theme_2),
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                      ],
                    ),

                    //bg Canvas
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Choose BackGround",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: theme_2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    indexed_Stack_index = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.done,
                                  size: 30,
                                  color: theme_2,
                                ))
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(
                                  10,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Bg_Color = null;
                                            Bg_Gradient2 = null;
                                            Bg_Gradient1 = null;
                                            asset_image_index = index;
                                          });
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          margin: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    fest_data['assets_image']
                                                        [index]),
                                              )),
                                        ),
                                      ))),
                        ),
                      ],
                    ),

                    //bg Color
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Choose BackGround Color",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: theme_2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    indexed_Stack_index = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.done,
                                  size: 30,
                                  color: theme_2,
                                ))
                          ],
                        ),
                        //Bg Color Gradient
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            ...List.generate(
                                bg_gradient_colorList.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Bg_Gradient1 =
                                              bg_gradient_colorList[index]
                                                  ['Color1'];
                                          Bg_Gradient2 =
                                              bg_gradient_colorList[index]
                                                  ['Color2'];
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(colors: [
                                              bg_gradient_colorList[index]
                                                  ['Color1'],
                                              bg_gradient_colorList[index]
                                                  ['Color2']
                                            ])),
                                      ),
                                    ))
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: fontEditingVisibility,
              child: Container(
                width: w,
                height: 200,
                decoration: BoxDecoration(
                  color: theme_1,
                ),
                child: IndexedStack(
                  index: indexed_Stack_font,
                  children: [
                    //bg options
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Edite Your Text Here !!",
                          style: TextStyle(
                              fontSize: 16,
                              color: theme_2,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexed_Stack_font = 1;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme_1,
                                    boxShadow: [
                                      BoxShadow(
                                        color: theme_2,
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                      )
                                    ]),
                                alignment: Alignment.center,
                                child: Text(
                                  "Add Text",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: theme_2),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexed_Stack_font = 2;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme_1,
                                    boxShadow: [
                                      BoxShadow(
                                        color: theme_2,
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                      )
                                    ]),
                                alignment: Alignment.center,
                                child: Text(
                                  "Alignment",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: theme_2),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexed_Stack_font = 3;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme_1,
                                    boxShadow: [
                                      BoxShadow(
                                        color: theme_2,
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                      )
                                    ]),
                                alignment: Alignment.center,
                                child: Text(
                                  "Font Family",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: theme_2),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexed_Stack_font = 4;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme_1,
                                    boxShadow: [
                                      BoxShadow(
                                        color: theme_2,
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                      )
                                    ]),
                                alignment: Alignment.center,
                                child: Text(
                                  "Font Color",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: theme_2),
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                      ],
                    ),

                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              // height: 15,
                              ),
                          Row(
                            children: [
                              Text(
                                "Choose Your Text",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      indexed_Stack_font = 0;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.done,
                                    // size: 25,
                                    color: theme_2,
                                  ))
                            ],
                          ),
                          Divider(
                            color: theme_2,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Text_fest = "Happy ${fest_data['title']}";
                                });
                              },
                              child: Text(
                                "Happy ${fest_data['title']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme_2,
                                    fontSize: 18),
                              )),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Text_fest =
                                      "Have a fun and festive  ${fest_data['title']}!";
                                });
                              },
                              child: Text(
                                "Have a fun and festive  ${fest_data['title']}!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme_2,
                                    fontSize: 18),
                              )),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Text_fest =
                                      " Have a blessed ${fest_data['title']}!.";
                                });
                              },
                              child: Text(
                                " Have a blessed ${fest_data['title']}!.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme_2,
                                    fontSize: 18),
                              )),
                        ],
                      ),
                    ),

                    //TextAlign
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Edit Your Font Style",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: theme_2),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    indexed_Stack_font = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.done,
                                  size: 25,
                                  color: theme_2,
                                ))
                          ],
                        ),
                        Divider(
                          color: theme_2,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Alignment",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: theme_2.withOpacity(0.5)),
                            ),
                            Spacer(),
                            Text(
                              "Font Size",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: theme_2.withOpacity(0.5)),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Font_Text_Align = Alignment.centerLeft;
                                  });
                                },
                                icon: Icon(
                                  Icons.format_align_left_outlined,
                                  size: 25,
                                  color: theme_2,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Font_Text_Align = Alignment.center;
                                  });
                                },
                                icon: Icon(
                                  Icons.format_align_center_outlined,
                                  size: 25,
                                  color: theme_2,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Font_Text_Align = Alignment.centerRight;
                                  });
                                },
                                icon: Icon(
                                  Icons.format_align_right_outlined,
                                  size: 25,
                                  color: theme_2,
                                )),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Font_Size++;
                                  });
                                },
                                icon: Icon(
                                  Icons.text_increase,
                                  size: 25,
                                  color: theme_2,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Font_Size--;
                                  });
                                },
                                icon: Icon(
                                  Icons.text_decrease,
                                  size: 25,
                                  color: theme_2,
                                )),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    (Font_Text_Weight == FontWeight.bold)
                                        ? Font_Text_Weight = FontWeight.normal
                                        : Font_Text_Weight = FontWeight.bold;
                                  });
                                },
                                icon: Icon(
                                  Icons.format_bold,
                                  size: 25,
                                  color: theme_2,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    (Font_Text_Style == null)
                                        ? Font_Text_Style = FontStyle.italic
                                        : Font_Text_Style = null;
                                  });
                                },
                                icon: Icon(
                                  Icons.format_italic,
                                  size: 25,
                                  color: theme_2,
                                )),
                          ],
                        )
                      ],
                    ),

                    //fontFamily
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Edit Your Font Family",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: theme_2),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    indexed_Stack_font = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.done,
                                  size: 25,
                                  color: theme_2,
                                ))
                          ],
                        ),
                        Divider(
                          color: theme_2,
                        ),
                        Container(
                          width: w,
                          height: 200 - 70,
                          child: Stack(
                            children: [
                              Center(
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: w - 30,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: theme_2.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              ListWheelScrollView(
                                  itemExtent: 50,
                                  perspective: 0.01,
                                  diameterRatio: 2.5,
                                  squeeze: 1,
                                  onSelectedItemChanged: (val) {
                                    setState(() {
                                      fontFamilyIndexVal = val;
                                    });
                                  },
                                  children: List.generate(
                                      quoteFontFamily.length, (index) {
                                    return Container(
                                      height: 70,
                                      width: w,
                                      alignment: Alignment.center,
                                      child: Text(quoteFontFamilyName[index],
                                          style: quoteFontFamily[index].merge(
                                              TextStyle(
                                                  color: (index ==
                                                          fontFamilyIndexVal)
                                                      ? theme_2
                                                      : theme_2
                                                          .withOpacity(0.5),
                                                  fontSize: 24))),
                                    );
                                  })),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //Font Color
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Edit Your Font Color",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: theme_2),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    indexed_Stack_font = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.done,
                                  size: 25,
                                  color: theme_2,
                                ))
                          ],
                        ),
                        Divider(
                          color: theme_2,
                        ),
                        Expanded(
                          child: Container(
                            width: w,
                            // color: theme_1.withOpacity(0.3),
                            child: SingleChildScrollView(
                              child: Wrap(
                                children: [
                                  //colour picker
                                  Container(
                                    width: 60,
                                    height: 60,
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: theme_2,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5,
                                            // offset: Offset(2,2)
                                          )
                                        ]),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(
                                          () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: Text("Pick Color"),
                                              content: SingleChildScrollView(
                                                  child: ColorPicker(
                                                pickerColor: pickerColor,
                                                onColorChanged: ChangeColor,
                                              )),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Font_Color =
                                                            pickerColor;
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    },
                                                    child: Text("Got it"))
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.colorize_rounded,
                                        size: 35,
                                        color: theme_1,
                                      ),
                                    ),
                                  ),
                                  ...fontColorList
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                Font_Color = e;
                                              });
                                            },
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              margin: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: e,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 5,
                                                      // offset: Offset(2,2)
                                                    )
                                                  ]),
                                            ),
                                          ))
                                      .toList()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: w,
              height: 70,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(color: theme_1, boxShadow: [
                BoxShadow(
                    offset: Offset(-2, -2), color: Colors.grey, blurRadius: 3),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        canvasEditingVisibility = true;
                        fontEditingVisibility = false;
                      });
                    },
                    child: Container(
                      width: 90,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.gradient_outlined,
                            size: 30,
                            color: theme_2,
                          ),
                          Text(
                            "Canvas",
                            style: TextStyle(
                              color: theme_2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        canvasEditingVisibility = false;
                        print("FontEditing..");
                        fontEditingVisibility = true;
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.text_fields,
                            size: 30,
                            color: theme_2,
                          ),
                          Text(
                            "Text",
                            style: TextStyle(
                              color: theme_2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //share
                  GestureDetector(
                    onTap: () async {
                      print("Sharing started...");

                      final boundary = key.currentContext?.findRenderObject()
                          as RenderRepaintBoundary?;
                      final image = await boundary?.toImage(pixelRatio: 12);
                      final byteData =
                          await image?.toByteData(format: ImageByteFormat.png);
                      final imageBytes = byteData?.buffer.asUint8List();

                      if (imageBytes != null) {
                        print("Bytes generated...");

                        final directory =
                            await getApplicationDocumentsDirectory();
                        final imagePath =
                            await File('${directory.path}/container_image.png')
                                .create();
                        await imagePath.writeAsBytes(imageBytes);

                        ShareExtend.share(imagePath.path, "file")
                            .then((value) => print("Sharedd.."))
                            .onError((error, stackTrace) => print("Eroor..."));
                      }
                    },
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.share,
                            size: 30,
                            color: theme_2,
                          ),
                          Text(
                            "Share",
                            style: TextStyle(
                              color: theme_2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Save
                  GestureDetector(
                    onTap: () async {
                      print("Sharing started...");

                      final boundary = key.currentContext?.findRenderObject()
                          as RenderRepaintBoundary?;
                      final image = await boundary?.toImage(pixelRatio: 12);
                      final byteData =
                          await image?.toByteData(format: ImageByteFormat.png);
                      final imageBytes = byteData?.buffer.asUint8List();

                      if (imageBytes != null) {
                        print("Bytes generated...");

                        final directory =
                            await getApplicationDocumentsDirectory();
                        final imagePath =
                            await File('${directory.path}/container_image.png')
                                .create();
                        await imagePath.writeAsBytes(imageBytes);
                        ImageGallerySaver.saveFile(imagePath.path)
                            .then((value) => print("Save response: $value"));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Successfully Saved!!",
                              style: TextStyle(color: theme_1),
                            ),
                            backgroundColor: theme_2,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(10),
                            dismissDirection: DismissDirection.horizontal,
                          ),
                        );
                        //
                        // ShareExtend.share(imagePath.path, "file")
                        //     .then((value) => print("Sharedd.."))
                        //     .onError(
                        //         (error, stackTrace) => print("Eroor..."));
                      }
                    },
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.save_alt,
                            size: 30,
                            color: theme_2,
                          ),
                          Text(
                            "Save",
                            style: TextStyle(
                              color: theme_2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
