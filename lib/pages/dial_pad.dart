import 'package:flutter/material.dart';

class DialPad extends StatefulWidget {
  const DialPad({super.key});

  @override
  State<DialPad> createState() => _DialPadState();
}

class _DialPadState extends State<DialPad> {
  late final TextEditingController _Controller = TextEditingController();

  String numbers = '';
  String newText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(children: [
          TextFormField(
            cursorColor: Colors.blue,
            cursorWidth: 1,
            autofocus: true,
            textAlign: TextAlign.center,
            controller: _Controller,
            keyboardType: TextInputType.none,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        numbers = _Controller.text;
                        if (numbers.isNotEmpty) {
                          newText = numbers.substring(0, numbers.length - 1);
                          _Controller.text = newText;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.backspace_outlined,
                      color: Colors.grey[600],
                      size: 20,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "1";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "1",
                      ),
                      Icon(
                        Icons.voicemail_outlined,
                        color: Colors.white,
                        size: 13,
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "2";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "2",
                      ),
                      Text(
                        "ABC",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "3";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "3",
                      ),
                      Text(
                        "DEF",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "4";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "4",
                      ),
                      Text(
                        "GHI",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "5";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "5",
                      ),
                      Text(
                        "JKL",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "6";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "6",
                      ),
                      Text(
                        "JKL",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "7";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "7",
                      ),
                      Text(
                        "PQRS",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "8";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "8",
                      ),
                      Text(
                        "TUV",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "9";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "9",
                      ),
                      Text(
                        "WXYZ",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "*";
                      numbers = _Controller.text;
                    });
                  },
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: Text(
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      "*",
                    ),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "0";
                      numbers = _Controller.text;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        "0",
                      ),
                      Text(
                        "+",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Controller.text = numbers + "#";
                      numbers = _Controller.text;
                    });
                  },
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: Text(
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      "#",
                    ),
                  ),
                  style: ButtonStyle(
                      splashFactory:
                          InkSparkle.constantTurbulenceSeedSplashFactory,
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.call_outlined,
                    size: 25,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Call",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(100, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
            ),
          )
        ])),
      ),
    );
  }
}
