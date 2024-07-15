import 'package:flutter/material.dart';
import 'package:product_app/controller/controller.dart';
import 'package:product_app/screens/customers_page.dart';
import 'package:product_app/screens/home_page.dart';
import 'package:product_app/screens/my_cart.dart';
import 'package:product_app/screens/product_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetProduct(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff064f1a)),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
