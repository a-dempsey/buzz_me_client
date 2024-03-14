// // /*
// //  * David Brett - 121415946
// //  */
// //
// // package com.ucc.pap1.buzz_me.network
// //
// // const val SERVER_HOST = "192.168.1.15" // Local Server
// // const val SERVER_PORT = "3000"
// //
// // const val SERVER_URL = "http://$SERVER_HOST:$SERVER_PORT"; //The URL to the local server.
// // //const val SERVER_URL = "http://buzzme.eu-west-1.elasticbeanstalk.com" // AWS Server
//
// import 'dart:io';
// import 'package:shelf/shelf.dart' as shelf;
// import 'package:shelf/shelf_io.dart' as io;
// import 'src/routing.dart';
// void main() {
//   final handler = const shelf.Pipeline()
//       .addMiddleware(shelf.logRequests())
//       .addHandler(RouteUtils.handler);
//   final port = int.tryParse(Platform.environment['PORT'] ?? '8080');
//   final address = InternetAddress.anyIPv4;
//   io.serve(handler, address, port).then((server) {
//     server.autoCompress = true;
//     print('Serving at http://${server.address.host}:${server.port}');
//   });
// }