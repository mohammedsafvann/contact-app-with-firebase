import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:phone/contact_list.dart';
// import 'package:phone/contact_model.dart';
// import 'package:phone/main.dart';

import 'contact_list.dart';
import 'contact_model.dart';
// import 'contact_model.dart';

// import 'package:untitled/second_page.dart';

class EditContactPage extends StatefulWidget {
  final DataResponsModel contactList;

  const EditContactPage({
    super.key,
    required this.contactList,
  });

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  String firstcategories = 'No label';

  Future editData() async {
    // try {
    await FirebaseFirestore.instance
        .collection('data')
        .doc(widget.contactList.docId)
        .update({
      'name': firstNameController.text,
      'phonenumber': phoneController.text,
      'email': emailController.text,
    });
    // } catch (e) {
    //   print('Error getting data: $e');
    // }
  }

  @override
  void initState() {
    firstNameController.text = widget.contactList.name ?? "";
    phoneController.text = widget.contactList.phonenumber ?? "";
    emailController.text = widget.contactList.email ?? "";

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(
                  context,
                ),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 60),
                child: Text(
                  "Edit contact",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    editData();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactList(),
                      ),
                    );
                    print(firstNameController.text);
                    print(phoneController.text);
                    //   print(phoneController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 25),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.blue[300],
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                color: Colors.grey[900],
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    )),
                    const PopupMenuItem(
                      child: Text(
                        "Help & feedback",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ];
                },
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              color: Colors.grey[900],
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text("Saved to",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white)),
                  ),
                  // SizedBox(
                  //   width: ,
                  // ),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                        'assets/images/kisspng-cristiano-ronaldo-real-madrid-c-f-the-best-fifa-f-the-best-5ad978c26d0d83.3753809715242016664467.jpg'),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "mohammedsafvan.nondath@gmail.com",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                  child: const Icon(Icons.add_photo_alternate_outlined,
                      color: Colors.white, size: 50),
                  backgroundColor: Colors.grey[700],
                  radius: 65),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Add picture",
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.perm_identity_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 40),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: firstNameController,
                      decoration: const InputDecoration(
                          label: Text("Name",
                              style: TextStyle(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          )),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 1,
                          ))),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.call_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 40),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      controller: phoneController,
                      decoration: const InputDecoration(
                        label: Text("phone",
                            style: TextStyle(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            //DropdownButtonFormField(
            //  items: items.map((items)), onChanged: onChanged),
            const SizedBox(height: 20),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.email_outlined, color: Colors.white),
                ),
                const SizedBox(
                  width: 19,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: TextFormField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          label: Text("Email",
                              style: TextStyle(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          )),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 1,
                          ))),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
