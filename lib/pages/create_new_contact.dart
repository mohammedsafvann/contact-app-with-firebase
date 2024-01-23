import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_integration_in_contact_app/pages/contact_list.dart';
import 'package:firbase_integration_in_contact_app/pages/loading_page.dart';
import 'package:flutter/material.dart';

class CreateNewContact extends StatefulWidget {
  const CreateNewContact({super.key});
  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  var fireStore = FirebaseFirestore.instance.collection('data');
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  @override
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(
            context,
          ),
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  "Create contact",
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
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });

                      fireStore.add({
                        'name': nameController.text,
                        'phonenumber': phoneNumberController.text,
                        'email': emailController.text,
                      }).then((value) => {
                            fireStore.doc(value.id).update({"docId": value.id}),
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactList(),
                              ),
                            )
                          });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(80, 25),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.blue[300]),
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
                      ),
                    ),
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
      body: isLoading
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(
                    value: 2,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 3,
                    color: Colors.blue,
                    backgroundColor: Colors.white),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      color: Colors.grey[900],
                      child: const Row(children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Text("Saved to",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(
                              "assets/images/kisspng-cristiano-ronaldo-real-madrid-c-f-the-best-fifa-f-the-best-5ad978c26d0d83.3753809715242016664467.jpg"),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "mohammedsafvan.nondath@gmail.com",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        )
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[700],
                        radius: 65,
                        child: const Icon(Icons.add_photo_alternate_outlined,
                            color: Colors.white, size: 50),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Add picture",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500),
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please Enter your name';
                                }
                                return null;
                              },
                              controller: nameController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                label: Text("Name",
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter number';
                                } else if (value.length != 10) {
                                  return "Enter 10 digit number";
                                }
                                return null;
                              },
                              controller: phoneNumberController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.white),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:
                              Icon(Icons.email_outlined, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 19,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: TextFormField(
                              validator: (value) {
                                if (!RegExp(
                                        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                    .hasMatch(emailController.text)) {
                                  return 'please Enter your valid email';
                                }
                                return null;
                              },
                              controller: emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                label: Text("Email",
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
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "More fields",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          )),
                    ),
                  ]),
                ),
              ),
            ),
    );
  }
}
