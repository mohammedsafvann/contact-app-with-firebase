import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_integration_in_contact_app/pages/contact_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'create_new_contact.dart';
import 'dial_pad.dart';
import 'second_page.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  int selectedIndex = 0;
  List<DataResponsModel> contactData = [];
  DocumentSnapshot? lastDocument;
  bool moreData = true;

  final ScrollController _scrollController = ScrollController();

  int documentLimit = 10;

  @override
  void initState() {
    // TODO: implement initState

    getData();

    super.initState();
    _scrollController.addListener(
      () => _scrollListener(),
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (moreData) {
        getData();
      }
    }
  }

  bool shouldShowLoading() {
    return moreData && contactData.length >= 10;
  }

  @override
  getData() async {
    try {
      Query query = FirebaseFirestore.instance.collection("data");
      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument!);
      }

      // Query the 'users' collection
      QuerySnapshot querySnapshot = await query.limit(10).get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        DataResponsModel contactModel = DataResponsModel.fromJson({
          'name': doc["name"],
          'phonenumber': doc["phonenumber"],
          'email': doc["email"],
          'docId': doc.id
        });

        contactData.add(contactModel);
        contactData.sort((a, b) => a.name!.compareTo(b.name!));
      }
      if (querySnapshot.docs.isNotEmpty) {
        lastDocument = querySnapshot.docs.last;
      } else {
        moreData = false;
      }

      setState(() {});
    } catch (e) {
      print('Error getting data: $e');
    }
    return contactData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.black54,
        ),
        child: Scaffold(
          appBar: AppBar(
              leadingWidth: 0,
              backgroundColor: Colors.black,
              title: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                      gapPadding: 30),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  fillColor: Colors.white24,
                  filled: true,
                  hintText: "Search Contact & Places",
                  hintStyle: const TextStyle(
                    height: .6,
                    color: Colors.white,
                  ),
                  suffixIcon: SizedBox(
                    width: 75,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.mic_none,
                          size: 22,
                          color: Colors.white,
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert_rounded,
                              color: Colors.white),
                          color: Colors.grey[900],
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem(
                                  child: Text(
                                "Call history",
                                style: TextStyle(color: Colors.white),
                              )),
                              const PopupMenuItem(
                                  child: Text(
                                "Settings",
                                style: TextStyle(color: Colors.white),
                              )),
                              const PopupMenuItem(
                                  child: Text(
                                "Help & feedback",
                                style: TextStyle(color: Colors.white),
                              )),
                            ];
                          },
                          onSelected: (value) {
                            setState(() {
                              var selected = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              )),
          floatingActionButton: SizedBox(
            height: 55,
            width: 53,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: Colors.indigo[100],
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const DialPad(),
                );
              },
              child: const Icon(Icons.dialpad_rounded,
                  color: Colors.black, size: 25),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.black87,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.black54,
                icon: Icon(Icons.star_outline, color: Colors.white),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time_sharp, color: Colors.white),
                label: 'Recent',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_sharp, color: Colors.white),
                  label: 'Contacts'),
            ],
            currentIndex: selectedIndex,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedLabelStyle: const TextStyle(color: Colors.white),
            unselectedLabelStyle: const TextStyle(color: Colors.white),
            selectedItemColor: Colors.white,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    itemCount:
                        contactData.length + (shouldShowLoading() ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.zero),
                                ),
                              ),
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateNewContact(),
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Icon(Icons.person_add_alt_1_outlined,
                                      color: Colors.blue[100]),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Center(
                                  child: Text(
                                    "Create new contact",
                                    style: TextStyle(
                                        color: Colors.blue[100], fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        if (index == contactData.length) {
                          return shouldShowLoading()
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.white),
                                )
                              : const SizedBox();
                        }

                        DataResponsModel contact = contactData[index - 1];

                        return InkWell(
                          onTap: () {
                            print(" contact.phonenumber");
                            print(contact.phonenumber);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Secondpage(
                                  contactList: contact,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.black,
                            width: 150,
                            height: 60,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 30),
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.primaries[Random()
                                          .nextInt(Colors.primaries.length)],
                                      child: Text(
                                        contact.name![0].toUpperCase(),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  contact.name!.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
