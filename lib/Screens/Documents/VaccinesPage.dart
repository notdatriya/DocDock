
import 'package:flutter/material.dart';

class VaccinesPage extends StatefulWidget {
  const VaccinesPage({Key? key}) : super(key: key);

  @override
  State<VaccinesPage> createState() => _VaccinesPageState();
}

class _VaccinesPageState extends State<VaccinesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Vaccines Page')),
    );
  }
}
