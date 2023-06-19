import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_final/controller/cartController.dart';

import 'Test/test_items.dart';
import 'Test/test_provider.dart';
import 'Test/test_selected.dart';
import 'favourite_app/favourite_provider.dart';
import 'favourite_app/fovourite_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ItemsProviderr()),
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ItemsListt(),
      ),
    );
  }
}
