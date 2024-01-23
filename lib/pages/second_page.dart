import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_integration_in_contact_app/pages/contact_model.dart';
import 'package:flutter/material.dart';

import 'calling_page.dart';
import 'contact_list.dart';

import 'edit_contact_page.dart';

class Secondpage extends StatefulWidget {
  final DataResponsModel contactList;

  const Secondpage({
    super.key,
    required this.contactList,
  });

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  final _fireStore = FirebaseFirestore.instance.collection('data');
  bool favourite = false;
  var selectedItem = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future deleteData() async {
    await _fireStore.doc(widget.contactList.docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: InkWell(
              onTap: () => Navigator.pop(
                    context,
                  ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  print('widget.contactList.name');
                  print(widget.contactList.name);
                  print('widget.contactList.email');
                  print(widget.contactList.email);
                  print("widget.contactList.phonenumber");
                  print(widget.contactList.phonenumber);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditContactPage(
                        contactList: widget.contactList,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.mode_edit_outlined, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    favourite = !favourite;
                  });
                },
                icon: favourite
                    ? const Icon(
                        Icons.star,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.star_outline,
                        color: Colors.white,
                      ),
              ),
            ),
            PopupMenuButton(
              color: Colors.grey[900],
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text(
                      "View linked contacts",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'Delete',
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Share",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Add to home screen",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Set ringtone",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Rout to voiceemail",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Block number",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Helpe & feedback",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                setState(() {
                  selectedItem = value.toString();
                });
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text(
                      "This will Delete The Contact From your Device ",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.grey[900],
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          deleteData();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactList(),
                            ),
                          );
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    title: const Text(
                      "Delete Contact?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  child: Text(widget.contactList.name![0].toUpperCase(),
                      style: TextStyle(color: Colors.black, fontSize: 80)),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  widget.contactList.name!.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[700],
                              radius: 25,
                              child: IconButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CallingPage(
                                      contactList: widget.contactList,

                                      // name: widget.contactdata.name!
                                      //     .toUpperCase()
                                      //     .toString(),
                                      // phonenumbers: widget
                                      //     .contactdata.phoneNumber
                                      //     .toString(),
                                    ),
                                  ),
                                ),
                                icon: Icon(
                                  size: 23,
                                  Icons.call_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Call",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[700],
                              radius: 25,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  size: 23,
                                  Icons.message_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Text",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[700],
                              radius: 25,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  size: 23,
                                  Icons.videocam_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Video",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[900],
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12, top: 15),
                        child: Text(
                          "Contact info",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ListTile(
                        title: Text(widget.contactList.phonenumber.toString(),
                            style: TextStyle(color: Colors.white)),
                        subtitle: const Text("phone",
                            style: TextStyle(color: Colors.white)),
                        trailing: const Wrap(spacing: 10, children: [
                          Icon(Icons.videocam_outlined, color: Colors.white),
                          Icon(Icons.message_outlined, color: Colors.white),
                        ]),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Added janu12, 2024(${widget.contactList.email})",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
