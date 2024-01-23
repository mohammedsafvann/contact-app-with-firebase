import 'dart:math';

import 'package:flutter/material.dart';

class Favuorite extends StatefulWidget {
  const Favuorite({super.key});

  @override
  State<Favuorite> createState() => _FavuoriteState();
}

class _FavuoriteState extends State<Favuorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 1,
          // contactData.length,
          itemBuilder: (context, index) {
            // DataResponsModel contact = contactData[index];

            return Container(
              color: Colors.black,
              width: 150,
              height: 60,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 30),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        // colorList[index],
                        child: Text(""
                            // contact.name![0].toUpperCase(),

                            // names[index][0],
                            ),
                      ),
                    ),
                  ),
                  Text(
                    ""
                    // contact.name!.toUpperCase(),
                    // names[index]. toUpperCase(),
                    // getData(),

                    ,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )
                ],
              ),
            );
          }),
    );
  }
}
