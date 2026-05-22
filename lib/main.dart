import 'package:el_kabah_app_backup/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/location_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final locationProvider = LocationProvider();

  await locationProvider.loadLocation();

  runApp(
    ChangeNotifierProvider(create: (_) => locationProvider, child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      // theme: ThemeData(colorSchemeSeed: Color.fromARGB(1, 255, 255, 255)),
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}
