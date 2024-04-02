// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:sellersapp/global/global.dart';
// import 'package:sellersapp/models/menus.dart';
// // import 'package:sellersapp/models/menus.dart';
// import 'package:sellersapp/widgets/info_design.dart';
// import 'package:sellersapp/widgets/my_drawer.dart';
// import 'package:sellersapp/widgets/progress_bar.dart';
// import 'package:sellersapp/widgets/text_widget_header.dart';
//
// import '../uploadScreens/menu_upload_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   // ignore: use_super_parameters
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   Color myColor = const Color(0xFF33536F);
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       if (_selectedIndex == 2) {
//         // Open drawer for "Profile" tab using the GlobalKey
//         _scaffoldKey.currentState?.openDrawer();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         flexibleSpace: Container(
//           color: const Color.fromARGB(255, 60, 116, 164),
//         ),
//         title: Text(
//           sharedPreferences!.getString("name")!,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//             fontFamily: "lobster",
//           ),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.post_add,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: ((context) => const MenusUploadScreen()),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       drawer: const MyDrawer(),
//       body: Container(
//         decoration: const BoxDecoration(color: Colors.white
//             ),
//         child: CustomScrollView(
//           slivers: [
//             SliverPersistentHeader(
//               pinned: true,
//               delegate: TextWidgetHeader(title: "My Menus"),
//             ),
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection("sellers")
//                   .doc(sharedPreferences!.getString("uid"))
//                   .collection("menus")
//                   .orderBy("publishedDate", descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 return !snapshot.hasData
//                     ? SliverToBoxAdapter(
//                         child: Center(
//                           child: circularProgress(),
//                         ),
//                       )
//                     : SliverStaggeredGrid.countBuilder(
//                         crossAxisCount: 1,
//                         staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
//                         itemBuilder: (context, index) {
//                           Menus model = Menus.fromJson(
//                             snapshot.data!.docs[index].data()!
//                                 as Map<String, dynamic>,
//                           );
//                           return InfoDesignWidget(
//                             model: model,
//                             context: context,
//                           );
//                         },
//                         itemCount: snapshot.data!.docs.length,
//                       );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Menu',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'My Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: const Color.fromRGBO(0xd7, 0x57, 0x3c, 1.0),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
