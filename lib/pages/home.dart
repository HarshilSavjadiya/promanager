// ignore_for_file: sort_child_properties_last, unnecessary_import, implementation_imports, prefer_const_constructors, unused_element

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_stack/image_stack.dart';
import 'package:sizer/sizer.dart';

import '../component/card_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;

  Widget cardsHome(
    String taskName,
    String typeOfProject,
    String hashName,
    String timing,
    String imageOne,
    String imageTwo,
    Color colorOfCard,
  ) {
    List<String> images = <String>[
      imageOne,
      imageTwo,
    ];

    List<Widget> widgets = [
      ...images.map<Widget>((img) => Image.network(
            img,
            fit: BoxFit.cover,
          ))
    ];

    List<ImageProvider> providers = [
      ...images.map<ImageProvider>((img) => NetworkImage(
            img,
          ))
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                color: colorOfCard, borderRadius: BorderRadius.circular(035)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        taskName,
                        style: TextStyle(
                            color: Color.fromRGBO(33, 33, 33, 1),
                            fontFamily: "Jost",
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromRGBO(33, 33, 33, 1),
                                width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: Text(
                            typeOfProject,
                            style: TextStyle(
                                color: Color.fromRGBO(33, 33, 33, 1),
                                fontFamily: "Montserrat",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(hashName,
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(114, 114, 114, 1)))
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 2.h,
                            child:
                                Image(image: AssetImage('lib/assets/Time.png')),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            timing,
                            style: TextStyle(
                                color: Color.fromRGBO(33, 33, 33, 1),
                                fontFamily: "Montserrat",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      ImageStack(
                        imageList: images,
                        imageRadius: 43,
                        imageCount: 2,
                        imageBorderWidth: 2,
                        totalCount: 2,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        imageBorderColor: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget boxChip(String chipTitle, int index) {
    return InkWell(
      highlightColor: Colors.black.withOpacity(0.0),
      splashColor: Colors.black.withOpacity(0.0),
      onTap: (() {
        setState(() {
          selected = index;
        });
      }),
      child: Container(
        decoration: BoxDecoration(
            color: (selected == index)
                ? Color.fromRGBO(33, 33, 33, 1)
                : Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                color: Color.fromRGBO(33, 33, 33, 1), width: 1.5.sp)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
          child: Text(
            chipTitle,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: (selected == index)
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(33, 33, 33, 1)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          child: TitleBar(),
          flex: 1,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              boxChip("To do", 1),
              boxChip("In progress", 2),
              boxChip("Done", 3),
            ],
          ),
          flex: 2,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                cardsHome(
                    'Fintech app',
                    'Asap',
                    '#UI design',
                    'Sep 17-19',
                    'lib/assets/abhishek.jpg',
                    'lib/assets/bariy.jpg',
                    Color.fromRGBO(201, 253, 199, 1)),
                cardsHome(
                    'Brand guide',
                    'Medium',
                    '#graphics design',
                    'Sep 18-20',
                    'lib/assets/clayton.jpg',
                    'lib/assets/conner.jpg',
                    Color.fromRGBO(251, 243, 152, 1)),
                cardsHome(
                    'Kickoff meeting',
                    'Low',
                    '#projectmanagment',
                    'Sep 21',
                    'lib/assets/Jen.jpg',
                    'lib/assets/kimson.jpg',
                    Color.fromRGBO(221, 223, 254, 1)),
              ],
            ),
          ),
          flex: 8,
        )
      ],
    )));
  }

  Row TitleBar() {
    return Row(
      children: [
        SizedBox(
          width: 3.w,
        ),
        Text(
          "Projects",
          style: TextStyle(
              fontFamily: "jost",
              fontWeight: FontWeight.w600,
              fontSize: 33.sp,
              color: Color.fromRGBO(33, 33, 33, 1)),
        ),
        SizedBox(
          width: 3.w,
        ),
        BorderedText(
          strokeWidth: 3.0.sp,
          strokeColor: Color.fromRGBO(33, 33, 33, 1),
          child: Text(
            'Goals',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 31.0.sp,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontFamily: 'jost',
            ),
          ),
        )
      ],
    );
  }
}
