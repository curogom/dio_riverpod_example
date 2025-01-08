import 'dart:io';

import 'package:dio_riverpod_example/presentation/common_api/common_api_request_screen.dart';
import 'package:dio_riverpod_example/presentation/home/home_screen.dart';
import 'package:dio_riverpod_example/presentation/stream_api/booking_api_request_screen.dart';
import 'package:dio_riverpod_example/presentation/stream_api/stream_api_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));

  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/common-api-request': (context) => const CommonApiRequestScreen(),
        '/stream-api-request': (context) => const StreamApiRequestScreen(),
        '/booking-api-request': (context) => const BookingApiRequestScreen(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
