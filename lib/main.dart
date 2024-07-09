import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/index/welcome_view.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workpulse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.matteBlack),
        useMaterial3: true,
      ),
      home: const WelcomePageView(),
    );
  }
}
