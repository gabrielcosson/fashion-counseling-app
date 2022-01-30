import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_adriana/constants.dart';

class ContenedorMembresia extends StatefulWidget {
  const ContenedorMembresia({
    Key key,
  }) : super(key: key);

  @override
  _ContenedorMembresiaState createState() => _ContenedorMembresiaState();
}

class _ContenedorMembresiaState extends State<ContenedorMembresia> {
  TextEditingController numberController = new TextEditingController();
  TextEditingController expiryController = new TextEditingController();
  TextEditingController cvvController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding / 4, horizontal: kDefaultPadding),
      margin: EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding),
      height: size.height * 0.35,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: kBeigeColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //CARD NUMBER
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            height: size.height * 0.077,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.79,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: kPinkColor, width: 2.5)),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.1,
                          height: size.height * 0.05,
                          child: Icon(
                            Icons.credit_card,
                            color: kBrownColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 4),
                          width: size.width * 0.65,
                          height: size.height * 0.05,
                          child: TextField(
                            controller: numberController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Escriba el número de su tarjeta",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: kDefaultPadding * 2,
                  child: Container(
                    height: size.height * 0.02,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      color: kPinkColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Número de Tarjeta",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kBrownColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              //EXPIRY DATE
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                height: size.height * 0.077,
                width: size.width * 0.5,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: kPinkColor, width: 2.5)),
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.1,
                              height: size.height * 0.05,
                              child: Icon(
                                Icons.calendar_today,
                                color: kBrownColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 4),
                              width: size.width * 0.35,
                              height: size.height * 0.05,
                              child: TextField(
                                controller: expiryController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "MM / YY",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: kDefaultPadding * 2,
                      child: Container(
                        height: size.height * 0.02,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          color: kPinkColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          "Fecha de expiración",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kBrownColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),

              //CVV FIELD

              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                height: size.height * 0.077,
                width: size.width * 0.26,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.26,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: kPinkColor, width: 2.5)),
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.1,
                              height: size.height * 0.05,
                              child: Icon(
                                Icons.lock_outline,
                                color: kBrownColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 4),
                              width: size.width * 0.1,
                              height: size.height * 0.05,
                              child: TextFormField(
                                controller: cvvController,
                                maxLength: 3,
                                maxLengthEnforced: true,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "CVV",
                                    counterText: ""),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: kDefaultPadding * 1.5,
                      child: Container(
                        height: size.height * 0.02,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                          color: kPinkColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          "CVV",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kBrownColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            height: size.height * 0.077,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.79,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: kPinkColor, width: 2.5)),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.1,
                          height: size.height * 0.05,
                          child: Icon(
                            Icons.person_outline,
                            color: kBrownColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 4),
                          width: size.width * 0.65,
                          height: size.height * 0.05,
                          child: TextField(
                            controller: numberController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Escriba el nombre en la tarjeta",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: kDefaultPadding * 2,
                  child: Container(
                    height: size.height * 0.02,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      color: kPinkColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Nombre en la Tarjeta",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kBrownColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
