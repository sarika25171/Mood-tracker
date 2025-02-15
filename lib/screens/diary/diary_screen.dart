import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class DiaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text("Diary")),
    );
  }
}
