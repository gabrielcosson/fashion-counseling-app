import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prueba_adriana/constants.dart';
import 'package:prueba_adriana/screens/citas/components/title_box.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

int mes = 0;
int w = 0;
int dia = 1;
int radio = 0;
String categoria = "ARMARIO";

var list = [
  "Ene",
  "Feb",
  "Mar",
  "Abr",
  "May",
  "Jun",
  "Jul",
  "Ago",
  "Sep",
  "Oct",
  "Nov",
  "Dic"
];

String selected = list[mes];

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          TitleBox(text: "AGENDAR"),

          //MONTH SELECTOR
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: kBrownColor,
                  ),
                  onPressed: () {
                    if (mes > 0) {
                      setState(() {
                        mes = mes - 1;
                        selected = list[mes];
                      });
                    }
                  }),
              Text(
                selected,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: kBrownColor,
                  ),
                  onPressed: () {
                    if (mes < list.length - 1) {
                      setState(() {
                        mes = mes + 1;
                        selected = list[mes];
                      });
                    }
                  }),
            ],
          ),

          //DAY SELECTOR
          Container(
              height: size.height * 0.1,
              width: size.width * 0.9,
              child: CarouselSlider(
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 0.25,
                    aspectRatio: 16 / 9,
                    onPageChanged: (w, reason) {
                      setState(() {
                        dia = w + 1; //w empienza en 0, no en 1
                      });
                    },
                    enlargeStrategy: CenterPageEnlargeStrategy.scale),
                items: [
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10,
                  11,
                  12,
                  13,
                  14,
                  15,
                  16,
                  17,
                  18,
                  19,
                  20,
                  21,
                  22,
                  23,
                  24,
                  25,
                  26,
                  27,
                  28,
                  29,
                  30,
                  31
                ].map((w) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 1.0),
                          child: GestureDetector(
                            child: Text(
                              w.toString().padLeft(2, "0"),
                              style: TextStyle(fontSize: 65),
                              textAlign: TextAlign.center,
                            ),
                          ));
                    },
                  );
                }).toList(),
              )),
          //HORAS SELECTOR
          Container(
            padding: EdgeInsets.only(top: kDefaultPadding),
            margin: EdgeInsets.only(top: kDefaultPadding),
            height: size.height * 0.2,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: kBeigeColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.2))
                ]),
          ),
          //CATEGORIA CITA
          Container(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            margin: EdgeInsets.all(kDefaultPadding / 2),
            height: size.height * 0.15,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿PARA QUÉ OCASIÓN DESEAS TU CITA?",
                  style: TextStyle(
                    fontSize: 18,
                    color: kBrownColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.42,
                      child: RadioListTile(
                        activeColor: kBrownColor,
                        value: 1,
                        groupValue: radio,
                        onChanged: (val) {
                          setState(() {
                            radio = val;
                          });
                        },
                        title: Text(
                          "ARMARIO",
                          style: TextStyle(
                            color: kBrownColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: RadioListTile(
                        activeColor: kBrownColor,
                        value: 2,
                        groupValue: radio,
                        onChanged: (val) {
                          setState(() {
                            radio = val;
                          });
                        },
                        title: Text(
                          "COMPRA",
                          style: TextStyle(
                            color: kBrownColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          FlatButton(
              onPressed: () {
                print("MES " + (mes + 1).toString());
                print("DIA " + dia.toString());
                if (radio == 1) {
                  categoria = "ARMARIO";
                }
                if (radio == 2) {
                  categoria = "SHOPPING";
                }
                print("CATEGORIA " + categoria);
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: kDefaultPadding * 2),
                  height: size.height * 0.08,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: kPinkColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.2))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "CONFIRMAR CITA",
                        style: TextStyle(
                            color: kBrownColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
        ]));
  }
}
