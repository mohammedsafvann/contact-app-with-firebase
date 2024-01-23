// // for (QueryDocumentSnapshot doc in querySnapshot.docs) {
// //   DataResponsModel contactModel = DataResponsModel.fromJson({
// //     'name': doc["name"],
// //     'phonenumber': doc["phonenumber"],
// //     'email': doc["email"],
// //     'docId': doc.id
// //   });
// //   contactData.add(contactModel);
// //   contactData.sort((a, b) => a.name!.compareTo(b.name!));
// // }
// // setState(() {});
// // } catch (e) {
// // print('Error getting data: $e');
// // } finally {
// // loading = false;
// // }
// // }
//
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:contact_application/Model/data_response_model.dart';
// import 'package:contact_application/pages/add_contact_page.dart';
// import 'package:contact_application/pages/user_info_page.dart';
// import 'package:flutter/material.dart';
//
// class ContactPage extends StatefulWidget {
//   const ContactPage({Key? key}) : super(key: key);
//
//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }
//
// class _ContactPageState extends State<ContactPage> {
//   List<DataResponseModel> contactData = [];
//   DocumentSnapshot? lastDocument;
//   bool hasMoreContacts = true;
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_scrollListener);
//     getData();
//   }
//
//   // @override
//   // void dispose() {
//   //   _scrollController.dispose();
//   //   super.dispose();
//   // }
//
//   void _scrollListener() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       if (hasMoreContacts) {
//         getData();
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black54,
//       appBar: AppBar(
//         backgroundColor: Colors.black54,
//         title: SizedBox(
//           height: 45,
//           child: TextField(
//             style: const TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.blueGrey[900],
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(width: 1, color: Colors.blueGrey.shade900),
//                 borderRadius: BorderRadius.circular(30.0),
//               ),
//               hintText: "Search contact and places",
//               hintStyle: TextStyle(fontSize: 16, color: Colors.blueGrey[100]),
//               prefixIcon: Icon(Icons.search, color: Colors.blueGrey[100]),
//               suffixIcon: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.mic_none_outlined,
//                     color: Colors.blueGrey[100],
//                   ),
//                   Icon(
//                     Icons.more_vert,
//                     color: Colors.blueGrey[100],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.person_add_alt_outlined,
//                   color: Colors.blueGrey[50],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const ProfilePage(),
//                       ),
//                     );
//                   },
//                   style:
//                       ElevatedButton.styleFrom(backgroundColor: Colors.black),
//                   child: Text(
//                     "Create new Contact",
//                     style: TextStyle(color: Colors.blue[300]),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: contactData.length + (shouldShowLoading() ? 1 : 0),
//               itemBuilder: (context, index) {
//                 if (index == contactData.length) {
//                   return shouldShowLoading()
//                       ? const Center(
//                           child: CircularProgressIndicator(),
//                         )
//                       : Container();
//                 }
//                 DataResponseModel contact = contactData[index];
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => UserInfo(contact: contact),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.black,
//                     ),
//                     height: 60,
//                     width: double.infinity,
//                     child: Row(
//                       children: [
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const SizedBox(
//                           width: 65,
//                         ),
//                         CircleAvatar(
//                           radius: 23,
//                           backgroundColor: Colors.primaries[
//                               Random().nextInt(Colors.primaries.length)],
//                           child: Text(
//                             contact.name![0].toUpperCase(),
//                             style: const TextStyle(
//                               fontSize: 28,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Center(
//                           child: Text(
//                             contact.name ?? "",
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.black,
//         backgroundColor: Colors.blueGrey[600],
//         items: const [
//           BottomNavigationBarItem(
//             icon:
//                 Icon(Icons.star_border_purple500_outlined, color: Colors.black),
//             label: 'Favourites',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Recent'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.people_alt), label: 'Contacts'),
//         ],
//       ),
//     );
//   }
//
//   bool shouldShowLoading() {
//     return hasMoreContacts && contactData.length >= 10;
//   }
//
//   getData() async {
//     try {
//       Query query = FirebaseFirestore.instance.collection('data');
//       if (lastDocument != null) {
//         query = query.startAfterDocument(lastDocument!);
//       }
//       QuerySnapshot querySnapshot = await query.limit(10).get();
//       for (QueryDocumentSnapshot doc in querySnapshot.docs) {
//         DataResponseModel dataModel = DataResponseModel.fromJson({
//           'name': doc['name'],
//           'number': doc['number'],
//           'email': doc['email'],
//           'docId': doc.id,
//         });
//         contactData.add(dataModel);
//         contactData.sort(
//           (a, b) => a.name!.compareTo(b.name!),
//         );
//       }
//       if (querySnapshot.docs.isNotEmpty) {
//         lastDocument = querySnapshot.docs.last;
//       } else {
//         hasMoreContacts = false;
//       }
//       setState(() {});
//     } catch (e) {
//       print('Error getting data: $e');
//     }
//   }
// }
