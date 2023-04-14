
import 'package:flutter/material.dart';

class ScansPage extends StatefulWidget {
  const ScansPage({Key? key}) : super(key: key);

  @override
  State<ScansPage> createState() => _ScansPageState();
}

class _ScansPageState extends State<ScansPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Scans Page')),
    );
  }
}
