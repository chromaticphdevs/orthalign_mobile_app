import 'package:flutter/material.dart';

class ResourceSliderScreen extends StatefulWidget {
  const ResourceSliderScreen({super.key});

  @override
  State<ResourceSliderScreen> createState() => _ResourceSliderScreenState();
}

class _ResourceSliderScreenState extends State<ResourceSliderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/Images/Match probe offset.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}