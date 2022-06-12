import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(238, 30, 106, 248),
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
        // body: Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Center(
        //     child: ListView.builder(
        //       itemCount: lstWishlist.length,
        //       itemBuilder: (context, index) {
        //         return Card(
        //           child: Column(
        //             children: [
        //               InkWell(
        //                 onTap: () {
        //                   Navigator.pushNamed(context, '/details',
        //                       arguments: lstWishlist[index]);
        //                 },
        //                 child: ListTile(
        //                   title: Text(lstWishlist[index].title),
        //                   subtitle: Text(lstWishlist[index].description),
        //                   trailing: IconButton(
        //                     icon: const Icon(Icons.delete),
        //                     onPressed: () {},
        //                   ),
        //                 ),
        //               ),
        //               Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        //                 ElevatedButton.icon(
        //                     onPressed: () {},
        //                     icon: const Icon(Icons.update),
        //                     label: const Text('Update')),
        //                 const SizedBox(width: 10),
        //                 ElevatedButton.icon(
        //                     onPressed: () {},
        //                     icon: const Icon(Icons.check),
        //                     label: const Text('Mark as Done')),
        //               ]),
        //             ],
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),

        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
              child: const Text('Add Product'),
            ),
          ],
        ));
  }
}
