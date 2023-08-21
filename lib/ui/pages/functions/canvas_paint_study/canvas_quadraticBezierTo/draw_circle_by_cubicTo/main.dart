import 'package:flutter/cupertino.dart';
import './paper.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Paper();
  }
}
