import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Example'),
      ),
      body: Column(
        children: [
          // Container(
          //   // height: 400,
          //   // width: 350,
          //   color: Colors.red,
          //   child: Image.asset(
          //       "images/image1.jpg",
          //     // height: 200,
          //     // width: 200,
          //     fit: BoxFit.contain,
          //     alignment: Alignment.center,
          //     scale:5.5,
          //     // color: Colors.green,
          //   ),
          // ),

          // Image(
          //   image: AssetImage(
          //     "images/image1.jpg",
          //   ),
          //   width: 200,
          //   height: 200,
          // ),

          // Container(
          //   height: 200,
          //   width: 200,
          //   decoration: const BoxDecoration(
          //     color: Colors.black26,
          //     image: DecorationImage(
          //       image: AssetImage(
          //         "images/image1.jpg",
          //       ),
          //       opacity: 0.5,
          //       fit: BoxFit.fitWidth,
          //       // invertColors: true,
          //     ),
          //   ),
          //   child: const Text(
          //     'Hello',
          //     style: TextStyle(
          //       fontSize: 35,
          //     ),
          //   ),
          // ),

          // Image.network(
          //   "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
          //
          // ),

          CachedNetworkImage(
            imageUrl:
                "https://2.img-dpreviewcom/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 50,
              ),
            ),
          ),

          // Image(
          //   image: NetworkImage(
          //     "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
          //   ),
          // ),
          //
          // Container(
          //   height: 200,
          //   width: 200,
          //   decoration: BoxDecoration(
          //     color: Colors.black26,
          //     image: DecorationImage(
          //       image: NetworkImage(
          //         "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
          //       ),
          //       opacity: 0.5,
          //       fit: BoxFit.fitWidth,
          //       // invertColors: true,
          //     ),
          //   ),
          //   child: const Text(
          //     'Hello',
          //     style: TextStyle(
          //       fontSize: 35,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
